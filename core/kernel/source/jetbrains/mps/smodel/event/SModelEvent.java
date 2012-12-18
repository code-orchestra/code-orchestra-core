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

import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;

public abstract class SModelEvent {
  private SModel myModel;

  public abstract void accept(SModelEventVisitor visitor);

  public abstract SNode getAffectedRoot();

  protected SModelEvent(SModel model) {
    myModel = model;
  }

  public SModel getModel() {
    return myModel;
  }

  public SModelDescriptor getModelDescriptor() {
    return myModel.getModelDescriptor();
  }

  public boolean isChangeEvent() {
    return true;
  }
}
