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

import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: User
 * Date: 15.09.2009
 * Time: 18:54:05
 * To change this template use File | Settings | File Templates.
 */
public class OrdinaryWithAnonymousClass {
  {
    final int i = getNumber();
    ArrayList<String> arrayList = new ArrayList<String>() {
      public boolean isEmpty() {
        System.err.println(i);
        return true;
      }
    };
  }

  public int getNumber() {
    return 3;
  }
}
