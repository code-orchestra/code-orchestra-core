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

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: evgeny
 * Date: Dec 4, 2009
 * Time: 9:50:38 PM
 * To change this impl use File | Settings | File Templates.
 */
public abstract class AbstractImmutableList<T> extends AbstractCollection<T> implements List<T> {

  final protected T myFirst;
  private int mySize;

  public AbstractImmutableList(T first) {
    myFirst = first;
    mySize = -1;
  }

  public AbstractImmutableList(T first, int size) {
    myFirst = first;
    mySize = size;
  }

  protected abstract T next(T node);

  protected abstract T prev(T node);

  @Override
  public Iterator<T> iterator() {
    return listIterator();
  }

  @Override
  public T get(int index) {
    if (index < 0 || mySize >= 0 && index >= mySize) {
      throw new IndexOutOfBoundsException();
    }
    T current = myFirst;
    while (current != null) {
      if (index-- == 0) {
        return current;
      }
      current = next(current);
    }
    throw new IndexOutOfBoundsException();
  }

  @Override
  public int indexOf(Object o) {
    int count = 0;
    T current = myFirst;
    if (mySize == 0 || o == null) {
      return -1;
    }
    while (current != null) {
      if (current.equals(o)) {
        return count;
      }
      if (++count == mySize) {
        return -1;
      }
      current = next(current);
    }
    return -1;
  }

  @Override
  public int lastIndexOf(Object o) {
    int lastIndex = -1;
    int count = 0;
    T current = myFirst;
    if (mySize == 0 || o == null) {
      return -1;
    }
    while (current != null) {
      if (current.equals(o)) {
        lastIndex = count;
      }
      if (++count == mySize) {
        return lastIndex;
      }
      current = next(current);
    }
    return lastIndex;
  }

  @Override
  public ListIterator<T> listIterator() {
    return new ListItr(myFirst, 0);
  }

  @Override
  public ListIterator<T> listIterator(int index) {
    if (index == 0) {
      return listIterator();
    } else {
      if (index < 0 || index > size()) {
        throw new IndexOutOfBoundsException();
      }
      if (index == size()) {
        ListItr itr = new ListItr(get(index - 1), index - 1);
        itr.next();
        return itr;
      } else {
        return new ListItr(get(index), index);
      }
    }
  }

  protected abstract AbstractImmutableList<T> subList(T elem, int size);

  @Override
  public List<T> subList(int fromIndex, int toIndex) {
    if (fromIndex < toIndex) {
      return subList(get(fromIndex), toIndex - fromIndex);
    } else {
      return Collections.emptyList();
    }
  }

  @Override
  public int size() {
    if (mySize == -1) {
      T node = myFirst;
      mySize = 0;
      while (node != null) {
        mySize++;
        node = next(node);
      }
    }
    return mySize;
  }

  @Override
  public boolean addAll(int index, Collection<? extends T> c) {
    throw new UnsupportedOperationException();
  }

  @Override
  public T set(int index, T element) {
    throw new UnsupportedOperationException();
  }

  @Override
  public void add(int index, T element) {
    throw new UnsupportedOperationException();
  }

  @Override
  public T remove(int index) {
    throw new UnsupportedOperationException();
  }

  private class ListItr implements ListIterator<T> {

    private T myCurrent;
    private T myPrev;
    private int index;

    ListItr(T current, int index) {
      this.myCurrent = current;
      this.myPrev = null;
      this.index = index;
    }

    @Override
    public boolean hasNext() {
      return myCurrent != null;
    }

    @Override
    public T next() {
      if (myCurrent == null) {
        return null;
      }
      myPrev = myCurrent;
      index++;
      myCurrent = mySize == -1 || index < mySize ? AbstractImmutableList.this.next(myCurrent) : null;
      return myPrev;
    }

    @Override
    public boolean hasPrevious() {
      return myPrev != null;
    }

    @Override
    public T previous() {
      if (myPrev == null) {
        return null;
      }
      myCurrent = myPrev;
      index--;
      myPrev = index > 0 ? AbstractImmutableList.this.prev(myCurrent) : null;
      return myCurrent;
    }

    @Override
    public int nextIndex() {
      return index;
    }

    @Override
    public int previousIndex() {
      return index - 1;
    }

    @Override
    public void remove() {
      throw new UnsupportedOperationException();
    }

    @Override
    public void set(T t) {
      throw new UnsupportedOperationException();
    }

    @Override
    public void add(T t) {
      throw new UnsupportedOperationException();
    }
  }
}
