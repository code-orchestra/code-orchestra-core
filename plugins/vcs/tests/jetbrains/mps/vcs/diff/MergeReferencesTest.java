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
package jetbrains.mps.vcs.diff;

import java.io.IOException;

public class MergeReferencesTest extends MergeTestCase {

  public void testSimpleStructure() throws IOException {
    testZip("resources/structure.mps.zip", false);
  }

  public void testEditorWithNewConcepts() throws IOException {
    testZip("resources/editor.mps.zip", false);
  }

  public void testConflictInternalReferencesInNewNodesChange() throws IOException {
    testZip("resources/conflictInternalRefNew.mps.zip", false);
  }

  public void testNonConflictInternalReferencesInNewNodesChange() throws IOException {
    testZip("resources/nonConflictInternalRefNew.mps.zip", false);
  }

  public void testConflictInternalReferencesChange() throws IOException {
    testZip("resources/conflictInternalRef.mps.zip", false);
  }

  public void testConflictExternalReferencesChange() throws IOException {
    testZip("resources/conflictExternalRef.mps.zip", false);
  }

  public void testNonConflictExternalReferencesChange() throws IOException {
    testZip("resources/nonConflictExternalRef.mps.zip", false);
  }

  public void testNonConflictExternalReferencesChange3() throws IOException {
    testZip("resources/nonConflictExternalRef2.mps.zip", false);
  }

  public void testConflictedAndNotConflictedReferencesWright() throws IOException {
    testZip("resources/conflictedAndNotConflictedReferencesWright.mps.zip", false);
  }

  public void testConflictedAndNotConflictedReferences() throws IOException {
    testZip("resources/conflictedAndNotConflictedReferences.mps.zip", false);
  }
}
