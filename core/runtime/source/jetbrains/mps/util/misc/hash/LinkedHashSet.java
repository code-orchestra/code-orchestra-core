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

public class LinkedHashSet<E> extends AbstractSet<E> implements Set<E> {

  private Entry<E>[] table;
  private Entry<E> top;
  private Entry<E> back;
  private int capacity;
  private int size;
  private final float loadFactor;
  private int shift;
  private int mask;
  private boolean holdsNull;

  public LinkedHashSet() {
    this(0);
  }

  public LinkedHashSet(int capacity) {
    this(capacity, HashUtil.DEFAULT_LOAD_FACTOR);
  }

  public LinkedHashSet(int capacity, float loadFactor) {
    this.loadFactor = loadFactor;
    init(capacity);
  }

  public int size() {
    return size;
  }

  public boolean contains(final Object key) {
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
    final Entry<E> top = this.top;
    e.next = top;
    if (top != null) {
      top.previous = e;
    } else {
      back = e;
    }
    this.top = e;
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
    unlink(e);
    size = size - 1;
    return true;
  }

  public Iterator<E> iterator() {
    return new LinkedHashIterator<E>() {
      public E next() {
        return nextEntry().key;
      }
    };
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
    top = back = null;
    this.capacity = capacity;
    size = 0;
    holdsNull = false;
  }

  private void unlink(final Entry<E> e) {
    final Entry<E> prev = e.previous;
    final Entry<E> next = e.next;
    if (prev != null) {
      prev.next = next;
    } else {
      top = next;
    }
    if (next != null) {
      next.previous = prev;
    } else {
      back = prev;
    }
  }

  private void rehash(int capacity) {
    final int length = HashUtil.adjustTableLength((int) (capacity / loadFactor));
    this.capacity = capacity;
    if (length != table.length) {
      allocateTable(length);
      final Entry<E>[] table = this.table;
      final int shift = this.shift;
      final int mask = this.mask;
      for (Entry<E> e = back; e != null; e = e.previous) {
        final int index = HashUtil.indexFor(e.keyHash, length, shift, mask);
        e.hashNext = table[index];
        table[index] = e;
      }
    }
  }


  private static class Entry<E> {

    private final E key;
    private final int keyHash;
    private Entry<E> next;
    private Entry<E> previous;
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

  private abstract class LinkedHashIterator<T> implements Iterator<T> {

    private Entry<E> e;
    private Entry<E> last;

    private LinkedHashIterator() {
      final Entry<E> back = LinkedHashSet.this.back;
      if (LinkedHashSet.this.holdsNull) {
        e = new Entry<E>();
        e.previous = back;
      } else {
        e = back;
      }
    }

    public boolean hasNext() {
      return e != null;
    }

    public void remove() {
      if (last == null) {
        throw new IllegalStateException();
      }
      LinkedHashSet.this.remove(last.key);
      last = null;
    }

    protected Entry<E> nextEntry() {
      final Entry<E> result = last = e;
      e = result.previous;
      return result;
    }
  }
}
