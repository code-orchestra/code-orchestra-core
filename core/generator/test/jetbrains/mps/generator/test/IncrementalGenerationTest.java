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
package jetbrains.mps.generator.test;

import jetbrains.mps.TestMain;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelOperations;
import jetbrains.mps.smodel.SNode;
import org.junit.Assert;
import org.junit.Test;

import java.io.File;
import java.io.IOException;

/**
 * Evgeny Gryaznov, Oct 4, 2010
 */
public class IncrementalGenerationTest extends GenerationTestBase {

  @Test
  public void testIncSolution1() throws IOException {
    final MPSProject p = TestMain.loadProject(new File(System.getProperty("user.dir") + "/languages/languageDesign/generator/generator.mpr"));
    SModelDescriptor descr = findModel(p, "test_Closure");

    doTestIncrementalGeneration(p, descr,
      new ModelChangeRunnable() {
        public void run(SModelDescriptor descr) {
          SModel model = descr.getSModel();
          SNode root = SModelOperations.getRootByName(model,"User");
          Assert.assertNotNull("No root in model", root);

          SNode found = null;
          for(SNode md : root.getChildren("method")) {
            if(md.getName().equals("testRename2")) {
              found = md;
            }
          }
          Assert.assertNotNull("no method in class", found);
          found.setName("testRename3");
        }
      });

    cleanup(p);
  }

  @Test
  public void testIdeActions() throws IOException {
    final MPSProject p = TestMain.loadProject(new File(System.getProperty("user.dir") + "/workbench/workbench.mpr"));
    SModelDescriptor descr = findModel(p, "jetbrains.mps.ide.actions");

    doTestIncrementalGeneration(p, descr,
      new ModelChangeRunnable() {
        public void run(SModelDescriptor descr) {
          SModel model = descr.getSModel();
          SNode root = SModelOperations.getRootByName(model,"GoToFile");
          Assert.assertNotNull("No root in model", root);
          root.setName("GoToFile2");
        }
      });

    cleanup(p);
  }

  @Test
  public void testPluginStructure() throws IOException {
    final MPSProject p = TestMain.loadProject(new File(System.getProperty("user.dir") + "/core/languageDesign/plugin/plugin.mpr"));
    SModelDescriptor descr = findModel(p, "jetbrains.mps.lang.plugin.structure");

    doTestIncrementalGeneration(p, descr,
      new ModelChangeRunnable() {
        public void run(SModelDescriptor descr) {
          SModel model = descr.getSModel();
          SNode root = SModelOperations.getRootByName(model,"ActionGroupDeclaration");
          Assert.assertNotNull("No root in model", root);
          root.setName("ActionGroupRedeclaration");
        }
      });

    cleanup(p);
  }

  @Test
  public void testBaseLanguageEditor() throws IOException {
    final MPSProject p = TestMain.loadProject(new File(System.getProperty("user.dir") + "/core/baseLanguage/baseLanguage/baseLanguage.mpr"));
    SModelDescriptor descr = findModel(p, "jetbrains.mps.baseLanguage.editor");

    doTestIncrementalGeneration(p, descr,
      new ModelChangeRunnable() {
        public void run(SModelDescriptor descr) {
          SModel model = descr.getSModel();
          SNode root = SModelOperations.getRootByName(model,"StatementList_Editor");
          Assert.assertNotNull("No root in model", root);
          descr.getSModel().removeRoot(root);
        }
      });

    cleanup(p);
  }
}
