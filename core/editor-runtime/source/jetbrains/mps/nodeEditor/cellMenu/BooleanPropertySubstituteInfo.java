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
package jetbrains.mps.nodeEditor.cellMenu;


import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.action.INodeSubstituteAction;
import jetbrains.mps.smodel.action.PropertySubstituteAction;
import jetbrains.mps.nodeEditor.cellMenu.AbstractNodeSubstituteInfo;
import jetbrains.mps.nodeEditor.EditorContext;

import java.util.*;

public class BooleanPropertySubstituteInfo extends AbstractNodeSubstituteInfo {

  private SNode myNode;
  private String myPropertyName;

  public BooleanPropertySubstituteInfo(SNode node, String propertyName, EditorContext editorContext) {
    super(editorContext);
    myNode = node;
    myPropertyName = propertyName;
  }

  public List<INodeSubstituteAction> createActions() {
    List<INodeSubstituteAction> list = new LinkedList<INodeSubstituteAction>();
    list.add(new PropertySubstituteAction(myNode, myPropertyName, "true"));
    list.add(new PropertySubstituteAction(myNode, myPropertyName, null));
    return (List) list;
  }
}
