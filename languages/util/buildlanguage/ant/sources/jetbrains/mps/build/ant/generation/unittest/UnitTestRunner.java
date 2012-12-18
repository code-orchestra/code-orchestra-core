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
package jetbrains.mps.build.ant.generation.unittest;

import jetbrains.mps.internal.collections.runtime.ListSequence;
import junit.framework.*;
import junit.runner.BaseTestRunner;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

public class UnitTestRunner extends BaseTestRunner {
  public static final String START_TEST_PREFIX = "<START_TEST>";
  public static final String END_TEST_PREFIX = "<END_TEST>";
  public static final String FAILURE_TEST_PREFIX = "<TEST_FAILURE_BEGIN>";
  public static final String FAILURE_TEST_SUFFIX = "<TEST_FAILURE_END>";

  public void start(String[] argv) throws Throwable {
    runTests(collectTestsToRun(argv));
  }

  private void runTests(List<Test> tests) {
    TestResult testResult = new TestResult();
    testResult.addListener(this);
    for (Test test : tests) {
      if (test == null) {
        System.err.println("Can't run. Test is Null");
        continue;
      }
      if (test.countTestCases() == 0) {
        System.err.println("No tests found in " + test.getClass().getName());
        continue;
      }
      try {
        test.run(testResult);
      } catch (Throwable t) {
        t.printStackTrace();
      }
    }
  }

  private List<Test> collectTestsToRun(String[] argv) throws ClassNotFoundException {
    List<Test> tests = new ArrayList<Test>();
    for (int i = 0; i < argv.length; i++) {
      if ("-c".equals(argv[i])) {
        i++;
        Test test = this.getTest(argv[i]);
        ListSequence.fromList(tests).addElement(test);
      } else if ("-m".equals(argv[i])) {
        i++;
        String s = argv[i];
        int index = s.lastIndexOf('.');
        String testCase = s.substring(0, index);
        String method = s.substring(index + 1);
        Class<? extends TestCase> testClass = (Class<? extends TestCase>) this.loadSuiteClass(testCase);
        Test test = TestSuite.createTest(testClass, method);
        tests.add(test);
      }
    }
    return tests;
  }

  private String getTestName(Test test) {
    String testName = test.getClass().getName();
    if (test instanceof TestCase) {
      testName += "." + ((TestCase) test).getName();
    }
    return testName;
  }

  private void testFailed(Test test, Throwable t) {
    System.out.flush();
    String testName = getTestName(test);
    System.err.println(FAILURE_TEST_PREFIX + t.getMessage());
    t.printStackTrace(System.err);
    System.err.println(FAILURE_TEST_SUFFIX + testName);
    System.err.flush();
  }

  public void testFailed(int status, Test test, Throwable t) {
  }

  @Override
  public void addError(Test test, Throwable t) {
    testFailed(test, t);
  }

  @Override
  public void addFailure(Test test, AssertionFailedError t) {
    testFailed(test, t);
  }

  public void testStarted(String testName) {
    System.out.println(START_TEST_PREFIX + getTestName(testName));
    System.out.flush();
  }

  public void testEnded(String testName) {
    System.out.println(END_TEST_PREFIX + getTestName(testName));
    System.out.flush();
  }

  private String getTestName(String testName) {
    String[] parts = testName.split("\\(|\\)");
    return parts[1] + "." + parts[0];
  }

  public void runFailed(String message) {
    System.out.flush();
    System.err.println(message);
  }

  public static void main(String[] argv) {
    UnitTestRunner runner = new UnitTestRunner();
    try {
      runner.start(argv);
    } catch (Throwable t) {
      t.printStackTrace(System.err);
      System.exit(1);
    }
  }
}
