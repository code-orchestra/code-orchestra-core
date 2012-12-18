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
package jetbrains.mps.generator.template;

import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;

import java.util.List;

/**
 * Igor Alshannikov
 * Jul 21, 2008
 */
public class TemplateQueryContext {
  // key for 'node user object' used to keep track of 'original input node' for a generated node
  // only used when output node has been created as a 'copy' of 'original input node'
  public static final String ORIGINAL_INPUT_NODE = "originalInputNode";

  private final SNode myInputNode;
  private final SNode myTemplateNode;
  private final ITemplateGenerator myGenerator;
  protected TemplateContext myContext;

  public TemplateQueryContext(SNode inputNode, SNode templateNode, TemplateContext context, ITemplateGenerator generator) {
    myInputNode = inputNode;
    myTemplateNode = templateNode;
    myGenerator = generator;
    myContext = context;
  }

  /**
   * 'node' mapping
   */
  public SNode getNode() {
    return getInputNode();
  }


  public SNode getInputNode() {
    return myInputNode;
  }

  public SNode getTemplateNode() {
    return myTemplateNode;
  }

  public SNode getOutputNode() {
    return null; //used in ref macros
  }

  public SModel getInputModel() {
    return myGenerator.getInputModel();
  }

  public boolean isDirty(SNode node) {
    return myGenerator.isDirty(node);
  }

  public SModel getOutputModel() {
    return myGenerator.getOutputModel();
  }

  public SModel getOriginalInputModel() {
    return myGenerator.getGeneratorSessionContext().getOriginalInputModel();
  }

  /**
   * 'sourceModel' mapping
   *
   * @deprecated
   */
  public SModel getSourceModel() {
    return getInputModel();
  }

  /**
   * 'generator' mapping
   */
  public ITemplateGenerator getGenerator() {
    return myGenerator;
  }

  /**
   * 'scope' mapping
   */
  public IScope getScope() {
    return myGenerator.getGeneratorSessionContext().getScope();
  }

  public SNode getOutputNodeByMappingLabel(String label) {
    if (!myGenerator.areMappingsAvailable()) {
      myGenerator.getLogger().error(getTemplateNodeForLogging(), "'get output by label' cannot be used here");
    }
    return myGenerator.findOutputNodeByInputNodeAndMappingName(null, label);
  }

  public SNode getOutputNodeByInputNodeAndMappingLabel(SNode inputNode, String label) {
    if (inputNode == null) return null;
    if (!myGenerator.areMappingsAvailable()) {
      myGenerator.getLogger().error(getTemplateNodeForLogging(), "'get output by input and label' cannot be used here");
    }
    return myGenerator.findOutputNodeByInputNodeAndMappingName(inputNode, label);
  }

  @Deprecated
  public SNode getOutputNodeByInputNodeAndMappingLabelAndOutputNode(SNode inputNode, SNode outputNode, String label) {
    if (inputNode == null) return null;
    return getOutputNodeByInputNodeAndMappingLabel(inputNode, label); //output node ignored
  }

  public List<SNode> getAllOutputNodesByInputNodeAndMappingLabel(SNode inputNode, String label) {
    if (inputNode == null) return null;
    if (!myGenerator.areMappingsAvailable()) {
      myGenerator.getLogger().error(getTemplateNodeForLogging(), "'get all output by input and label' cannot be used here");
    }
    return myGenerator.findAllOutputNodesByInputNodeAndMappingName(inputNode, label);
  }

  public SNode getOutputNodeByInputNodeAndMappingLabelAndOutputNodeScope(SNode inputNode, String label, IOperationContext operationContext) {
    throw new UnsupportedOperationException("use this method only in reference macros");
  }

  public SNode getCopiedOutputNodeForInputNode(SNode inputNode) {
    if (inputNode == null) return null;
    if (!myGenerator.areMappingsAvailable()) {
      myGenerator.getLogger().error(getTemplateNodeForLogging(), "'get copied node for input' cannot be used here");
    }
    return myGenerator.findCopiedOutputNodeForInputNode(inputNode);
  }

  public SNode getPreviousInputNodeByMappingLabel(String label) {
    return myContext == null ? null : myContext.getNamedInput(label);
  }

  public SNode getOriginalCopiedInputNode(SNode node) {
    if (node == null || node.isDisposed()) return null;
    SNode result = (SNode) node.getUserObject(ORIGINAL_INPUT_NODE);
    return result != null ? result : node;
  }

  public String createUniqueName(String baseName, SNode contextNode) {
    return myGenerator.getGeneratorSessionContext().createUniqueName(baseName, contextNode, myInputNode);
  }

  public IOperationContext getInvocationContext() {
    return myGenerator.getGeneratorSessionContext().getInvocationContext();
  }

  // user objects

  public Object putTransientObject(Object key, Object o) {
    myGenerator.getGeneratorSessionContext().putTransientObject(key, o);
    return o;
  }

  public Object getTransientObject(Object key) {
    return myGenerator.getGeneratorSessionContext().getTransientObject(key);
  }

  public Object getVariable(String name) {
    return myContext == null ? null : myContext.getVariable(name);
  }

  public Object getPatternVariable(String name) {
    return myContext == null ? null : myContext.getPatternVariable(name);
  }

  public Object getGenerationParameter(String name) {
    return myGenerator.getGeneratorSessionContext().getGenerationParameter(name);
  }

  public Object putStepObject(Object key, Object o) {
    myGenerator.getGeneratorSessionContext().putStepObject(key, o);
    return o;
  }

  public Object getStepObject(Object key) {
    return myGenerator.getGeneratorSessionContext().getStepObject(key);
  }

  public Object putSessionObject(Object key, Object o) {
    myGenerator.getGeneratorSessionContext().putSessionObject(key, o);
    return o;
  }

  public Object getSessionObject(Object key) {
    return myGenerator.getGeneratorSessionContext().getSessionObject(key);
  }

  public void showInformationMessage(SNode node, String message) {
    myGenerator.getLogger().info(node, message);
  }

  public void showWarningMessage(SNode node, String message) {
    myGenerator.getLogger().warning(node, message);
  }

  public void showErrorMessage(SNode node, String message) {
    SNode inputNode = (node != null) ? node : getInputNode();
    myGenerator.showErrorMessage(inputNode, getTemplateNode(), getRuleNodeForLogging(), message);
  }

  public SNode getTemplateNodeForLogging() {
    return getTemplateNode();
  }

  public SNode getRuleNodeForLogging() {
    return null;
  }
}
