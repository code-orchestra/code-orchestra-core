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
package jetbrains.mps.storage;

import java.util.Collection;
import java.util.Set;

public final class PackagesAndClassesStorage extends PreifxStringStorage {
  private static PackagesAndClassesStorage ourInstance = new PackagesAndClassesStorage();

  public static PackagesAndClassesStorage getInstance() {
    return ourInstance;
  }

  private PackagesAndClassesStorage() {
    super('.');
  }

  //---------------------------

  public Collection<String> getChildStrings(StringObject obj) {
    return obj.getChildStrings();
  }

  public StringObject getParent(StringObject obj) {
    return obj.getParent();
  }

  public void addClasses(String pack, Set<String> names) {
    StringObject node = get(pack);
    for (String name : names) {
      node.getChild(name);
    }
  }
}
