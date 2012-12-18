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
package jetbrains.mps.typesystem.inference;

import jetbrains.mps.errors.QuickFixProvider;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Pair;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

public class EquationInfo {

  private String myErrorString;
  private SNode myNodeWithError;

  private String myRuleModel;
  private String myRuleId;
  private Stack<Pair<String, String>> myOuterRulesIds = null;

  private List<QuickFixProvider> myIntentionProviders;

  private int myInequationPriority;
  private boolean myIsStrong = false;


  public EquationInfo(SNode nodeWithError, String errorString) {
    myErrorString = errorString;
    myNodeWithError = nodeWithError;
  }

  public EquationInfo(SNode nodeWithError, String errorString, String ruleModel, String ruleId, int inequationPriority, QuickFixProvider intentionProvider) {
    myErrorString = errorString;
    myNodeWithError = nodeWithError;
    myRuleModel = ruleModel;
    myRuleId = ruleId;
    myInequationPriority = inequationPriority;
    addIntentionProvider(intentionProvider);
  }

  @Deprecated
  public EquationInfo(SNode nodeWithError, String errorString, String ruleModel, String ruleId, int inequationPriority) {
    this(nodeWithError, errorString, ruleModel, ruleId, inequationPriority, null);
  }

  public EquationInfo(SNode nodeWithError, String errorString, String ruleModel, String ruleId) {
    myErrorString = errorString;
    myNodeWithError = nodeWithError;
    myRuleModel = ruleModel;
    myRuleId = ruleId;
  }

  public EquationInfo(EquationInfo pattern) {
    myErrorString = pattern.myErrorString;
    myNodeWithError = pattern.myNodeWithError;
    myRuleModel = pattern.myRuleModel;
    myRuleId = pattern.myRuleId;
    myInequationPriority = pattern.myInequationPriority;
    if (pattern.myIntentionProviders != null) {
      if (myIntentionProviders == null) {
        myIntentionProviders = new ArrayList<QuickFixProvider>(pattern.myIntentionProviders);
      }
      myIntentionProviders.addAll(pattern.myIntentionProviders);
    }
  }

  public String getErrorString() {
    return myErrorString;
  }

  public SNode getNodeWithError() {
    return myNodeWithError;
  }

  public String getRuleModel() {
    return myRuleModel;
  }

  public String getRuleId() {
    return myRuleId;
  }

  public void setIntentionProvider(QuickFixProvider intentionProvider) {
    addIntentionProvider(intentionProvider);
  }

  public void addIntentionProvider(QuickFixProvider intentionProvider) {
    if (myIntentionProviders == null) {
      myIntentionProviders = new ArrayList<QuickFixProvider>(1);
    }
    myIntentionProviders.add(intentionProvider);
  }

  public List<QuickFixProvider> getIntentionProviders() {
    ArrayList<QuickFixProvider> result = new ArrayList<QuickFixProvider>(1);
    if (myIntentionProviders != null) {
      result.addAll(myIntentionProviders);
    }
    return result;
  }


  public void pushOuterRuleId(String modelId, String ruleId) {
    if (myOuterRulesIds == null) {
      myOuterRulesIds = new Stack<Pair<String, String>>();
    }
    myOuterRulesIds.push(new Pair<String, String>(modelId, ruleId));
  }

  public void getOuterRulesIdFromInfo(EquationInfo outerInfo) {
    if (myOuterRulesIds == null) {
      myOuterRulesIds = new Stack<Pair<String, String>>();
    }
    for (Pair<String, String> id : outerInfo.getAdditionalRulesIds()) {
      myOuterRulesIds.push(id);
    }
    myOuterRulesIds.push(new Pair<String, String>(outerInfo.getRuleModel(), outerInfo.getRuleId()));
  }

  public List<Pair<String, String>> getAdditionalRulesIds() {
    if (myOuterRulesIds == null) return new ArrayList<Pair<String, String>>();
    return new ArrayList<Pair<String, String>>(myOuterRulesIds);
  }

  public SNode findRuleNode() {
    SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(SModelReference.fromString(myRuleModel));
    if (modelDescriptor == null) return null;
    return modelDescriptor.getSModel().getNodeById(myRuleId);
  }

  boolean isStrong() {
    return myIsStrong;
  }

  void setStrong() {
    myIsStrong = true;
  }
}
