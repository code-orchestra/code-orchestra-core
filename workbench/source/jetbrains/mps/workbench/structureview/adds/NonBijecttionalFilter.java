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
package jetbrains.mps.workbench.structureview.adds;

import com.intellij.ide.util.treeView.smartTree.ActionPresentation;
import com.intellij.ide.util.treeView.smartTree.ActionPresentationData;
import com.intellij.ide.util.treeView.smartTree.Filter;
import com.intellij.ide.util.treeView.smartTree.TreeElement;
import jetbrains.mps.workbench.structureview.adds.icons.Icons;
import jetbrains.mps.workbench.structureview.nodes.AspectTreeElement;
import org.jetbrains.annotations.NotNull;

public class NonBijecttionalFilter implements Filter {
  public boolean isVisible(TreeElement element) {
    if (!(element instanceof AspectTreeElement)) return true;
    AspectTreeElement ate = (AspectTreeElement) element;
    return ate.isBijectional();
  }

  public boolean isReverted() {
    return true;
  }

  @NotNull
  public ActionPresentation getPresentation() {
    return new ActionPresentationData("Show Indirect","", Icons.OUTPUT);
  }

  @NotNull
  public String getName() {
    return NonBijecttionalFilter.class.getSimpleName();
  }
}
