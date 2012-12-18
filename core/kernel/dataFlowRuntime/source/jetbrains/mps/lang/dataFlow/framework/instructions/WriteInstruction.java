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
package jetbrains.mps.lang.dataFlow.framework.instructions;

public class WriteInstruction extends Instruction {
  private Object myVar;
  private int myIndex;
  private Object myValue;

  public WriteInstruction(Object var, Object value) {
    myVar = var;
    myValue = value;
  }

  public Object getVariable() {
    return myVar;
  }

  public int getVariableIndex() {
    return myIndex;
  }

  public Object getValue() {
    return myValue;
  }

  @Override
  public void buildCaches() {
    super.buildCaches();
    myIndex = getProgram().getVariableIndex(myVar);
  }

  public String commandPresentation() {
    if (myValue == null) {
      return "write " + myVar;
    } else {
      return "write " + myVar + " " + myValue;
    }
  }
}
