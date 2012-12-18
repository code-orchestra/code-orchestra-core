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
package jetbrains.mps.ide.findusages.view.treeholder.tree.nodedatatypes;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.view.treeholder.tree.TextOptions;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.INodeRepresentator;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.path.PathItemRole;
import jetbrains.mps.ide.projectPane.Icons;
import org.jdom.Element;

import javax.swing.Icon;

public class ResultsNodeData extends BaseNodeData {
  private static final String CATEGORY_NAME = "results";
  private INodeRepresentator myNodeRepresentator;

  public ResultsNodeData(PathItemRole role) {
    super(role, CATEGORY_NAME, "", true, false, false);
  }

  public ResultsNodeData(PathItemRole role, INodeRepresentator nodeRepresentator) {
    super(role, CATEGORY_NAME, "", true, false, false);
    myNodeRepresentator = nodeRepresentator;
  }

  public ResultsNodeData(Element element, Project project) throws CantLoadSomethingException {
    read(element, project);
  }

  public Object getIdObject() {
    return CATEGORY_NAME;
  }

  @Override
  public Icon getIcon() {
    if (myNodeRepresentator == null) {
      return Icons.USAGES_ICON;
    } else {
      return myNodeRepresentator.getResultsIcon();
    }
  }

  public String getText(TextOptions options) {
    if (myNodeRepresentator == null) {
      return "<b>" + sizeRepresentation(options.mySubresultsCount) + " found" + "</b>";
    } else {
      return myNodeRepresentator.getResultsText(options);
    }
  }

  private static String sizeRepresentation(int size) {
    return "<b>" + Integer.toString(size) + " usage" + (size == 1 ? "" : "s") + "</b>";
  }
}
