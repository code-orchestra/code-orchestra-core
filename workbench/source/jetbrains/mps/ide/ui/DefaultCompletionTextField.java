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
package jetbrains.mps.ide.ui;

import jetbrains.mps.ide.ChooseItemComponent;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class DefaultCompletionTextField extends CompletionTextField {

  private List<String> myPossibleValues = new ArrayList<String>();

  public DefaultCompletionTextField(List<String> possibleValues) {
    myPossibleValues.addAll(possibleValues);
  }

  public List<String> getProposals(String text) {
    List<String> result = new ArrayList<String>();
    Pattern pattern = Pattern.compile(ChooseItemComponent.getExactItemPatternBuilder(text, true) + ".*");
    for (String possibleValue : myPossibleValues) {
      if (pattern.matcher(possibleValue).matches()) {
        result.add(possibleValue);
      }
    }
    return result;
  }
}
