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
package jetbrains.mps.project.structure.modules.mappingpriorities;

import jetbrains.mps.util.annotation.CodeOrchestraPatch;

public enum RuleType {
  STRICTLY_BEFORE("strictly_before", "<"),
  STRICTLY_TOGETHER("strictly_together", "="),
  BEFORE_OR_TOGETHER("before_or_together", "<="),
  AFTER_OR_TOGETHER("after_or_together", ">="),
  STRICTLY_AFTER("strictly_after", ">"),

  @CodeOrchestraPatch
  ABSOLUTE_FIRST("absolute_first", "!1");

  private String myType;
  private String myPresentation;

  RuleType(String type, String presentation) {
    myType = type;
    myPresentation = presentation;
  }

  public String getName() {
    return myType;
  }

  public String getPresentation() {
    return myPresentation;
  }

  @Override
  public String toString() {
    return myPresentation;
  }

  public static RuleType parse(String s) {
    for (RuleType rt : RuleType.values()) {
      if (rt.getName().equals(s)) return rt;
    }
    throw new IllegalArgumentException("No priority rule type: " + s);
  }
}
