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

import jetbrains.mps.generator.TransientModelsModule.TransientSModelDescriptor;
import jetbrains.mps.smodel.FastNodeFinder;
import jetbrains.mps.smodel.GlobalSModelEventsManager;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.nodeidmap.RegularNodeIdMap;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

/**
 * @author  Evgeny Gryaznov, Apr 19, 2010
 * @author Alexander Eliseyev Jul 21, 2012
 */
public class TransientSModel extends SModel {

  @CodeOrchestraPatch
  private boolean isObsolete;

  @CodeOrchestraPatch
  private SModel originalModel;

  public TransientSModel(@NotNull SModelReference modelReference) {
    super(modelReference, new RegularNodeIdMap());
  }

  @CodeOrchestraPatch
  public boolean isObsolete() {
    return isObsolete;
  }

  @CodeOrchestraPatch
  public void setObsolete(boolean obsolete) {
    boolean wasObsolete = this.isObsolete;

    this.isObsolete = obsolete;

    if (!wasObsolete && obsolete) {
      GlobalSModelEventsManager.getInstance().fireTransientSModelDisposed((TransientSModelDescriptor) getModelDescriptor());
    }
  }

  @CodeOrchestraPatch
  public void setOriginalModel(SModel model) {
    originalModel = model;
  }

  @CodeOrchestraPatch
  public SModel getOriginalModel() {
    return originalModel;
  }

  @Override
  protected FastNodeFinder createFastNodeFinder() {
    return new TransientModelNodeFinder(this);
  }

  public boolean isTransient() {
    return true;
  }
}
