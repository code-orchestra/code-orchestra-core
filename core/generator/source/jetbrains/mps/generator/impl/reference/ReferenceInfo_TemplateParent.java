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
package jetbrains.mps.generator.impl.reference;

import jetbrains.mps.generator.IGeneratorLogger.ProblemDescription;
import jetbrains.mps.generator.impl.GeneratorUtil;
import jetbrains.mps.generator.impl.TemplateGenerator;
import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;

/**
 * Evgeny Gryaznov, 11/19/10
 */
public class ReferenceInfo_TemplateParent extends ReferenceInfo {
  private SNodePointer myTemplateSourceNode;
  private int myParentIndex;
  private String myResolveInfo;


  public ReferenceInfo_TemplateParent(SNode outputSourceNode, String role, SNodePointer sourceNode, int parentIndex, String resolveInfo, TemplateContext context) {
    super(outputSourceNode, role, context.getInput());
    myTemplateSourceNode = sourceNode;
    myParentIndex = parentIndex;
    myResolveInfo = resolveInfo;
  }

  public SNode getInputTargetNode() {
    throw new UnsupportedOperationException();
  }

  public SNode doResolve_Straightforward(TemplateGenerator generator) {
    // try to resolve if referent node is parent of source node.
    // this solves situation when reference node inside 'template fragment' refers to 'context node' (ancestor outside 'template fragment')
    SNode current = getOutputSourceNode();
    for (int i = 0; i < myParentIndex && current != null; i++) {
      current = current.getParent();
    }
    return current;
  }

  public SNode doResolve_Tricky(TemplateGenerator generator) {
    return null;
  }

  public String getResolveInfoForDynamicResolve() {
    return myResolveInfo;
  }

  public String getResolveInfoForNothing() {
    return myResolveInfo;
  }

  @Override
  public ProblemDescription[] getErrorDescriptions() {
    SNode inputNode = getInputNode();
    return new ProblemDescription[]{
      GeneratorUtil.describe(inputNode, "input node"),
      GeneratorUtil.describe(myTemplateSourceNode.getNode(), "original reference")
    };
  }
}
