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

import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;

public class NodeSubstitutePreconditionContext {
  private SNode myParentNode;
  private SNode myChildConcept;
  private SNode myCurrentTargetNode;
  private SNode myLink;
  private boolean myWrapped;

  public NodeSubstitutePreconditionContext(SNode parentNode, SNode childConcept, SNode currentTargetNode, SNode link, boolean wrapped) {
    myParentNode = parentNode;
    myChildConcept = childConcept;
    myCurrentTargetNode = currentTargetNode;
    myLink = link;
    myWrapped = wrapped;
  }

  public SModel getModel() {
    return getParentNode().getModel();
  }

  public SNode getParentNode() {
    return myParentNode;
  }

  public SNode getChildConcept() {
    return myChildConcept;
  }

  public SNode getCurrentTargetNode() {
    return myCurrentTargetNode;
  }

  public SNode getLink() {
    return myLink;
  }

  public boolean getWrapped() {
    return myWrapped;
  }
}
