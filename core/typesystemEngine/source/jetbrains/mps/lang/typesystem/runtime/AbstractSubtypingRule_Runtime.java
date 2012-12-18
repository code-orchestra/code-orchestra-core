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
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public abstract class AbstractSubtypingRule_Runtime implements ISubtypingRule_Runtime {

  @Override
  public List<SNode> getSubOrSuperTypes(SNode type, TypeCheckingContext typeCheckingContext, IsApplicableStatus status) {
    SNode subOrSuperType = getSubOrSuperType(type, typeCheckingContext, status);
    if (subOrSuperType != null) {
      return Arrays.asList(subOrSuperType);
    }
    return getSubOrSuperTypes(type, typeCheckingContext);
  }

  public List<SNode> getSubOrSuperTypes(SNode type, @Nullable TypeCheckingContext typeCheckingContext) {
    SNode subOrSuperType = getSubOrSuperType(type, typeCheckingContext);
    if (subOrSuperType != null) {
      return Arrays.asList(subOrSuperType);
    }
    return getSubOrSuperTypes(type);
  }

  @Deprecated
  public SNode getSubOrSuperType(SNode type, TypeCheckingContext typeCheckingContext) {
    return getSubOrSuperType(type);
  }

  public SNode getSubOrSuperType(SNode type, TypeCheckingContext typeCheckingContext, IsApplicableStatus status) {
    return getSubOrSuperType(type, typeCheckingContext);
  }

  @Deprecated
  public List<SNode> getSubOrSuperTypes(SNode type) {
    SNode subOrSuperType = getSubOrSuperType(type);
    if (subOrSuperType == null) {
      return new ArrayList<SNode>(0);
    }
    return Arrays.asList(subOrSuperType);
  }

  @Deprecated
  public SNode getSubOrSuperType(SNode type) {
    return null;
  }

  public boolean isWeak() {
    return false;
  }

  @Override
  public IsApplicableStatus isApplicableAndPattern(SNode argument) {
    return new IsApplicableStatus(isApplicable(argument), null);
  }

  @Deprecated
  public boolean isApplicable(SNode argument) {
    return false;
  }
}
