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
package jetbrains.mps.smodel;

import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.util.InternUtil;
import jetbrains.mps.util.NameUtil;

public class SConceptReference {
  public SConceptReference fromString(String text) {
    return new SConceptReference(text);
  }

  private String myConceptFqName;

  public SConceptReference(String conceptFqName) {
    myConceptFqName = InternUtil.intern(conceptFqName);
  }

  public ModuleReference getLanguage() {
    return new ModuleReference(NameUtil.namespaceFromConceptFQName(myConceptFqName));
  }

  public int hashCode() {
    return myConceptFqName.hashCode();
  }

  public boolean equals(Object obj) {
    if (!(obj instanceof SConceptReference)) {
      return false;
    }

    SConceptReference ref = (SConceptReference) obj;
    return ref.myConceptFqName.equals(myConceptFqName);
  }

  public String toString() {
    return myConceptFqName;
  }
}
