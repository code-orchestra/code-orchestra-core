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
package jetbrains.mps.newTypesystem;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: Oct 15, 2010
 * Time: 11:28:26 AM
 */
public class VariableIdentifier {
  private char myVariableChar;
  private int myVariableIndex;

  public VariableIdentifier() {
    myVariableChar = 'a';
    myVariableIndex = 0;
  }

  public void clear() {
    myVariableChar = 'a';
    myVariableIndex = 0;
  }

  public String getNewVarName() {
    String result = myVariableChar + (myVariableIndex == 0 ? "" : "" + myVariableIndex);
    if (myVariableChar == 'z') {
      myVariableIndex++;
      myVariableChar = 'a';
    } else {
      myVariableChar++;
    }
    return result;
  }
}
