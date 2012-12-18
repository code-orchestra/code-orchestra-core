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
package jetbrains.mps.smodel.action;

import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;

public class NodeSetupContext {
  private SNode myNewNode;
  private SNode mySampleNode;
  private SNode myEnclosingNode;
  private SModel myModel;

  public NodeSetupContext(SNode newNode, SNode sampleNode, SNode enclosingNode, SModel model) {
    myNewNode = newNode;
    mySampleNode = sampleNode;
    myEnclosingNode = enclosingNode;
    myModel = model;
  }

  public SNode getNewNode() {
    return myNewNode;
  }

  public SNode getSampleNode() {
    return mySampleNode;
  }

  public SNode getEnclosingNode() {
    return myEnclosingNode;
  }

  public SModel getModel() {
    return myModel;
  }
}
