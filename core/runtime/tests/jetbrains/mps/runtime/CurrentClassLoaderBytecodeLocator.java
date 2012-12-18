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

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class CurrentClassLoaderBytecodeLocator implements BytecodeLocator {
  private Set<String> myAllowedClasses = new HashSet<String>();

  public CurrentClassLoaderBytecodeLocator add(Class cls) {
    myAllowedClasses.add(cls.getName());
    return this;
  }

  public byte[] find(String fqName) {
    try {
      if (myAllowedClasses.contains(fqName)) {
        String fileName = fqName.replace('.', '/') + ".class";

        InputStream stream = getClass().getClassLoader().getResourceAsStream(fileName);
        try {
          List<Byte> resultList = new ArrayList<Byte>();

          int current;
          while ((current = stream.read()) != -1) {
            resultList.add((byte) current);
          }

          byte[] result = new byte[resultList.size()];
          for (int i = 0; i < resultList.size(); i++) {
            result[i] = resultList.get(i);
          }

          return result;
        } finally {
          stream.close();
        }
      } else {
        return null;
      }
    } catch (IOException e) {
      return null;
    }
  }

  public URL findResource(String name) {
    return null;
  }

}
