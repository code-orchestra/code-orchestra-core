/*
 * Copyright 2003-2010 JetBrains s.r.o.
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
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.apache.commons.lang.StringUtils;

import java.util.UUID;

public abstract class SModelId {
  private static final String REGULAR_PREFIX = "r:";
  private static final String FOREIGN_PREFIX = "f:";

  @CodeOrchestraPatch
  public boolean isForeign() {
    return toString().startsWith(FOREIGN_PREFIX);
  }

  public static SModelId generate() {
    return new RegularSModelId(UUID.randomUUID());
  }

  public static SModelId regular(UUID uid) {
    return new RegularSModelId(uid);
  }

  public static SModelId foreign(String id) {
    return new ForeignSModelId(id);
  }

  public static SModelId foreign(String kind, String id) {
    return new ForeignSModelId(kind + "#" + id);
  }

  public static SModelId foreign(String kind, String moduleId, String id) {
    // RE-2059
    return foreign(kind, id);

    /*
    if (moduleId==null||moduleId.length()==0){
      return new ForeignSModelId(kind + "#" + id);
    }
    return new ForeignSModelId(kind + "#" + moduleId + "#" + id);
    */
  }

  public static SModelId fromString(String id) {
    if (id.startsWith(REGULAR_PREFIX)) {
      String suffix = id.substring(REGULAR_PREFIX.length());
      try {
        UUID uuid = UUID.fromString(suffix);
        return regular(uuid);
      } catch (IllegalArgumentException e) {
        long lower = Long.parseLong(suffix);
        UUID uuid = new UUID(0x0000000000004000, lower);
        return regular(uuid);
      }
    }
    if (id.startsWith(FOREIGN_PREFIX)) {
      String suffix = id.substring(FOREIGN_PREFIX.length());
      return foreign(suffix);
    }
    throw new IllegalArgumentException();
  }

  private SModelId() {
  }

  public SModelId getCopy() {
    return fromString(toString());
  }

  private static interface UUIDSModelId {
    UUID getUUID();
  }

   public static class RegularSModelId extends SModelId implements UUIDSModelId {
    private UUID myId;

    private RegularSModelId(UUID id) {
      myId = id;
    }

    public boolean equals(Object obj) {
      if (!(obj instanceof UUIDSModelId)) return false;
      return ((UUIDSModelId) obj).getUUID().equals(myId);
    }

    public UUID getId() {
      return getUUID();
    }

    public UUID getUUID() {
      return myId;
    }

    public int hashCode() {
      return myId.hashCode();
    }

    public String toString() {
      return REGULAR_PREFIX + myId;
    }
  }

  @CodeOrchestraPatch
  private static String cutModuleId(String foreignModelIdStr) {
    if (StringUtils.countMatches(foreignModelIdStr, "#") == 2) {
      return foreignModelIdStr.substring(0, foreignModelIdStr.indexOf("#")) +
        foreignModelIdStr.substring(foreignModelIdStr.lastIndexOf("#"));
    }
    return foreignModelIdStr;
  }

  public static class ForeignSModelId extends SModelId implements UUIDSModelId {

    private UUID myId;
    private String myStringId;

    @CodeOrchestraPatch
    private ForeignSModelId(String id) {
      // RE-2074
      myStringId = InternUtil.intern(cutModuleId(id));
      myId = UUID.nameUUIDFromBytes(myStringId.toString().getBytes());
    }

    public boolean equals(Object obj) {
      if (!(obj instanceof UUIDSModelId)) return false;
      return ((UUIDSModelId) obj).getUUID().equals(myId);
    }

    public int hashCode() {
      return myId.hashCode();
    }

    public String getId() {
      return myStringId;
    }

    public UUID getUUID() {
      return myId;
    }

    public String toString() {
      return FOREIGN_PREFIX + myStringId;
    }
  }

}
