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
package jetbrains.mps.ide.java.testMaterial;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 11.09.2009
 * Time: 20:12:43
 * To change this template use File | Settings | File Templates.
 */
public class OrdinaryClass2 {
  OrdinaryClass2 myOrdinaryClass2;
  static OrdinaryClass2 ourOrdinaryClass2;

  public OrdinaryClass2() {
    System.err.println("");
    OrdinaryClass2 ordinaryClass = ourOrdinaryClass2;
    OrdinaryClass2 ordinaryClass2 = ourOrdinaryClass2.myOrdinaryClass2.myOrdinaryClass2;
    OrdinaryClass2 ordinaryClass3 = this.myOrdinaryClass2;
    OrdinaryClass2 ordinaryClass4 = myOrdinaryClass2;
  }

  public void foo(int a) {
    switch (a) {
      case 1:
        System.err.println("1");
        System.err.println("239");
      case 2:
        System.out.println("2");
      default:
        System.err.println("hello");
    }
  }
}
