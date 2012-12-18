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
package jetbrains.mps.workbench.choose.base;

import com.intellij.navigation.ItemPresentation;
import com.intellij.openapi.editor.colors.TextAttributesKey;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.smodel.ModelAccess;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;

public abstract class BasePresentation implements ItemPresentation {
  public String getPresentableText() {
    return ModelAccess.instance().runReadAction(new Computable<String>() {
      public String compute() {
        return doGetPresentableText();
      }
    });
  }

  @Nullable
  public String getLocationString() {
    return ModelAccess.instance().runReadAction(new Computable<String>() {
      public String compute() {
        return doGetLocationString();
      }
    });
  }

  @Nullable
  public Icon getIcon(boolean open) {
    return ModelAccess.instance().runReadAction(new Computable<Icon>() {
      public Icon compute() {
        return doGetIcon();
      }
    });
  }

  @Nullable
  public TextAttributesKey getTextAttributesKey() {
    return null;
  }

  @NotNull
  public abstract String doGetPresentableText();

  public abstract String doGetLocationString();

  public abstract Icon doGetIcon();
}
