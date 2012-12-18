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
package jetbrains.mps.util;

import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class ArrayListBasedImmutableMap<K, V> extends SmallMap<K, V> {
  private final Object[] keys;
  private final Object[] values;

  private final Set<K> keySet;

  public ArrayListBasedImmutableMap(Map<K, V> map) {
    keys = new Object[map.size()];
    values = new Object[map.size()];

    int i = 0;
    for (Map.Entry<K, V> entry : map.entrySet()) {
      keys[i] = entry.getKey();
      values[i++] = entry.getValue();
    }

    keySet = new ArrayBasedImmutableSet<K>(keys);
  }

  @Override
  public int size() {
    return keys.length;
  }

  @Override
  public boolean containsKey(Object key) {
    int hash = key.hashCode();

    for (int i = 0; i < keys.length; i++) {
      if (keys[i].hashCode() == hash) {
        if (org.apache.commons.lang.ObjectUtils.equals(keys[i], key)) {
          return true;
        }
      }
    }

    return false;
  }

  @Override
  public V get(Object key) {
    int hash = key.hashCode();

    for (int i = 0; i < keys.length; i++) {
      if (keys[i].hashCode() == hash) {
        if (org.apache.commons.lang.ObjectUtils.equals(keys[i], key)) {
          return (V) values[i];
        }
      }
    }

    return null;
  }

  @Override
  public Set<K> keySet() {
    return keySet;
  }

  class ArrayBasedImmutableSet<V> extends AbstractSet<V> {
    private final Object[] keys;

    /**
     * @param keys Must be immutable!
     */
    ArrayBasedImmutableSet(Object[] keys) {
      this.keys = keys;
    }

    @Override
    public Iterator<V> iterator() {
      return new Iterator<V>() {
        int position = 0;

        @Override
        public boolean hasNext() {
          return position < keys.length;
        }

        @Override
        public V next() {
          return (V) keys[position++];
        }

        @Override
        public void remove() {
          throw new UnsupportedOperationException();
        }
      };
    }

    @Override
    public int size() {
      return keys.length;
    }
  }
}
