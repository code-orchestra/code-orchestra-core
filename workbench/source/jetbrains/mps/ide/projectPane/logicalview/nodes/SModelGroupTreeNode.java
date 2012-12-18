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
package jetbrains.mps.ide.projectPane.logicalview.nodes;

import jetbrains.mps.ide.StereotypeProvider;
import jetbrains.mps.ide.projectPane.NamespaceTextNode;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelStereotype;

public class SModelGroupTreeNode extends NamespaceTextNode implements StereotypeProvider {
  private ProjectLanguageTreeNode myProjectLanguageTreeNode;

  public SModelGroupTreeNode(ProjectLanguageTreeNode projectLanguageTreeNode, IOperationContext context) {
    super("util models", context);
    myProjectLanguageTreeNode = projectLanguageTreeNode;
  }

  public String getNamespace() {
    if (getParent() == null || !(getParent() instanceof ProjectLanguageTreeNode)) return "";
    ProjectLanguageTreeNode parent = (ProjectLanguageTreeNode) getParent();
    return parent.getModule().getModuleFqName();
  }

  public boolean isFinalName() {
    return true;
  }

  public String getStereotype() {
    return SModelStereotype.NONE;
  }

  public boolean isStrict() {
    return false;
  }
}
