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

import com.intellij.ide.DataManager;
import jetbrains.mps.ide.common.PathField;
import jetbrains.mps.ide.devkit.newDevkitDialog.NewDevKitDialog;
import jetbrains.mps.project.DevKit;
import jetbrains.mps.workbench.MPSDataKeys;
import junit.extensions.jfcunit.eventdata.StringEventData;
import junit.framework.Assert;

import javax.swing.JTextField;
import javax.swing.SwingUtilities;
import java.awt.Frame;
import java.lang.reflect.InvocationTargetException;

public class NewDevkitUITest extends NewDialogsUITestsBase {
    public void testDevkitCreation() throws InvocationTargetException, InterruptedException {
    Frame frame = MPSDataKeys.FRAME.getData(DataManager.getInstance().getDataContext());
    Assert.assertNotNull("Main frame not found", frame);

    final NewDevKitDialog dialog = new NewDevKitDialog(frame);
    dialog.setProject(myCreatedProject);

    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        dialog.showDialog();
      }
    });
    flushAWT();

    JTextField nameField = findTextField("Name");
    getHelper().sendString(new StringEventData(this, nameField, "myDev"));
    flushAWT();
    PathField pathField = findPathField("Path");
    boolean correctSuffix = pathField.getPath().endsWith(nameField.getText());
    Assert.assertTrue("Devkit suffix is not added to path", correctSuffix);

    pressButton(dialog, "OK");
    flushAWT();

    final DevKit devKit = dialog.getResult();
    Assert.assertNotNull("Devkit is not created", devKit);

    boolean isImported = myCreatedProject.getProjectModules(DevKit.class).contains(devKit);
    Assert.assertTrue("Devkit is not imported into project", isImported);
  }
}
