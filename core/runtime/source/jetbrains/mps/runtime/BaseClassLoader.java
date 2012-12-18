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

import gnu.trove.THashMap;
import jetbrains.mps.util.InternUtil;

import java.security.ProtectionDomain;
import java.util.Map;

abstract class BaseClassLoader extends ClassLoader {
  private Map<String, Class> myCache = new THashMap<String, Class>();

  protected BaseClassLoader() {
    super(BaseClassLoader.class.getClassLoader());
  }

  protected Class loadBeforeCurrent(String name) {
    return null;
  }

  protected abstract byte[] findClassBytes(String name);

  protected Class loadAfterCurrent(String name) {
    return null;
  }

  protected synchronized Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
    name = InternUtil.intern(name);
    Class c = myCache.get(name);

    if (myCache.containsKey(name) && c == null) {
      throw new ClassNotFoundException("Classloader: " + this + "; Class: " + name);
    }

    if (c == null) {
      c = loadBeforeCurrent(name);

      if (c == null) {
        byte[] bytes = findClassBytes(name);
        if (bytes == null) {
          c = loadAfterCurrent(name);
          if (c == null) {
            try {
              c = getParent().loadClass(name);
            } catch (ClassNotFoundException e) {
              myCache.put(name, null);
              throw e;
            }
          }
          if (resolve) {
            resolveClass(c);
          }
        } else {
          definePackageIfNecessary(name);
          c = defineClass(name, bytes, 0, bytes.length, ProtectionDomainUtil.loadedClassDomain());
        }
      }
      myCache.put(name, c);
    }
    if (resolve) {
      resolveClass(c);
    }

    return c;
  }

  public void dispose() {
    myCache.clear();
  }

  private void definePackageIfNecessary(String name) {
    String pack = getNamespace(name);
    if (getPackage(pack) != null) return;
    definePackage(pack, null, null, null, null, null, null, null);
  }

  private String getNamespace(String fqName) {
    int lastIndex = fqName.lastIndexOf('.');
    if (lastIndex == -1) return "";
    return fqName.substring(0, lastIndex);
  }
}
