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
package jetbrains.mps.typesystem.uiActions;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.ide.dialogs.BaseNodeDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.ide.util.JSplitPaneWithoutBorders;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.util.GoToTypeErrorRuleUtil;

import javax.swing.AbstractAction;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JSplitPane;
import java.awt.HeadlessException;
import java.awt.event.ActionEvent;

public class
  MyBaseNodeDialog extends BaseNodeDialog {
  private final SNode myType;
  private SModel myModel;
  private final IErrorReporter myError;
  private boolean myWasRegistered = true;
  private JSplitPane myMainComponent;
  private JComponent mySupertypesViewComponent;

  public MyBaseNodeDialog(IOperationContext operationContext, SNode node, SNode type, IErrorReporter error) throws HeadlessException {
    super(getTitle(node), operationContext);

    SupertypesViewTool supertypesView = operationContext.getProject().getComponent(SupertypesViewTool.class);

    mySupertypesViewComponent = supertypesView.getComponent();
    myMainComponent = new JSplitPaneWithoutBorders(JSplitPane.HORIZONTAL_SPLIT, getSuperMainComponent(), mySupertypesViewComponent);
    myMainComponent.setDividerSize(6);
    myMainComponent.setResizeWeight(0.8);

    myType = type;
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        myModel = myType.getModel();
      }
    });
    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        if (!myType.isRegistered()) {
          boolean wasLoading = myModel.isLoading();
          try {
            myModel.setLoading(true);
            myWasRegistered = false;
            myModel.addRoot(myType.getTopmostAncestor());
          } finally {
            myModel.setLoading(wasLoading);
          }
        }
      }
    });
    myError = error;
    supertypesView.showItemInHierarchy(myType, operationContext);
  }

  private static String getTitle(final SNode node) {
    return ModelAccess.instance().runReadAction(new Computable<String>() {
      public String compute() {
        return "Type For Node " + node;
      }
    });
  }

  protected JComponent getMainComponent() {
    return myMainComponent;
  }

  private JComponent getSuperMainComponent() {
    return super.getMainComponent();
  }

  protected JButton[] createButtons() {
    JButton button = new JButton(new AbstractAction("OK") {
      public void actionPerformed(ActionEvent e) {
        MyBaseNodeDialog.this.dispose();
      }
    });
    if (myError != null) {
      JButton errorButton = new JButton(new AbstractAction("Go To Rule Which Caused Error") {
        public void actionPerformed(ActionEvent e) {
          GoToTypeErrorRuleUtil.goToTypeErrorRule(getOperationContext(), myError);
        }
      });
      return new JButton[]{button, errorButton};
    }
    return new JButton[]{button};
  }

  protected boolean saveChanges() {
    return true;
  }

  protected SNode getNode() {
    return myType;
  }

  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(200, 200, 500, 400);
  }

  public void showDialog() {
    if (myError != null) {
      String s = ModelAccess.instance().runReadAction(new Computable<String>() {
        public String compute() {
          return myError.reportError();
        }
      });
      setErrorText("Type error! Message: " + s);
    }
    super.showDialog();
  }

  public void dispose() {
    if (mySupertypesViewComponent != null && mySupertypesViewComponent.getParent() != null) {
      mySupertypesViewComponent.getParent().remove(mySupertypesViewComponent);
    }
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        if (!myWasRegistered) {
          boolean wasLoading = myModel.isLoading();
          try {
            myModel.setLoading(true);
            myModel.removeRoot(myType.getTopmostAncestor());
            myWasRegistered = true;
          } finally {
            myModel.setLoading(wasLoading);
          }
        }
        MyBaseNodeDialog.super.dispose();
      }
    });
  }
}
