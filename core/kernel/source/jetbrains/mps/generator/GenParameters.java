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
package jetbrains.mps.generator;

import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class GenParameters {
  private List<SModelDescriptor> myModelDescriptors = new ArrayList<SModelDescriptor>();
  private IModule myModule;

  public GenParameters(List<SModelDescriptor> models, IModule module) {
    myModelDescriptors.addAll(models);
    myModule = module;
  }

  public List<SModelDescriptor> getModelDescriptors() {
    return Collections.unmodifiableList(myModelDescriptors);
  }

  public List<SModel> getSModels() {
    List<SModel> result = new ArrayList<SModel>();
    for (SModelDescriptor sm : myModelDescriptors) {
      result.add(sm.getSModel());
    }
    return result;
  }

  public IModule getModule() {
    return myModule;
  }
}
