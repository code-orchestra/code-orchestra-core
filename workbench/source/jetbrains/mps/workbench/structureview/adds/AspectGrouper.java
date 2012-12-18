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

import com.intellij.ide.util.treeView.AbstractTreeNode;
import com.intellij.ide.util.treeView.smartTree.*;
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import jetbrains.mps.workbench.structureview.nodes.AspectTreeElement;
import jetbrains.mps.workbench.structureview.nodes.MainNodeTreeElement;
import org.jetbrains.annotations.NotNull;

import java.util.*;
import java.util.Map.Entry;

public class AspectGrouper implements Grouper {

  @NotNull
  public Collection<Group> group(AbstractTreeNode parent, final Collection<TreeElement> children) {
    final Object element = parent.getValue();
    if (!(element instanceof MainNodeTreeElement)) return Collections.emptyList();

    Map<EditorTabDescriptor, List<TreeElement>> groups = new HashMap<EditorTabDescriptor, List<TreeElement>>();
    for (TreeElement te : children) {
      if (!(te instanceof AspectTreeElement)) continue;

      AspectTreeElement ate = (AspectTreeElement) te;
      EditorTabDescriptor d = ate.getAspectDescriptor();
      if (!groups.containsKey(d)) {
        groups.put(d, new ArrayList<TreeElement>());
      }
      groups.get(d).add(ate);
    }

    Collection<Group> result = new ArrayList<Group>();
    for (Entry<EditorTabDescriptor, List<TreeElement>> e : groups.entrySet()) {
      result.add(new AspectGroup(e.getKey(), e.getValue()));
    }
    return result;
  }

  @NotNull
  public ActionPresentation getPresentation() {
    return new ActionPresentationData("Group by Aspect", "", jetbrains.mps.workbench.structureview.adds.icons.Icons.GROUP_ASPECTS_ICON);
  }

  @NotNull
  public String getName() {
    return "AspectGrouper";
  }
}
