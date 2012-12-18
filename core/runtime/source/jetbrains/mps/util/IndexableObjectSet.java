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
import java.util.BitSet;
import java.util.Iterator;
import java.util.NoSuchElementException;

public abstract class IndexableObjectSet<E> extends AbstractSet<E> {
  private BitSet myBitSet;

  protected IndexableObjectSet(int size) {
    this(size, false);
  }

  protected IndexableObjectSet(int size, boolean full) {
    myBitSet = new BitSet(size);

    if (full) {
      myBitSet.set(0, size);
    }
  }

  protected abstract int getIndex(E e);

  protected abstract E getObject(int index);

  public Iterator<E> iterator() {
    return new Iterator<E>() {
      private int myCurrent = 0;

      public boolean hasNext() {
        return myBitSet.nextSetBit(myCurrent) != -1;
      }

      public E next() {
        int nextSetBit = myBitSet.nextSetBit(myCurrent);
        if (nextSetBit == -1) throw new NoSuchElementException();
        myCurrent = nextSetBit + 1;
        return getObject(nextSetBit);
      }

      public void remove() {
        if (myCurrent == 0) throw new IllegalStateException();
        myBitSet.set(myCurrent - 1, false);
      }
    };
  }

  public int size() {
    int result = 0;
    for (int i = 0; i < myBitSet.size(); i++) {
      if (myBitSet.get(i)) {
        result++;
      }
    }
    return result;
  }


  @Override
  public boolean isEmpty() {
    return myBitSet.isEmpty();
  }

  @Override
  public boolean contains(Object o) {
    int index = getIndex((E) o);
    if (index == -1) return false;
    return myBitSet.get(index);
  }

  @Override
  public boolean add(E e) {
    int index = getIndex(e);
    if (index == -1) throw new IllegalArgumentException();

    boolean was = myBitSet.get(index);
    myBitSet.set(index);


    return !was;
  }

  @Override
  public boolean remove(Object o) {
    int index = getIndex((E) o);
    if (index == -1) throw new IllegalArgumentException();

    boolean contained = myBitSet.get(index);
    myBitSet.set(index, false);

    return contained;
  }

  public void add(int index) {
    myBitSet.set(index);
  }

  public void remove(int index) {
    myBitSet.set(index, false);
  }

  public void addAll(IndexableObjectSet<E> set) {
    myBitSet.or(set.myBitSet);
  }

  public void retainAll(IndexableObjectSet<E> set) {
    myBitSet.and(set.myBitSet);
  }

  public boolean contains(int varId) {
    return myBitSet.get(varId);
  }

  @Override
  public void clear() {
    myBitSet.clear();
  }

  @Override
  public int hashCode() {
    return myBitSet.hashCode();
  }

  @Override
  public boolean equals(Object o) {
    if (o instanceof IndexableObjectSet) {
      IndexableObjectSet vs = (IndexableObjectSet) o;
      return vs.myBitSet.equals(myBitSet);
    }

    return super.equals(o);
  }
}

