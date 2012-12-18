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
import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.common.PathField;
import jetbrains.mps.ide.devkit.newLanguageDialog.NewLanguageDialog;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.workbench.MPSDataKeys;
import junit.extensions.jfcunit.eventdata.StringEventData;

import javax.swing.JTextField;
import javax.swing.SwingUtilities;
import java.awt.Frame;
import java.lang.reflect.InvocationTargetException;

public class NewLanguageUITest extends NewDialogsUITestsBase {
   public void testLanguageCreation() throws InvocationTargetException, InterruptedException {
    Frame frame = MPSDataKeys.FRAME.getData(DataManager.getInstance().getDataContext());
    assertNotNull("Main frame not found", frame);

    final NewLanguageDialog dialog = new NewLanguageDialog(frame);
    dialog.setProject(myCreatedProject);

    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        dialog.showDialog();
      }
    });
    flushAWT();

    JTextField nameField = findTextField("Name");
    getHelper().sendString(new StringEventData(this, nameField, "myLang"));
    flushAWT();
    PathField pathField = findPathField("Path");
    boolean correctSuffix = pathField.getPath().endsWith(nameField.getText());
    assertTrue("Language suffix is not added to path", correctSuffix);

    pressButton(dialog, "OK");

    final boolean[] loaded = new boolean[1];
    ClassLoaderManager.getInstance().addReloadHandler(new ReloadAdapter() {
      @Override
      public void onAfterReload() {
        loaded[0] = true;
        ClassLoaderManager.getInstance().removeReloadHandler(this);
      }
    });

     TestUtil.conditionalWaitAndFlush(this,new Computable<Boolean>() {
       public Boolean compute() {
         return loaded[0];
       }
     });

    final Language l = dialog.getResult();
    assertNotNull("Language is not created", l);

    boolean isImported = myCreatedProject.getProjectModules(Language.class).contains(l);
    assertTrue("Language is not imported into project", isImported);
  }
}
