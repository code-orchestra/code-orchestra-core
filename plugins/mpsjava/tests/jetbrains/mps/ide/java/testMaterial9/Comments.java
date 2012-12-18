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
package jetbrains.mps.ide.java.testMaterial9;

/**
 * Created by IntelliJ IDEA.
 * User: Michael.Vlassiev
 * Date: 6/9/11
 * Time: 5:04 PM
 * To change this template use File | Settings | File Templates.
 */
public class Comments {
  // test comment 1
  int a;
  /*
   * aaaa bbb
   */
 /**
   * javadoc on field
   * @since 321
   */
  int b=0;

  /** ????
   * Javadoc
   * @param no param
   * @since 12345
   */
  public void f(int no) {
    int a = 3;  // test comment 2
    /**
     * javadoc like comment inside method
     * @since 123
     */
    int b = 2+3;
    // test comment 3
    int c = 0x123 + -1;
    /* test comment 4 */
    {
      a = b + c;  // test comment 5
      // test comment 6
      /*
      test comment 7

      ==============
       */
    }
  }
}
