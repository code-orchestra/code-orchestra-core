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

import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ModuleId;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.util.InternUtil;
import jetbrains.mps.util.annotation.ImmutableObject;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.apache.commons.lang.ObjectUtils;
import org.jetbrains.annotations.NotNull;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@ImmutableObject
public class ModuleReference {
  private static final Pattern MODULE_REFERENCE = Pattern.compile("(.*?)\\((.*?)\\)");

  public static ModuleReference fromString(String text) {
    text = text.trim();
    Matcher m = MODULE_REFERENCE.matcher(text);
    if (m.matches()) {
      return new ModuleReference(m.group(2), m.group(1));
    }
    return new ModuleReference(text);
  }

  private final String myModuleFqName;
  private final ModuleId myModuleId;

  public ModuleReference(String moduleFqName) {
    this(moduleFqName, (ModuleId) null);
  }

  public ModuleReference(String moduleFqName, String moduleId) {
    this(moduleFqName, ModuleId.fromString(moduleId));
  }

  public ModuleReference(String moduleFqName, ModuleId moduleId) {
    myModuleFqName = InternUtil.intern(moduleFqName);
    myModuleId = moduleId;
  }

  public String getModuleFqName() {
    return myModuleFqName;
  }

  public ModuleId getModuleId() {
    return myModuleId;
  }

  @NotNull
  public ModuleReference update() {
    IModule module = MPSModuleRepository.getInstance().getModule(this);
    if (module == null) return this;
    return module.getModuleReference();
  }

  public boolean differs(ModuleReference ref) {
    return !(ObjectUtils.equals(myModuleFqName, ref.myModuleFqName) && ObjectUtils.equals(myModuleId, ref.myModuleId));
  }

  public int hashCode() {
    if (myModuleId != null) {
      return myModuleId.hashCode();
    }
    return myModuleFqName.hashCode();
  }

  @CodeOrchestraPatch
  public boolean equals(Object obj) {
    if (!(obj instanceof ModuleReference)) {
      return false;
    }

    ModuleReference p = (ModuleReference) obj;

    // RE-3506
    if (myModuleFqName != null && p.myModuleFqName != null && myModuleFqName.equals(p.myModuleFqName)) {
      return true;
    }

    if (myModuleId != null && p.myModuleId != null) {
      return ObjectUtils.equals(myModuleId, p.myModuleId);
    }

    if (myModuleId == null && p.myModuleId != null) {
      return false;
    }

    if (myModuleId != null && p.myModuleId == null) {
      return false;
    }

    return ObjectUtils.equals(myModuleFqName, p.myModuleFqName);
  }

  public String toString() {
    if (myModuleId != null) {
      return myModuleId.toString() + "(" + myModuleFqName + ")";
    }
    return myModuleFqName;
  }
}

