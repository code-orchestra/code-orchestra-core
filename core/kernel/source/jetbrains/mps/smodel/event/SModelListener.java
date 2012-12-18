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
package jetbrains.mps.smodel.event;

import jetbrains.mps.smodel.ModelLoadingState;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import org.jetbrains.annotations.NotNull;

/**
 * Author: Sergey Dmitriev
 * Created Sep 16, 2003
 * <p/>
 * WARNING: Do not use this kind of listener in UI. In case of changes to a model
 * that affect many nodes it might lead to performance problems. Use SModelCommandListener
 * instead in these cases.
 */
public interface SModelListener {
  void languageAdded(SModelLanguageEvent event);

  void languageRemoved(SModelLanguageEvent event);

  void importAdded(SModelImportEvent event);

  void importRemoved(SModelImportEvent event);

  void devkitAdded(SModelDevKitEvent event);

  void devkitRemoved(SModelDevKitEvent event);

  void rootAdded(SModelRootEvent event);

  void rootRemoved(SModelRootEvent event);

  void beforeRootRemoved(SModelRootEvent event);

  void beforeModelRenamed(SModelRenamedEvent event);

  void modelRenamed(SModelRenamedEvent event);

  void beforeModelFileChanged(SModelFileChangedEvent event);

  void modelFileChanged(SModelFileChangedEvent event);

  void propertyChanged(SModelPropertyEvent event);

  void childAdded(SModelChildEvent event);

  void childRemoved(SModelChildEvent event);

  void beforeChildRemoved(SModelChildEvent event);

  void referenceAdded(SModelReferenceEvent event);

  void referenceRemoved(SModelReferenceEvent event);

  void loadingStateChanged(SModelDescriptor model, boolean isLoading);

  void modelSaved(SModelDescriptor sm);

  void modelLoadingStateChanged(SModelDescriptor sm, ModelLoadingState oldState, ModelLoadingState newState);

  /**
   * This method will be called by SModelDescriptor to notify clients that underlying
   * SModel instance was replaced by another one (as a result of reloadFromDisk(),
   * refresh() or replaceModel() methods execution).
   * <p/>
   * It is guaranteed that this method will be executed in event dispatch thread.
   * <p/>
   * Passed SModelDescriptor will keep new instance of SModel.
   * <p/>
   * Old instance of SModel will not be attached to any SModelDescriptor and will not
   * be disposed till the end of notifications processing.
   *
   * @param md model descriptor with replaced SModel instance
   */
  void modelReplaced(SModelDescriptor md);

  void beforeModelDisposed(SModel sm);

  @NotNull
  SModelListenerPriority getPriority();

  public enum SModelListenerPriority {
    PLATFORM,
    CLIENT;
  }
}
