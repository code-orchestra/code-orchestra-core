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

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.Stack;

/**
 * Evgeny Gryaznov, 9/13/11
 */
public abstract class RecursiveIterator<T> implements Iterable<T>, Iterator<T> {

  private Stack<Iterator<T>> stack = new Stack<Iterator<T>>();
  private T current;
  private final boolean onlyLeaves;
  private Set<T> seen = new HashSet<T>();

  public RecursiveIterator(Iterator<T> root, boolean onlyLeaves) {
    this.onlyLeaves = onlyLeaves;
    stack.push(root);
    current = nextElement();
  }

  protected T nextElement() {
    while(!stack.isEmpty()) {
      final Iterator<T> top = stack.peek();
      if(top.hasNext()) {
        final T next = top.next();
        if(next == null || !seen.add(next)) {
          continue;
        }
        Iterator<T> new_ = children(next);
        if(new_ != null) {
          stack.push(new_);
          if(onlyLeaves) {
            continue;
          }
        }
        return next;
      }
      stack.pop();
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

  protected abstract Iterator<T> children(T node);
}
