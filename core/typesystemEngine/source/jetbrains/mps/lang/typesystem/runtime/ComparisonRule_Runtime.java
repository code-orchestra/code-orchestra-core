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

import jetbrains.mps.smodel.SNode;

public abstract class ComparisonRule_Runtime implements IRuleWithTwoApplicableNodes {
  @Deprecated
  public boolean areComparable(SNode type1, SNode type2) {
    return false;
  }

  //todo generate this method
  public boolean areComparable(SNode type1, SNode type2, IsApplicable2Status status) {
    return areComparable(type1, type2);
  }

  public boolean isWeak() {
    return false;
  }

  @Deprecated
  public boolean isApplicable(SNode node1, SNode node2) {
    return isApplicable1(node1) && isApplicable2(node2);
  }

  @Override
  public boolean isApplicable1(SNode node) {
    return false;
  }

  @Override
  public boolean isApplicable2(SNode node) {
    return false;
  }

  public IsApplicable2Status isApplicableAndPatterns(SNode node1, SNode node2) {
    IsApplicableStatus applicableStatus1 = isApplicableFirst(node1);
    if (!applicableStatus1.isApplicable()) return IsApplicable2Status.FALSE_STATUS;
    IsApplicableStatus applicableStatus2 = isApplicableSecond(node2);
    if (!applicableStatus2.isApplicable()) return IsApplicable2Status.FALSE_STATUS;
    return new IsApplicable2Status(true, applicableStatus1.getPattern(), applicableStatus2.getPattern());
  }

  //todo generate this method
  public IsApplicableStatus isApplicableFirst(SNode node) {
    return new IsApplicableStatus(isApplicable1(node), null);
  }

  //todo generate this method
  public IsApplicableStatus isApplicableSecond(SNode node) {
    return new IsApplicableStatus(isApplicable2(node), null);
  }
}
