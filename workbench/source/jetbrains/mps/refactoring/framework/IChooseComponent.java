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
package jetbrains.mps.refactoring.framework;

import jetbrains.mps.util.Condition;

import javax.swing.JComponent;

@Deprecated
//left for compatibility with old refactorings
public interface IChooseComponent<T> {
  public T submit() throws InvalidInputValueException;

  public void setInitialValue(T initialValue);

  public void setCondition(Condition<T> condition);

  public JComponent getComponentToFocus();

  public JComponent getMainComponent();

  public String getPropertyName();

  public void setPropertyName(String propertyName);

  public void setCaption(String caption);

  public void initComponent();
}
