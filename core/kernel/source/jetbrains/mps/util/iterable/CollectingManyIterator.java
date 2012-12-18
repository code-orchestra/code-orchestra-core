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
package jetbrains.mps.util.iterable;


import java.util.Iterator;

/**
 * Evgeny Gryaznov, 9/13/11
 */
public abstract class CollectingManyIterator<IN, T> implements Iterable<T>, Iterator<T> {

  private Iterator<IN> currentOuter;
  private Iterator<T> currentInner;
  private T next;

  public CollectingManyIterator(Iterator<IN> input) {
    currentOuter = input;
    next = nextInternal();
  }

  @Override
  public boolean hasNext() {
    return next != null;
  }

  @Override
  public T next() {
    T curr = next;
    next = nextInternal();
    return curr;
  }

  private T nextInternal() {
    if (currentInner != null && currentInner.hasNext()) {
      return currentInner.next();
    }
    while (currentOuter.hasNext()) {
      IN element = currentOuter.next();
      currentInner = element != null ? translate(element) : null;
      if (currentInner != null && currentInner.hasNext()) {
        return currentInner.next();
      }
    }
    return null;
  }

  @Override
  public void remove() {
    throw new UnsupportedOperationException();
  }

  protected abstract Iterator<T> translate(IN node);

  @Override
  public Iterator iterator() {
    return this;
  }
}
