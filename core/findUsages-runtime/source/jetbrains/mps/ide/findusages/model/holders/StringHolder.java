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
package jetbrains.mps.ide.findusages.model.holders;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;

public class StringHolder implements IHolder<String> {
  private static final String VALUE = "value";

  private String myString = "";

  public StringHolder(Element element, Project project) throws CantLoadSomethingException {
    read(element, project);
  }

  public StringHolder(String string) {
    myString = string;
  }

  public String getObject() {
    return myString;
  }

  @NotNull
  public String getCaption() {
    return myString;
  }

  public void read(Element element, Project project) throws CantLoadSomethingException {
    myString = element.getAttributeValue(VALUE);
    if (myString == null) throw new CantLoadSomethingException("string value is not present");
  }

  public void write(Element element, Project project) throws CantSaveSomethingException {
    element.setAttribute(VALUE, myString);
  }
}
