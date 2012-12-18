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
package jetbrains.mps.cache;

import com.intellij.openapi.components.AbstractProjectComponent;
import com.intellij.openapi.project.Project;
import jetbrains.mps.generator.GenerationAdapter;
import jetbrains.mps.generator.GenerationOptions;
import jetbrains.mps.generator.GeneratorManager;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;

import java.util.List;

public class CachesClearer extends AbstractProjectComponent{
  private GeneratorManager myGm;
  private GenerationAdapter myGenListener = new MyGenerationListener();

  public CachesClearer(Project p, GeneratorManager gm) {
    super(p);
    myGm = gm;
  }

  public void initComponent() {
    myGm.addGenerationListener(myGenListener);
  }

  public void disposeComponent() {
    myGm.removeGenerationListener(myGenListener);
  }

  private class MyGenerationListener extends GenerationAdapter {
    public void afterGeneration(List<SModelDescriptor> inputModels, GenerationOptions options, IOperationContext operationContext) {
      CachesManager.getInstance().removeGenerationCaches();
    }
  }
}
