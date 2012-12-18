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

import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Set;

public class HashSet<E> extends AbstractSet<E> implements Set<E> {

  private Entry<E>[] table;
  private int capacity;
  private int size;
  private final float loadFactor;
  private int shift;
  private int mask;
  private boolean holdsNull;

  public HashSet() {
    this(0);
  }

  public HashSet(int capacity) {
    this(capacity, HashUtil.DEFAULT_LOAD_FACTOR);
  }

  public HashSet(int capacity, float loadFactor) {
    this.loadFactor = loadFactor;
    init(capacity);
  }

  public boolean contains(Object key) {
    if (key == null) {
      return holdsNull;
    }

    final Entry<E>[] table = this.table;
    final int hash = key.hashCode();
    final int index = HashUtil.indexFor(hash, table.length, shift, mask);

    for (Entry<E> e = table[index]; e != null; e = e.hashNext) {
      final E entryKey;
      if (e.keyHash == hash && ((entryKey = e.key) == key || entryKey.equals(key))) {
        return true;
      }
    }

    return false;
  }

  public boolean add(E key) {
    if (key == null) {
      final boolean wasHoldingNull = holdsNull;
      holdsNull = true;
      if (!wasHoldingNull) {
        size = size + 1;
      }
      return !wasHoldingNull;
    }

    final Entry<E>[] table = this.table;
    final int hash = key.hashCode();
    final int index = HashUtil.indexFor(hash, table.length, shift, mask);

    for (Entry<E> e = table[index]; e != null; e = e.hashNext) {
      final E entryKey;
      if (e.keyHash == hash && ((entryKey = e.key) == key || entryKey.equals(key))) {
        return false;
      }
    }

    final Entry<E> e = new Entry<E>(key);
    e.hashNext = table[index];
    table[index] = e;
    size = size + 1;

    if (size > capacity) {
      rehash(HashUtil.nextCapacity(capacity));
    }
    return true;
  }

  public boolean remove(Object key) {
    if (key == null) {
      final boolean wasHoldingNull = holdsNull;
      holdsNull = false;
      if (wasHoldingNull) {
        size = size - 1;
      }
      return wasHoldingNull;
    }

    final Entry<E>[] table = this.table;
    final int hash = key.hashCode();
    final int index = HashUtil.indexFor(hash, table.length, shift, mask);
    Entry<E> e = table[index];

    if (e == null) return false;

    E entryKey;
    if (e.keyHash == hash && ((entryKey = e.key) == key || entryKey.equals(key))) {
      table[index] = e.hashNext;
    } else {
      for (; ;) {
        final Entry<E> last = e;
        e = e.hashNext;
        if (e == null) return false;
        if (e.keyHash == hash && ((entryKey = e.key) == key || entryKey.equals(key))) {
          last.hashNext = e.hashNext;
          break;
        }
      }
    }
    size = size - 1;
    return true;
  }

  public Iterator<E> iterator() {
    return new HashSetIterator<E>() {
      public E next() {
        return nextEntry().key;
      }
    };
  }

  public int size() {
    return size;
  }

  private void allocateTable(int length) {
    table = new Entry[length];
    shift = HashUtil.shift(table.length);
    mask = (1 << shift) - 1;
  }

  private void init(int capacity) {
    if (capacity < HashUtil.MIN_CAPACITY) {
      capacity = HashUtil.MIN_CAPACITY;
    }
    allocateTable(HashUtil.adjustTableLength((int) (capacity / loadFactor)));
    this.capacity = capacity;
    size = 0;
    holdsNull = false;
  }

  private void rehash(int capacity) {
    final int length = HashUtil.adjustTableLength((int) (capacity / loadFactor));
    this.capacity = capacity;
    if (length != table.length) {
      final Iterator<Entry<E>> entries = new HashSetIterator<Entry<E>>() {
        public Entry<E> next() {
          return nextEntry();
        }
      };
      allocateTable(length);
      final Entry<E>[] table = this.table;
      final int shift = this.shift;
      final int mask = this.mask;
      while (entries.hasNext()) {
        final Entry<E> e = entries.next();
        final int index = HashUtil.indexFor(e.keyHash, length, shift, mask);
        e.hashNext = table[index];
        table[index] = e;
      }
    }
  }

  private static class Entry<E> {

    private final E key;
    private final int keyHash;
    private Entry<E> hashNext;

    public Entry() {
      key = null;
      keyHash = 0;
    }

    public Entry(final E key) {
      this.key = key;
      keyHash = key.hashCode();
    }
  }

  private abstract class HashSetIterator<T> implements Iterator<T> {

    private final Entry<E>[] table = HashSet.this.table;
    private int index = 0;
    private Entry<E> e = null;
    private Entry<E> last;
    private boolean holdsNull = HashSet.this.holdsNull;

    HashSetIterator() {
      initNextEntry();
    }

    public boolean hasNext() {
      return e != null;
    }

    public void remove() {
      if (last == null) {
        throw new IllegalStateException();
      }
      HashSet.this.remove(last.key);
      last = null;
    }

    protected Entry<E> nextEntry() {
      final Entry<E> result = last = e;
      initNextEntry();
      return result;
    }

    private void initNextEntry() {
      Entry<E> result = e;
      if (result != null) {
        result = result.hashNext;
      }
      final Entry<E>[] table = this.table;
      final int length = table.length;
      while (result == null && index < length) {
        result = table[index++];
      }
      if (result == null && holdsNull) {
        holdsNull = false;
        result = new Entry<E>();
      }
      e = result;
    }
  }
}
