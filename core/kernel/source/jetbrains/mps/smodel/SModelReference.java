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

import jetbrains.mps.util.annotation.ImmutableObject;
import org.apache.commons.lang.ObjectUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@ImmutableObject
public final class SModelReference {
  private static final Pattern MODEL_UID_PATTERN = Pattern.compile("(.*?)\\((.*?)\\)");

  public static SModelReference fromString(String s) {
    if (s == null) return null;
    s = s.trim();
    Matcher matcher = MODEL_UID_PATTERN.matcher(s);
    if (matcher.matches()) {
      SModelId modelId = SModelId.fromString(matcher.group(1));
      SModelId nid = StubMigrationHelper.convertModelId(modelId, false);
      return new SModelReference(SModelFqName.fromString(matcher.group(2)), nid == null ? modelId : nid);
    }

    return new SModelReference(SModelFqName.fromString(s), null);
  }

  private final SModelId myModelId;
  private final SModelFqName myModelFqName;

  public SModelReference(String longName, String stereotype) {
    this(new SModelFqName(longName, stereotype), null);
  }

  public SModelReference(SModelFqName fqName, SModelId modelId) {
    myModelFqName = fqName;
    myModelId = modelId;
  }

  public SModelId getSModelId() {
    return myModelId;
  }

  public SModelFqName getSModelFqName() {
    return myModelFqName;
  }

  public boolean equals(Object o) {
    if (o == this) return true;
    if (!(o instanceof SModelReference)) return false;
    SModelReference otherReference = (SModelReference) o;

    if (otherReference.myModelId != null && myModelId != null) {
      return otherReference.myModelId.equals(myModelId);
    }

    if (otherReference.myModelId == null && myModelId != null) {
      return false;
    }

    if (otherReference.myModelId != null && myModelId == null) {
      return false;
    }

    return otherReference.myModelFqName.equals(myModelFqName);
  }

  public int hashCode() {
    if (myModelId != null) {
      return myModelId.hashCode();
    }
    return myModelFqName.hashCode();
  }

  public String toString() {
    if (myModelId != null) {
      return myModelId + "(" + myModelFqName + ")";
    }
    return myModelFqName.toString();
  }

  public String getLongName() {
    return myModelFqName.getLongName();
  }

  public String getCompactPresentation() {
    return myModelFqName.getCompactPresentation();
  }

  public String getStereotype() {
    return myModelFqName.getStereotype();
  }

  public boolean hasStereotype() {
    return myModelFqName.hasStereotype();
  }

  public SModelReference update() {
    SModelDescriptor sm = SModelRepository.getInstance().getModelDescriptor(this);
    if (sm == null) return this;
    return sm.getSModelReference();
  }

  public boolean differs(SModelReference ref) {
    return !(ObjectUtils.equals(myModelId, ref.myModelId) && ObjectUtils.equals(myModelFqName, ref.myModelFqName));
  }

  public static SModelReference fromPath(String path) {
    int index = Math.max(path.lastIndexOf("/"), path.lastIndexOf("\\"));
    String shortName = index == -1 ? path : path.substring(index + 1);
    index = shortName.lastIndexOf('.');
    String modelName = index >= 0 ? shortName.substring(0, index) : shortName;
    String stereotype;
    index = modelName.indexOf('@');
    if(index >= 0) {
      stereotype = modelName.substring(index+1);
      modelName = modelName.substring(0, index);
    } else {
      stereotype = "";
    }
    return new SModelReference(modelName, stereotype);
  }
}
