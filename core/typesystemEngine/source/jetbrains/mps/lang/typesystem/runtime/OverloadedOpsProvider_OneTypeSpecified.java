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
package jetbrains.mps.lang.typesystem.runtime;

import jetbrains.mps.lang.pattern.util.MatchingUtil;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.SubtypingManager;

public abstract class OverloadedOpsProvider_OneTypeSpecified implements IOverloadedOpsTypesProvider {
  protected SNode myOperandType;
  protected String myOperationConceptFQName;
  protected boolean myTypeIsExact = false;
  protected boolean myIsStrong = false;

  public String getApplicableConceptFQName() {
    return myOperationConceptFQName;
  }

  public boolean isApplicable(SubtypingManager subtypingManager, SNode leftOperandType, SNode rightOperandType) {
    if (myTypeIsExact) {
      if (!(MatchingUtil.matchNodes(leftOperandType, myOperandType) || MatchingUtil.matchNodes(rightOperandType, myOperandType))) {
        return false;
      }
    } else {
      if (!(subtypingManager.isSubtype(leftOperandType, myOperandType, !myIsStrong)
        || subtypingManager.isSubtype(rightOperandType, myOperandType, !myIsStrong))) {
        return false;
      }
    }
    return true;
  }

  public boolean isApplicable(SubtypingManager subtypingManager, SNode operation, SNode leftOperandType, SNode rightOperandType) {
    return isApplicable(subtypingManager, leftOperandType, rightOperandType);
  }

  public int compareTo(IOverloadedOpsTypesProvider o) {
    if (o instanceof OverloadedOpsProvider_OneTypeSpecified) {
      OverloadedOpsProvider_OneTypeSpecified o2 = (OverloadedOpsProvider_OneTypeSpecified) o;
      int i1 = (this.myTypeIsExact ? 1 : 0);
      int i2 = (o2.myTypeIsExact ? 1 : 0);
      return i2 - i1;
    }
    if (o instanceof OverloadedOperationsTypesProvider) {
      return 1;
    }
    return 0;
  }
}
