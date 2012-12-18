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

import jetbrains.mps.project.IModule;
import jetbrains.mps.project.SModelRoot;
import jetbrains.mps.refactoring.StructureModificationLog;
import jetbrains.mps.smodel.*;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Collection;
import java.util.Set;

public interface IModelRootManager {
  public static final IModelRootManager NULL_MANAGER = new NullModelRootManager();

  @Nullable
  Collection<SModelReference> collectModels(@NotNull SModelRoot root);

  void updateModels(@NotNull SModelRoot root, @NotNull IModule owner);

  @NotNull
  SModel loadModel(@NotNull SModelDescriptor modelDescriptor);

  SModel saveModel(@NotNull SModelDescriptor modelDescriptor);

  StructureModificationLog loadModelRefactorings(@NotNull SModelDescriptor modelDescriptor);

  void saveModelRefactorings(@NotNull SModelDescriptor modelDescriptor, @NotNull StructureModificationLog log);

  boolean isFindUsagesSupported();

  boolean containsSomeString(@NotNull SModelDescriptor modelDescriptor,
                             @NotNull Set<String> strings);

  boolean containsString(@NotNull SModelDescriptor modelDescriptor,
                         @NotNull String string);

  boolean isEmpty(SModelDescriptor modelDescriptor);

  boolean isNewModelsSupported();

  /*
   * If you will implement this method do not forget
   * 1. Register new model in SModelRepository
   * 2. Fire new model created event : SModelsMulticaster.getInstance().fireModelCreatedEvent(modelDescriptor);
   */
  @NotNull
  SModelDescriptor createNewModel(@NotNull SModelRoot root,
                                  @NotNull SModelFqName fqName,
                                  @NotNull ModelOwner owner);

  void rename(SModelDescriptor model, SModelFqName modelFqName, boolean changeFile);

  void dispose();
}
