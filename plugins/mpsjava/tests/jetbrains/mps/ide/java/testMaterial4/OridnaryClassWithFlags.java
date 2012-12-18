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
package jetbrains.mps.ide.java.testMaterial4;

/**
 * Created by IntelliJ IDEA.
 * User: User
 * Date: 29.12.2009
 * Time: 18:16:04
 * To change this template use File | Settings | File Templates.
 */
public class OridnaryClassWithFlags {
  public static final boolean FLAG = false;

  public static void foo() {
    int count = FLAG ? 1 : 0;
    for (int i = count; i < 5; i++) {
      System.err.println("");
    }
    if (FLAG) {
      System.err.println("hi");
    } else {
      System.err.println("wow");
    }
    if (!FLAG) {
      System.err.println("");
    } else {
      System.err.println("");
    }
  }
}
