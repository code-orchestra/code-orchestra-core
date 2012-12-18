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
package jetbrains.mps.ide.findusages.view.optionseditor.options;

import com.intellij.openapi.project.Project;
import org.jdom.Element;

public class ViewOptions extends BaseOptions {
  private static final String FLAGS = "flags";
  private static final String SHOW_ONE_RESULT = "show_one_result";
  private static final String NEW_TAB = "new_tab";

  public boolean myShowOneResult;
  public boolean myNewTab;

  public ViewOptions() {
    myShowOneResult = true;
    myNewTab = false;
  }

  public ViewOptions(Element element, Project project) {
    read(element, project);
  }

  public ViewOptions(boolean showOneResult, boolean newTab) {
    myShowOneResult = showOneResult;
    myNewTab = newTab;
  }

  public ViewOptions clone() {
    return new ViewOptions(myShowOneResult, myNewTab);
  }

  public void read(Element element, Project project) {
    Element flagsXML = element.getChild(FLAGS);
    myShowOneResult = Boolean.parseBoolean(flagsXML.getAttribute(SHOW_ONE_RESULT).getValue());
    myNewTab = Boolean.parseBoolean(flagsXML.getAttribute(NEW_TAB).getValue());
  }

  public void write(Element element, Project project) {
    Element flagsXML = new Element(FLAGS);
    flagsXML.setAttribute(SHOW_ONE_RESULT, Boolean.toString(myShowOneResult));
    flagsXML.setAttribute(NEW_TAB, Boolean.toString(myNewTab));
    element.addContent(flagsXML);
  }
}
