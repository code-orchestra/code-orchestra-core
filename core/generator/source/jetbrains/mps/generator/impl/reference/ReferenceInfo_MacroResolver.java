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
import jetbrains.mps.generator.runtime.ReferenceResolver;
import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;

/**
 * Evgeny Gryaznov, 11/18/10
 */
public class ReferenceInfo_MacroResolver extends ReferenceInfo_Macro{

  private final ReferenceResolver myResolver;

  public ReferenceInfo_MacroResolver(ReferenceResolver resolver, SNode outputSourceNode, String role, TemplateContext context, ReductionContext reductionContext) {
    super(outputSourceNode, role, context, reductionContext);
    myResolver = resolver;
  }

  @Override
  protected Object resolveReference() {
    return myResolver.resolve(getOutputSourceNode(), myContext);
  }

  @Override
  protected SNode getMacroNode() {
    SNodePointer macro = myResolver.getTemplateNode();
    if(macro != null) {
      return macro.getNode();
    }
    return null;
  }

  @Override
  public SNode getInputTargetNode() {
    throw new UnsupportedOperationException();
  }

  @Override
  public String getResolveInfoForNothing() {
    return myResolver.getDefaultResolveInfo();
  }
}
