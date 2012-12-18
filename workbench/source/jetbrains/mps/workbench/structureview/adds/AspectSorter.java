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
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import jetbrains.mps.ide.projectPane.Icons;
import org.jetbrains.annotations.NotNull;

import java.util.Comparator;

public class AspectSorter implements Sorter {
  public Comparator getComparator() {
    return new EditorTabComparator();
  }

  public boolean isVisible() {
    return false;
  }

  @NotNull
  public ActionPresentation getPresentation() {
    return new ActionPresentationData("Sort Aspects", "", null);
  }

  @NotNull
  public String getName() {
    return "AspectSorter";
  }

  private static class EditorTabComparator implements Comparator{
    public int compare(Object o1, Object o2) {
      if (!(o1 instanceof AspectGroup || o2 instanceof AspectGroup)) return 0;

      if (!(o1 instanceof AspectGroup)) return -1;
      if (!(o2 instanceof AspectGroup)) return 1;

      EditorTabDescriptor d1 = ((AspectGroup) o1).getTab();
      EditorTabDescriptor d2 = ((AspectGroup) o2).getTab();

      int r1 = d1.compareTo(d2);
      int r2 = d2.compareTo(d1);

      if ((r1 == 0) ^ (r2 == 0)) return r1 - r2;

      assert r1 * r2 <= 0 : "can't determine order";

      return r1;
    }
  }
}
