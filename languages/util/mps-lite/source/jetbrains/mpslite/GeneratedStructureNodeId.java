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
package jetbrains.mpslite;

import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.smodel.SNodeId.Foreign;
import jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration;
import jetbrains.mps.lang.structure.structure.LinkDeclaration;
import jetbrains.mps.lang.structure.structure.PropertyDeclaration;
import jetbrains.mps.lang.structure.structure.LinkMetaclass;

public class GeneratedStructureNodeId {

  public static SNodeId createConceptNodeId(AbstractConceptDeclaration conceptDeclaration) {
    StringBuilder sb = new StringBuilder();
    sb.append("[C]");
    sb.append(conceptDeclaration.getModel().getLongName());
    sb.append(conceptDeclaration.getName());
    return new Foreign(Foreign.ID_PREFIX + sb.toString());
  }

  public static SNodeId createChildLinkNodeId(AbstractConceptDeclaration conceptDeclaration, LinkDeclaration linkDeclaration) {
    StringBuilder sb = new StringBuilder();
    sb.append("[LC]");
    sb.append(conceptDeclaration.getModel().getLongName());
    sb.append(conceptDeclaration.getName());
    sb.append("&");
    sb.append(linkDeclaration.getRole());
    return new Foreign(Foreign.ID_PREFIX + sb.toString());
  }

  public static SNodeId createReferentLinkNodeId(AbstractConceptDeclaration conceptDeclaration, LinkDeclaration linkDeclaration) {
    StringBuilder sb = new StringBuilder();
    sb.append("[LR]");
    sb.append(conceptDeclaration.getModel().getLongName());
    sb.append(conceptDeclaration.getName());
    sb.append("&");
    sb.append(linkDeclaration.getRole());
    return new Foreign(Foreign.ID_PREFIX + sb.toString());
  }

  public static SNodeId createPropertyNodeId(AbstractConceptDeclaration conceptDeclaration, PropertyDeclaration propertyDeclaration) {
    StringBuilder sb = new StringBuilder();
    sb.append("[P]");
    sb.append(conceptDeclaration.getModel().getLongName());
    sb.append(conceptDeclaration.getName());
    sb.append("&");
    sb.append(propertyDeclaration.getName());
    return new Foreign(Foreign.ID_PREFIX + sb.toString());
  }

  public void changeIdsInGeneratedConcept(AbstractConceptDeclaration conceptDeclaration) {
    conceptDeclaration.getNode().setId(createConceptNodeId(conceptDeclaration));
    for (LinkDeclaration linkDeclaration : conceptDeclaration.getLinkDeclarations()) {
      if (linkDeclaration.getMetaClass() == LinkMetaclass.aggregation) {
        linkDeclaration.getNode().setId(createChildLinkNodeId(conceptDeclaration, linkDeclaration));
      } else {
        linkDeclaration.getNode().setId(createReferentLinkNodeId(conceptDeclaration, linkDeclaration));
      }
    }
    for (PropertyDeclaration propertyDeclaration : conceptDeclaration.getPropertyDeclarations()) {
      propertyDeclaration.getNode().setId(createPropertyNodeId(conceptDeclaration, propertyDeclaration));
    }
  }
}
