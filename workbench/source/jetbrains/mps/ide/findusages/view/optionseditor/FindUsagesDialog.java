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
package jetbrains.mps.ide.findusages.view.optionseditor;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.ide.findusages.findalgorithm.finders.ReloadableFinder;
import jetbrains.mps.ide.findusages.view.optionseditor.components.FindersEditor;
import jetbrains.mps.ide.findusages.view.optionseditor.components.ScopeEditor;
import jetbrains.mps.ide.findusages.view.optionseditor.components.ViewOptionsEditor;
import jetbrains.mps.ide.findusages.view.optionseditor.options.FindersOptions;
import jetbrains.mps.ide.findusages.view.optionseditor.options.ScopeOptions;
import jetbrains.mps.ide.findusages.view.optionseditor.options.ViewOptions;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.editors.MPSEditorOpener;

import javax.swing.AbstractAction;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JPanel;
import java.awt.BorderLayout;
import java.awt.Frame;
import java.awt.event.ActionEvent;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FindUsagesDialog extends BaseDialog {
  private JPanel myPanel;
  private ScopeEditor myScopeEditor;
  private FindersEditor myFindersEditor;
  private ViewOptionsEditor myViewOptionsEditor;
  private boolean myIsCancelled = true;
  private JButton myOkButton;

  public FindUsagesDialog(final FindUsagesOptions defaultOptions, final SNode node, final Project project, Frame mainFrame) {
    super(mainFrame, "Find Usages");

    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        myScopeEditor = new ScopeEditor(defaultOptions.getOption(ScopeOptions.class));
        myFindersEditor = new MyFindersEditor(defaultOptions, node, project) {
          @Override
          protected void findersListChangedByUser() {
            super.findersListChangedByUser();
            updateOkButton();
          }
        };
        myViewOptionsEditor = new ViewOptionsEditor(defaultOptions.getOption(ViewOptions.class));
      }
    });

    JPanel centerPanel = new JPanel(new BorderLayout());
    centerPanel.add(myFindersEditor.getComponent(), BorderLayout.CENTER);
    centerPanel.add(myViewOptionsEditor.getComponent(), BorderLayout.EAST);

    myPanel = new JPanel(new BorderLayout());
    myPanel.add(centerPanel, BorderLayout.CENTER);
    myPanel.add(myScopeEditor.getComponent(), BorderLayout.SOUTH);

    myOkButton = new JButton(new AbstractAction("OK") {
      public void actionPerformed(ActionEvent e) {
        myIsCancelled = false;
        dispose();
      }
    });

    updateOkButton();
  }

  private void updateOkButton() {
    boolean enabled = myFindersEditor.getOptions().getFindersClassNames().size() != 0;
    myOkButton.setEnabled(enabled);
  }

  public FindUsagesOptions getResult() {
    FindUsagesOptions options = new FindUsagesOptions(myFindersEditor.getOptions(), myScopeEditor.getOptions(), myViewOptionsEditor.getOptions());
    return options;
  }

  public boolean isCancelled() {
    return myIsCancelled;
  }

  @Override
  protected JButton[] createButtons() {
    JButton[] buttonsArray = super.createButtons();
    List<JButton> buttons = new ArrayList<JButton>(Arrays.asList(buttonsArray));
    buttons.add(0, myOkButton);
    setDefaultButton(myOkButton);
    return buttons.toArray(new JButton[buttons.size()]);
  }

  @Button(position = 0, name = "Cancel", mnemonic = 'C')
  public void onCancel() {
    dispose();
  }

  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(400, 400, 400, 400);
  }

  protected JComponent getMainComponent() {
    return myPanel;
  }

  protected void prepareDialog() {
    super.prepareDialog();
    pack();
  }

  private class MyFindersEditor extends FindersEditor {
    private Project myProject;

    public MyFindersEditor(FindUsagesOptions defaultOptions, SNode node, Project project) {
      super(defaultOptions.getOption(FindersOptions.class), node);
      myProject = project;
    }

    public void goToFinder(final ReloadableFinder finder) {
      SNode finderNode = finder.getNodeToNavigate();
      if (finderNode == null) return;
      FindUsagesDialog.this.onCancel();
      myProject.getComponent(MPSEditorOpener.class).openNode(finderNode);
    }
  }
}
