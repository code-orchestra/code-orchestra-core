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
package jetbrains.mps.smodel.persistence.def;

import java.util.HashMap;
import java.util.Map;

public abstract class IHashProvider {
  public abstract String getHash(byte[] modelBytes);

  public abstract Map<String, String> getRootHashes(byte[] modelBytes);

  protected static String extractId(String tag) {
    if (tag == null) return null;

    String idString = " id=\"";
    int index = tag.lastIndexOf(idString);
    if (index < 0) return null;

    int offset = index + idString.length();
    index = offset;
    while (index < tag.length() && Character.isDigit(tag.codePointAt(index))) {
      index++;
    }
    if (index < tag.length() && tag.charAt(index) == '"') return tag.substring(offset, index);

    return null;
  }

  public static class SimpleHashProvider extends IHashProvider {
    public String getHash(byte[] modelBytes) {
      return "";
    }

    public Map<String, String> getRootHashes(byte[] modelBytes) {
      return new HashMap<String, String>();
    }
  }
}
