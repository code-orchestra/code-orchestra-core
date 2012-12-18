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

import jetbrains.mps.nodeEditor.EditorComponent;

/**
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 * Date: 1/27/11
 * Time: 1:43 PM
 * To change this template use File | Settings | File Templates.
 */
public interface SelectionListener {
  /**
   * @param editorComponent - cannot be null
   * @param oldSelection    - can be null in case there was no oldSelection in editor
   * @param newSelection    - can be null indicating there is no newSelection in editor
   */
  void selectionChanged(EditorComponent editorComponent, Selection oldSelection, Selection newSelection);
}
