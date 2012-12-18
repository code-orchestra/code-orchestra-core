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
import jetbrains.mps.typesystem.inference.TypeCheckingContext;

public abstract class AbstractNonTypesystemRule_Runtime implements NonTypesystemRule_Runtime {

  @Override
  public IsApplicableStatus isApplicableAndPattern(SNode argument) {
    return new IsApplicableStatus(isApplicable(argument), null);
  }

  @Override
  public void applyRule(SNode argument, TypeCheckingContext typeCheckingContext, IsApplicableStatus status) {
    applyRule(argument, typeCheckingContext);
  }

  @Deprecated
  public boolean isApplicable(SNode argument) {
    return false;
  }

  @Deprecated
  public void applyRule(SNode argument, TypeCheckingContext typeCheckingContext) {
  }
}
