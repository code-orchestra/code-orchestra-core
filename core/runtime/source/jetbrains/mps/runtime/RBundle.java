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

import java.net.URL;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;

public class RBundle<T> {
  private T myId;
  private BytecodeLocator myLocator;
  private BundleClassLoader<T> myClassLoader;
  private RuntimeEnvironment myRuntimeEnvironment;
  private Set<T> myDependencies = new LinkedHashSet<T>();

  public RBundle(T id, BytecodeLocator locator) {
    myId = id;
    myLocator = locator;
  }

  public T getId() {
    return myId;
  }

  public RBundle addDependency(T id) {
    myDependencies.add(id);
    return this;
  }

  public boolean isInitialized() {
    return myRuntimeEnvironment != null;
  }

  public Set<T> getDependencies() {
    return Collections.unmodifiableSet(myDependencies);
  }

  public void clearDependencies() {
    myDependencies.clear();
  }

  public void unload() {
    if (myClassLoader != null) {
      myClassLoader.dispose();
    }
  }

  boolean hasClass(String fqName) {
    return myLocator.find(fqName) != null;
  }

  boolean hasResource(String name) {
    return myLocator.findResource(name) != null;
  }

  Class getClass(String fqName) {
    try {
      return Class.forName(fqName, false, getClassLoader());
    } catch (ClassNotFoundException e) {
      return null;
    }
  }

  URL getResource(String name) {
    return myLocator.findResource(name);
  }

  RuntimeEnvironment getRuntimeEnvironment() {
    return myRuntimeEnvironment;
  }

  BytecodeLocator getLocator() {
    return myLocator;
  }

  void init(RuntimeEnvironment e) {
    myRuntimeEnvironment = e;
    reload();
  }

  void reload() {
    if (myClassLoader != null) {
      myClassLoader.dispose();
    }
    myClassLoader = new BundleClassLoader<T>(this);
  }

  public BundleClassLoader getClassLoader() {
    assert myClassLoader != null;
    return myClassLoader;
  }

  public String toString() {
    return "RBundle " + getId();
  }

  public void classLoaded(String name) {
    myRuntimeEnvironment.classLoaded(name, myId);
  }
}
