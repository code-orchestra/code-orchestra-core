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

import jetbrains.mps.util.misc.hash.HashSet;

import java.util.Iterator;
import java.util.Set;

/**
 * Evgeny Gryaznov, 9/13/11
 */
public class DistinctIterator<T> implements Iterable<T>, Iterator<T> {
  private T current;
  private final Iterator<T> inner;
  private Set<T> seen = new HashSet<T>();

  public DistinctIterator(Iterator<T> inner) {
    this.inner = inner;
    current = nextElement();
  }

  protected T nextElement() {
    while (inner.hasNext()) {
      final T next = inner.next();
      if (next != null) {
        if (seen.add(next)) {
          return next;
        }
      }
    }
    seen = null;
    return null;
  }

  @Override
  public final boolean hasNext() {
    return current != null;
  }

  @Override
  public final T next() {
    final T result = current;
    current = nextElement();
    return result;
  }

  @Override
  public void remove() {
    throw new UnsupportedOperationException();
  }

  @Override
  public Iterator<T> iterator() {
    return this;
  }
}
