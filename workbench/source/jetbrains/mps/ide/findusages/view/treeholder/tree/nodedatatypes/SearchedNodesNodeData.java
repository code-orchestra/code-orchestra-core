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
import jetbrains.mps.ide.findusages.view.icons.Icons;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.path.PathItemRole;
import org.jdom.Element;

import javax.swing.Icon;

public class SearchedNodesNodeData extends BaseNodeData {
  public static final String CATEGORY_NAME = "Searched nodes";

  public SearchedNodesNodeData(PathItemRole role) {
    super(role, CATEGORY_NAME, "", true, false, false);
  }

  public SearchedNodesNodeData(Element element, Project project) throws CantLoadSomethingException {
    read(element, project);
  }

  public Icon getIcon() {
    return Icons.SEARCHED_NODES_ICON;
  }

  public Object getIdObject() {
    return CATEGORY_NAME;
  }
}
