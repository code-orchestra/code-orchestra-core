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
package jetbrains.mps.ide.progress.util;

import jetbrains.mps.ide.progress.TaskProgressSettings;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;

import java.util.Collection;

public class ModelsProgressHelper {
  private String myTaskKind;

  public ModelsProgressHelper(String taskKind) {
    myTaskKind = taskKind;
  }

  public String modelTaskName(SModelDescriptor modelDescriptor) {
    return modelTaskName(modelDescriptor.getSModelReference());
  }

  public String modelTaskName(SModelReference modelReference) {
    return modelReference.getLongName() + "_" + myTaskKind;
  }

  public long estimateModelsTaskTimeMillis(Iterable<SModelDescriptor> models) {
    long timeMillis = 0;
    TaskProgressSettings settings = TaskProgressSettings.getInstance();
    for (SModelDescriptor model : models) {
      timeMillis += settings.getEstimatedTimeMillis(modelTaskName(model));
    }
    return timeMillis;
  }
}
