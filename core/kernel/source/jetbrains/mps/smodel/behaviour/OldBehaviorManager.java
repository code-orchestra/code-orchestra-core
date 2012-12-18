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
package jetbrains.mps.smodel.behaviour;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.InternUtil;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class OldBehaviorManager implements ApplicationComponent {
  private static final Logger LOG = Logger.getLogger(OldBehaviorManager.class);

  private static final Pattern CONCEPT_FQNAME = Pattern.compile("(.*)\\.structure\\.([^\\.]+)$");

  private ReloadAdapter myReloadHandler = new ReloadAdapter() {
    public void unload() {
      clear();
    }
  };

  public static OldBehaviorManager getInstance() {
    return ApplicationManager.getApplication().getComponent(OldBehaviorManager.class);
  }

  private final ConcurrentMap<MethodInfo, Object> myMethods = new ConcurrentHashMap<MethodInfo, Object>();
  private final ConcurrentMap<String, List<Method>> myConstructors = new ConcurrentHashMap<String, List<Method>>();

  private ClassLoaderManager myClassLoaderManager;

  public OldBehaviorManager(ClassLoaderManager classLoaderManager) {
    myClassLoaderManager = classLoaderManager;
  }

  public void initComponent() {
    myClassLoaderManager.addReloadHandler(myReloadHandler);
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "Old Behavior Manager";
  }

  public void disposeComponent() {
    myClassLoaderManager.removeReloadHandler(myReloadHandler);
  }

  public void clear() {
    myMethods.clear();
    myConstructors.clear();
  }

  private static List<Method> calculateConstructors(SNode concept, Language language) {
    List<Method> methodsToCall = new ArrayList<Method>();
    Set<SNode> processed = new HashSet<SNode>();

    List<SNode> concepts = Collections.singletonList(concept);
    while (!concepts.isEmpty()) {
      List<SNode> newFrontier = new ArrayList<SNode>();
      for (SNode currentConcept : concepts) {
        assert currentConcept != null;
        if (processed.contains(currentConcept)) {
          continue;
        }
        String fqName = NameUtil.nodeFQName(currentConcept);
        String behaviorClass = behaviorClassByConceptFqName(fqName);

        try {
          Class cls = language.getClass(behaviorClass);
          if (cls != null) {
            Method method = cls.getMethod("init", SNode.class);
            method.setAccessible(true);
            methodsToCall.add(method);
          }
        } catch (NoSuchMethodException e) {
          //ignore
        }

        if (SNodeUtil.isInstanceOfConceptDeclaration(currentConcept)) {
          for (SNode interfaceConcept : SNodeUtil.getConceptDeclaration_Implements(currentConcept)) {
            if (interfaceConcept == null || processed.contains(interfaceConcept)) continue;
            newFrontier.add(interfaceConcept);
          }
          SNode parentConcept = SNodeUtil.getConceptDeclaration_Extends(currentConcept);
          if (parentConcept != null && !processed.contains(parentConcept)) {
            newFrontier.add(parentConcept);
          }
        } else if (SNodeUtil.isInstanceOfInterfaceConceptDeclaration(currentConcept)) {
          for (SNode interfaceConcept : SNodeUtil.getInterfaceConceptDeclaration_Extends(currentConcept)) {
            if (interfaceConcept == null || processed.contains(interfaceConcept)) continue;
            newFrontier.add(interfaceConcept);
          }
        }
        processed.add(currentConcept);
      }
      concepts = newFrontier;
    }

    /*  while (concept != null) {
      String fqName = NameUtil.nodeFQName(concept);
      String behaviorClass = behaviorClassByConceptFqName(fqName);

      try {
        Class cls = language.getClass(behaviorClass);
        if (cls != null) {
          Method method = cls.getMethod("init", SNode.class);
          method.setAccessible(true);
          methodsToCall.add(method);
        }
      } catch (NoSuchMethodException e) {
        //ignor too
      }

      concept = ((ConceptDeclaration) concept).getExtends();
    }*/
    return methodsToCall;
  }

  public void initNode(@NotNull SNode node) {
    SNode concept = node.getConceptDeclarationNode();
    Language language = node.getLanguage();

    String conceptFqName = InternUtil.intern(NameUtil.nodeFQName(concept));

    List<Method> methodsToCall;

    methodsToCall = myConstructors.get(conceptFqName);
    if (methodsToCall == null) {
      methodsToCall = calculateConstructors(concept, language);
      myConstructors.putIfAbsent(conceptFqName, methodsToCall);
    }

    for (int i = methodsToCall.size() - 1; i >= 0; i--) {
      try {
        methodsToCall.get(i).invoke(null, node);
      } catch (IllegalAccessException e) {
        LOG.error(e);
      } catch (InvocationTargetException e) {
        e.printStackTrace();
      }
    }
  }

  public static String behaviorClassByConceptFqName(@NotNull String fqName) {
    Matcher m = CONCEPT_FQNAME.matcher(fqName);
    if (m.matches()) {
      return m.group(1) + ".behavior." + m.group(2) + "_Behavior";
    } else {
      throw new RuntimeException();
    }
  }

  public void reloadAll() {
  }

  private Method getMethod(final SNode concept, final String methodName, final Class[] parameterTypes) {
    return NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<Method>() {
      public Method compute() {
        Language l = SModelUtil.getDeclaringLanguage(concept);

        Method method = null;
        String fqName = InternUtil.intern(NameUtil.nodeFQName(concept));

        MethodInfo mi = new MethodInfo(fqName, methodName, parameterTypes);

        Object mm = myMethods.get(mi);
        if (mm != null) {
          return mm instanceof Method ? (Method) mm : null;
        }

        String behaviorClass = behaviorClassByConceptFqName(fqName);

        try {
          Class cls = l.getClass(behaviorClass);
          if (cls != null) {
            method = cls.getMethod(methodName, parameterTypes);
          }
        } catch (NoSuchMethodException e) {
          //ignore too
        }

        if (method != null) {
          method.setAccessible(true);
        }
        mm = myMethods.putIfAbsent(mi, method != null ? method : OldBehaviorManager.this);

        return mm instanceof Method ? (Method) mm : method;
      }
    });
  }

  public <T> T invoke(Class<T> returnType, SNode node, String methodName, Class[] parametersTypes, Object... parameters) {
    return _invokeInternal(returnType, node, null, methodName, parametersTypes, parameters);
  }

  public <T> T invokeSuper(Class<T> returnType, SNode node, String callerConceptFqName, String methodName, Class[] parametersTypes, Object... parameters) {
    return _invokeInternal(returnType, node, callerConceptFqName, methodName, parametersTypes, parameters);
  }

  private <T> T _invokeInternal(Class<T> returnType, @NotNull SNode node, String callerConceptFqName, String methodName, Class[] parametersTypes, Object... parameters) {
    List<SNode> superConcepts;
    SNode concept;
    if (callerConceptFqName == null) {
      concept = node.getConceptDeclarationNode();
      if (concept == null) {
        concept = SModelUtil.getBaseConcept();
      }
      superConcepts = SModelUtil_new.getConceptAndSuperConcepts(concept);
    } else {
      concept = SModelUtil.findConceptDeclaration(callerConceptFqName, GlobalScope.getInstance());
      if (concept == null) {
        concept = SModelUtil.getBaseConcept();
      }
      superConcepts = new ArrayList<SNode>(SModelUtil_new.getConceptAndSuperConcepts(concept));
      superConcepts.remove(concept);
    }

    Method method = null;
    Class[] parameterTypeArray = parametersTypes;

    for (SNode conceptDeclaration : superConcepts) {
      method = getMethod(conceptDeclaration, methodName, parameterTypeArray);
      if (method != null) {
        break;
      }
    }

    if (method != null) {
      Object[] params = new Object[parameters.length + 1];
      params[0] = node;
      System.arraycopy(parameters, 0, params, 1, parameters.length);
      try {
        return (T) method.invoke(null, params);
      } catch (IllegalAccessException e) {
        throw new RuntimeException(e);
      } catch (InvocationTargetException e) {
        throw new RuntimeException(e);
      }
    }

    throw new RuntimeException("Can't find a method " + methodName + " in a concept " + node.getConceptFqName() + ", conceptNode == null: " + (concept == null));
  }

  private static class MethodInfo {
    private String myConceptFqName;
    private String myMethodName;
    private Class[] myParameters;

    public MethodInfo(String conceptFqName, String methodName, Class[] parameters) {
      myConceptFqName = conceptFqName;
      myMethodName = methodName;
      myParameters = parameters;
    }

    public boolean equals(Object obj) {
      if (!(obj instanceof MethodInfo)) {
        return false;
      }
      MethodInfo mi = (MethodInfo) obj;

      if (!myConceptFqName.equals(mi.myConceptFqName)) return false;
      if (!myMethodName.equals(mi.myMethodName)) return false;

      if (myParameters.length != mi.myParameters.length) return false;

      for (int i = 0; i < myParameters.length; i++) {
        if (myParameters[i] != mi.myParameters[i]) {
          return false;
        }
      }

      return true;
    }

    public int hashCode() {
      int h = 13;
      h += myConceptFqName.hashCode() * 17;
      h += myMethodName.hashCode() * 23;
      for (Class c : myParameters) {
        h += c.hashCode() * 11;
      }
      return h;
    }
  }
}
