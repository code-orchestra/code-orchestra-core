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
package jetbrains.mps.smodel;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import org.jetbrains.annotations.Nullable;

public class DefaultUndoHandler implements UndoHandler {
  public void addUndoableAction(SNodeUndoableAction action) {

  }

  public <T> T runNonUndoableAction(Computable<T> t) {
    return t.compute();
  }

  public boolean needRegisterUndo(@Nullable SModel model) {
    return false;
  }

  public boolean isInsideUndoableCommand() {
    return false;
  }

  public void flushCommand(Project p) {

  }
}
