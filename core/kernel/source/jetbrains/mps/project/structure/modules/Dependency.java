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
package jetbrains.mps.project.structure.modules;

import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

public class Dependency {
  public static final String MODULEREF = "moduleRef";
  public static final String REEXPORT = "reexport";

  @CodeOrchestraPatch
  public static final String EXCLUDE = "exclude";

  @NotNull
  private ModuleReference myModuleRef;
  private boolean myReexport;

  @CodeOrchestraPatch
  private boolean exclude;

  public Dependency() {

  }

  public Dependency(ModuleReference ref, boolean reexport) {
    myModuleRef = ref;
    myReexport = reexport;
  }

  @CodeOrchestraPatch
  public Dependency(ModuleReference ref, boolean reexport, boolean exclude) {
    myModuleRef = ref;
    myReexport = reexport;
    this.exclude = exclude;
  }

  @NotNull
  public ModuleReference getModuleRef() {
    return myModuleRef;
  }

  public void setModuleRef(@NotNull ModuleReference moduleRef) {
    myModuleRef = moduleRef;
  }

  public boolean isReexport() {
    return myReexport;
  }

  public void setReexport(boolean reexport) {
    myReexport = reexport;
  }

  @CodeOrchestraPatch
  public boolean isExclude() {
    return exclude;
  }

  @CodeOrchestraPatch
  public void setExclude(boolean exclude) {
    this.exclude = exclude;
  }

  @CodeOrchestraPatch
  public Dependency getCopy() {
    Dependency result = new Dependency();
    result.myModuleRef = myModuleRef;
    result.myReexport = myReexport;
    result.exclude = exclude;

    return result;
  }

  @Override
  @CodeOrchestraPatch
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    Dependency that = (Dependency) o;

    if (myReexport != that.myReexport) return false;
    if (exclude != that.exclude) return false;
    if (!myModuleRef.equals(that.myModuleRef)) return false;

    return true;
  }

  @Override
  @CodeOrchestraPatch
  public int hashCode() {
    int result = myModuleRef.hashCode();
    result = 31 * result + (myReexport ? 1 : 0);
    result = 31 * result + (exclude ? 1 : 0);
    return result;
  }
}
