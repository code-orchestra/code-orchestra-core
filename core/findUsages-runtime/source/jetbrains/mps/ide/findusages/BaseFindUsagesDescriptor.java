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
package jetbrains.mps.ide.findusages;

import jetbrains.mps.ide.findusages.findalgorithm.finders.GeneratedFinder;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.smodel.SNodePointer;

public abstract class BaseFindUsagesDescriptor {
  private ModuleReference myModuleRef;
  private SModelReference myModelRef;

  protected BaseFindUsagesDescriptor(ModuleReference moduleRef, SModelReference modelRef) {
    myModuleRef = moduleRef;
    myModelRef = modelRef;
  }

  public abstract void init();

  protected void add(GeneratedFinder finder, String nodeId) {
    SNodePointer np = new SNodePointer(myModelRef, SNodeId.fromString(nodeId));
    FindersManager.getInstance().addFinder(finder, myModuleRef, np);
  }
}
