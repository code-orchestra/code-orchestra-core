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

import jetbrains.mps.generator.runtime.TemplateMappingPriorityRule;
import jetbrains.mps.project.structure.modules.RefUpdateUtil;

public class MappingPriorityRule implements TemplateMappingPriorityRule {
  public static final String LEFT = "left";
  public static final String TYPE = "type";
  public static final String RIGHT = "right";

  private RuleType myType;
  private MappingConfig_AbstractRef myLeft, myRight;

  public MappingPriorityRule() {
    myType = RuleType.STRICTLY_TOGETHER;
    myLeft = new MappingConfig_AbstractRef();
    myRight = new MappingConfig_AbstractRef();
  }

  public RuleType getType() {
    return myType;
  }

  public void setType(RuleType type) {
    myType = type;
  }

  public MappingConfig_AbstractRef getLeft() {
    return myLeft;
  }

  public void setLeft(MappingConfig_AbstractRef left) {
    myLeft = left;
  }

  public MappingConfig_AbstractRef getRight() {
    return myRight;
  }

  public void setRight(MappingConfig_AbstractRef right) {
    myRight = right;
  }

  public MappingPriorityRule getCopy() {
    MappingPriorityRule result = new MappingPriorityRule();

    result.myLeft = myLeft != null ? myLeft.getCopy() : null;
    result.myRight = myRight != null ? myRight.getCopy() : null;
    result.myType = myType;

    return result;
  }

  public boolean updateReferences() {
    return RefUpdateUtil.composeUpdates(
      myRight.updateReferences(),
      myLeft.updateReferences()
    );
  }
}
