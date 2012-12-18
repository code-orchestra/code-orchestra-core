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
package jetbrains.mps.runtime;

import jetbrains.mps.util.InternUtil;

import java.io.IOException;
import java.net.URL;
import java.util.*;

public class BundleClassLoader<T> extends BaseClassLoader {
  private Map<String, Class> myClassesCache = new HashMap<String, Class>();
  private final Object myLock = new Object();

  private boolean myDisposed;
  private RBundle<T> myBundle;

  BundleClassLoader(RBundle<T> bundle) {
    myBundle = bundle;
  }

  protected synchronized Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
    checkDisposed();
    return super.loadClass(name, resolve);
  }

  public Class getClass(String fqName) {
    checkDisposed();

    synchronized (myLock) {
      if (myClassesCache.containsKey(fqName)) {
        return myClassesCache.get(fqName);
      }

      fqName = InternUtil.intern(fqName);
      try {
        Class<?> cls = Class.forName(fqName, false, this);
        myClassesCache.put(fqName, cls);
        return cls;
      } catch (ClassNotFoundException e) {
        myClassesCache.put(fqName, null);
        return null;
      }
    }
  }

  protected Class loadBeforeCurrent(String name) {
    Class fromParent = myBundle.getRuntimeEnvironment().loadFromParent(name, myBundle);
    if (fromParent != null) {
      return fromParent;
    }

    return null;
  }

  protected Class loadAfterCurrent(String name) {
    RuntimeEnvironment<T> re = myBundle.getRuntimeEnvironment();
    for (T dep : re.getAllDependencies(myBundle)) {
      if (dep.equals(myBundle.getId())) continue;
      if (re.get(dep).hasClass(name)) {
        try {
          return Class.forName(name, false, re.get(dep).getClassLoader());
        } catch (ClassNotFoundException e) {
          throw new RuntimeException(e);
        }
      }
    }

    return null;
  }

  protected byte[] findClassBytes(String name) {
    byte[] bytes = myBundle.getLocator().find(name);
    if (bytes != null) {
      myBundle.classLoaded(name);
    }
    return bytes;
  }

  protected URL findResource(String name) {
    RuntimeEnvironment<T> re = myBundle.getRuntimeEnvironment();

    for (T dep : re.getAllDependencies(myBundle)) {
      if (re.get(dep).hasResource(name)) {
        return re.get(dep).getResource(name);
      }
    }

    return null;
  }

  @Override
  protected Enumeration<URL> findResources(String name) throws IOException {
    ArrayList<URL> result = new ArrayList<URL>();
    RuntimeEnvironment<T> re = myBundle.getRuntimeEnvironment();
    for (T dep : re.getAllDependencies(myBundle)) {
      if (re.get(dep).hasResource(name)) {
        result.add(re.get(dep).getResource(name));
      }
    }

    return new IterableToEnumWrapper<URL>(result);
  }

  public void dispose() {
    super.dispose();
    myClassesCache.clear();
    myDisposed = true;
  }

  private void checkDisposed() {
    if (myDisposed) {
//      throw new IllegalStateException("Attempt to load class from disposed class loader");
    }
  }

  public boolean isDisposed() {
    return myDisposed;
  }

  public RBundle getBundle() {
    checkDisposed();
    return myBundle;
  }

  public String toString() {
    return myBundle.getId() + "'s class loader";
  }

  private static class IterableToEnumWrapper<E> implements Enumeration<E> {

    private Iterator<E> myIterator;

    public IterableToEnumWrapper(Iterable<E> iterable) {
      myIterator = iterable.iterator();
    }

    @Override
    public boolean hasMoreElements() {
      return myIterator.hasNext();
    }

    @Override
    public E nextElement() {
      return myIterator.next();
    }
  }
}
