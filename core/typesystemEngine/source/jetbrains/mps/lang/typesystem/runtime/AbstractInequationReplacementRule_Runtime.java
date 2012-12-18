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
import jetbrains.mps.typesystem.inference.EquationInfo;
import jetbrains.mps.typesystem.inference.TypeCheckingContext;

public abstract class AbstractInequationReplacementRule_Runtime extends InequationReplacementRule_Runtime {
  @Deprecated
  public void processInequation(SNode subtype, SNode supertype, EquationInfo errorInfo) {
    processInequation(subtype, supertype, errorInfo, (TypeCheckingContext) null);
  }

  @Deprecated
  public void processInequation(SNode subtype, SNode supertype, EquationInfo errorInfo, TypeCheckingContext typeCheckingContext) {

  }

  @Override
  public boolean isApplicableSubtype(SNode node) {
    return false;
  }

  @Override
  public boolean isApplicableSupertype(SNode node) {
    return false;
  }

  //todo generate this method

  public void processInequation(SNode subtype, SNode supertype, EquationInfo errorInfo, TypeCheckingContext typeCheckingContext, IsApplicable2Status status, boolean weak, boolean isLessThan) {
    processInequation(subtype, supertype, errorInfo, typeCheckingContext);
  }

  public void processInequation(SNode subtype, SNode supertype, EquationInfo errorInfo, TypeCheckingContext typeCheckingContext, IsApplicable2Status status, boolean weak) {
    processInequation(subtype, supertype, errorInfo, typeCheckingContext, status, weak, true);
  }

  public void processInequation(SNode subtype, SNode supertype, EquationInfo errorInfo, TypeCheckingContext typeCheckingContext, IsApplicable2Status status) {
    processInequation(subtype, supertype, errorInfo, typeCheckingContext, status, true);
  }

}
