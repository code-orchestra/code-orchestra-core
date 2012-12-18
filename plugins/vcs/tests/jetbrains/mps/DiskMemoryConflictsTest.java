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

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.Messages;
import com.intellij.openapi.ui.TestDialog;
import com.intellij.openapi.util.Ref;
import com.intellij.openapi.vfs.LocalFileSystem;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.openapi.vfs.newvfs.RefreshQueue;
import com.intellij.openapi.vfs.newvfs.RefreshSession;
import jetbrains.mps.TestMain.ProjectRunnable;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.FileUtil;
import org.jetbrains.annotations.Nullable;
import org.junit.Assert;
import org.junit.Test;

import javax.swing.SwingUtilities;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author Evgeny Gerashchenko
 * @since 3/23/11
 */
public class DiskMemoryConflictsTest {
  private static final File DESTINATION_PROJECT_DIR = new File(FileUtil.getTempDir(), "testConflicts");
  private static final File PROJECT_ARCHIVE = new File("testbench/modules/simpleProject.zip");
  private static final String PROJECT_FILE = "simpleProject.mpr";
  private static final SModelReference MODEL_REFERENCE = SModelReference.fromString("r:21cf9f47-5464-40f2-9509-d94ba20bfe82(simpleModel)");
  private static final File MODEL_FILE = new File(DESTINATION_PROJECT_DIR, "solutions/simpleProject/simpleModel.mps");
  private Project myProject;
  private Solution myModule;
  private SNode myNodeBackup;
  private EditableSModelDescriptor myModelDescriptor;
  private static final String FIELD_DEFAULT_NAME = "theField";
  private static final String FIELD_NAME_IN_FILE = "theFieldInFile";
  private static final String FIELD_NAME_IN_MODEL = "theFieldInModel";

  @Test
  public void testDiskMemoryConflicts() {
    final Action[] startedAction = new Action[1];
    final DiskModification[] startedDiskModification = new DiskModification[1];
    final VersionToChoose[] startedVersion = new VersionToChoose[1];
    final boolean result = TestMain.testOnProjectCopy(PROJECT_ARCHIVE, DESTINATION_PROJECT_DIR, PROJECT_FILE, new ProjectRunnable() {
      public boolean execute(final MPSProject project) {
        final boolean[] resultArr = new boolean[1];
        try {
          myProject = project.getProject();
          myModelDescriptor = (EditableSModelDescriptor) SModelRepository.getInstance().getModelDescriptor(MODEL_REFERENCE);
          myModule = (Solution) myModelDescriptor.getModule();
          ModelAccess.instance().runReadAction(new Runnable() {
            @Override
            public void run() {
              myNodeBackup = CopyUtil.copyAndPreserveId(myModelDescriptor.getSModel().rootsIterator().next());
            }
          });

          checkInitialState();

          for (Action a : Action.values()) {
            for (DiskModification dm : DiskModification.values()) {
              for (VersionToChoose v : VersionToChoose.values()) {
                startedAction[0] = a;
                startedVersion[0] = v;
                startedDiskModification[0] = dm;

                provokeAndCheckConflict(a, dm, v);
                restoreAndCheckOriginalState();
              }
            }
          }

          resultArr[0] = true;
        } catch (Throwable e) {
          e.printStackTrace();
          return false;
        }
        return resultArr[0];
      }
    }, "jetbrains.mps.vcs");
    if (!result) {
      Assert.fail("Last started check action=" + startedAction[0] + ", disk modification=" + startedDiskModification[0]
        + ", version=" + startedVersion[0]);
    }
  }

  private String processFieldNameInModel(final String nameToWrite) {
    final String[] result = new String[1];
    ModelAccess.instance().runCommandInEDT(new Runnable() {
      @Override
      public void run() {
        if (SModelRepository.getInstance().getModelDescriptor(myModelDescriptor.getSModelReference()) != null) {
          try {
            final SModelDescriptor modelDescriptor = myModelDescriptor;
            Assert.assertNotNull(modelDescriptor);
            SNode node = modelDescriptor.getSModel().getNodeById("6010389230754495469");
            Assert.assertNotNull(node);
            if (nameToWrite == null) {
              result[0] = node.getProperty("name");
            } else {
              node.setProperty("name", nameToWrite);
            }
          } catch (Throwable ignored) {
          }
        }
      }
    }, myProject);

    waitEDT();
    return result[0];
  }

  private void setFieldNameInModel(String value) {
    processFieldNameInModel(value);
  }

  private String getFieldNameFromModel() {
    return processFieldNameInModel(null);
  }


  // File stuff
  private String processFieldNameInFile(final String nameToWrite) {
    if (!MODEL_FILE.exists()) {
      return null;
    }
    try {
      Scanner scanner = new Scanner(MODEL_FILE);
      String FIELD_PATTERN = "      <property name=\"name\" nameId=\"tpck.1169194664001\" value=\"%s\" />";
      Pattern fieldNamePattern = Pattern.compile(String.format(FIELD_PATTERN, "([^\"]+)"));
      boolean inField = false;
      List<String> lines = new ArrayList<String>();
      while (scanner.hasNextLine()) {
        String line = scanner.nextLine();
        if (line.contains("<node role=\"field\" roleId=\"tpee.1068390468199\" type=\"tpee.FieldDeclaration\" typeId=\"tpee.1068390468200\" id=\"6010389230754495469\">")) {
          inField = true;
        } else if (inField) {
          Matcher matcher = fieldNamePattern.matcher(line);
          if (matcher.matches()) {
            if (nameToWrite == null) {
              return matcher.group(1);
            } else {
              lines.add(matcher.replaceFirst(String.format(FIELD_PATTERN, nameToWrite)));
              inField = false;
              continue;
            }
          }
        }
        lines.add(line);
      }
      scanner.close();
      long lastModifiedBefore = MODEL_FILE.lastModified();
      PrintWriter w = new PrintWriter(MODEL_FILE);
      for (String line : lines) {
        w.println(line);
      }
      w.close();
      if (MODEL_FILE.lastModified() == lastModifiedBefore) {
        setLastModified(lastModifiedBefore + 1000);
      }

      setLastModified(lastModifiedBefore + 2000 + (int) (Math.random() * 100000));
    } catch (FileNotFoundException e) {
      Assert.fail();
    }
    return null;
  }

  private String getFieldNameFromFile() {
    return processFieldNameInFile(null);
  }

  private void setFieldNameInFile(String name) {
    processFieldNameInFile(name);
  }

  private void checkInitialState() {
    checkSynchronizedState(FIELD_DEFAULT_NAME);
  }

  private void checkSynchronizedState(@Nullable String fieldName) {
    Assert.assertEquals(fieldName, getFieldNameFromModel());
    Assert.assertEquals(fieldName, getFieldNameFromFile());
    if (fieldName == null) {
      Assert.assertNull(SModelRepository.getInstance().getModelDescriptor(myModelDescriptor.getSModelReference()));
    } else {
      Assert.assertFalse(myModelDescriptor.isChanged());
    }
  }

  private void provokeAndCheckConflict(Action action, final DiskModification diskModification, final VersionToChoose versionToChoose) {
    setFieldNameInModel(FIELD_NAME_IN_MODEL);
    if (DiskModification.MODIFY == diskModification) {
      setFieldNameInFile(FIELD_NAME_IN_FILE);
    } else {
      delete();
    }

    refreshVfs();

    final boolean[] dialogWasInvoked = new boolean[1];

    Messages.setTestDialog(new TestDialog() {
      @Override
      public int show(String message) {
        dialogWasInvoked[0] = true;
        if (DiskModification.DELETE == diskModification) {
          return VersionToChoose.MEMORY == versionToChoose ? 0 : 1;
        } else {
          return VersionToChoose.MEMORY == versionToChoose ? 1 : 0;
        }
      }
    });

    if (Action.SAVE == action) {
      // save conflicting model
      ModelAccess.instance().runCommandInEDT(new Runnable() {
        @Override
        public void run() {
          SModelRepository.getInstance().saveAll();
        }
      }, myProject);
    } else {
      // reload conflict
      ModelAccess.instance().runWriteInEDT(new Runnable() {
        public void run() {
          myModelDescriptor.reloadFromDiskSafe();
        }
      });
    }

    ModelAccess.instance().flushEventQueue();
    try {
      SwingUtilities.invokeAndWait(new Runnable() {
        @Override
        public void run() {
        }
      });
    } catch (InterruptedException e) {
    } catch (InvocationTargetException e) {
    }

    Assert.assertTrue(dialogWasInvoked[0]);
    String expectedFieldName;
    if (VersionToChoose.MEMORY == versionToChoose) {
      expectedFieldName = FIELD_NAME_IN_MODEL;
    } else {
      if (DiskModification.MODIFY == diskModification) {
        expectedFieldName = FIELD_NAME_IN_FILE;
      } else {
        expectedFieldName = null;
      }
    }
    checkSynchronizedState(expectedFieldName);
  }

  private void refreshVfs() {
    VirtualFile vf = LocalFileSystem.getInstance().findFileByIoFile(MODEL_FILE);
    if (vf == null || !vf.exists()) {
      vf = LocalFileSystem.getInstance().findFileByIoFile(MODEL_FILE.getParentFile());
    }
    RefreshSession rs = RefreshQueue.getInstance().createSession(false, true, null);
    assert vf != null;
    rs.addFile(vf);
    rs.launch();
  }

  private void restoreAndCheckOriginalState() {
    if (MODEL_FILE.exists()) {
      setFieldNameInFile(FIELD_DEFAULT_NAME);

      refreshVfs();
      ModelAccess.instance().runWriteAction(new Runnable() {
        @Override
        public void run() {
          myModelDescriptor.reloadFromDisk();
        }
      });
    } else {
      // Restore model
      ModelAccess.instance().runCommandInEDT(new Runnable() {
        @Override
        public void run() {
          myModelDescriptor = myModule.createModel(MODEL_REFERENCE.getSModelFqName(), myModule.getSModelRoots().get(0));
          myModelDescriptor.getSModel().addRoot(CopyUtil.copyAndPreserveId(myNodeBackup));
          myModelDescriptor.save();
        }
      }, myProject);
      waitEDT();
    }
    checkInitialState();
  }

  private static void setLastModified(long timeStamp) {
    // this is a workaround of JRE bug #4243868
    // http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=4243868
    int count = 0;
    while (!MODEL_FILE.setLastModified(timeStamp) && count < 10) {
      count++;
      System.gc();
      try {
        Thread.sleep(100);
      } catch (InterruptedException e) {
        Assert.fail();
        return;
      }
    }
    Assert.assertTrue(count < 10);
  }

  private static void delete() {
    // this is a workaround of JRE bug similar to #4243868
    // http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=4243868
    int count = 0;
    while (!MODEL_FILE.delete() && count < 10) {
      count++;
      System.gc();
      try {
        Thread.sleep(100);
      } catch (InterruptedException e) {
        Assert.fail();
        return;
      }
    }
    Assert.assertTrue(count < 10);
  }

  private static void waitEDT() {
    ModelAccess.instance().flushEventQueue();
    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      @Override
      public void run() {
      }
    });
  }

  private enum Action {
    SAVE, RELOAD
  }

  private enum VersionToChoose {
    MEMORY, DISK
  }

  private enum DiskModification {
    MODIFY, DELETE
  }
}
