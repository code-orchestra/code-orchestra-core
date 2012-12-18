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

import java.util.AbstractList;
import java.util.Arrays;

public abstract class ArrayWrapper<T> extends AbstractList<T> {
  private T[] myArray;

  protected ArrayWrapper() {
    myArray = getArray();
  }

  public T get(int index) {
    return myArray[index];
  }

  public T set(int index, T element) {
    T oldItem = myArray[index];
    myArray[index] = element;
    return oldItem;
  }

  public void add(int index, T element) {
    T[] oldArray = myArray;
    T[] newArray = newArray(oldArray.length + 1);
    System.arraycopy(oldArray, 0, newArray, 0, index);
    newArray[index] = element;
    System.arraycopy(oldArray, index, newArray, index + 1, oldArray.length - index);
    myArray = newArray;
    setArray(newArray);
  }

  public T remove(int index) {
    T oldItem = myArray[index];
    T[] oldArray = myArray;
    T[] newArray = newArray(oldArray.length - 1);
    System.arraycopy(oldArray, 0, newArray, 0, index);
    System.arraycopy(oldArray, index + 1, newArray, index, oldArray.length - index - 1);
    myArray = newArray;
    setArray(newArray);
    return oldItem;
  }

  public int indexOf(Object o) {
    int len = myArray.length;
    for (int i = 0; i < len; i++) {
      if (myArray[i] == o) return i;
    }
    return -1;
  }

  @Override
  public Object[] toArray() {
    return Arrays.copyOf(myArray, size());
  }

  @Override
  public <T> T[] toArray(T[] a) {
    if (a.length < size()) {
      // Make a new array of a's runtime type, but my contents:
      return (T[]) Arrays.copyOf(myArray, size(), a.getClass());
    }
    System.arraycopy(myArray, 0, a, 0, size());
    if (a.length > size()) {
      a[size()] = null;
    }
    return a;
  }

  public int size() {
    return myArray.length;
  }

  protected abstract T[] getArray();

  protected abstract void setArray(T[] newArray);

  protected abstract T[] newArray(int size);
}
