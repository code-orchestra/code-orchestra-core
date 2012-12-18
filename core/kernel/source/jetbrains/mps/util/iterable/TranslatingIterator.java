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
public abstract class TranslatingIterator<E, T> implements Iterable<T>, Iterator<T> {
  private T current;
  private final Iterator<E> inner;

  public TranslatingIterator(Iterator<E> inner) {
    this.inner = inner;
    current = nextElement();
  }

  protected T nextElement() {
    while (inner.hasNext()) {
      final E next = inner.next();
      T result = translate(next);
      if (result != null) {
        return result;
      }
    }
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

  protected abstract T translate(E node);
}
