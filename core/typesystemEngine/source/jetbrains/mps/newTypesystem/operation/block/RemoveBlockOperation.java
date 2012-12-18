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
package jetbrains.mps.newTypesystem.operation.block;

import jetbrains.mps.newTypesystem.operation.PresentationKind;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.newTypesystem.state.blocks.Block;
import jetbrains.mps.newTypesystem.state.blocks.BlockKind;

public class RemoveBlockOperation extends AbstractBlockOperation {
  public RemoveBlockOperation(Block block) {
    super(block);
  }

  public String getPresentation() {
    if (myBlock.getBlockKind().equals(BlockKind.WHEN_CONCRETE)) {
      return myBlock.getPresentation() + "   executed";
    }
    return myBlock.getPresentation() + "   solved";
  }

  public void doUndo(State state) {
    state.addBlockNoVars(myBlock);
  }

  public void doRedo(State state) {
    state.removeBlockNoVars(myBlock);
  }

  public void execute(State state) {
    super.execute(state);
    myBlock.performAction();
  }

  public String getPresentationKind() {
    if (myBlock.getBlockKind() == BlockKind.WHEN_CONCRETE) {
      return PresentationKind.WHEN_CONCRETE_REMOVED;
    } else {
      return PresentationKind.RELATION_REMOVED;
    }
  }
}
