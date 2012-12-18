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
package jetbrains.mps.build.ant.generation;

import jetbrains.mps.build.ant.MpsLoadTask;
import jetbrains.mps.build.ant.MpsWorker;
import jetbrains.mps.build.ant.generation.workers.GeneratorWorker;

public class GenerateTask extends MpsLoadTask {
  public static final String COMPILE = "COMPILE";
  public static final String PER_ROOT_GENERATION = "PER_ROOT_GENERATION";

  {
    myWhatToDo.putProperty(COMPILE, Boolean.toString(true));
    myWhatToDo.putProperty(PER_ROOT_GENERATION, Boolean.toString(false));
  }

  protected Class<? extends MpsWorker> getWorkerClass() {
    return GeneratorWorker.class;
  }

  public void setCompile(boolean compile) {
    myWhatToDo.putProperty(COMPILE, Boolean.toString(compile));
  }

  protected boolean getCompile() {
    return Boolean.parseBoolean(myWhatToDo.getProperty(COMPILE));
  }

  public void setUsePerRootGeneration(boolean usePerRootGeneration) {
    myWhatToDo.putProperty(PER_ROOT_GENERATION, Boolean.toString(usePerRootGeneration));
  }

  protected boolean getUsePerRootGeneration() {
    return Boolean.parseBoolean(myWhatToDo.getProperty(PER_ROOT_GENERATION));
  }
}
