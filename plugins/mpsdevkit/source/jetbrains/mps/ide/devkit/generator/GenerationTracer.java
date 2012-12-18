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
package jetbrains.mps.ide.devkit.generator;

import com.intellij.openapi.project.Project;

import jetbrains.mps.generator.IGenerationTracer;
import jetbrains.mps.generator.runtime.TemplateMappingScript;
import jetbrains.mps.ide.devkit.generator.TracerNode.Kind;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.Pair;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.SwingUtilities;
import java.util.*;


public class GenerationTracer implements IGenerationTracer {
  private static final Logger LOG = Logger.getLogger(GenerationTracer.class);

  private Project myProject;
  private boolean myActive = false;

  private List<TracerNode> myCurrentTracingData;
  private TracerNode myCurrentTraceNode;
  private Map<String, List<TracerNode>> myTracingDataByInputModel;
  private Map<String, List<TracerNode>> myTracingDataByOutputModel;
  private ModelsProcessedByScripts myModelsProcessedByScripts;

  private Map<SNode, TracerNode> myOutputNodesToReplaceLater = new HashMap<SNode, TracerNode>();

  public GenerationTracer(Project project) {
    myProject = project;
  }

  private GenerationTracerViewTool getTracerViewTool() {
    return myProject.getComponent(GenerationTracerViewTool.class);
  }

  @Override
  public void startTracing() {
    myActive = true;
    myTracingDataByInputModel = new HashMap<String, List<TracerNode>>();
    myTracingDataByOutputModel = new HashMap<String, List<TracerNode>>();
    myModelsProcessedByScripts = new ModelsProcessedByScripts();
    myCurrentTracingData = null;
    myCurrentTraceNode = null;

    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        getTracerViewTool().setTracingDataIsAvailable(false);
      }
    });
  }

  @Override
  public void finishTracing() {
    myActive = false;
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        getTracerViewTool().setTracingDataIsAvailable(hasTracingData());
      }
    });
  }

  @Override
  public void discardTracing() {
    myActive = false;
    myTracingDataByInputModel = null;
    myTracingDataByOutputModel = null;
    myModelsProcessedByScripts = null;
    myCurrentTracingData = null;
    myCurrentTraceNode = null;

    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        getTracerViewTool().setTracingDataIsAvailable(false);
      }
    });
  }

  @Override
  public boolean isTracing() {
    return myActive;
  }

  @Override
  public void startTracing(SModel inputModel, SModel outputModel) {
    if (!myActive) return;
    myCurrentTracingData = new ArrayList<TracerNode>();
    myTracingDataByInputModel.put(inputModel.getSModelReference().toString(), myCurrentTracingData);
    myTracingDataByOutputModel.put(outputModel.getSModelReference().toString(), myCurrentTracingData);
    myCurrentTraceNode = null;
  }

  @Override
  public void discardTracing(SModel inputModel, SModel outputModel) {
    if (!myActive) return;
    myTracingDataByInputModel.remove(inputModel.getSModelReference().toString());
    myTracingDataByOutputModel.remove(outputModel.getSModelReference().toString());
    myCurrentTracingData = null;
    myCurrentTraceNode = null;
  }

  @Override
  public void pushInputNode(SNode node) {
    if (!myActive) return;
    push(new TracerNode(TracerNode.Kind.INPUT, new SNodePointer(node)));
  }

  @Override
  public void closeInputNode(SNode node) {
    if (!myActive) return;
    closeBranch(TracerNode.Kind.INPUT, new SNodePointer(node));
  }

  @Override
  public void popInputNode(SNode node) {
    if (!myActive) return;
    pop(TracerNode.Kind.INPUT, new SNodePointer(node));
  }

  @Override
  public void pushRule(SNodePointer node) {
    if (!myActive) return;
    push(new TracerNode(TracerNode.Kind.RULE, node));
  }

  @Override
  public void closeRule(SNodePointer node) {
    if (!myActive) return;
    closeBranch(TracerNode.Kind.RULE, node);
  }

  @Override
  public void pushRuleConsequence(SNodePointer node) {
    if (!myActive) return;
    push(new TracerNode(TracerNode.Kind.RULE_CONSEQUENCE, node));
  }

  @Override
  public void pushSwitch(SNodePointer node) {
    if (!myActive) return;
    push(new TracerNode(TracerNode.Kind.SWITCH, node));
  }

  @Override
  public void pushMacro(SNodePointer node) {
    if (!myActive) return;
    push(new TracerNode(TracerNode.Kind.MACRO, node));
  }

  @Override
  public void closeMacro(SNodePointer node) {
    if (!myActive) return;
    closeBranch(TracerNode.Kind.MACRO, node);
  }

  @Override
  public void pushOutputNode(SNode node) {
    if (!myActive) return;
    push(new TracerNode(TracerNode.Kind.OUTPUT, new SNodePointer(node)));
  }

  @Override
  public void pushOutputNodeToReplaceLater(SNode node) {
    if (!myActive) return;
    if (myCurrentTraceNode == null) {
      LOG.errorWithTrace("can't define parent tracer node");
      return;
    }
    myOutputNodesToReplaceLater.put(node, myCurrentTraceNode);
  }

  @Override
  public void replaceOutputNode(SNode node, SNode newOutputNode) {
    if (!myActive) return;
    TracerNode parentTracerNode = myOutputNodesToReplaceLater.get(node);
    myOutputNodesToReplaceLater.remove(node);
    if (parentTracerNode == null) {
      LOG.errorWithTrace("can't define parent tracer node");
      return;
    }
    parentTracerNode.addChild(new TracerNode(Kind.OUTPUT, new SNodePointer(newOutputNode)));
  }

  @Override
  public void pushTemplateNode(SNodePointer node) {
    if (!myActive) return;
    push(new TracerNode(Kind.TEMPLATE, node));
  }

  @Override
  public void closeTemplateNode(SNodePointer node) {
    if (!myActive) return;
    closeBranch(Kind.TEMPLATE, node);
  }

  @Override
  public void pushCopyOperation() {
    if (!myActive) return;
    push(new TracerNode(Kind.COPY_OPERATION, null));
  }

  private void push(TracerNode tracerNode) {
    if (myCurrentTraceNode == null) {
      // new root
      myCurrentTracingData.add(tracerNode);
    } else {
      myCurrentTraceNode.addChild(tracerNode);
    }

    if (myCurrentTraceNode == null) {
      if (tracerNode.getKind() != Kind.INPUT && tracerNode.getKind() != Kind.RULE) {
        LOG.errorWithTrace("node of kind '" + tracerNode.getKind() + "' can not be root");
      }
    }

    if (tracerNode.getKind() != Kind.OUTPUT) {
      // OUTPUT node is always leaf (leave 'current' unchanged)
      myCurrentTraceNode = tracerNode;
    }
  }

  private void closeBranch(Kind kind, SNodePointer node) {
    TracerNode checkNode = myCurrentTraceNode;
    while (checkNode != null) {
      if (checkNode.isThis(kind, node)) {
        myCurrentTraceNode = checkNode.getParent(); // can be null
        return;
      }
      checkNode = checkNode.getParent();
    }

    LOG.errorWithTrace("tracer node not found. kind:" + kind + " node: " + node.getNode().getDebugText());
    myCurrentTraceNode = null; // reset branch
  }

  /**
   * removes node from tree
   */
  private void pop(Kind kind, SNodePointer node) {
    TracerNode checkNode = myCurrentTraceNode;
    while (checkNode != null) {
      if (checkNode.isThis(kind, node)) {
        myCurrentTraceNode = checkNode.getParent(); // can be null
        if (myCurrentTraceNode != null) {
          myCurrentTraceNode.removeChild(checkNode);
        } else {
          myCurrentTracingData.remove(checkNode);
        }
        return;
      }
      checkNode = checkNode.getParent();
    }

    LOG.errorWithTrace("tracer node not found. kind:" + kind + " node: " + node.getNode().getDebugText());
    myCurrentTraceNode = null; // reset branch
  }

  public boolean hasTracingData() {
    if (myTracingDataByInputModel == null || myTracingDataByInputModel.isEmpty()) return false;
    for (List<TracerNode> list : myTracingDataByInputModel.values()) {
      if (!list.isEmpty()) return true;
    }
    return false;
  }

  public boolean hasTraceInputData(SModelReference modelReference) {
    if (getRootTracerNodes(Kind.INPUT, modelReference) != null) {
      return true;
    }
    return myModelsProcessedByScripts != null && myModelsProcessedByScripts.hasInput(modelReference);
  }

  public boolean showTraceInputData(SNode node) {
    int index = getTracerViewTool().getTabIndex(Kind.INPUT, node);
    if (index > -1) {
      getTracerViewTool().selectIndex(index);
      getTracerViewTool().openToolLater(true);
      return true;
    }

    TracerNode tracerNode = buildTraceInputTree(node);
    if (tracerNode == null) return false;
    getTracerViewTool().showTraceView(tracerNode);
    return true;
  }

  @Nullable
  private TracerNode buildTraceInputTree(SNode node) {
    List<TracerNode> tracerNodes = findAllTopmostTracerNodes(Kind.INPUT, new SNodePointer(node));
    if (!tracerNodes.isEmpty()) {
      TracerNode resultTracerNode = new TracerNode(tracerNodes.get(0).getKind(), tracerNodes.get(0).getNodePointer());
      for (TracerNode tracerNode : tracerNodes) {
        List<TracerNode> childrensCopy = tracerNode.getChildrenCopy();
        for (TracerNode childCopy : childrensCopy) {
          resultTracerNode.addChild(childCopy);
        }
      }
      return resultTracerNode;
    }

    // may be input is processed by scripts?
    List<TemplateMappingScript> mappingScripts = myModelsProcessedByScripts.getScriptsForInput(node.getModel());
    if (mappingScripts == null) return null;
    SModelReference reference = myModelsProcessedByScripts.getOutputForInput(node.getModel());
    if (reference == null) return null;
    SModelDescriptor descriptor = SModelRepository.getInstance().getModelDescriptor(reference);
    if (descriptor == null) return null;
    SModel outputModel = descriptor.getSModel();
    SNode inputNode = node;
    SNode outputNode = null;
    while (inputNode != null) {
      outputNode = outputModel.getNodeById(inputNode.getId());
      if (outputNode != null) break;
      inputNode = inputNode.getParent();
    }

    TracerNode inputTracerNode = new TracerNode(Kind.INPUT, new SNodePointer(node));
    TracerNode tracerNode = inputTracerNode;
    for (TemplateMappingScript mappingScript : mappingScripts) {
      TracerNode childTracerNode = new TracerNode(Kind.MAPPING_SCRIPT, mappingScript.getScriptNode());
      tracerNode.addChild(childTracerNode);
      tracerNode = childTracerNode;
    }
    if (outputNode != null) {
      if (inputNode == node) {
        tracerNode.addChild(new TracerNode(Kind.OUTPUT, new SNodePointer(outputNode)));
      } else {
        tracerNode.addChild(new TracerNode(Kind.APPROXIMATE_OUTPUT, new SNodePointer(outputNode)));
      }
    }

    return inputTracerNode;
  }

  public boolean hasTracebackData(SModelReference modelReference) {
    if (getRootTracerNodes(Kind.OUTPUT, modelReference) != null) {
      return true;
    }
    return myModelsProcessedByScripts != null && myModelsProcessedByScripts.hasOutput(modelReference);
  }

  public boolean showTracebackData(SNode node) {
    int index = getTracerViewTool().getTabIndex(Kind.OUTPUT, node);
    if (index > -1) {
      getTracerViewTool().selectIndex(index);
      getTracerViewTool().openToolLater(true);
      return true;
    }

    TracerNode tracerNode = buildTracebackTree(node);
    if (tracerNode == null) return false;
    getTracerViewTool().showTraceView(tracerNode);
    return true;
  }

  private TracerNode buildTracebackTree(SNode node) {
    {
      TracerNode tracerNode = findTracerNode(Kind.OUTPUT, new SNodePointer(node));
      if (tracerNode != null) {
        return buildTracebackTree(tracerNode, 0);
      }
    }

    // may be output is produced by scripts?
    List<TemplateMappingScript> mappingScripts = myModelsProcessedByScripts.getScriptsForOutput(node.getModel());
    if (mappingScripts == null) return null;
    SModelReference reference = myModelsProcessedByScripts.getInputForOutput(node.getModel());
    if (reference == null) return null;
    SModelDescriptor descriptor = SModelRepository.getInstance().getModelDescriptor(reference);
    if (descriptor == null) return null;
    SModel inputModel = descriptor.getSModel();
    SNode outputNode = node;
    SNode inputNode = null;
    while (outputNode != null) {
      inputNode = inputModel.getNodeById(outputNode.getId());
      if (inputNode != null) break;
      outputNode = outputNode.getParent();
    }

    TracerNode outputTracerNode = new TracerNode(Kind.OUTPUT, new SNodePointer(node));
    TracerNode tracerNode = outputTracerNode;
    List<TemplateMappingScript> mappingScripts_reversed = new ArrayList<TemplateMappingScript>(mappingScripts);
    Collections.reverse(mappingScripts_reversed);
    for (TemplateMappingScript mappingScript : mappingScripts_reversed) {
      TracerNode childTracerNode = new TracerNode(Kind.MAPPING_SCRIPT, mappingScript.getScriptNode());
      tracerNode.addChild(childTracerNode);
      tracerNode = childTracerNode;
    }
    if (inputNode != null) {
      if (outputNode == node) {
        tracerNode.addChild(new TracerNode(Kind.INPUT, new SNodePointer(inputNode)));
      } else {
        tracerNode.addChild(new TracerNode(Kind.APPROXIMATE_INPUT, new SNodePointer(inputNode)));
      }
    }

    return outputTracerNode;
  }

  @NotNull
  private List<TracerNode> findAllTopmostTracerNodes(Kind kind, SNodePointer node) {
    List<TracerNode> rootTracerNodes = getRootTracerNodes(kind, node.getModel().getSModelReference());
    if (rootTracerNodes == null) return new ArrayList<TracerNode>();

    List<TracerNode> result = new ArrayList<TracerNode>();
    for (TracerNode rootTracerNode : rootTracerNodes) {
      rootTracerNode.findAllTopmost(kind, node, result);
    }
    return result;
  }

  @Nullable
  private List<TracerNode> getRootTracerNodes(Kind kind, SModelReference modelReference) {
    if (myTracingDataByInputModel == null) return null;

    if (kind == Kind.INPUT) {
      String inputModelUID = modelReference.toString();
      return myTracingDataByInputModel.get(inputModelUID);
    } else if (kind == Kind.OUTPUT) {
      String outputModelUID = modelReference.toString();
      return myTracingDataByOutputModel.get(outputModelUID);
    }

    LOG.errorWithTrace("unexpected trace node kind: " + kind);
    return null;
  }

  private TracerNode findTracerNode(Kind kind, SNodePointer node) {
    List<TracerNode> rootTracerNodes = getRootTracerNodes(kind, node.getModel().getSModelReference());
    if (rootTracerNodes == null) return null;

    for (TracerNode rootTracerNode : rootTracerNodes) {
      TracerNode tracerNode = rootTracerNode.find(kind, node);
      if (tracerNode != null) {
        return tracerNode;
      }
    }
    return null;
  }

  private TracerNode buildTracebackTree(TracerNode tracerNode, int depth) {
    TracerNode tracebackNode = new TracerNode(tracerNode.getKind(), tracerNode.getNodePointer());
    if (depth >= 200) {
      // its enough
      return tracebackNode;
    }
    if (tracerNode.getParent() != null) {
      tracebackNode.addChild(buildTracebackTree(tracerNode.getParent(), depth + 1));
    }
    return tracebackNode;
  }


  /**
   * util
   */
  @Override
  public List<Pair<SNode, SNode>> getAllAppiedRulesWithInputNodes(SModelReference outputModelReference) {
    List<TracerNode> list = myTracingDataByOutputModel.get(outputModelReference.toString());
    List<TracerNode> ruleNodes = new ArrayList<TracerNode>();
    for (TracerNode tracerNode : list) {
      tracerNode.findAll(Kind.RULE, ruleNodes);
    }

    List<Pair<SNode, SNode>> result = new ArrayList<Pair<SNode, SNode>>();
    for (TracerNode ruleNode : ruleNodes) {
      // find input for rule
      TracerNode inputNode = ruleNode.getParent();
      while (inputNode != null && inputNode.getKind() != Kind.INPUT) {
        inputNode = inputNode.getParent();
      }
      result.add(new Pair<SNode, SNode>(ruleNode.getNodePointer().getNode(), inputNode != null ? inputNode.getNodePointer().getNode() : null));
    }

    return result;
  }

  /**
   * util
   */
  @Override
  public List<Pair<SNode, String>> getNodesWithTextFromCurrentBranch() {
    List<Pair<SNode, String>> result = new ArrayList<Pair<SNode, String>>();
    TracerNode currNode = myCurrentTraceNode;
    while (currNode != null) {
      SNodePointer pointer = currNode.getNodePointer();
      if (pointer != null) {
        result.add(new Pair<SNode, String>(pointer.getNode(), currNode.getKind().toString()));
      } else {
        result.add(new Pair<SNode, String>(null, currNode.getKind().toString()));
      }
      currNode = currNode.getParent();
    }
    return result;
  }

  @Override
  public void registerPreMappingScripts(SModel scriptsInputModel, SModel scriptsOutputModel, List<TemplateMappingScript> preMappingScripts) {
    if (!myActive) return;
    myModelsProcessedByScripts.put(scriptsInputModel, scriptsOutputModel, preMappingScripts);
  }

  @Override
  public void registerPostMappingScripts(SModel scriptsInputModel, SModel scriptsOutputModel, List<TemplateMappingScript> postMappingScripts) {
    if (!myActive) return;
    myModelsProcessedByScripts.put(scriptsInputModel, scriptsOutputModel, postMappingScripts);
  }

  private static class ModelsProcessedByScripts {
    List<String> myInputModels = new ArrayList<String>();
    List<String> myOutputModels = new ArrayList<String>();
    List<List<TemplateMappingScript>> myScripts = new ArrayList<List<TemplateMappingScript>>();

    public void put(SModel inputModel, SModel outputModel, List<TemplateMappingScript> scripts) {
      myInputModels.add(inputModel.getSModelReference().toString());
      myOutputModels.add(outputModel.getSModelReference().toString());
      myScripts.add(scripts);
    }

    public boolean hasInput(SModelReference modelReference) {
      return myInputModels.contains(modelReference.toString());
    }

    public boolean hasOutput(SModelReference modelReference) {
      return myOutputModels.contains(modelReference.toString());
    }

    public List<TemplateMappingScript> getScriptsForInput(SModel model) {
      int i = myInputModels.indexOf(model.getSModelReference().toString());
      if (i >= 0) {
        return myScripts.get(i);
      }
      return null;
    }

    public List<TemplateMappingScript> getScriptsForOutput(SModel model) {
      int i = myOutputModels.indexOf(model.getSModelReference().toString());
      if (i >= 0) {
        return myScripts.get(i);
      }
      return null;
    }

    public SModelReference getOutputForInput(SModel model) {
      int i = myInputModels.indexOf(model.getSModelReference().toString());
      if (i >= 0) {
        return SModelReference.fromString(myOutputModels.get(i));
      }
      return null;
    }

    public SModelReference getInputForOutput(SModel model) {
      int i = myOutputModels.indexOf(model.getSModelReference().toString());
      if (i >= 0) {
        return SModelReference.fromString(myInputModels.get(i));
      }
      return null;
    }
  }
}
