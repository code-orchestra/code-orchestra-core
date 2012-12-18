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
package jetbrains.mps.workbench.highlighter;

import com.intellij.util.messages.Topic;
import jetbrains.mps.nodeEditor.EditorComponent;
import org.jetbrains.annotations.NotNull;

public interface EditorComponentCreateListener {
  Topic<EditorComponentCreateListener> EDITOR_COMPONENT_CREATION =
    new Topic<EditorComponentCreateListener>("editor component creation and disposal", EditorComponentCreateListener.class);

  // This is invoked in the end of EditorComponent constructor
  void editorComponentCreated(@NotNull EditorComponent editorComponent);

  // This is invoked before EditorComponent is disposed
  void editorComponentDisposed(@NotNull EditorComponent editorComponent);
}
