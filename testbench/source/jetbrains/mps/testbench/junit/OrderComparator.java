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
package jetbrains.mps.testbench.junit;

import jetbrains.mps.testbench.junit.Order;
import org.junit.runner.Description;

import java.lang.reflect.Method;
import java.util.Comparator;

/**
* Created by IntelliJ IDEA.
* User: fyodor
* Date: Sep 6, 2010
* Time: 3:57:45 PM
* To change this template use File | Settings | File Templates.
*/
public class OrderComparator implements Comparator<Description> {
  @Override
  public int compare(Description a, Description b) {
    if (a.getTestClass() != b.getTestClass()) {
      return a.getTestClass().getName().compareTo(b.getTestClass().getName());
    }
    if (a.getMethodName().equals(b.getMethodName())) {
      return 0;
    }
    Order oaa = a.getAnnotation(Order.class);
    int orderA = oaa != null ? oaa.value() : -1;
    Order oab = b.getAnnotation(Order.class);
    int orderB = oab != null ? oab.value() : -1;
    if (orderA >= 0 || orderB >= 0) {
      return orderA - orderB;
    }

    // default order
    for (Method m: a.getTestClass().getMethods()) {
      if (m.getName().equals(a.getMethodName())) {
        return -1;
      }
      else if (m.getName().equals(b.getMethodName())) {
        return 1;
      }
    };
    throw new IllegalArgumentException("Method(s) not found : either "+a+" or "+b);
  }
}
