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

import jetbrains.mps.project.SModelRoot;
import jetbrains.mps.refactoring.StructureModificationLog;
import jetbrains.mps.smodel.ModelOwner;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelFqName;
import jetbrains.mps.smodel.SModelReference;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Collection;
import java.util.Set;

public abstract class AbstractModelRootManager implements IModelRootManager {
  public boolean isFindUsagesSupported() {
    return false;
  }

  public boolean containsString(@NotNull SModelDescriptor modelDescriptor, @NotNull String string) {
    return false;
  }

  public boolean isEmpty(SModelDescriptor modelDescriptor) {
    return modelDescriptor.getSModel().rootsCount() == 0;
  }

  public boolean containsSomeString(@NotNull SModelDescriptor modelDescriptor,
                                    @NotNull Set<String> strings) {
    for (String identifier : strings) {
      if (containsString(modelDescriptor, identifier)) return true;
    }
    return false;
  }

  public boolean isNewModelsSupported() {
    return false;
  }

  @NotNull
  public SModelDescriptor createNewModel(@NotNull SModelRoot root,
                                         @NotNull SModelFqName fqName,
                                         @NotNull ModelOwner owner) {
    throw new RuntimeException("can't create new model " + fqName + " manager class = " + getClass());
  }

  @Nullable
  @Override
  public Collection<SModelReference> collectModels(@NotNull SModelRoot root) {
    return null;
  }

  @Override
  public StructureModificationLog loadModelRefactorings(@NotNull SModelDescriptor modelDescriptor) {
    return null;
  }

  @Override
  public void saveModelRefactorings(@NotNull SModelDescriptor modelDescriptor, @NotNull StructureModificationLog log) {
    throw new UnsupportedOperationException();
  }

  public void dispose() {
  }

  public void rename(SModelDescriptor model, SModelFqName modelFqName, boolean changeFile) {
    throw new UnsupportedOperationException();
  }
}
