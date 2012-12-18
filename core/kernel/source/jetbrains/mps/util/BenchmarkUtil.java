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

import java.util.ArrayList;
import java.util.List;

public class BenchmarkUtil {
  public static long measure(int ntimes, Runnable r) {
    long start = System.currentTimeMillis();
    for (int i = 0; i < ntimes; i++) {
      r.run();
    }
    return System.currentTimeMillis() - start;
  }

  public static void printMeasure(String taskName, int ntimes, Runnable r) {
    System.out.println(taskName + " took " + measure(ntimes, r));
  }

  public static void main(String[] args) {
    final List<String> items = new ArrayList<String>();
    for (int i = 0; i < 10; i++) {
      items.add("abc" + Math.random());
    }

    int ntimes = 100000;

    printMeasure("simple iteration", ntimes, new Runnable() {
      public void run() {
        for (String item : items) {
          item.toUpperCase();
        }
      }
    });

    printMeasure("to array iteration", ntimes, new Runnable() {
      public void run() {
        for (String item : items.toArray(new String[items.size()])) {
          item.toUpperCase();
        }
      }
    });

    printMeasure("to array with runnable", ntimes, new Runnable() {
      public void run() {
        abstract class Visitor {
          abstract void visit(String s);
        }

        Visitor v = new Visitor() {
          @Override
          void visit(String s) {
            s.toUpperCase();
          }
        };

        for (String item : items.toArray(new String[items.size()])) {
          v.visit(item);
        }
      }
    });

  }
}
