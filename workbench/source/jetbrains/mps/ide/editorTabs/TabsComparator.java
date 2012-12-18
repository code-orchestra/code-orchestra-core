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
package jetbrains.mps.ide.editorTabs;

import java.util.Comparator;
import java.util.List;

public class TabsComparator implements Comparator<EditorTabDescriptor> {
  private List<String> myOrderedIds;

  public TabsComparator(List<String> orderedIds) {
    myOrderedIds = orderedIds;
  }

  public int compare(EditorTabDescriptor d1, EditorTabDescriptor d2) {
    String id1 = d1.getTitle();
    String id2 = d2.getTitle();

    int i1 = myOrderedIds.indexOf(id1);
    int i2 = myOrderedIds.indexOf(id2);

    if (i1 == -1 || i2 == -1) return 0;

    return i1 - i2;
  }
}
