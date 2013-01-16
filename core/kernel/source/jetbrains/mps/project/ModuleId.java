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
package jetbrains.mps.project;

import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.util.annotation.ImmutableObject;

import java.util.UUID;

@ImmutableObject
@CodeOrchestraPatch
// CO-4616
public abstract class ModuleId {

  public static ModuleId generate() {
    return new Regular(UUID.randomUUID());
  }

  public static ModuleId fromString(String text) {
    if (text == null) return null;
    if (text.startsWith(Foreign.PREFIX)) {
      return new Foreign(text);
    }
    return new Regular(UUID.fromString(text));
  }

  @ImmutableObject
  @CodeOrchestraPatch
  // CO-4616
  public static class Regular extends ModuleId {

    private final UUID myUid;

    public Regular(UUID uid) {
      myUid = uid;
    }

    public boolean equals(Object obj) {
      if (!(obj instanceof Regular)) return false;

      Regular id = (Regular) obj;
      return id.myUid.equals(myUid);
    }

    public int hashCode() {
      return myUid.hashCode();
    }

    public String toString() {
      return myUid.toString();
    }

  }

  @ImmutableObject
  @CodeOrchestraPatch
  // CO-4616
  public static class Foreign extends ModuleId {

    public static final String PREFIX = "f:";

    private final String myUid;

    public Foreign(String uid) {
      myUid = uid;
    }

    public boolean equals(Object obj) {
      if (!(obj instanceof Foreign)) return false;

      Foreign id = (Foreign) obj;
      return id.myUid.equals(myUid);
    }

    public int hashCode() {
      return myUid.hashCode();
    }

    public String toString() {
      return myUid;
    }

  }
}
