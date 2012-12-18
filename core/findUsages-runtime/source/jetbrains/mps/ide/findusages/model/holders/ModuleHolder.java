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
package jetbrains.mps.ide.findusages.model.holders;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.MPSModuleRepository;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;

public class ModuleHolder implements IHolder<IModule> {
  private static final String UID = "uid";

  private String myModuleUID = "";

  public ModuleHolder(Element element, Project project) throws CantLoadSomethingException {
    read(element, project);
  }

  public ModuleHolder(IModule module) {
    myModuleUID = module.getModuleFqName();
  }

  public IModule getObject() {
    return MPSModuleRepository.getInstance().getModuleByUID(myModuleUID);
  }

  @NotNull
  public String getCaption() {
    return myModuleUID;
  }

  public void write(Element element, Project project) throws CantSaveSomethingException {
    if (getObject() == null) throw new CantSaveSomethingException("module is not found");

    element.setAttribute(UID, myModuleUID);
  }

  public void read(Element element, Project project) throws CantLoadSomethingException {
    myModuleUID = element.getAttributeValue(UID);

    if (getObject() == null) throw new CantLoadSomethingException("module is not found");
  }
}
