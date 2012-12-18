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

import jetbrains.mps.util.InternAwareStringSet;
import jetbrains.mps.util.InternUtil;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

public class RuntimeEnvironment<T> {
  private static final ClassHolder NULL_CLASS_HOLDER = new ClassHolder(null);
  private final Object myLock = new Object();

  private Map<T, RBundle<T>> myBundles = new HashMap<T, RBundle<T>>();
  private Set<String> myLoadFromParentPrefixes = new InternAwareStringSet();

  private Map<String, ClassHolder> myClassesFromParent = new ConcurrentHashMap<String, ClassHolder>();
  private Map<String, T> myLoadedClasses = new HashMap<String, T>();

  public RuntimeEnvironment() {
  }

  public RuntimeEnvironment<T> addLoadFromParent(String prefix) {
    myLoadFromParentPrefixes.add(prefix);
    return this;
  }

  public Class loadFromParent(String cls, RBundle<T> bundle) {
    for (String prefix : myLoadFromParentPrefixes) {
      if (cls.startsWith(prefix)) {
        return getFromParent(cls);
      }
    }

    return null;
  }

  protected Class getFromParent(String name) {
    if (myClassesFromParent.containsKey(name)) {
      return myClassesFromParent.get(name).myClass;
    }

    Class result = null;
    try {
      result = Class.forName(name);
    } catch (ClassNotFoundException e) {
      //it's ok
    }

    myClassesFromParent.put(InternUtil.intern(name), result != null ? new ClassHolder(result) : NULL_CLASS_HOLDER);
    return result;
  }

  public RBundle<T> get(T id) {
    synchronized (myLock) {
      return myBundles.get(id);
    }
  }

  public Set<RBundle<T>> getBundles() {
    synchronized (myLock) {
      return new HashSet<RBundle<T>>(myBundles.values());
    }
  }

  public RuntimeEnvironment<T> add(RBundle<T>... bundles) {
    synchronized (myLock) {
      for (RBundle<T> bundle : bundles) {
        assert !myBundles.containsKey(bundle.getId());
        myBundles.put(bundle.getId(), bundle);
      }

      return this;
    }
  }

  public RuntimeEnvironment<T> init(RBundle<T>... bundles) {
    synchronized (myLock) {
      Set<T> deps = new HashSet<T>();
      for (RBundle<T> bundle : bundles) {
        assert myBundles.containsKey(bundle.getId());
        collectDependencies(bundle, deps);
      }

      for (T dep : deps) {
        if (!myBundles.containsKey(dep)) {
          throw new UnsatisfiedDependencyException("Can't satisfy " + Arrays.asList(bundles) + "'s dependency on " + dep);
        }
        RBundle b = myBundles.get(dep);
        if (!b.isInitialized()) {
          b.init(this);
        }
      }

      return this;
    }
  }

  public RuntimeEnvironment<T> unload(T... bundleIds) {
    return unload(toBundles(bundleIds));
  }

  public RuntimeEnvironment<T> unload(RBundle<T>... bundles) {
    synchronized (myLock) {
      Set<RBundle> deps = getBundlesWhichDependOn(bundles);
      deps.removeAll(Arrays.asList(bundles));
      if (!deps.isEmpty()) {
        String message = "Can't unload bundles " + Arrays.asList(bundles) + " because bundles " + deps + " depend on them\n";
        Set<RBundle> bundlesSet = new HashSet<RBundle>(Arrays.asList(bundles));
        for (RBundle<T> b : deps) {
          message += "bundle " + b + " depends on ";
          for (T depName : b.getDependencies()) {
            if (bundlesSet.contains(get(depName))) {
              message += depName + " ";
            }
          }
          message += "\n";
        }

        throw new RuntimeEnvironmentException(message);
      }

      for (RBundle<T> b : bundles) {
        b.unload();
        myBundles.remove(b.getId());
      }

      return this;
    }
  }

  public RuntimeEnvironment reload(RBundle<T>... bundles) {
    synchronized (myLock) {
      Set<RBundle> bundlesToReload = new HashSet<RBundle>(Arrays.asList(bundles));
      bundlesToReload.addAll(getBundlesWhichDependOn(bundles));
      for (RBundle<T> db : bundlesToReload) {
        db.reload();
      }

      return this;
    }
  }

  private RBundle<T>[] toBundles(T... bundleIds) {
    RBundle[] bundles = new RBundle[bundleIds.length];

    for (int i = 0; i < bundleIds.length; i++) {
      bundles[i] = get(bundleIds[i]);
      assert bundles[i] != null : "Can't find " + bundleIds[i];
    }

    return bundles;
  }

  public RuntimeEnvironment<T> reload(T... bundleIds) {
    return reload(toBundles(bundleIds));
  }

  public RuntimeEnvironment<T> replace(RBundle<T>... bundles) {
    synchronized (myLock) {
      Set<RBundle> bundlesToReload = getBundlesWhichDependOn(bundles);
      bundlesToReload.removeAll(Arrays.asList(bundles));

      for (RBundle<T> b : bundles) {
        assert myBundles.containsKey(b.getId());

        myBundles.remove(b.getId());
        myBundles.put(b.getId(), b);
      }

      for (RBundle btr : bundlesToReload) {
        reload(btr);
      }

      return this;
    }
  }

  private Set<RBundle> getBundlesWhichDependOn(RBundle... bs) {
    Set<RBundle> result = new HashSet<RBundle>();
    for (RBundle cb : myBundles.values()) {
      for (RBundle b : bs) {
        if (cb.getDependencies().contains(b.getId())) {
          result.add(cb);
        }
      }
    }
    return result;
  }

  public Set<T> getAllDependencies(RBundle<T> b) {
    synchronized (myLock) {
      Set<T> result = new HashSet<T>();
      collectDependencies(b, result);
      return result;
    }
  }

  private void collectDependencies(RBundle<T> bundle, Set<T> result) {
    if (result.contains(bundle.getId())) {
      return;
    }

    result.add(bundle.getId());
    for (T dep : bundle.getDependencies()) {
      if (myBundles.containsKey(dep)) {
        RBundle b = get(dep);
        collectDependencies(b, result);
      } else {
        result.add(dep);
      }
    }
  }

  public RuntimeEnvironment<T> reloadAll() {
    reload(myBundles.values().toArray(new RBundle[myBundles.values().size()]));
    return this;
  }

  public void classLoaded(String name, T id) {
    synchronized (myLoadedClasses) {
      if (myLoadedClasses.containsKey(name)) {
        T oldLoaderId = myLoadedClasses.get(name);
        if (!equals(oldLoaderId, id)) {
          String s = "Class \"" + name + "\" was loaded by multiple module classloaders simultaneously.\n" +
            "Classloaders: \n" +
            "  " + id.toString() + "\n" +
            "  " + oldLoaderId.toString();
          //throw new IllegalStateException(s);
          System.out.println(s);
        }
      } else {
        myLoadedClasses.put(InternUtil.intern(name), id);
      }
    }
  }

  public static boolean equals(Object o1, Object o2) {
    if (o1 == o2) return true;
    if (o1 == null || o2 == null) return false;
    return o1.equals(o2);
  }

  private static class ClassHolder<T> {
    private Class<T> myClass;

    public ClassHolder(Class<T> cls) {
      this.myClass = cls;
    }
  }
}
