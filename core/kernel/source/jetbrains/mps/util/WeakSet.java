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

import java.util.AbstractSet;
import java.util.Collection;
import java.util.Iterator;
import java.util.WeakHashMap;

/**
 * @author Kostik
 */
public class WeakSet<T> extends AbstractSet<T> {
  private static final Object VALUE = new Object();

  private WeakHashMap<T, Object> myWeakHashMap;

  public WeakSet(int size) {
    myWeakHashMap = new WeakHashMap<T, Object>(size);
  }

  public WeakSet() {
    myWeakHashMap = new WeakHashMap<T, Object>();
  }

  public WeakSet(@NotNull Collection<? extends T> collection) {
    this(collection.size());
    for (T t : collection) {
      add(t);
    }
  }

  public boolean add(T t) {
    return myWeakHashMap.put(t, VALUE) == null;
  }

  public boolean remove(Object o) {
    return myWeakHashMap.remove(o) != null;
  }

  public Iterator iterator() {
    return myWeakHashMap.keySet().iterator();
  }

  public int size() {
    return myWeakHashMap.size();
  }

}
