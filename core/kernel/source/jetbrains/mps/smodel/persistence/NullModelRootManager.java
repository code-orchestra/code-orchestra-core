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
package jetbrains.mps.smodel.persistence;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.SModelRoot;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelRepository;
import org.jetbrains.annotations.NotNull;

class NullModelRootManager extends BaseMPSModelRootManager {
  public static final Logger LOG = Logger.getLogger(NullModelRootManager.class);

  public void updateModels(@NotNull SModelRoot root, @NotNull IModule owner) {
    LOG.error("Can't read from Null Model Root Manager");
  }

  @NotNull
  public SModel loadModel(@NotNull SModelDescriptor modelDescriptor) {
    return new SModel(modelDescriptor.getSModelReference());
  }

  public SModel saveModel(@NotNull SModelDescriptor modelDescriptor) {
    String message = "saving model " + modelDescriptor.getSModelReference().getSModelFqName() + " using null model root manager \n";
    message += "this model is owned by " + SModelRepository.getInstance().getOwners(modelDescriptor);
    LOG.error(message);
    return null;
  }
}
