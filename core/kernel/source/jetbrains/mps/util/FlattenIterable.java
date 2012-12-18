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

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

/**
 * Evgeny Gryaznov, Feb 10, 2010
 * <p/>
 * Iterates over superposition of Iterables.
 */
public class FlattenIterable<T> implements Iterable<T> {

  private Collection<Iterable<T>> myContent;

  public FlattenIterable() {
    this(new ArrayList<Iterable<T>>());
  }

  public FlattenIterable(Collection<Iterable<T>> content) {
    myContent = content;
  }

  public void add(Iterable<T> e) {
    myContent.add(e);
  }

  @Override
  public Iterator<T> iterator() {
    return new Iterator<T>() {
      Iterator<Iterable<T>> currentOuter;
      Iterator<T> currentInner;
      T next;

      {
        currentOuter = myContent.iterator();
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
          Iterable<T> innerIterable = currentOuter.next();
          currentInner = innerIterable != null ? innerIterable.iterator() : null;
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
    };
  }
}
