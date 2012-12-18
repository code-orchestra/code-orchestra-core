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

public class LongHashSet extends AbstractSet<Long> implements Set<Long> {
  private Entry[] table;
  private int capacity;
  private int size;
  private final float loadFactor;
  private int shift;
  private int mask;

  public LongHashSet() {
    this(0);
  }

  public LongHashSet(int capacity) {
    this(capacity, HashUtil.DEFAULT_LOAD_FACTOR);
  }

  public LongHashSet(int capacity, float loadFactor) {
    this.loadFactor = loadFactor;
    init(capacity);
  }

  public boolean contains(final long key) {
    final Entry[] table = this.table;
    final int index = HashUtil.indexFor(key, table.length, shift, mask);

    for (Entry e = table[index]; e != null; e = e.hashNext) {
      if (e.key == key) {
        return true;
      }
    }

    return false;
  }

  public boolean contains(final Object key) {
    return contains(((Long) key).longValue());
  }

  public boolean add(final long key) {
    final Entry[] table = this.table;
    final int index = HashUtil.indexFor(key, table.length, shift, mask);

    for (Entry e = table[index]; e != null; e = e.hashNext) {
      if (e.key == key) {
        return false;
      }
    }

    final Entry e = new Entry(key);
    e.hashNext = table[index];
    table[index] = e;
    size = size + 1;

    if (size > capacity) {
      rehash(HashUtil.nextCapacity(capacity));
    }
    return true;
  }

  public boolean add(Long key) {
    return add(key.longValue());
  }

  public boolean remove(long key) {
    final Entry[] table = this.table;
    final int index = HashUtil.indexFor(key, table.length, shift, mask);
    Entry e = table[index];

    if (e == null) return false;

    if (e.key == key) {
      table[index] = e.hashNext;
    } else {
      for (; ;) {
        final Entry last = e;
        e = e.hashNext;
        if (e == null) return false;
        if (e.key == key) {
          last.hashNext = e.hashNext;
          break;
        }
      }
    }
    size = size - 1;
    return true;
  }

  public boolean remove(Object key) {
    return remove(((Long) key).longValue());
  }

  public Iterator<Long> iterator() {
    return new HashSetIterator<Long>() {
      public Long next() {
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
  }

  private void rehash(int capacity) {
    final int length = HashUtil.adjustTableLength((int) (capacity / loadFactor));
    this.capacity = capacity;
    if (length != table.length) {
      final Iterator<Entry> entries = new HashSetIterator<Entry>() {
        public Entry next() {
          return nextEntry();
        }
      };
      allocateTable(length);
      final Entry[] table = this.table;
      final int shift = this.shift;
      final int mask = this.mask;
      while (entries.hasNext()) {
        final Entry e = entries.next();
        final int index = HashUtil.indexFor(e.key, length, shift, mask);
        e.hashNext = table[index];
        table[index] = e;
      }
    }
  }

  private static class Entry {

    private final long key;
    private Entry hashNext;

    public Entry(final long key) {
      this.key = key;
    }
  }

  private abstract class HashSetIterator<T> implements Iterator<T> {

    private final Entry[] table = LongHashSet.this.table;
    private int index = 0;
    private Entry e = null;
    private Entry last;

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
      LongHashSet.this.remove(last.key);
      last = null;
    }

    protected Entry nextEntry() {
      final Entry result = last = e;
      initNextEntry();
      return result;
    }

    private void initNextEntry() {
      Entry result = e;
      if (result != null) {
        result = result.hashNext;
      }
      final Entry[] table = this.table;
      while (result == null && index < table.length) {
        result = table[index++];
      }
      e = result;
    }
  }
}
