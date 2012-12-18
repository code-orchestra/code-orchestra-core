/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.intentions;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.application.RuntimeInterruptedException;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.util.Pair;
import jetbrains.mps.errors.QuickFixProvider;
import jetbrains.mps.ide.script.plugin.migrationtool.MigrationScriptUtil;
import jetbrains.mps.lang.script.runtime.AbstractMigrationRefactoring;
import jetbrains.mps.lang.script.runtime.BaseMigrationScript;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.EditorMessage;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.smodel.*;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.util.InternUtil;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;


@State(
  name = "MPSIntentionsManager",
  storages = {
    @Storage(
      id = "other",
      file = "$APP_CONFIG$/intentions.xml"
    )}
)
public class IntentionsManager implements ApplicationComponent, PersistentStateComponent<IntentionsManager.MyState> {
  private static final Logger LOG = Logger.getLogger(IntentionsManager.class);

  public static String getDescriptorClassName(ModuleReference langRef) {
    return "IntentionsDescriptor";
  }

  private ReloadAdapter myReloadHandler = new ReloadAdapter() {
    public void unload() {
      clear();
    }
  };

  public static IntentionsManager getInstance() {
    return ApplicationManager.getApplication().getComponent(IntentionsManager.class);
  }

  private Map<Intention, SNodePointer> myNodesByIntentions = new HashMap<Intention, SNodePointer>();
  private Map<String, Set<Intention>> myIntentions = new HashMap<String, Set<Intention>>();
  private Set<Intention> myDisabledIntentionsCache = new HashSet<Intention>();
  private HashMap<Class, ModuleReference> myIntentionsLanguages = new HashMap<Class, ModuleReference>();
  private boolean myCachesAreValid = false;
  private boolean myLoaded = false;

  private MyState myState = new MyState();

  private ClassLoaderManager myClassLoaderManager;

  public IntentionsManager(ClassLoaderManager manager) {
    myClassLoaderManager = manager;
  }

  public synchronized Collection<Pair<Intention, SNode>> getAvailableIntentions(final QueryDescriptor query, final SNode node, final EditorContext context) {
    checkLoaded();
    Computable<Set<Pair<Intention, SNode>>> computable = new Computable<Set<Pair<Intention, SNode>>>() {
      public Set<Pair<Intention, SNode>> compute() {
        Set<Pair<Intention, SNode>> result = new HashSet<Pair<Intention, SNode>>();

        for (Intention intention : getAvailableIntentionsForExactNode(query, node, context, false)) {
          result.add(new Pair<Intention, SNode>(intention, node));
        }

        if (!query.isCurrentNodeOnly()) {
          Set<Intention> addedIntentions = new HashSet<Intention>();
          SNode parent = node.getParent();
          while (parent != null) {
            for (Intention intention : getAvailableIntentionsForExactNode(query, parent, context, true)) {
              // RE-4323
              if (!addedIntentions.contains(intention)) {
                addedIntentions.add(intention);
                result.add(new Pair<Intention, SNode>(intention, parent));
              }
            }
            parent = parent.getParent();
          }
        }

        return query.filter(result);
      }
    };

    try {
      TypeChecker.getInstance().enableGlobalSubtypingCache();
      Set<Pair<Intention, SNode>> intentions = ModelAccess.instance().runReadAction(computable);
      return intentions;
    } finally {
      TypeChecker.getInstance().clearGlobalSubtypingCache();
    }
  }

  public synchronized boolean intentionIsDisabled(Intention intention) {
    checkLoaded();
    return getDisabledIntentions().contains(intention);
  }

  private List<Intention> getAvailableIntentionsForExactNode(QueryDescriptor query, final SNode node, @NotNull final EditorContext context, boolean childOnly) {
    assert node != null : "node == null - inconsistent editor state";
    List<Intention> intentions;
    if (!query.isInstantiate()) {
      intentions = getIntentionsFor(node, context.getScope(), query.getTerminated());
    } else {
      intentions = new ArrayList<Intention>();
      for (Intention intention : getIntentionsFor(node, context.getScope(), query.getTerminated())) {
        if (query.getTerminated().compute()) return new ArrayList<Intention>();
        if (intention.isParameterized()) {
          Method method = null;
          try {
            method = intention.getClass().getMethod("instances", SNode.class, EditorContext.class);
          } catch (NoSuchMethodException e) {
            LOG.error(e);
          }
          Object[] arguments = new Object[]{node, context};
          try {
            List<Intention> parameterizedIntentions = (List<Intention>) method.invoke(null, arguments);
            intentions.addAll(parameterizedIntentions);
          } catch (IllegalAccessException e) {
            LOG.error(e);
          } catch (InvocationTargetException e) {
            if (e.getTargetException() instanceof RuntimeInterruptedException) {
              throw (RuntimeInterruptedException) e.getTargetException();
            }
            LOG.error(e);
          }
        } else {
          intentions.add(intention);
        }
      }
    }

    List<Intention> result = new ArrayList<Intention>();
    for (final Intention intention : intentions) {
      try {
        boolean isApplicable = false;
        if (!childOnly || intention.isAvailableInChildNodes()) {
          isApplicable = ModelAccess.instance().runReadAction(new Computable<Boolean>() {
            public Boolean compute() {
              return intention.isApplicable(node, context);
            }
          });
        }
        if (isApplicable) {
          result.add(intention);
        }
      } catch (Throwable t) {
        LOG.error("Intention's isApplicable method failed " + t.getMessage(), t);
      }
    }

    List<EditorMessage> messages = context.getNodeEditorComponent().getHighlightManager().getMessagesFor(node);
    for (EditorMessage message : messages) {
      List<QuickFixProvider> intentionProviders = message.getIntentionProviders();
      for (QuickFixProvider intentionProvider : intentionProviders) {
        Intention intention = new QuickFixAdapter(intentionProvider.getQuickFix(), intentionProvider.isError());
        if (intention != null) {
          if (!childOnly || intention.isAvailableInChildNodes()) {
            result.add(intention);
          }
        }
      }
    }

    return result;
  }

  private List<Intention> getIntentionsFor(SNode node, IScope scope, Computable<Boolean> terminated) {
    String conceptFqName = node.getConceptFqName();
    Set<Language> visibleLanguages = new HashSet<Language>(SModelOperations.getLanguages(node.getModel(), scope));
    List<Intention> result = new ArrayList<Intention>();
    for (String ancestor : LanguageHierarchyCache.getAncestorsNames(conceptFqName)) {
      Set<Intention> intentions = myIntentions.get(ancestor);
      if (intentions == null) continue;
      for (Intention intention : intentions) {
        if (terminated.compute()) return new ArrayList<Intention>();
        Language language = getIntentionLanguage(intention);
        if (!intention.getType().equals(IntentionType.MIGRATION) && language != null && !visibleLanguages.contains(language)) continue;
        result.add(intention);
      }
    }
    return result;
  }

  private Set<Intention> getDisabledIntentions() {
    if (!myCachesAreValid) {
      myDisabledIntentionsCache.clear();
      for (Set<Intention> conceptIntentions : myIntentions.values()) {
        for (Intention intention : conceptIntentions) {
          if (myState.myDisabledIntentions.contains(intention.getClass().getName())) {
            myDisabledIntentionsCache.add(intention);
          }
        }
      }
      myCachesAreValid = true;
    }
    return myDisabledIntentionsCache;
  }

  private void invalidateCaches() {
    myCachesAreValid = false;
    myDisabledIntentionsCache.clear();
  }

  //-------------disabled state control-----------------

  public synchronized void invertIntentionState(Intention intention) {
    setIntentionState(intention, !intentionIsDisabled(intention));
  }

  public synchronized void setIntentionState(Intention intention, boolean disabled) {
    if (disabled) {
      disableIntention(intention);
    } else {
      enableIntention(intention);
    }
  }

  public synchronized void disableIntention(Intention intention) {
    checkLoaded();
    myState.myDisabledIntentions.add(intention.getClass().getName());
    myDisabledIntentionsCache.add(intention);
  }

  public synchronized void enableIntention(Intention intention) {
    checkLoaded();
    myState.myDisabledIntentions.remove(intention.getClass().getName());
    myDisabledIntentionsCache.remove(intention);
  }

  //-------------node info by intention-----------------

  @Nullable
  public synchronized Language getIntentionLanguage(Intention intention) {
    checkLoaded();
    ModuleReference ref = myIntentionsLanguages.get(intention.getClass());
    if (ref == null) return null;
    return MPSModuleRepository.getInstance().getLanguage(ref);
  }

  @Nullable
  public synchronized SNode getNodeByIntention(Intention intention) {
    checkLoaded();
    SNodePointer pointer = myNodesByIntentions.get(intention);
    if (pointer == null) return intention.getNodeByIntention();
    SNode node = pointer.getNode();
    if (node == null) return intention.getNodeByIntention();
    return node;
  }

  @NotNull
  public synchronized Set<Intention> getAllIntentions() {
    checkLoaded();
    return Collections.unmodifiableSet(myNodesByIntentions.keySet());
  }

  //-------------reloading-----------------

  public synchronized void addIntention(Intention intention, @Nullable ModuleReference lang, @Nullable SNodePointer node) {
    Set<Intention> intentions = myIntentions.get(intention.getConcept());
    if (intentions == null) {
      intentions = new HashSet<Intention>();
      myIntentions.put(InternUtil.intern(intention.getConcept()), intentions);
    }
    intentions.add(intention);

    myNodesByIntentions.put(intention, node);
    myIntentionsLanguages.put(intention.getClass(), lang);
  }

  private void checkLoaded() {
    if (myLoaded) return;
    myLoaded = true;
    load();
  }

  private void load() {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        List<Language> allLanguages = MPSModuleRepository.getInstance().getAllLanguages();
        for (Language language : allLanguages) {
          String className = getDescriptorClassName(language.getModuleReference());
          initIntentionsDescriptor(language, LanguageAspect.INTENTIONS, className);
        }
        for (Language language : allLanguages) {
          addMigrationsFromLanguage(language);
        }
      }
    });
  }

  private void addMigrationsFromLanguage(Language language) {
    List<SNode> migrationScripts = MigrationScriptUtil.getMigrationScripts(language);

    Map<BaseMigrationScript, SNode> scripts = new HashMap<BaseMigrationScript, SNode>();
    for (SNode migrationScript : migrationScripts) {
      // IOperationContext operationContext = new ModuleContext(language, ...);
      //it seems that IOperationContext is unnecessary in MigrationScriptUtil.getBaseScriptForNode
      BaseMigrationScript script = MigrationScriptUtil.getBaseScriptForNode(null, migrationScript);
      if (script == null) continue;
      scripts.put(script, migrationScript);
    }

    for (BaseMigrationScript script : scripts.keySet()) {
      SNode migrationScript = scripts.get(script);
      for (AbstractMigrationRefactoring refactoring : script.getRefactorings()) {
        if (refactoring.isShowAsIntention()) {
          Intention intention = new MigrationRefactoringAdapter(refactoring, migrationScript);
          ModuleReference moduleRef = language.getModuleReference();
          SNodePointer node = new SNodePointer(migrationScript);
          IntentionsManager.getInstance().addIntention(intention, moduleRef, node);
        }
      }
    }
  }


  private void clear() {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        myIntentions.clear();
        myNodesByIntentions.clear();
        myIntentionsLanguages.clear();
        invalidateCaches();
        myLoaded = false;
      }
    });
  }

  private void initIntentionsDescriptor(Language language, LanguageAspect aspect, String classShortName) {
    try {
      Class<?> cls = language.getClass(language.getModuleFqName() + "." + aspect.getName() + "." + classShortName);
      if (cls != null) {
        BaseIntentionsDescriptor desc = (BaseIntentionsDescriptor) cls.newInstance();
        desc.init();
      }
    } catch (Throwable throwable) {
      LOG.error("Error while initializing intentions descriptor for language " + language.getModuleFqName(), throwable);
    }
  }


  //-------------queryDescriptor-----------------

  public static class QueryDescriptor {
    private Class<? extends Intention> myIntentionClass = null;
    private boolean myInstantiate = false;
    private boolean myEnabledOnly = false;
    private boolean myCurrentNodeOnly = false;
    private Computable<Boolean> myTerminated = new Computable<Boolean>() {
      public Boolean compute() {
        return false;
      }
    };

    public QueryDescriptor(Class<? extends Intention> intentionClass, boolean instantiate, boolean enabledOnly, Computable<Boolean> terminated, boolean currentNodeOnly) {
      myIntentionClass = intentionClass;
      myInstantiate = instantiate;
      myEnabledOnly = enabledOnly;
      myCurrentNodeOnly = currentNodeOnly;

      if (terminated != null) {
        myTerminated = terminated;
      }
    }

    public QueryDescriptor() {

    }

    public void setIntentionClass(Class<? extends Intention> intentionClass) {
      myIntentionClass = intentionClass;
    }

    public void setInstantiate(boolean instantiate) {
      myInstantiate = instantiate;
    }

    public void setEnabledOnly(boolean enabledOnly) {
      myEnabledOnly = enabledOnly;
    }

    public void setCurrentNodeOnly(boolean currentNodeOnly) {
      myCurrentNodeOnly = currentNodeOnly;
    }

    public void setTerminated(Computable<Boolean> terminated) {
      myTerminated = terminated;
    }

    public boolean isInstantiate() {
      return myInstantiate;
    }

    public boolean isCurrentNodeOnly() {
      return myCurrentNodeOnly;
    }

    public Computable<Boolean> getTerminated() {
      return myTerminated;
    }

    public Set<Pair<Intention, SNode>> filter(Set<Pair<Intention, SNode>> intentions) {
      Set<Pair<Intention, SNode>> result = new HashSet<Pair<Intention, SNode>>();

      Set<Intention> disabled = IntentionsManager.getInstance().getDisabledIntentions();
      for (Pair<Intention, SNode> p : intentions) {
        if (myIntentionClass == null || myIntentionClass.isAssignableFrom(p.getFirst().getClass())) {
          if (!(myEnabledOnly && disabled.contains(p.first))) {
            result.add(p);
          }
        }
      }

      return result;
    }
  }

  //-------------component methods-----------------

  public void initComponent() {
    myClassLoaderManager.addReloadHandler(myReloadHandler);
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "MPS Intention Manager";
  }

  public void disposeComponent() {
    myClassLoaderManager.removeReloadHandler(myReloadHandler);
  }

  public MyState getState() {
    return myState;
  }

  public void loadState(MyState state) {
    myState = state;
  }

  public static class MyState {
    private Set<String> myDisabledIntentions = new HashSet<String>();

    public Set<String> getDisabledIntentions() {
      return myDisabledIntentions;
    }

    public void setDisabledIntentions(Set<String> disabledIntentions) {
      myDisabledIntentions = disabledIntentions;
    }
  }
}
