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
package jetbrains.mps.nodeEditor.cells;

import jetbrains.mps.util.Condition;

public class CellConditions {
  public static final Condition<EditorCell> SELECTABLE = new Condition<EditorCell>() {
    public boolean met(EditorCell object) {
      return object.isSelectable();
    }
  };

  public static final Condition<EditorCell> EDITABLE = new Condition<EditorCell>() {
    public boolean met(EditorCell object) {
      return  object.isSelectable() && object instanceof EditorCell_Label && ((EditorCell_Label) object).isEditable();
    }
  };
}
