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
package jetbrains.mps.smodel;

import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.AuxilaryRuntimeModel;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.smodel.constraints.ModelConstraintsManager;
import jetbrains.mps.smodel.event.SModelListener.SModelListenerPriority;
import jetbrains.mps.smodel.event.SModelPropertyEvent;
import jetbrains.mps.smodel.event.SModelRootEvent;
import jetbrains.mps.smodel.search.ConceptAndSuperConceptsScope;
import jetbrains.mps.smodel.search.SModelSearchUtil;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.ConditionalIterable;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.List;

public class SModelUtil_new implements ApplicationComponent {
  private static final Logger LOG = Logger.getLogger(SModelUtil_new.class);
  private ClassLoaderManager myClManager;
  private GlobalSModelEventsManager myMeManager;
  private ReloadAdapter myReloadHandler = new ReloadAdapter() {
    public void unload() {
      SModelUtil.clearCaches();
    }
  };
  private SModelAdapter myModelListener = new SModelAdapter(SModelListenerPriority.PLATFORM) {
    public void rootRemoved(SModelRootEvent p0) {
      if (!LanguageAspect.STRUCTURE.is(p0.getModel())) {
        return;
      }
      if (!(SNodeUtil.isInstanceOfAbstractConceptDeclaration(p0.getRoot()))) {
        return;
      }

      SModelUtil.clearCaches();
    }

    public void modelReplaced(SModelDescriptor descriptor) {
      if (Language.getModelAspect(descriptor) != LanguageAspect.STRUCTURE) {
        return;
      }
      SModelUtil.clearCaches();
    }

    public void propertyChanged(SModelPropertyEvent p0) {
      if (!LanguageAspect.STRUCTURE.is(p0.getModel())) {
        return;
      }
      if (!(SNodeUtil.isInstanceOfAbstractConceptDeclaration(p0.getNode()))) {
        return;
      }
      if (!p0.getPropertyName().equals("name")) {
        return;
      }

      String modelName = p0.getNode().getModel().getLongName();
      String newName = modelName + "." + p0.getNewPropertyValue();
      String oldName = modelName + "." + p0.getOldPropertyValue();
      SModelUtil.conceptRenamed(oldName, newName);
    }
  };

  public SModelUtil_new(ClassLoaderManager clManager, GlobalSModelEventsManager meManager) {
    myClManager = clManager;
    myMeManager = meManager;
  }

  public void initComponent() {
    myClManager.addReloadHandler(myReloadHandler);
    myMeManager.addGlobalModelListener(myModelListener);
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "SModelUtil";
  }

  public void disposeComponent() {
    myMeManager.removeGlobalModelListener(myModelListener);
    myClManager.removeReloadHandler(myReloadHandler);
  }

  public static <T extends BaseAdapter> T findNodeByFQName(String nodeFQName, Class<T> conceptClass, IScope scope) {
    String modelName = NameUtil.namespaceFromLongName(nodeFQName);
    final String name = NameUtil.shortNameFromLongName(nodeFQName);

    for (SModelDescriptor descriptor : scope.getModelDescriptors()) {
      if (!modelName.equals(descriptor.getLongName())) continue;

      SModel model = descriptor.getSModel();
      Condition<SNode> cond = new Condition<SNode>() {
        public boolean met(SNode node) {
          return name.equals(node.getName());
        }
      };
      Iterable<SNode> iterable = new ConditionalIterable<SNode>(model.roots(), cond);
      for (SNode node : iterable) {
        INodeAdapter adapter = BaseAdapter.fromNode(node);
        if (conceptClass.isAssignableFrom(adapter.getClass())) {
          return (T) adapter;
        }
      }
    }
    LOG.warning("couldn't find node by fqname: " + nodeFQName);
    return null;
  }


  /**
   * use SModelUtil
   */
  @Deprecated
  public static boolean isAssignableConcept(String fromConceptFqName, String toConceptFqName) {
    return SModelUtil.isAssignableConcept(fromConceptFqName, toConceptFqName);
  }

  public static List<SNode> getConceptAndSuperConcepts(SNode topConcept) {
    return new ConceptAndSuperConceptsScope(topConcept).getConcepts();
  }

  public static SNode instantiateConceptDeclaration(String conceptFQName, SModel model, IScope scope) {
    return instantiateConceptDeclaration(conceptFQName, model, scope, true);
  }

  public static SNode instantiateConceptDeclaration(SNode conceptDeclaration, SModel model) {
    return instantiateConceptDeclaration(NameUtil.nodeFQName(conceptDeclaration), model, GlobalScope.getInstance());
  }

  public static SNode instantiateConceptDeclaration(SNode conceptDeclaration, SModel model, boolean fullNodeStructure) {
    return instantiateConceptDeclaration(NameUtil.nodeFQName(conceptDeclaration), model, GlobalScope.getInstance(), fullNodeStructure);
  }

  public static SNode instantiateConceptDeclaration(@NotNull String conceptFqName, @Nullable SModel model, IScope scope, boolean fullNodeStructure) {
    if (model == null) {
      model = AuxilaryRuntimeModel.getDescriptor().getSModel();
    }
    assert model != null;
    boolean isNotProjectModel = !ProjectModels.isProjectModel(model.getSModelReference());
    if (isNotProjectModel) {
      String fqName = ModelConstraintsManager.getInstance().getDefaultConcreteConceptFqName(conceptFqName, scope);
      if (fqName != null) {
        conceptFqName = fqName;
      }
    }

    // patch: old generated adapters use fqName without word 'structure'
    if (conceptFqName.indexOf(".structure.") == -1) {
      String conceptName = NameUtil.shortNameFromLongName(conceptFqName);
      String languageNamespace = NameUtil.namespaceFromLongName(conceptFqName);
      conceptFqName = languageNamespace + ".structure." + conceptName;
    }

    SNode newNode = new SNode(model, conceptFqName);
    // create the node structure
    if (fullNodeStructure &&
      isNotProjectModel) { //project models can be created and used
      //before project language is loaded
      SNode conceptDeclaration = SModelUtil.findConceptDeclaration(conceptFqName, scope);
      createNodeStructure(conceptDeclaration, newNode, model);
    }
    return newNode;
  }

  private static void createNodeStructure(SNode nodeConcept,
                                          SNode newNode, SModel model) {
    for (SNode linkDeclaration : SModelSearchUtil.getLinkDeclarations(nodeConcept)) {
      String role = SModelUtil.getGenuineLinkRole(linkDeclaration);
      SNode genuineLinkDeclaration = SModelUtil.getGenuineLinkDeclaration(linkDeclaration);
      if (!SNodeUtil.getLinkDeclaration_IsReference(genuineLinkDeclaration) &&
        SNodeUtil.getLinkDeclaration_IsAtLeastOneMultiplicity(genuineLinkDeclaration)) {

        SNode targetConcept = SModelUtil.getLinkDeclarationTarget(linkDeclaration);
        LOG.assertLog(targetConcept != null, "link target is null");
        if (newNode.getChildren(role).isEmpty()) {
          SNode childNode = instantiateConceptDeclaration(targetConcept, model);
          newNode.addChild(role, childNode);
        }
      }
    }
  }

  public static boolean isAcceptableTarget(SNode sourceNode, String role, SNode targetNode) {
    SNode conceptDeclaration = sourceNode.getConceptDeclarationNode();
    SNode linkDeclaration = SModelSearchUtil.findMostSpecificLinkDeclaration(conceptDeclaration, role);
    if (linkDeclaration == null) {
      LOG.error("couldn't find link declaration for role '" + role + "' in hierarchy of concept " + conceptDeclaration.getDebugText(), sourceNode);
      return false;
    }
    return SModelUtil.isAcceptableTarget(linkDeclaration, targetNode);
  }

  public static String getAlias(SNode conceptDeclaration) {
    return getStringConceptProperty(conceptDeclaration, SNodeUtil.CPR_BaseConcept_alias);
  }

  public static String getStringConceptProperty(SNode conceptDeclaration, String propertyName) {
    SNode property = SModelSearchUtil.findConceptProperty(conceptDeclaration, propertyName);

    Object value = SNodeUtil.getConceptPropertyValue(property);
    if (value instanceof String) {
      return (String) value;
    }
    return null;
  }

  public static boolean isEmptyPropertyValue(String s) {
    return s == null || s.equals("");
  }

  public static int getMetaLevel(SNode node) {
    return SNodeUtil.getMetaLevel(node);
  }
}
