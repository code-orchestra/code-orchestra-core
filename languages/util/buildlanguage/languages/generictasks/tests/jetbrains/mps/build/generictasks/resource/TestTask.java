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
package jetbrains.mps.build.generictasks.resource;

import org.apache.tools.ant.Task;

public class TestTask extends Task {

  private String myStringAttribute;
  private int myIntAttribute;
  private boolean myBooleanAttribute;

  public String getStringAttribute() {
    return myStringAttribute;
  }

  public void setStringAttribute(String stringAttribute) {
    myStringAttribute = stringAttribute;
  }

  public int getIntAttribute() {
    return myIntAttribute;
  }

  public void setIntAttribute(int intAttribute) {
    myIntAttribute = intAttribute;
  }

  public boolean getBooleanAttribute() {
    return myBooleanAttribute;
  }

  public void setBooleanAttribute(boolean booleanAttribute) {
    myBooleanAttribute = booleanAttribute;
  }
}
