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
package jetbrains.mps.workbench.choose.string;

import com.intellij.navigation.ItemPresentation;
import com.intellij.navigation.NavigationItem;
import com.intellij.openapi.vcs.FileStatus;
import jetbrains.mps.workbench.choose.base.BasePresentation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;

public abstract class BaseStringItem implements NavigationItem {
  private String myString;

  public BaseStringItem(String string) {
    myString = string;
  }

  public String getString() {
    return myString;
  }

  public String getName() {
    return myString;
  }

  @Nullable
  public ItemPresentation getPresentation() {
    return new BasePresentation() {
      @NotNull
      @Override
      public String doGetPresentableText() {
        return myString;
      }

      @Override
      public String doGetLocationString() {
        return null;
      }

      @Override
      public Icon doGetIcon() {
        return null;
      }
    };
  }

  public FileStatus getFileStatus() {
    return FileStatus.NOT_CHANGED;
  }

  public boolean canNavigate() {
    return false;
  }

  public boolean canNavigateToSource() {
    return false;
  }

}
