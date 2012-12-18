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

import static jetbrains.mps.runtime.BundleUtil.bundle;
import static jetbrains.mps.runtime.ClassLoaderAssert.*;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import org.junit.Test;

import java.net.URL;
import java.net.MalformedURLException;

public class BundleTest {
    

  @Test
  public void simpleBundle() throws Exception {
    RuntimeEnvironment<String> re = new RuntimeEnvironment<String>();
    RBundle<String> a = bundle("a", A.class);

    re.add(a)
      .init(a);

    ClassLoader cl = a.getClassLoader();
    assertContains(cl, A.class.getName());
  }

  @Test
  public void bundleDependency() {
    RuntimeEnvironment<String> re = new RuntimeEnvironment<String>();
    RBundle<String> a = bundle("a", A.class);
    RBundle<String> b = bundle("b", B.class).addDependency("a");

    re.add(a, b)
      .init(b);

    assertTrue(a.isInitialized());
    assertTrue(b.isInitialized());

    assertVisible(a.getClassLoader(), A.class.getName());
    assertClassLoader(b.getClassLoader(), A.class.getName(), a.getClassLoader());    
  }
    
  @Test
  public void loadFromParent() {
    RuntimeEnvironment<String> re = new RuntimeEnvironment<String>();
    re.addLoadFromParent(A.class.getName());

    RBundle<String> a = bundle("a", A.class);
    re.add(a).init(a);

    assertClassLoader(a.getClassLoader(), A.class.getName(), getClass().getClassLoader());
  }

  @Test
  public void transitiveDependency() {
    RuntimeEnvironment<String> re = new RuntimeEnvironment<String>();
    RBundle<String> a = bundle("a", A.class);
    RBundle<String> b = bundle("b", B.class).addDependency("a");
    RBundle<String> c = bundle("c").addDependency("b");

    re.add(a, b, c).init(c);

    assertVisible(c.getClassLoader(), A.class.getName());
  }

  @Test(expected = UnsatisfiedDependencyException.class)
  public void unsatisfiedDependency() {
    RuntimeEnvironment<String> re = new RuntimeEnvironment<String>();
    RBundle<String> a = bundle("a").addDependency("b");

    re.add(a)
      .init(a);
  }

  @Test
  public void cyclesInDependency() {
    RuntimeEnvironment<String> re = new RuntimeEnvironment<String>();
    RBundle<String> a = bundle("a", A.class).addDependency("b");
    RBundle<String> b = bundle("b", B.class).addDependency("a");

    re.add(a, b)
      .init(a);

    assertTrue(a.isInitialized());
    assertTrue(b.isInitialized());

    assertVisible(a.getClassLoader(), B.class.getName());
    assertVisible(b.getClassLoader(), A.class.getName());    
  }

  @Test
  public void bundleResource() throws Exception {
    RuntimeEnvironment<String> re = new RuntimeEnvironment<String>();
    RBundle<String> a = bundle("a", new StubLocator());

    re.add(a)
      .init(a);

    assertNotNull(a.getClassLoader().getResource("abc"));
  }

  @Test
  public void resourcesAreVisibleThroughtDependencies() throws Exception {
    RuntimeEnvironment<String> re = new RuntimeEnvironment<String>();
    RBundle<String> a = bundle("a", new StubLocator());
    RBundle<String> b = bundle("b").addDependency("a");

    re.add(a, b)
      .init(a, b);

    assertNotNull(b.getClassLoader().getResource("abc"));
  }

  public static class A {

  }

  public static class B {

  }

  private static class StubLocator implements BytecodeLocator {
    public byte[] find(String fqName) {
      return null;
    }

    public URL findResource(String name) {
      if (name.equals("abc")) {
        try {
          return new URL("http://www.jetbrains.com");
        } catch (MalformedURLException e) {
          throw new RuntimeException(e);
        }
      }
      return null;
    }
  }
}
