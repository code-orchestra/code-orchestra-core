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
package jetbrains.mps.checkedName;

import jetbrains.mps.smodel.SNode;

public class PropertyReference {
  private SNode myNode;
  private String myProperty;

  public PropertyReference(SNode node, String property) {
    myNode = node;
    myProperty = property;
  }

  public SNode getNode() {
    return myNode;
  }

  public String getProperty() {
    return myProperty;
  }

  public String getValue(){
    return myNode.getProperty(myProperty);
  }

  public void setValue(String value){
    myNode.setProperty(myProperty,value);
  }
}
