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
package jetbrains.mps.util.misc.hash;

import java.util.*;

public abstract class AbstractHashMap<K, V> extends AbstractMap<K, V> {

  protected int size;

  public int size() {
    return size;
  }

  public void clear() {
    init(0);
  }

  public V get(final Object key) {
    Map.Entry<K, V> e = getEntry(key);
    return e == null ? null : e.getValue();
  }

  public boolean containsKey(final Object key) {
    return getEntry(key) != null;
  }

  public Set<K> keySet() {
    return new KeySet();
  }

  public Collection<V> values() {
    return new Values();
  }

  public Set<Map.Entry<K, V>> entrySet() {
    return new EntrySet();
  }

  public boolean forEachKey(final ObjectProcedure<K> procedure) {
    for (final Entry<K, V> entry : entrySet()) {
      if (!procedure.execute(entry.getKey())) return false;
    }
    return true;
  }

  public boolean forEachValue(final ObjectProcedure<V> procedure) {
    for (final Entry<K, V> entry : entrySet()) {
      if (!procedure.execute(entry.getValue())) return false;
    }
    return true;
  }

  public boolean forEachEntry(final ObjectProcedure<Entry<K, V>> procedure) {
    for (final Entry<K, V> entry : entrySet()) {
      if (!procedure.execute(entry)) return false;
    }
    return true;
  }

  protected abstract Entry<K, V> getEntry(Object key);

  protected abstract void init(int capacity);

  protected abstract class HashMapIterator {

    protected abstract Entry<K, V> nextEntry();

    protected abstract boolean hasNext();

    protected abstract void remove();

  }

  protected abstract HashMapIterator hashIterator();

  private abstract class HashIteratorDecorator<T> implements Iterator<T> {

    protected final HashMapIterator decorated;

    protected HashIteratorDecorator() {
      this.decorated = hashIterator();
    }

    public boolean hasNext() {
      return decorated.hasNext();
    }

    public void remove() {
      decorated.remove();
    }
  }

  private final class EntrySet extends AbstractSet<Entry<K, V>> {

    public Iterator<Map.Entry<K, V>> iterator() {
      return new HashIteratorDecorator<Entry<K, V>>() {
        public Entry<K, V> next() {
          return decorated.nextEntry();
        }
      };
    }

    public boolean contains(Object o) {
      if (!(o instanceof Map.Entry)) {
        return false;
      }
      final Map.Entry<K, V> rightEntry = (Map.Entry<K, V>) o;
      final Map.Entry<K, V> leftEntry = getEntry(rightEntry.getKey());
      return leftEntry != null && leftEntry.getValue().equals(rightEntry.getValue());
    }

    public boolean remove(Object o) {
      if (!(o instanceof Map.Entry)) {
        return false;
      }
      final Map.Entry<K, V> e = (Map.Entry<K, V>) o;
      return AbstractHashMap.this.remove(e.getKey()) != null;
    }

    public int size() {
      return size;
    }

    public void clear() {
      AbstractHashMap.this.clear();
    }
  }

  private final class KeySet extends AbstractSet<K> {

    public Iterator<K> iterator() {
      return new HashIteratorDecorator<K>() {
        public K next() {
          return decorated.nextEntry().getKey();
        }
      };
    }

    public int size() {
      return size;
    }

    public boolean contains(Object o) {
      return AbstractHashMap.this.containsKey(o);
    }

    public boolean remove(Object o) {
      return AbstractHashMap.this.remove(o) != null;
    }

    public void clear() {
      AbstractHashMap.this.clear();
    }
  }

  private final class Values extends AbstractCollection<V> {

    public Iterator<V> iterator() {
      return new HashIteratorDecorator<V>() {
        public V next() {
          return decorated.nextEntry().getValue();
        }
      };
    }

    public int size() {
      return size;
    }

    public boolean contains(Object o) {
      return containsValue(o);
    }

    public void clear() {
      AbstractHashMap.this.clear();
    }
  }

}
