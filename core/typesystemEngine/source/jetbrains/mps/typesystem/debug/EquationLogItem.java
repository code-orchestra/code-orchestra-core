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
package jetbrains.mps.typesystem.debug;

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.EquationInfo;
import jetbrains.mps.util.Pair;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class EquationLogItem {

  private SNode myLeftType;
  private SNode myRightType;
  private SNode myLeftRepresentator;
  private SNode myRightRepresentator;
  private String myReason;
  private String myRuleModel;
  private String myRuleId;
  private List<Pair<String, String>> myCauses = new ArrayList<Pair<String, String>>();

  public EquationLogItem(SNode leftType, SNode rightType, SNode leftRepresentator, SNode rightRepresentator, String ruleModel, String ruleId, String reason, Set<Pair<String, String>> causes) {
    this(leftType, rightType, leftRepresentator, rightRepresentator, ruleModel, ruleId, reason);
    myCauses = new ArrayList<Pair<String, String>>(causes);
  }

  public EquationLogItem(SNode leftType, SNode rightType, SNode leftRepresentator, SNode rightRepresentator, String ruleModel, String ruleId, String reason, List<EquationInfo> equationInfos) {
    this(leftType, rightType, leftRepresentator, rightRepresentator, ruleModel, ruleId, reason);
    myCauses = new ArrayList<Pair<String, String>>();
    for (EquationInfo equationInfo : equationInfos) {
      myCauses.add(new Pair<String, String>(equationInfo.getRuleModel(), equationInfo.getRuleId()));
    }
  }

  public EquationLogItem(SNode leftType, SNode rightType, SNode leftRepresentator, SNode rightRepresentator, String ruleModel, String ruleId, String reason) {
    myLeftType = leftType;
    myRightType = rightType;
    myLeftRepresentator = leftRepresentator;
    myRightRepresentator = rightRepresentator;
    myRuleModel = ruleModel;
    myRuleId = ruleId;
    myReason = reason;
  }


  public SNode getLeftType() {
    return myLeftType;
  }

  public SNode getRightType() {
    return myRightType;
  }

  public SNode getLeftRepresentator() {
    return myLeftRepresentator;
  }

  public SNode getRightRepresentator() {
    return myRightRepresentator;
  }

  public String getReason() {
    return myReason;
  }

  public List<Pair<String, String>> getCauses() {
    return new ArrayList<Pair<String, String>>(myCauses);
  }

  public String getRuleModel() {
    return myRuleModel;
  }

  public String getRuleId() {
    return myRuleId;
  }
}
