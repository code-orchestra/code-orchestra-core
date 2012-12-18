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
package jetbrains.mps.diff;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class DiffTestCase extends BaseDiffTestCase {
  public void testContentDeleted() {
    assertDiff(myContent, new String[0]);
  }

  public void testContentCreated() {
    assertDiff(new String[0], myContent);
  }

  public void testContentEquals() {
    assertDiff(myContent, myContent);
  }

  public void testRandomChangesTestMain() {
    assertDiff("TestMain");
  }

  public void testRandomChangesMath() {
    assertDiff("Math");
  }

  public void testRandomChangesUnitTest() {
    assertDiff("UnitTest");
  }

  public void testRandomChangesOperations() {
    assertDiff("Operations");
  }

  public void testContentIsEmpty() {
    assertDiff(new String[0], new String[0]);
  }

  public void testLineAdded() {
    assertDiff(copyOf(myContent, myContent.length - 1), myContent);
  }

  public void testLineDeleted() {
    assertDiff(myContent, copyOf(myContent, myContent.length - 2));
  }

  public void testLineSwapped() {
    String[] reversed = copyOf(myContent, myContent.length);
    String temp = reversed[0];
    reversed[0] = reversed[1];
    reversed[1] = temp;
    assertDiff(myContent, reversed);
  }

  public void testLineCopied() {
    String[] copied = new String[myContent.length * 2];
    for (int i = 0; i < myContent.length; i++) {
      copied[i] = myContent[i];
      copied[myContent.length + i] = myContent[i];
    }
    assertDiff(myContent, copied);
  }

  public void testLineDuplicatesRemoved() {
    String[] copied = new String[myContent.length * 2];
    for (int i = 0; i < myContent.length; i++) {
      copied[i] = myContent[i];
      copied[myContent.length + i] = myContent[i];
    }
    assertDiff(copied, myContent);
  }

  public void testLineReversed() {
    List<String> reversed = Arrays.asList(myContent.clone());
    Collections.reverse(reversed);
    assertDiff(myContent, reversed.toArray(new String[reversed.size()]));
  }

  public void testAddEmptyLine() {
    String[] withEmptyLine = new String[myContent.length + 1];
    System.arraycopy(myContent, 0, withEmptyLine, 0, myContent.length);
    withEmptyLine[myContent.length] = "";
    assertDiff(myContent, withEmptyLine);
  }

  public void testDeleteEmptyLine() {
    String[] withEmptyLine = new String[myContent.length + 1];
    System.arraycopy(myContent, 0, withEmptyLine, 0, myContent.length);
    withEmptyLine[myContent.length] = "";
    assertDiff(withEmptyLine, myContent);
  }

  public void testCharChanged() {
    String[] changed = new String[myContent.length];
    for (int i = 0; i < myContent.length; i++) {
      changed[i] = myContent[i].replace("t", "s");
    }
    assertDiff(myContent, changed);
  }

  public void testCharDeleted() {
    String[] deleted = new String[myContent.length];
    for (int i = 0; i < myContent.length; i++) {
      deleted[i] = myContent[i].replace("t", "");
    }
    assertDiff(myContent, deleted);
  }

  public void testCharAdded() {
    String[] added = new String[myContent.length];
    for (int i = 0; i < myContent.length; i++) {
      added[i] = myContent[i].replace("t", "test");
    }
    assertDiff(myContent, added);
  }
}
