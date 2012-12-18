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

import org.apache.commons.lang.ObjectUtils;
import org.jetbrains.annotations.NotNull;

import java.util.*;
import java.util.AbstractMap.SimpleEntry;

class PropertiesMap implements Map<String, String> {
  private final String[] myProperties;

  public PropertiesMap(@NotNull String[] properties) {
    myProperties = properties;
  }

  public int size() {
    return myProperties.length / 2;
  }

  public boolean isEmpty() {
    return false;
  }

  public boolean containsKey(Object key) {
    if (!(key instanceof String)) return false;
    return getIndex((String) key, false) != -1;
  }

  public boolean containsValue(Object value) {
    if (!(value instanceof String)) return false;
    return getIndex((String) value, true) != -1;
  }

  public String get(Object key) {
    if (!(key instanceof String)) return null;
    int index = getIndex((String) key, false);
    if (index == -1) return null;
    return myProperties[index + 1];
  }

  public String put(String key, String value) {
    throw new UnsupportedOperationException();
  }

  public String remove(Object key) {
    throw new UnsupportedOperationException();
  }

  public void putAll(Map<? extends String, ? extends String> m) {
    throw new UnsupportedOperationException();
  }

  public void clear() {
    throw new UnsupportedOperationException();
  }

  public Set<String> keySet() {
    return new AbstractSet<String>() {
      public Iterator<String> iterator() {
        return new ArrayWithHolesIterator(-2, 2);
      }

      public int size() {
        return PropertiesMap.this.size();
      }
    };
  }

  public Collection<String> values() {
    return new AbstractSet<String>() {
      public Iterator<String> iterator() {
        return new ArrayWithHolesIterator(-1, 2);
      }

      public int size() {
        return PropertiesMap.this.size();
      }
    };
  }

  public Set<Entry<String, String>> entrySet() {
    HashSet<Entry<String, String>> res = new HashSet<Entry<String, String>>(size());
    for (int i = 0;i<myProperties.length;i+=2){
      res.add(new SimpleEntry<String, String>(myProperties[i],myProperties[i+1]));
    }
    return res;
  }

  private int getIndex(String propertyName, boolean value) {
    for (int i = value ? 1 : 0; i < myProperties.length; i += 2) {
      if (ObjectUtils.equals(myProperties[i], propertyName)) return i;
    }
    return -1;
  }

  private class ArrayWithHolesIterator implements Iterator<String> {
    private int myIndex;
    private int myHole;

    public ArrayWithHolesIterator(int startIndex, int hole) {
      myIndex = startIndex;
      myHole = hole;
    }

    public boolean hasNext() {
      return myIndex+myHole<myProperties.length;
    }

    public String next() {
      myIndex+=myHole;
      return myProperties[myIndex];
    }

    public void remove() {
      throw new UnsupportedOperationException();
    }
  }
}
