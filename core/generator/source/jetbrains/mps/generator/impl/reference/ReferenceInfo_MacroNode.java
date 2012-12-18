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

import jetbrains.mps.generator.impl.ReductionContext;
import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.smodel.AttributesRolesUtil;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.InternUtil;

/**
 * Evgeny Gryaznov, 11/18/10
 */
public class ReferenceInfo_MacroNode extends ReferenceInfo_Macro {

  private final SNode myTemplateReferenceNode;
  private final SNode myReferenceMacro;

  public ReferenceInfo_MacroNode(SNode outputSourceNode, SNode macro, SNode templateReferenceNode, TemplateContext context, ReductionContext reductionContext) {
    super(outputSourceNode, InternUtil.intern(getReferenceRole(macro)), context, reductionContext);
    myTemplateReferenceNode = templateReferenceNode;
    myReferenceMacro = macro;
  }

  private static String getReferenceRole(SNode macro) {
    return AttributeOperations.getLinkRole(macro);
  }

  public SNode getInputTargetNode() {
    return myTemplateReferenceNode.getReferent(getReferenceRole());
  }

  protected SNode getMacroNode() {
    return myReferenceMacro;
  }

  protected Object resolveReference() {
    return myReductionContext.getQueryExecutor().getReferentTarget(getInputNode(), getOutputSourceNode(), myReferenceMacro, myContext);
  }
}
