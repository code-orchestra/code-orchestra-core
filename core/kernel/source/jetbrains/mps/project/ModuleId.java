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

import jetbrains.mps.util.annotation.ImmutableObject;

import java.util.UUID;

@ImmutableObject
public class ModuleId {
  public static ModuleId generate() {
    return new ModuleId(UUID.randomUUID());
  }

  public static ModuleId fromString(String text) {
    if (text == null) return null;
    return new ModuleId(UUID.fromString(text));
  }

  private final UUID myUid;

  private ModuleId(UUID uid) {
    myUid = uid;
  }

  public boolean equals(Object obj) {
    if (!(obj instanceof ModuleId)) return false;

    ModuleId id = (ModuleId) obj;
    return id.myUid.equals(myUid);
  }

  public int hashCode() {
    return myUid.hashCode();
  }

  public String toString() {
    return myUid.toString();
  }
}
