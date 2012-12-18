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
import com.intellij.ide.util.treeView.smartTree.Sorter;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.structureview.nodes.AspectTreeElement;
import org.jetbrains.annotations.NotNull;

import java.util.Comparator;

public class AspectNodeSorter implements Sorter {

  public Comparator getComparator() {
    return new EditorTabComparator();
  }

  public boolean isVisible() {
    return false;
  }

  @NotNull
  public ActionPresentation getPresentation() {
    return new ActionPresentationData("Sort Nodes by Aspect", "", jetbrains.mps.workbench.structureview.adds.icons.Icons.SORT_NODES_BY_ASPECT_ICON);
  }

  @NotNull
  public String getName() {
    return "AspectNodesSorter";
  }

  private static class EditorTabComparator implements Comparator {
    public int compare(Object o1, Object o2) {
      if (!(o1 instanceof AspectTreeElement || o2 instanceof AspectTreeElement)) return 0;

      if (!(o1 instanceof AspectTreeElement)) return 1;
      if (!(o2 instanceof AspectTreeElement)) return -1;

      final AspectTreeElement ate1 = (AspectTreeElement) o1;
      EditorTabDescriptor d1 = ate1.getAspectDescriptor();
      final AspectTreeElement ate2 = (AspectTreeElement) o2;
      EditorTabDescriptor d2 = ate2.getAspectDescriptor();

      int r1 = d1.compareTo(d2);
      int r2 = d2.compareTo(d1);

      if ((r1 == 0) ^ (r2 == 0)) return r1 - r2;

      assert r1 * r2 <= 0 : "can't determine order";

      if (r1 != 0) return r1;

      return ModelAccess.instance().runReadAction(new Computable<Integer>() {
        public Integer compute() {
          SNode n1 = ate1.getValue().getNode();
          SNode n2 = ate2.getValue().getNode();

          if (n1 == null || n2 == null) return 0;

          return n1.getConceptFqName().compareTo(n2.getConceptFqName());
        }
      });
    }
  }
}
