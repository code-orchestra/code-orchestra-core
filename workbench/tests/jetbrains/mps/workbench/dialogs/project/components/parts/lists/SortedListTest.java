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
package jetbrains.mps.workbench.dialogs.project.components.parts.lists;

import junit.framework.TestCase;

import java.util.Collections;
import java.util.LinkedList;

import jetbrains.mps.workbench.dialogs.project.components.parts.lists.ListsFactory.ListComparator;
import org.junit.Assert;

public class SortedListTest extends TestCase {

  public void testAddToSingletonList() {
    SortedList<Integer> sortedList = new SortedList<Integer>(new IntegerComparator());
    sortedList.add(10);
    sortedList.add(1);
    Assert.assertEquals(Integer.valueOf(1), sortedList.get(0));
    Assert.assertEquals(Integer.valueOf(10), sortedList.get(1));
  }

  public void testAddToSingletonListBuggy() {
    SortedList<Integer> sortedList = new SortedList<Integer>(new IntegerComparator());
    sortedList.add(1);
    sortedList.add(10);
    Assert.assertEquals(Integer.valueOf(1), sortedList.get(0));
    Assert.assertEquals(Integer.valueOf(10), sortedList.get(1));
  }

  public void testAddThreeNumbers1() {
    SortedList<Integer> sortedList = new SortedList<Integer>(new IntegerComparator());
    sortedList.add(1);
    sortedList.add(2);
    sortedList.add(3);
    Assert.assertEquals(Integer.valueOf(1), sortedList.get(0));
    Assert.assertEquals(Integer.valueOf(2), sortedList.get(1));
    Assert.assertEquals(Integer.valueOf(3), sortedList.get(2));
  }

  public void testAddThreeNumbers2() {
    SortedList<Integer> sortedList = new SortedList<Integer>(new IntegerComparator());
    sortedList.add(1);
    sortedList.add(3);
    sortedList.add(2);
    Assert.assertEquals(Integer.valueOf(1), sortedList.get(0));
    Assert.assertEquals(Integer.valueOf(2), sortedList.get(1));
    Assert.assertEquals(Integer.valueOf(3), sortedList.get(2));
  }

  public void testAddThreeNumbers3() {
    SortedList<Integer> sortedList = new SortedList<Integer>(new IntegerComparator());
    sortedList.add(2);
    sortedList.add(1);
    sortedList.add(3);
    Assert.assertEquals(Integer.valueOf(1), sortedList.get(0));
    Assert.assertEquals(Integer.valueOf(2), sortedList.get(1));
    Assert.assertEquals(Integer.valueOf(3), sortedList.get(2));
  }

  public void testAddThreeNumbers4() {
    SortedList<Integer> sortedList = new SortedList<Integer>(new IntegerComparator());
    sortedList.add(2);
    sortedList.add(3);
    sortedList.add(1);
    Assert.assertEquals(Integer.valueOf(1), sortedList.get(0));
    Assert.assertEquals(Integer.valueOf(2), sortedList.get(1));
    Assert.assertEquals(Integer.valueOf(3), sortedList.get(2));
  }

  public void testAddThreeNumbers5() {
    SortedList<Integer> sortedList = new SortedList<Integer>(new IntegerComparator());
    sortedList.add(3);
    sortedList.add(2);
    sortedList.add(1);
    Assert.assertEquals(Integer.valueOf(1), sortedList.get(0));
    Assert.assertEquals(Integer.valueOf(2), sortedList.get(1));
    Assert.assertEquals(Integer.valueOf(3), sortedList.get(2));
  }

  public void testAddThreeNumbers6() {
    SortedList<Integer> sortedList = new SortedList<Integer>(new IntegerComparator());
    sortedList.add(3);
    sortedList.add(1);
    sortedList.add(2);
    Assert.assertEquals(Integer.valueOf(1), sortedList.get(0));
    Assert.assertEquals(Integer.valueOf(2), sortedList.get(1));
    Assert.assertEquals(Integer.valueOf(3), sortedList.get(2));
  }

  public void testAddNumbersRandomOrder() {
    // this is probably not the best thing to do...
    int n = 10;
    LinkedList<Integer> numbers = new LinkedList<Integer>();
    for (int i = 0; i < n; i++) {
      numbers.add(i);
    }
    Collections.shuffle(numbers);

    SortedList<Integer> sortedList = new SortedList<Integer>(new IntegerComparator());

    for (Integer i : numbers) {
      sortedList.add(i);
    }

    for (int i = 0; i < n; i++) {
      Assert.assertEquals("Adding order was " + numbers, Integer.valueOf(i), sortedList.get(i));
    }
  }

  private static class IntegerComparator extends ListComparator<Integer> {
    public int compare(Integer o1, Integer o2) {
      return o1.compareTo(o2);
    }

    @Override
    public boolean isEqual(Integer o1, Integer o2) {
      return false;
    }
  }
}
