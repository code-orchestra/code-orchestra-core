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

public class TrivialClassLoader extends AbstractClassLoader {
  private String myName;
  private byte[] myCls;

  public TrivialClassLoader(ClassLoader classLoader, String name, byte[] cls) {
    super(classLoader);
    myName = name;
    myCls = cls;
  }

  protected byte[] findClassBytes(String name) {
    return EqualUtil.equals(name, myName) ? myCls : null;
  }

  protected boolean isExcluded(String name) {
    return false;
  }
}
