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
import jetbrains.mps.TestMain;
import jetbrains.mps.testbench.MpsMakeHelper;
import jetbrains.mps.testbench.junit.runners.SymbolicSuite.SuiteClassSymbols;
import jetbrains.mps.testbench.junit.runners.WatchingSuite;
import junit.framework.TestSuite;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;


@SuiteClassSymbols({"jetbrains.mps.DiskMemoryConflictsTest",
  "jetbrains.mps.dataFlow.lang.InitializedVariablesAnalysisTest",
  "jetbrains.mps.dataFlow.lang.LivenessAnalysisTest",
  "jetbrains.mps.dataFlow.lang.ProgramTest",
  "jetbrains.mps.dataFlow.lang.ReachabilityAnaysisTest",
  "jetbrains.mps.dataFlow.lang.ReachingDefinitionsTest",
  "jetbrains.mps.dataFlow.lang.StructuralProgramBuilderTest",
  "jetbrains.mps.diff.DiffTestCase",
  "jetbrains.mps.ide.blame.command.YouTrackURLTest",
  "jetbrains.mps.ide.messages.MessageViewListModelTest",
  "jetbrains.mps.make.TestMakeOnRealProject",
  "jetbrains.mps.project.DependenciesTests",
  "jetbrains.mps.make.dependencies.FindStronglyConnectedComponentsTestCase",
  "jetbrains.mps.make.dependencies.GraphTestCase",
  "jetbrains.mps.packaged.PackagedLanguageTest",
  "jetbrains.mps.refactoring.RefactoringTest",
  "jetbrains.mps.runtime.BundleLoadingTest",
  "jetbrains.mps.runtime.BundleTest",
  "jetbrains.mps.vcs.diff.MergeConceptAndImportsTest",
  "jetbrains.mps.vcs.diff.MergeNotLoseExternalChangesTest",
  "jetbrains.mps.vcs.diff.MergeReferencesTest",
  "jetbrains.mps.vcs.diff.MergeSymmetricChangesTest",
  "jetbrains.mps.vfs.VfsTest",
  "jetbrains.mps.workbench.ProjectCreationTest",
  "jetbrains.mps.workbench.dialogs.project.components.parts.lists.SortedListTest"})
@RunWith(WatchingSuite.class)
public class GlobalTestSuite extends TestSuite {
  @BeforeClass
  public static void make () throws Exception {
    new MpsMakeHelper().make();
  }

  @AfterClass
  public static void shutdown() {
    TestMain.PROJECT_CONTAINER.clear();
  }
}
