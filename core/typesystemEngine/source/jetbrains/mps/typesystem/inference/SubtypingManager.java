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


import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.util.StructuralNodeSet;

import java.util.Set;

public abstract class SubtypingManager {
  private static final Logger LOG = Logger.getLogger(SubtypingManager.class);

  protected final TypeChecker myTypeChecker;

  public SubtypingManager(TypeChecker typeChecker) {
    myTypeChecker = typeChecker;
  }

  public abstract boolean isSubtype(SNode subType, SNode superType);

  public abstract boolean isSubtype(SNode subType, SNode superType, boolean isWeak);

  public abstract StructuralNodeSet<?> collectImmediateSupertypes(SNode term);

  public abstract StructuralNodeSet collectImmediateSupertypes(SNode term, boolean isWeak);

  public abstract Set<SNode> leastCommonSupertypes(Set<SNode> types, boolean isWeak);

  public abstract Set<SNode> mostSpecificTypes(Set<SNode> nodes);
}
