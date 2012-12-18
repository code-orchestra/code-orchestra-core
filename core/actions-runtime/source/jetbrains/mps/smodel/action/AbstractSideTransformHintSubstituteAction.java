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
package jetbrains.mps.smodel.action;

import jetbrains.mps.smodel.SNode;

/**
 * Igor Alshannikov
 * Mar 29, 2005
 */
public abstract class AbstractSideTransformHintSubstituteAction extends AbstractNodeSubstituteAction {
  // since MPS 2.0
  @Deprecated
  public AbstractSideTransformHintSubstituteAction(Object parameterNode, SNode sourceNode) {
    // parameter object is always output concept?
    super(parameterNode, sourceNode);
  }

  /**
   * @param concept instanceof AbstractConceptDeclaration
   */
  public AbstractSideTransformHintSubstituteAction(SNode concept, SNode sourceNode) {
    super(concept, concept, sourceNode);
  }

  /**
   * @param concept instanceof AbstractConceptDeclaration
   */
  public AbstractSideTransformHintSubstituteAction(SNode concept, Object parameterNode, SNode sourceNode) {
    super(concept, parameterNode, sourceNode);
  }

  public abstract SNode doSubstitute(String pattern);
}
