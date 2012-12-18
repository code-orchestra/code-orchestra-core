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
package jetbrains.mps.ide.migration.persistence;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.BaseMPSTest;
import jetbrains.mps.ModelAssert;
import jetbrains.mps.TestMain;
import jetbrains.mps.TestMain.ProjectRunnable;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.BaseSModelDescriptor.ModelLoadResult;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.ModelLoadingState;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelHeader;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.smodel.persistence.def.ModelPersistence;
import jetbrains.mps.util.PathManager;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import junit.framework.AssertionFailedError;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class PersistenceTest extends BaseMPSTest {
  private static final String TEST_PERSISTENCE_PROJECT = "testPersistence" + MPSExtentions.DOT_MPS_PROJECT;
  private static final String TEST_MODEL = "testlanguage.structure";
  private final static File sourceZip = new File("testbench/modules/testPersistence.zip");
  private final static File tempDir = new File(PathManager.getHomePath(), "TEST_PERSISTENCE");
  private final static int START_PERSISTENCE_TEST_VERSION = 4;

  private TestOutputFilter filter = new TestOutputFilter() {
    @Override protected boolean isLineOK(String line) {
      return !(line.contains("attribute") && line.contains("undeclared child role:"));
    }
  };

  public void testPersistenceWriteRead() {
    boolean result = TestMain.testOnProjectCopy(sourceZip, tempDir, TEST_PERSISTENCE_PROJECT,
      new ProjectRunnable() {
        public boolean execute(final MPSProject project) {
          final File tempFile = new File(tempDir, "testModel");
          final IFile file = FileSystem.getInstance().getFileByPath(tempFile.getAbsolutePath());
          final boolean success[] = { true };
          ModelAccess.instance().runWriteInEDT(new Runnable() {
            public void run() {
              try {
                EditableSModelDescriptor testModel = (EditableSModelDescriptor) TestMain.getModel(project, TEST_MODEL);
                assertTrue(testModel.getPersistenceVersion() == START_PERSISTENCE_TEST_VERSION);
                SModel model = testModel.getSModel();
                for (int i = START_PERSISTENCE_TEST_VERSION; i <=  ModelPersistence.LAST_VERSION; ++i) {
                  try { // errors about not found attributes are expected for old models
                    filter.start();
                    ModelPersistence.saveModel(model, file, i);
                  } finally {
                    filter.stop();
                  }
                  ModelLoadResult result = ModelPersistence.readModel(SModelHeader.create(i), file, ModelLoadingState.FULLY_LOADED);
                  assertTrue(result.getState() == ModelLoadingState.FULLY_LOADED);
                  ModelAssert.assertDeepModelEquals(model, result.getModel());
                  result.getModel().dispose();
                }
              } catch (AssertionFailedError e) {
                e.printStackTrace();
                success[0] = false;
              }
            }
          });
          ModelAccess.instance().flushEventQueue();
          return success[0];
      }
    });
    assertTrue(result);
  }

  public void testPersistenceUpgrade() {
    try { // errors about not found attributes are expected for old models
      filter.start();

      final int version[] = { START_PERSISTENCE_TEST_VERSION, START_PERSISTENCE_TEST_VERSION };
      for (; version[0] < ModelPersistence.LAST_VERSION; ++version[0])
      for (version[1] = version[0] + 1; version[1] <=  ModelPersistence.LAST_VERSION; ++version[1]) {
        boolean result = TestMain.testOnProjectCopy(sourceZip, tempDir, TEST_PERSISTENCE_PROJECT,
          new ProjectRunnable() {
            public boolean execute(final MPSProject project) {

              final EditableSModelDescriptor testModel = ModelAccess.instance().runWriteAction(new Computable<EditableSModelDescriptor>() {
                public EditableSModelDescriptor compute() {
                  EditableSModelDescriptor modelDescr = (EditableSModelDescriptor) TestMain.getModel(project, TEST_MODEL);
                  modelDescr.reloadFromDisk();   // no way to remove model from repository, so reloading
                  assertTrue(modelDescr.getPersistenceVersion() == START_PERSISTENCE_TEST_VERSION);
                  return modelDescr;
                }
              });

              final List<EditableSModelDescriptor> list = new ArrayList<EditableSModelDescriptor>(1);
              list.add(testModel);

              if (version[0] > START_PERSISTENCE_TEST_VERSION) {
                ModelAccess.instance().runWriteInEDT(new Runnable() {
                  public void run() {
                    new PersistenceUpdater().upgradePersistence(list, version[0]);
                  }
                });
              }
              ModelAccess.instance().flushEventQueue();
              assertTrue(testModel.getModelFile() != null);
              assertTrue(testModel.getPersistenceVersion() == version[0]);

              final ModelLoadResult resultFrom = ModelAccess.instance().runReadAction(new Computable<ModelLoadResult>() {
                public ModelLoadResult compute() {
                  ModelLoadResult result = ModelPersistence.readModel(SModelHeader.create(version[0]), testModel.getModelFile(), ModelLoadingState.FULLY_LOADED);
                  assertTrue(result.getState() == ModelLoadingState.FULLY_LOADED);
                  return result;
                }
              });

              ModelAccess.instance().runWriteInEDT(new Runnable() {
                public void run() {
                  new PersistenceUpdater().upgradePersistence(list, version[1]);
                }
              });
              ModelAccess.instance().flushEventQueue();
              assertTrue(testModel.getModelFile() != null);
              assertTrue(testModel.getPersistenceVersion() == version[1]);

              final ModelLoadResult resultTo = ModelAccess.instance().runReadAction(new Computable<ModelLoadResult>() {
                public ModelLoadResult compute() {
                  ModelLoadResult result = ModelPersistence.readModel(SModelHeader.create(version[1]), testModel.getModelFile(), ModelLoadingState.FULLY_LOADED);
                  assertTrue(result.getState() == ModelLoadingState.FULLY_LOADED);
                  ModelAssert.assertDeepModelEquals(resultFrom.getModel(), result.getModel());
                  return result;
                }
              });

              ModelAccess.instance().runWriteAction(new Runnable() {
                public void run() {
                  resultFrom.getModel().dispose();
                  resultTo.getModel().dispose();
                }
              });
              ModelAccess.instance().flushEventQueue();

              return true;
          }
        });
        assertTrue(result);
      }

    } finally {
      filter.stop();
    }
  }
}
