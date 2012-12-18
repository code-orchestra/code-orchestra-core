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

import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.cellMenu.DefaultChildSubstituteInfo;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SNode;

/**
 * User: Igor Alshannikov
 * Date: Mar 7, 2006
 */
public class DefaultChildNodeSetter extends AbstractChildNodeSetter {
  private static final Logger LOG = Logger.getLogger(DefaultChildNodeSetter.class);

  SNode myLinkDeclaration;

  public DefaultChildNodeSetter(SNode linkDeclaration) {
    myLinkDeclaration = linkDeclaration;

    if (DefaultChildSubstituteInfo.isNotAggregation(linkDeclaration)) {
      throw new RuntimeException("Only aggregation links are allowed here.");
    }
  }

  public SNode getLinkDeclaration() {
    return myLinkDeclaration;
  }

  public SNode doExecute(SNode parentNode, SNode oldChild, SNode newChild, IScope scope) {
    if (newChild != null && !SModelUtil.isAcceptableTarget(myLinkDeclaration, newChild)) {
      LOG.error("couldn't set instance of " + newChild.getConceptFqName() +
        " as child '" + SModelUtil.getLinkDeclarationRole(myLinkDeclaration) + "' to " + parentNode.getDebugText());
      return newChild;
    }

    if (oldChild == null) {
      parentNode.setChild(SModelUtil.getGenuineLinkRole(myLinkDeclaration), newChild);
    } else {
      parentNode.replaceChild(oldChild, newChild);
      oldChild.delete();
    }

    return newChild;
  }
}
