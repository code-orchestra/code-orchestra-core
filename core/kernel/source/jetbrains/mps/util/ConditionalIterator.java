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

import org.jetbrains.annotations.NotNull;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class ConditionalIterator<T> implements Iterator<T> {
  private Iterator<T> myIterator;
  private Condition<T> myCond;
  private T myObject = null;

  public ConditionalIterator(Iterator<T> iterator, @NotNull Condition<T> cond) {
    myIterator = iterator;
    myCond = cond;
  }

  public boolean hasNext() {
    if (myObject != null) return true;
    myObject = moveToNext();
    return myObject != null;
  }

  public T next() {
    if (myObject == null) {
      myObject = moveToNext();
      if (myObject == null) throw new NoSuchElementException();
    }

    T obj = myObject;
    myObject = null;
    return obj;
  }

  public void remove() {
    myIterator.remove();
  }

  private T moveToNext() {
    while (myIterator.hasNext()) {
      T obj = myIterator.next();
      if (myCond.met(obj)) {
        return obj;
      }
    }
    return null;
  }
}
