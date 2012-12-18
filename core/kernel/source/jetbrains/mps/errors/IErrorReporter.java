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
package jetbrains.mps.errors;

import jetbrains.mps.errors.messageTargets.MessageTarget;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Pair;

import java.util.List;

public interface IErrorReporter {
  public String reportError();

  public String getRuleId();

  public String getRuleModel();

  public void addAdditionalRuleId(String ruleModel, String ruleId);

  public List<Pair<String, String>> getAdditionalRulesIds();

  public List<Pair<String, String>> getAdditionalRulesIdsInReverseOrder();

  public void setAdditionalRulesIds(List<Pair<String, String>> ids);

  public MessageStatus getMessageStatus();

  public QuickFixProvider getIntentionProvider();

  public List<QuickFixProvider> getIntentionProviders();

  public void addIntentionProvider(QuickFixProvider intentionProvider);

  public void setIntentionProvider(QuickFixProvider intentionProvider);

  public MessageTarget getErrorTarget();

  public SNode getSNode();
}
