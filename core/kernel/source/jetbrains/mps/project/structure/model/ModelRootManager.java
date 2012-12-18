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
package jetbrains.mps.project.structure.model;

import jetbrains.mps.util.InternUtil;
import org.apache.commons.lang.ObjectUtils;

public class ModelRootManager {
  private String myModuleId;
  private String myClassName;

  public ModelRootManager() {

  }

  public ModelRootManager(String moduleId, String className) {
    myModuleId = InternUtil.intern(moduleId);
    myClassName = InternUtil.intern(className);
  }

  public void setModuleId(String moduleId) {
    myModuleId = InternUtil.intern(moduleId);
  }

  public void setClassName(String className) {
    myClassName = InternUtil.intern(className);
  }

  public String getModuleId() {
    return myModuleId;
  }

  public String getClassName() {
    return myClassName;
  }

  public ModelRootManager getCopy() {
    return new ModelRootManager(myModuleId, myClassName);
  }

  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    ModelRootManager that = (ModelRootManager) o;

    if (!ObjectUtils.equals(myClassName, that.myClassName)) return false;
    if (!ObjectUtils.equals(myModuleId, that.myModuleId)) return false;

    return true;
  }

  public int hashCode() {
    int result = myModuleId != null ? myModuleId.hashCode() : 0;
    result = 31 * result + (myClassName != null ? myClassName.hashCode() : 0);
    return result;
  }
}
