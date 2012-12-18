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
package jetbrains.mps;

import jetbrains.mps.project.TestResult;
import jetbrains.mps.refactoring.tests.IRefactoringTester;
import jetbrains.mps.smodel.ModelAccess;
import junit.framework.TestCase;

import java.io.File;

public class BaseMPSTest extends TestCase {
  protected void setUp() throws Exception {
    super.setUp();
  }

  protected void tearDown() throws Exception {
    super.tearDown();
    waitForEDTTasksToComplete();
  }

  public  static void waitForEDTTasksToComplete() {
    ModelAccess.instance().flushEventQueue();
  }

  protected void assertGenerates(File project, boolean runnable, String... configurations) {
    TestResult res = testProject(project, runnable, configurations);
    assertTrue(res.isOk());
  }

  protected void assertGenerates(File project, boolean runnable) {
    assertGenerates(project, runnable, new String[0]);
  }

  protected void assertGenerates(File project) {
    assertGenerates(project, false, new String[0]);
  }

  protected TestResult testProject(File project, String[] configurations) {
    return TestMain.testProject(project, false, configurations);
  }

  protected TestResult testProject(File project, boolean runnable, String[] configurations) {
    return TestMain.testProject(project, runnable, configurations);
  }

  protected TestResult testProject(File project) {
    return TestMain.testProject(project, false, new String[0]);
  }

  protected boolean testProjectGenerationForLeaks(File project) {
    return TestMain.testProjectGenerationForLeaks(project);
  }

  protected boolean testRefactoringTestEnvironment(File projectDirectory) {
    return TestMain.testRefactoringTestEnvironment(projectDirectory);
  }

  protected boolean testRefactoringOnProject(File projectDirectory, String refactoringTesterClassName) {
    try {
      Class<? extends IRefactoringTester> cls = (Class<? extends IRefactoringTester>) Class.forName(refactoringTesterClassName);
      return TestMain.testRefactoringOnProject(projectDirectory, cls.newInstance());
    } catch (Throwable t) {
      throw new RuntimeException(t);
    }
  }
}
