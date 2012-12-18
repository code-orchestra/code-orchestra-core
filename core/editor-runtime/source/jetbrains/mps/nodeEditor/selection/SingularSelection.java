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
package jetbrains.mps.nodeEditor.selection;

import jetbrains.mps.nodeEditor.cells.EditorCell;
import org.jetbrains.annotations.NotNull;

/**
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 * Date: 1/25/11
 * Time: 7:26 PM
 * To change this template use File | Settings | File Templates.
 */
public interface SingularSelection extends Selection {
  @NotNull
  EditorCell getEditorCell();

  void setSideSelectDirection(SideSelectDirection direction);

  SideSelectDirection getSideSelectDirection();

  enum SideSelectDirection {
    LEFT, RIGHT, NONE;
  }
}
