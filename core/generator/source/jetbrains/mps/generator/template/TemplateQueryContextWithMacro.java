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
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;

/**
 * Evgeny Gryaznov, 11/15/10
 */
public class TemplateQueryContextWithMacro extends TemplateQueryContext {

  private final SNode myMacro;
  private final SNodePointer myMacroPointer;

  public TemplateQueryContextWithMacro(SNode inputNode, SNode macroNode, TemplateContext context, ITemplateGenerator generator) {
    super(inputNode, null, context, generator);
    myMacro = macroNode;
    myMacroPointer = null;
  }

  public TemplateQueryContextWithMacro(SNode inputNode, SNodePointer macroNode, TemplateContext context, ITemplateGenerator generator) {
    super(inputNode, null, context, generator);
    myMacro = null;
    myMacroPointer = macroNode;
  }

  @Override
  public SNode getTemplateNode() {
    SNode ruleNode = getTemplateNodeForLogging();
    return ruleNode != null ? ruleNode.getParent() : null;
  }

  @Override
  public SNode getTemplateNodeForLogging() {
    return myMacro != null ? myMacro :
      myMacroPointer != null ? myMacroPointer.getNode() : null;
  }
}
