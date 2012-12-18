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
package jetbrains.mps.ide;

import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.fileTypes.ex.FileTypeManagerEx;
import jetbrains.mps.nodeEditor.CaretBlinker;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class MPSAdapter implements ApplicationComponent {
  private FileTypeManagerEx myFileTypeManager;

  public MPSAdapter(FileTypeManagerEx fileTypeManager) {
    myFileTypeManager = fileTypeManager;
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "MPS Adapter";
  }

  public void initComponent() {
    CaretBlinker.getInstance().launch();
  }

  public void disposeComponent() {

  }
}
