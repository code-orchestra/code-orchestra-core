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
package jetbrains.mps.uitests.dialogs;

import com.intellij.ide.GeneralSettings;
import com.intellij.openapi.application.ex.ApplicationEx;
import com.intellij.openapi.application.ex.ApplicationManagerEx;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.util.Disposer;
import jetbrains.mps.MPSMainImpl;
import jetbrains.mps.TestMain;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.ide.common.PathField;
import jetbrains.mps.project.MPSProject;
import junit.extensions.jfcunit.JFCTestCase;
import junit.extensions.jfcunit.JFCTestHelper;
import junit.extensions.jfcunit.eventdata.MouseEventData;
import junit.extensions.jfcunit.finder.AbstractButtonFinder;
import junit.extensions.jfcunit.finder.NamedComponentFinder;

import javax.swing.JCheckBox;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;
import java.awt.Component;
import java.awt.Container;
import java.io.File;
import java.util.List;

public abstract class UITestsBase extends JFCTestCase {
  protected void setUp() throws Exception {
    super.setUp();

    setHelper(new JFCTestHelper());

    System.setProperty("idea.no.jre.check", "true");
    System.setProperty("idea.platform.prefix", "MPS");

    IdeMain.setTestMode(TestMode.UI_TEST);

    MPSMainImpl.start(new String[0]);

    ApplicationManagerEx.getApplicationEx();

    flushAWT();

    GeneralSettings.getInstance().setReopenLastProject(false);

    flushAWT();

    doSetUp();

    flushAWT();
  }

  protected void tearDown() throws Exception {
    flushAWT();

    doTearDown();

    flushAWT();

    final ApplicationEx application = ApplicationManagerEx.getApplicationEx();

    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      public void run() {
        application.saveAll();
        Disposer.dispose(application);
      }
    });

    flushAWT();

    super.tearDown();
  }

  protected void doSetUp() {
  }

  protected void doTearDown() {
  }

  public abstract static class NoProjectUITestsBase extends UITestsBase {
  }

  public abstract static class ProjectUITestsBase extends UITestsBase {
    private String myProjectPath;
    private Project myProject;

    protected ProjectUITestsBase(String projectPath) throws InterruptedException {
      myProjectPath = projectPath;
      myProject = initProject();
    }

    public Project getProject() {
      return myProject;
    }

    protected Project initProject() throws InterruptedException {
      TestUtil.conditionalWaitAndFlush(this, new Computable<Boolean>() {
        public Boolean compute() {
          return false;//IdeMain.isUILoaded();
        }
      });

      final MPSProject[] project = new MPSProject[1];
      SwingUtilities.invokeLater(new Runnable() {
        public void run() {
          project[0] = TestMain.loadProject(new File(myProjectPath));
        }
      });

      TestUtil.conditionalWaitAndFlush(this, new Computable<Boolean>() {
        public Boolean compute() {
          return project[0] != null && project[0].getProject() != null;
        }
      });

      return project[0].getProject();
    }
  }

  protected final String checkTextField(String name) {
    JTextField field = findTextField(name);
    String text = field.getText();
    assertFalse("Initial " + name + " is empty", text.equals(""));
    return text;
  }

  protected JTextField findTextField(String name) {
    NamedComponentFinder finder = new NamedComponentFinder(JTextField.class, name);
    JTextField field = (JTextField) finder.find();
    assertNotNull(name + " field not found", field);
    return field;
  }

  protected final String checkPathField(String name) {
    PathField field = findPathField(name);
    String path = field.getPath();
    assertFalse("Initial " + name + " is empty", path.equals(""));
    return path;
  }

  protected PathField findPathField(String name) {
    NamedComponentFinder finder = new NamedComponentFinder(PathField.class, name);
    PathField field = (PathField) finder.find();
    assertNotNull(name + " field not found", field);
    return field;
  }

  protected final boolean checkCheckbox(String name) {
    JCheckBox cb = findCheckbox(name);
    return cb.isSelected();
  }

  protected JCheckBox findCheckbox(String name) {
    NamedComponentFinder finder = new NamedComponentFinder(JCheckBox.class, name);
    JCheckBox cb = (JCheckBox) finder.find();
    assertNotNull(name + " checkbox not found", cb);
    return cb;
  }

  protected final void pressButton(Component dialog, String caption) {
    AbstractButtonFinder btnFinder = new AbstractButtonFinder(".*" + caption + ".*");
    List nextBtn = btnFinder.findAll((Container) dialog);
    assertFalse("\"" + caption + "\" not found", nextBtn.isEmpty());
    getHelper().enterClickAndLeave(new MouseEventData(UITestsBase.this, (Component) nextBtn.get(0)));
  }
}
