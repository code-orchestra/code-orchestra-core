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
package jetbrains.mps.smodel.descriptor;

import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/**
 * This kind of descriptor is proposed to use for regular MPS models.
 * The main diff with SModelDescriptor is that these models have a real file behind them and can be edited.
 * This kind of model also can be refactored and can contain some metadata.
 * Maybe this kind of descriptor will be splitted to a number of descriptors in future.
 */
public interface EditableSModelDescriptor extends SModelDescriptor, Refactorable, MetadataContainer {
  boolean needsReloading();

  void reloadFromDisk();

  void reloadFromDiskSafe();

  void save();

  int getPersistenceVersion();

  @Nullable
  IFile getModelFile();

  void setModelFile(IFile file);

  long lastChangeTime();

  boolean isChanged();

  void setChanged(boolean changed);

  boolean isPackaged();

  void replaceModel(@NotNull SModel newModel);

  void setDoNotGenerate(boolean value);

  boolean isDoNotGenerate();

  void poke();
}
