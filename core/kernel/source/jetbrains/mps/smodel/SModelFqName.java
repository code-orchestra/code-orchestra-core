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

import jetbrains.mps.util.InternUtil;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.annotation.ImmutableObject;
import org.apache.commons.lang.ObjectUtils;

@ImmutableObject
public class SModelFqName implements Comparable<Object> {
  public static SModelFqName fromString(String s) {
    if (s == null) s = "";

    int indexSlash = s.indexOf("/");
    String module = "";
    if (indexSlash >= 0) {
      module = s.substring(0, indexSlash);
      s = s.substring(indexSlash + 1, s.length());
    }

    int index = s.indexOf("@");
    String stereotype = "";
    if (index >= 0) {
      stereotype = s.substring(index + 1);
    }
    String longName = s;
    if (index >= 0) {
      longName = s.substring(0, index);
    }

    return new SModelFqName(module, longName, stereotype);
  }

  private final String myModuleFqName;
  private final String myLongName;
  private final String myStereotype;

  public SModelFqName(String longName, String stereotype) {
    this(null, longName, stereotype);
  }

  public SModelFqName(String moduleFqName, String longName, String stereotype) {
    if (longName == null) longName = "";
    if (stereotype == null) stereotype = "";

    // RE-2059
    //if (moduleFqName == null) moduleFqName = "";
    moduleFqName = "";

    myLongName = InternUtil.intern(longName);
    myStereotype = InternUtil.intern(stereotype);
    myModuleFqName = InternUtil.intern(moduleFqName);
  }

  public boolean equals(Object o) {
    if (o == this) return true;
    if (!(o instanceof SModelFqName)) return false;
    SModelFqName otherUID = (SModelFqName) o;
    return ObjectUtils.equals(otherUID.myLongName, myLongName) && ObjectUtils.equals(otherUID.myStereotype, myStereotype);
  }

  public int hashCode() {
    return myLongName.hashCode() * 37 + myStereotype.hashCode();
  }

  public String toString() {
    String module = myModuleFqName.equals("") ? "" : myModuleFqName + "/";
    String stereotype = myStereotype.length() == 0 ? "" : "@" + myStereotype;
    return module + myLongName + stereotype;
  }

  public String getLongName() {
    return myLongName;
  }

  public String getCompactPresentation() {
    String compactNamespace = NameUtil.compactNamespace(getLongName());
    if (myStereotype.length() == 0) {
      return compactNamespace;
    } else {
      return compactNamespace + "@" + myStereotype.charAt(0);
    }
  }

  public String getStereotype() {
    return myStereotype;
  }

  public boolean hasStereotype() {
    return myStereotype.length() > 0;
  }

  public SModelFqName withStereotype(String newStereo) {
    return new SModelFqName(myModuleFqName, myLongName, newStereo);
  }

  public int compareTo(Object o) {
    int compareStereotypes = this.getStereotype().compareTo(((SModelFqName) o).getStereotype());
    if (compareStereotypes != 0) return compareStereotypes;
    return this.toString().compareTo(o.toString());
  }
}
