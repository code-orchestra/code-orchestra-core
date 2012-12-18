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
package jetbrains.mps.smodel;

import jetbrains.mps.generator.TransientSModel;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

public class ModelChange {
  static void assertLegalNodeChange(SNode node) {
    if (!node.getModelInternal().isLoading() && node.isRegistered() && !UndoHelper.getInstance().isInsideUndoableCommand()) {
      throw new IllegalModelChangeError("registered node can only be modified inside undoable command or in 'loading' model " + node.getDebugText());
    }
  }

  static void assertLegalNodeRegistration(SModel model, SNode node) {
    if (!model.isLoading() && !UndoHelper.getInstance().isInsideUndoableCommand()) {
      throw new IllegalModelChangeError("node registration is only allowed inside undoable command  or in 'loading' model " + node.getDebugText());
    }
  }

  static void assertLegalNodeUnRegistration(SModel model, SNode node) {
    if (!model.isLoading() && !UndoHelper.getInstance().isInsideUndoableCommand()) {
      throw new IllegalModelChangeError("node un-registration is only allowed inside undoable command or in 'loading' model" + node.getDebugText());
    }
  }

  static void assertLegalChange(SModel model) {
    if (!model.isLoading() && !ModelAccess.instance().canWrite()) {
      throw new IllegalModelChangeError("You can change model only inside write actions");
    }
  }

  @CodeOrchestraPatch
  static boolean needFireEvents(SModel model, SNode node) {
    // RE-4209
    if (model instanceof TransientSModel) {
      return true;
    }
    return node.isRegistered() && !(model.isLoading());
  }
}
