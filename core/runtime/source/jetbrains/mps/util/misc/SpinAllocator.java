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
package jetbrains.mps.util.misc;

import java.util.concurrent.atomic.AtomicBoolean;

/**
 * SpinAllocator can be used for allocating short-live automatic objects of type T.
 * Avoiding reenterable allocations, MAX_SIMULTANEOUS_ALLOCATIONS are concurrently possible.
 */
public class SpinAllocator<T> {

  public static final int MAX_SIMULTANEOUS_ALLOCATIONS = 64;

  public interface ICreator<T> {
    T createInstance();
  }

  public interface IDisposer<T> {
    void disposeInstance(T instance);
  }

  private AtomicBoolean[] _employed = new AtomicBoolean[MAX_SIMULTANEOUS_ALLOCATIONS];
  private Object[] _objects = new Object[MAX_SIMULTANEOUS_ALLOCATIONS];
  protected final ICreator<T> _creator;
  protected final IDisposer<T> _disposer;

  public SpinAllocator(final ICreator<T> creator, final IDisposer<T> disposer) {
    _creator = creator;
    _disposer = disposer;
    for (int i = 0; i < MAX_SIMULTANEOUS_ALLOCATIONS; ++i) {
      _employed[i] = new AtomicBoolean(false);
    }
  }

  public T alloc() {
    for (int i = 0; i < MAX_SIMULTANEOUS_ALLOCATIONS; ++i) {
      if (!_employed[i].getAndSet(true)) {
        T result = (T) _objects[i];
        if (result == null) {
          _objects[i] = result = _creator.createInstance();
        }
        return result;
      }
    }
    throw new RuntimeException("SpinAllocator has exhausted! Too many threads or you're going to get StackOverflow.");
  }

  public void dispose(final T instance) {
    for (int i = 0; i < MAX_SIMULTANEOUS_ALLOCATIONS; ++i) {
      if (_objects[i] == instance) {
        if (!_employed[i].get()) {
          throw new RuntimeException("Instance is already disposed.");
        }
        if (_disposer != null) {
          _disposer.disposeInstance(instance);
        }
        _employed[i].set(false);
        return;
      }
    }
    throw new RuntimeException("Attempt to dispose non-allocated instance.");
  }
}
