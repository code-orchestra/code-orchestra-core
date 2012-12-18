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
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SearchScopeOperations;
import jetbrains.mps.smodel.AttributesRolesUtil;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.search.ISearchScope;
import org.jetbrains.annotations.NotNull;

import java.util.List;

public class ReferenceMacroContext extends TemplateQueryContextWithMacro {
  private SNode myOutputNode;
  private String myRole;

  public ReferenceMacroContext(SNode node, SNode outputNode, SNode macroNode, TemplateContext context, ITemplateGenerator generator) {
    super(node, macroNode, context, generator);
    myOutputNode = outputNode;
    myRole = AttributeOperations.getLinkRole(macroNode);
  }

  public ReferenceMacroContext(SNode node, SNode outputNode, @NotNull SNodePointer macroNode, @NotNull String role, TemplateContext context, @NotNull ITemplateGenerator generator) {
    super(node, macroNode, context, generator);
    myOutputNode = outputNode;
    myRole = role;
  }

  /**
   * 'outputNode' mapping
   */
  public SNode getOutputNode() {
    return myOutputNode;
  }

  public SNode getOutputNodeByInputNodeAndMappingLabelAndOutputNodeScope(SNode inputNode, String label, IOperationContext operationContext) {
    List<SNode> outputNodes = this.getAllOutputNodesByInputNodeAndMappingLabel(inputNode, label);
    if(outputNodes == null) return null;
    SNode referenceSourceNode = getOutputNode();
    String referenceRole = myRole;
    ISearchScope referenceScope = SNodeOperations.getReferentSearchScope(referenceSourceNode, referenceRole, operationContext);
    for (SNode outputNode : outputNodes) {
      if (SearchScopeOperations.containsNode(referenceScope, outputNode)) {
        return outputNode;
      }
    }
    return null;
  }
}
