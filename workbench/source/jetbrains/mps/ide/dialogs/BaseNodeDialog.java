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
package jetbrains.mps.ide.dialogs;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task.Modal;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.cleanup.CleanupManager;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.util.JSplitPaneWithoutBorders;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.UIEditorComponent;
import jetbrains.mps.nodeEditor.inspector.InspectorEditorComponent;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JSplitPane;
import java.awt.HeadlessException;

public abstract class BaseNodeDialog extends BaseDialog {
  private static final Logger LOG = Logger.getLogger(BaseNodeDialog.class);

  private IOperationContext myOperationContext;
  private UIEditorComponent myEditorComponent;
  private JSplitPane mySplitter;

  protected BaseNodeDialog(String text, IOperationContext operationContext) throws HeadlessException {
    super(operationContext.getMainFrame(), text);
    myOperationContext = operationContext;
    InspectorEditorComponent inspector = new InspectorEditorComponent();
    myEditorComponent = new UIEditorComponent(getOperationContext(), inspector);

    mySplitter = new JSplitPaneWithoutBorders(JSplitPane.VERTICAL_SPLIT, myEditorComponent.getExternalComponent(), inspector.getExternalComponent());
    mySplitter.setDividerSize(6);
    mySplitter.setResizeWeight(0.8);
  }

  protected Icon getIcon() {
    return Icons.DEFAULT_ICON;
  }

  protected IOperationContext getOperationContext() {
    return myOperationContext;
  }

  protected IScope getScope() {
    return myOperationContext.getScope();
  }

  /**
   * @return true if no errors and the dialog should be closed
   */
  protected abstract boolean saveChanges();

  protected abstract SNode getNode();

  public void showDialog() {
    ModelAccess.instance().runReadAction(new Runnable() {
      @Override
      public void run() {
        myEditorComponent.editNode(getNode());
      }
    });
    super.showDialog();
  }

  protected JComponent getMainComponent() {
    return mySplitter;
  }

  protected String getErrorString() {
    return null;
  }

  private boolean validateNode() {
    return ModelAccess.instance().runReadAction(new Computable<Boolean>() {
      public Boolean compute() {
        String errorString = getErrorString();
        if (errorString != null) {
          setErrorText(errorString);
          String optionsText = errorString + "\n\n" +
            "Apply changes anyway?";
          int option = JOptionPane.showConfirmDialog(
            BaseNodeDialog.this,
            optionsText,
            "Errors in " + BaseNodeDialog.this.getTitle(),
            JOptionPane.OK_CANCEL_OPTION, JOptionPane.WARNING_MESSAGE);
          if (option != JOptionPane.OK_OPTION) {
            return false;
          }
        }
        return true;
      }
    });
  }

  @BaseDialog.Button(position = 0, name = "OK", mnemonic = 'O', defaultButton = true)
  public void buttonOK() {
    if (!doSaveChanges()) return;
    BaseNodeDialog.this.dispose();
  }

  /**
   * @return true if no errors and the dialog should be closed
   */
  private boolean doSaveChanges() {
    if (!validateNode()) return true;
    final boolean[] dontCloseDialog = new boolean[]{true};
    ProgressManager.getInstance().run(new Modal(getOperationContext().getProject(), "Applying changes", false) {
      public void run(@NotNull ProgressIndicator indicator) {
        indicator.setIndeterminate(true);
        try {
          ModelAccess.instance().runWriteAction(new Runnable() {
            public void run() {
              dontCloseDialog[0] = saveChanges();

              CleanupManager.getInstance().cleanup();
            }
          });
        } catch (Throwable t) {
          LOG.error(t);
        }
      }
    });

    ApplicationManager.getApplication().saveAll();

    return dontCloseDialog[0];
  }

  protected void afterSave() {
  }

  @Override
  public void dispose() {
    super.dispose();
    myEditorComponent.dispose();
  }

  @BaseDialog.Button(position = 1, name = "Cancel", mnemonic = 'C')
  public void buttonCancel() {
    BaseNodeDialog.this.dispose();
  }

  @BaseDialog.Button(position = 2, name = "Apply", mnemonic = 'A')
  public void buttonApply() {
    doSaveChanges();
  }
}
