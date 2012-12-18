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

import jetbrains.mps.util.DifflibFacade;
import jetbrains.mps.util.FileUtil;
import junit.framework.TestCase;

import java.io.File;

public abstract class BaseDiffTestCase extends TestCase {
  final String[] myContent = {"diff", "test", "case", "content"};

  String[] myResult, myCorrectResult;

  void assertDiff(String[] s1, String[] s2) {
    StackTraceElement[] stack = Thread.getAllStackTraces().get(Thread.currentThread());
    String fileName = null;
    for (StackTraceElement e : stack) {
      if (e.getClassName().equals(DiffTestCase.class.getName())) {
        fileName = "core/kernel/tests/jetbrains/mps/diff/test/resources/result/" + e.getMethodName() + ".txt";
      }
    }
    File file = new File(fileName);
    myCorrectResult = FileUtil.read(file).split("\n");
    boolean condition = diffIsCorrect(s1, s2);
    String message = getMessage();
    assertTrue(message, condition);
  }

  void assertDiff(String fileName) {
    String path = "core/kernel/tests/jetbrains/mps/diff/test/resources/";
    String fullName = path + fileName + "1.txt";
    assertDiff(FileUtil.read(new File(fullName)).split("\n"),
      FileUtil.read(new File(fullName.replace("1", "2"))).split("\n"));
  }

  boolean diffIsCorrect(String[] t1, String[] t2) {
    try {
      myResult = DifflibFacade.getGenDiff(t1, t2);
    } catch (Throwable t) {
      t.printStackTrace();
      return false;
    }
    if (myResult.length != myCorrectResult.length) {
      return false;
    }
    for (int i = 0; i < myResult.length; i++) {
      if (!myResult[i].equals(myCorrectResult[i])) {
        return false;
      }
    }
    return true;
  }

  String asArray(String[] array) {
    if (array == null) {
      return "null";
    }
    StringBuilder result = new StringBuilder();
    for (String s : array) {
      result.append(s).append('\n');
    }
    return result.toString();
  }

  String getMessage() {
    return "\n\tResult:\n" + asArray(myResult) + "\n\n\tCorrect result:\n" + asArray(myCorrectResult);
  }

  String[] copyOf(String[] src, int length) {
    String[] result = new String[length];
    System.arraycopy(src, 0, result, 0, length);
    return result;
  }
}
