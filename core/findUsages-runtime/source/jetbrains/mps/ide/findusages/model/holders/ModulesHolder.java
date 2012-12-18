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
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.util.NameUtil;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

public class ModulesHolder implements IHolder<List<IModule>> {
  private List<IModule> myModules = new ArrayList<IModule>();
  private IOperationContext myOperationContext = null;

  public ModulesHolder(List<IModule> modules, IOperationContext operationContext) {
    myModules = modules;
    myOperationContext = operationContext;
  }

  public List<IModule> getObject() {
    return myModules;
  }

  public IOperationContext getOperationContext() {
    return myOperationContext;
  }

  @NotNull
  public String getCaption() {
    return NameUtil.formatNumericalString(myModules.size(), "model");
  }

  public void write(Element element, Project project) throws CantSaveSomethingException {
    throw new UnsupportedOperationException();
  }

  public void read(Element element, Project project) throws CantLoadSomethingException {
    throw new UnsupportedOperationException();
  }
}
