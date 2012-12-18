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
package jetbrains.mps.smodel.runtime.illegal;

import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.runtime.ConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.PropertyConstraintsDescriptor;

public class IllegalPropertyConstraintsDescriptor implements PropertyConstraintsDescriptor {
  private final String name;
  private final ConstraintsDescriptor container;

  public IllegalPropertyConstraintsDescriptor(String name, ConstraintsDescriptor container) {
    this.name = name;
    this.container = container;
  }

  @Override
  public String getName() {
    return name;
  }

  @Override
  public ConstraintsDescriptor getContainer() {
    return container;
  }

  @Override
  public Object getValue(SNode node, IScope scope) {
    return node.getPersistentProperty(name);
  }

  @Override
  public void setValue(SNode node, String value, IScope scope) {
//    throw new UnsupportedOperationException("Unsupported set value for " + container.getConceptFqName() + "." + getName() + " property");
    node.setProperty(name, value, false);
  }

  @Override
  public boolean validateValue(SNode node, String value, IScope scope) {
    return false;
  }

  @Override
  public boolean isReadOnly() {
    return true;
  }
}
