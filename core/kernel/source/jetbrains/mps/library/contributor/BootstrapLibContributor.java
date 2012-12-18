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
package jetbrains.mps.library.contributor;

import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.library.LibraryInitializer;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.util.PathManager;
import org.jetbrains.annotations.NotNull;

import java.util.HashSet;
import java.util.Set;

public class BootstrapLibContributor implements LibraryContributor,ApplicationComponent {
  public Set<String> getLibraries() {
    Set<String> res = new HashSet<String>();
    res.add(PathManager.getBootstrapPath());
    res.add(PathManager.getLanguagesPath());
    return res;
  }

  public void initComponent() {
    LibraryInitializer.getInstance().addContributor(this);
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        LibraryInitializer.getInstance().update(true);
      }
    });
  }

  public void disposeComponent() {

  }

  @NotNull
  public String getComponentName() {
    return BootstrapLibContributor.class.getSimpleName();
  }
}
