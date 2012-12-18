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

import jetbrains.mps.smodel.PropertySupport;
import jetbrains.mps.smodel.SNode;

public class PropertySubstituteAction extends AbstractNodeSubstituteAction {
  private String myPropertyName;
  private String myPropertyValue;
  private PropertySupport myPropertySupport;

  public PropertySubstituteAction(SNode sourceNode, String propertyName, String propertyValue) {
    super(null, null, sourceNode);
    SNode propertyDeclaration = sourceNode.getPropertyDeclaration(propertyName);
    myPropertySupport = PropertySupport.getPropertySupport(propertyDeclaration);
    myPropertyName = propertyName;
    myPropertyValue = propertyValue;
  }

  public String getMatchingText(String pattern) {
    return myPropertySupport.fromInternalValue(myPropertyValue);
  }

  public String getVisibleMatchingText(String pattern) {
    return getMatchingText(pattern);
  }

  public SNode doSubstitute(String pattern) {
    getSourceNode().setProperty(myPropertyName, myPropertyValue);
    return null;
  }
}
