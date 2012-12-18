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
package jetbrains.mps.nodeEditor.cells;

import org.apache.commons.lang.ObjectUtils;

public class ConstantModelAccessor implements ModelAccessor {
  private String myValue;

  public ConstantModelAccessor(String value) {
    myValue = value;
  }

  public String getText() {
    return myValue;
  }

  public void setText(String text) {
  }

  public boolean isValidText(String text) {
    return ObjectUtils.equals(myValue, text);
  }
}
