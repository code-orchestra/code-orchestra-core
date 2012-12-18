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
package jetbrains.mps.newTypesystem.operation;

import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.smodel.SNode;

import java.util.List;

public class ClearNodeTypeOperation extends AbstractOperation {
  private SNode myNode;
  private SNode myType;
  private List<IErrorReporter> myErrors;

  public String getPresentationKind() {
    return PresentationKind.TYPE_REMOVED;
  }

  public ClearNodeTypeOperation(SNode node, SNode type, List<IErrorReporter> errors) {
    myNode = node;
    mySource = node;
    myType = type;
    myErrors = errors;
  }

  protected void doUndo(State state) {
    state.getNodeMaps().assignNodeType(myNode, myType);
    state.getNodeMaps().addNodeErrors(myNode, myErrors);
  }

  protected void doRedo(State state) {
    state.getNodeMaps().removeNodeType(myNode);
    state.getNodeMaps().removeNodeErrors(myNode);
  }

  public String getPresentation() {
    return "Type and errors cleared for node: " + myNode;
  }
}
