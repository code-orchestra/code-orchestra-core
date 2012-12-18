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
package jetbrains.mps.refactoring;

import jetbrains.mps.BaseMPSTest;

import java.io.File;

public class RefactoringTest extends BaseMPSTest {
  private static final String TEST_REFACTORING_PATH = "testbench/modules/testRefactoring";

  public void testRefactoringEnvironment() {
    assertTrue(testRefactoringTestEnvironment(new File(TEST_REFACTORING_PATH)));
  }

  public void testRenameConceptRefactoring() {
    assertTrue(testRefactoringOnProject(new File(TEST_REFACTORING_PATH), "jetbrains.mps.refactoring.tests.RenameConceptRefactoringTester"));
  }

  public void testRenameLinkRefactoring_Hierarchy() {
    assertTrue(testRefactoringOnProject(new File(TEST_REFACTORING_PATH), "jetbrains.mps.refactoring.tests.RenameLinkRefactoringTester_Hierarchy"));
  }

  public void testRenameLinkRefactoring_Simple() {
    assertTrue(testRefactoringOnProject(new File(TEST_REFACTORING_PATH), "jetbrains.mps.refactoring.tests.RenameLinkRefactoringTester_Simple"));
  }

  public void testMoveConceptRefactoring() {
    assertTrue(testRefactoringOnProject(new File(TEST_REFACTORING_PATH), "jetbrains.mps.refactoring.tests.MoveConceptRefactoringTester"));
  }

  public void testRenamePropertyRefactoring_Simple() {
    assertTrue(testRefactoringOnProject(new File(TEST_REFACTORING_PATH), "jetbrains.mps.refactoring.tests.RenamePropertyRefactoringTester_Simple"));
  }

  public void testDeleteLinkRefactoring_Simple() {
    assertTrue(testRefactoringOnProject(new File(TEST_REFACTORING_PATH), "jetbrains.mps.refactoring.tests.DeleteLinkRefactoringTester_Simple"));
  }
}
