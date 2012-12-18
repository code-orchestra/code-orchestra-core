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
package jetbrains.mps.newTypesystem;

import jetbrains.mps.errors.AbstractErrorReporter;
import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.errors.MessageStatus;
import jetbrains.mps.errors.messageTargets.MessageTarget;
import jetbrains.mps.errors.messageTargets.NodeMessageTarget;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.PresentationManager;
import jetbrains.mps.typesystem.inference.EquationInfo;

public class EquationErrorReporterNew extends AbstractErrorReporter implements IErrorReporter {
  private jetbrains.mps.newTypesystem.state.State myState;
  private String myBefore;
  private String myBetween;
  private String myAfter;
  private SNode myLeft;
  private SNode myRight;

  private SNode mySNode;

  public EquationErrorReporterNew(SNode node, jetbrains.mps.newTypesystem.state.State state, String before, SNode left, String between, SNode right,
                                  String after, String ruleModel, String ruleId) {
    super(ruleModel, ruleId);
    myState = state;
    myBefore = before;
    myAfter = after;
    myBetween = between;
    myLeft = left;
    myRight = right;
    mySNode = node;
  }

  public EquationErrorReporterNew(SNode node, jetbrains.mps.newTypesystem.state.State state, String before, SNode left, String between, SNode right,
                                  String after, EquationInfo info) {
    this(node, state, before, left, between, right, after, info != null ? info.getRuleModel() : null,
      info != null ? info.getRuleId() : null);
  }

  public String reportError() {
    SNode lRepresentative = myLeft;
    if (lRepresentative != null && TypesUtil.isVariable(lRepresentative)) {
      lRepresentative = myState.getEquations().getRepresentative(myLeft);
    }
    SNode rRepresentative = myRight;
    if (rRepresentative != null && TypesUtil.isVariable(rRepresentative)) {
      rRepresentative = myState.getEquations().getRepresentative(myRight);
    }
    return myBefore + PresentationManager.toString(lRepresentative) +
      myBetween + PresentationManager.toString(rRepresentative) + myAfter;
  }

  public MessageStatus getMessageStatus() {
    return MessageStatus.ERROR;
  }

  public MessageTarget getErrorTarget() {
    return new NodeMessageTarget();
  }

  public SNode getSNode() {
    return mySNode;
  }
}
