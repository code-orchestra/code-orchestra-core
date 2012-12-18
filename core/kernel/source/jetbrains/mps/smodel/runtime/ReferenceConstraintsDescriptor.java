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
package jetbrains.mps.smodel.runtime;

import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.Nullable;

public interface ReferenceConstraintsDescriptor {
  String getRole();

  ConstraintsDescriptor getContainer();

  @Nullable
  ReferenceScopeProvider getScopeProvider();

  boolean validate(SNode referenceNode, SNode oldReferentNode, SNode newReferentNode, IScope scope);

  void onReferenceSet(SNode referenceNode, SNode oldReferentNode, SNode newReferentNode, IScope scope);
}
