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

import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;

import java.util.Comparator;

public class EditorTabComparator implements Comparator<EditorTabDescriptor> {
  public int compare(EditorTabDescriptor d1, EditorTabDescriptor d2) {
    int r1 = d1.compareTo(d2);
    int r2 = d2.compareTo(d1);

    if ((r1 == 0) ^ (r2 == 0)) return r1 - r2;

    assert r1 * r2 <= 0 : "can't determine order";

    return r1;
  }
}
