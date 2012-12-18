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

import jetbrains.mps.runtime.ProtectionDomainUtil;

import java.util.HashMap;
import java.util.Map;

public abstract class AbstractClassLoader extends ClassLoader {
  private Map<String, Class> myCache = new HashMap<String, Class>();

  public AbstractClassLoader(ClassLoader classLoader) {
    super(classLoader);
  }

  protected abstract byte[] findClassBytes(String name);

  protected abstract boolean isExcluded(String name);

  protected synchronized Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
    Class c = myCache.get(name);

    if (myCache.containsKey(name) && c == null) {
      throw new ClassNotFoundException(name);
    }

    if (c == null) {
      byte[] bytes = null;

      if (!isExcluded(name)) {
        bytes = findClassBytes(name);
      }

      if (bytes == null) {
        try {
          c = getParent().loadClass(name);
        } catch (ClassNotFoundException e) {
          myCache.put(name, null);
          throw e;
        }
        if (resolve) {
          resolveClass(c);
        }
      } else {
        definePackageIfNecessary(name);
        c = defineClass(name, bytes, 0, bytes.length, ProtectionDomainUtil.loadedClassDomain());
      }
      myCache.put(name, c);
    }
    if (resolve) {
      resolveClass(c);
    }
    return c;
  }


  private void definePackageIfNecessary(String name) {
    String pack = NodeNameUtil.getNamespace(name);
    if (getPackage(pack) == null) {
      definePackage(pack, null, null, null, null, null, null, null);
    }
  }
}
