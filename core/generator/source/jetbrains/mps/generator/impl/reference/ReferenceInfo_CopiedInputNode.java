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
import jetbrains.mps.smodel.SNode;

/**
 * Created by: Sergey Dmitriev
 * Date: Jan 25, 2007
 */
public class ReferenceInfo_CopiedInputNode extends ReferenceInfo {

  private final SNode myInputNode;
  private final SNode myInputTargetNode;


  /**
   * @param role             should be interned
   * @param outputSourceNode reference source in output model
   * @param inputNode        node from input mode (ofter refernce source in input model)
   * @param inputTargetNode  reference target in input model
   */
  public ReferenceInfo_CopiedInputNode(String role, SNode outputSourceNode, SNode inputNode, SNode inputTargetNode) {
    super(outputSourceNode, role, inputNode);
    myInputNode = inputNode;
    myInputTargetNode = inputTargetNode;
  }

  public SNode getInputTargetNode() {
    return myInputTargetNode;
  }

  public SNode doResolve_Straightforward(TemplateGenerator generator) {
    // output target node might has been copied (reduced) from the input target node
    // here accept only one-to-one copying
    return myInputTargetNode == null ? null : generator.findCopiedOutputNodeForInputNode_unique(myInputTargetNode);
  }

  public SNode doResolve_Tricky(TemplateGenerator generator) {
    // if input was copied - return one of its copies
    // this can easy produce incorrect references
    return myInputTargetNode == null ? null : generator.findCopiedOutputNodeForInputNode(myInputTargetNode);
  }

  public String getResolveInfoForDynamicResolve() {
    return myInputTargetNode == null ? null : myInputTargetNode.getResolveInfo();
  }

  public String getResolveInfoForNothing() {
    return myInputTargetNode == null ? null : myInputTargetNode.getResolveInfo();
  }

  @Override
  public ProblemDescription[] getErrorDescriptions() {
    return new ProblemDescription[]{
      GeneratorUtil.describe(myInputNode, "input node")
    };
  }
}
