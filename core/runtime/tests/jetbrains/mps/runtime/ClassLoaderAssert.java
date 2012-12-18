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

import static org.junit.Assert.*;
import static org.junit.Assert.fail;

public class ClassLoaderAssert {
  public static void assertVisible(ClassLoader cl, String className) {
    try {
      Class<?> cls = Class.forName(className, true, cl);
      assertNotSame(cls.getClassLoader(), ClassLoaderAssert.class.getClassLoader());
    } catch (ClassNotFoundException e) {
      fail("Can't load class " + className + " : " + e.getMessage());
    }
  }

  public static void assertContains(ClassLoader cl, String className) {
    assertClassLoader(cl, className, cl);
  }

  public static void assertClassLoader(ClassLoader cl, String className, ClassLoader expectedOwner) {
    try {
      Class cls = Class.forName(className, true, cl);
      assertSame(expectedOwner, cls.getClassLoader());
    } catch (ClassNotFoundException e) {
      fail("Can't load class " + className + " : " + e.getMessage());
    }
  }
}
