package codeOrchestra.generator.optimize;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.view.utils.NodeUtils;
import codeOrchestra.environment.Environment;
import codeOrchestra.environment.view.EnvironmentLibraryManager;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.NameUtil;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public class UsagesCollector {

  private Project project;
  private CodeOrchestraGenerationContext codeOrchestraGenerationContext;
  private List<SNodePointer> rootPointers;
  private List<SModelDescriptor> rawModelsGraph;
  private ProgressIndicator progressIndicator;
  private Environment environment;
  private EnvironmentLibraryManager environmentLibraryManager;

  private Set<SNodePointer> usages = new HashSet<SNodePointer>();
  private Set<SNodePointer> checkedAlready = new HashSet<SNodePointer>();

  public UsagesCollector(Project project, CodeOrchestraGenerationContext codeOrchestraGenerationContext, List<SNodePointer> rootPointers, List<SModelDescriptor> rawModelsGraph, ProgressIndicator indicator) {
    this.project = project;
    this.codeOrchestraGenerationContext = codeOrchestraGenerationContext;
    this.rootPointers = rootPointers;
    this.rawModelsGraph = rawModelsGraph;
    this.progressIndicator = indicator;
    this.environmentLibraryManager = project.getComponent(EnvironmentLibraryManager.class);
    this.environment = Environment.byOutputType(codeOrchestraGenerationContext.getRootOutputType());
  }

  private SNode followTheReference(SReference reference) {
    SNode targetNode = reference.getTargetNode();
    if (environment == null) {
      return targetNode;
    }

    if (targetNode == null) {
      return null;
    }

    return followTheReference(targetNode);
  }

  private SNode followTheReference(SNode targetNode) {
    return environmentLibraryManager.getRedirector().redirect(project, targetNode, environment);
  }

  public void walk() {
    // Walk the root pointers
    for (SNodePointer rootPointer : rootPointers) {
      walk(rootPointer.getNode());
    }

    // Search the raw models graph for the roots that should be used anyway
    for (SModelDescriptor modelDescriptor : rawModelsGraph) {
      for (SNode root : modelDescriptor.getSModel().roots()) {
        if (mustBeUsedAnyway(root)) {
          walk(root);
        }
      }
    }

    // Add the roots
    for (SNodePointer usedRoot : usages) {
      codeOrchestraGenerationContext.addUsedRoot(usedRoot);
    }
  }

  private boolean mustBeUsedAnyway(SNode root) {
    return NodeUtils.mustBeUsedInGenerationAnyway(root);
  }

  private boolean mustBeAvoided(SNode root) {
    SModelDescriptor modelDescriptor = root.getModel().getModelDescriptor();
    if (modelDescriptor instanceof EditableSModelDescriptor && ((EditableSModelDescriptor) modelDescriptor).isDoNotGenerate()) {
      return true;
    }

    // Check for annotations like [API], [NeverUsed]
    if (NodeUtils.mustBeAvoidedInGeneration(root)) {
      return true;
    }

    return false;
  }

  private void walk(SNode node) {
    if (isStubNode(node)) {
      return;
    }

    SNodePointer nodePointer = new SNodePointerEx(node);
    if (checkedAlready.contains(nodePointer)) {
      return;
    } else {
      checkedAlready.add(nodePointer);
    }

    assert node.getParent() == null : "The node to check must be root: " + node;

    if (mustBeAvoided(node)) {
      return;
    }

    // Used nodes
    long timeStarted = System.currentTimeMillis();
    List<SNode> allUsedNodes = NodeUtils.getAllUsedNodes(node, project);
    long timeTook = System.currentTimeMillis() - timeStarted;
    if (timeTook > 1l) {
      updateProgressIndicator(node);
    }

    for (SNode usedNode : allUsedNodes) {
      SNode targetNode = followTheReference(usedNode);
      if (targetNode != null) {
        walk(targetNode);
      }
    }

    usages.add(nodePointer);
  }

  private void updateProgressIndicator(SNode node) {
    progressIndicator.setText2(NameUtil.longNameFromNamespaceAndShortName(node.getModel().getLongName(), node.getName()));
    try {
      Thread.sleep(20);
    } catch (InterruptedException e) {
      // ignore
    }
  }

  private boolean isStubNode(SNode node) {
    SModel model = node.getModel();
    return !model.getStereotype().isEmpty();
  }


}
