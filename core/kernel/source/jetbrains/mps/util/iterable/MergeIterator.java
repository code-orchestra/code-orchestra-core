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

import org.jetbrains.annotations.NotNull;

import java.util.Iterator;

/**
 * Evgeny Gryaznov, 9/13/11
 */
public class MergeIterator<T> implements Iterable<T>, Iterator<T> {

  private Iterator<T> it1;
  private boolean firstHasNext;
  private Iterator<T> it2;

  public MergeIterator(@NotNull Iterator<T> it1, @NotNull Iterator<T> it2) {
    this.it1 = it1;
    this.it2 = it2;
    firstHasNext = it1.hasNext();
  }

  @Override
  public Iterator<T> iterator() {
    return this;
  }

  @Override
  public boolean hasNext() {
    if (!firstHasNext) return it2.hasNext();
    firstHasNext = it1.hasNext();
    return firstHasNext || it2.hasNext();
  }

  @Override
  public T next() {
    return firstHasNext ? it1.next() : it2.next();
  }

  @Override
  public void remove() {
    throw new UnsupportedOperationException();
  }
}
