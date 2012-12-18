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
package jetbrains.mps.ide.java.testMaterial6;

import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;

import javax.swing.JComponent;
import java.awt.Frame;
import java.awt.HeadlessException;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 12.01.2010
 * Time: 17:21:15
 * To change this template use File | Settings | File Templates.
 */
public class OrdinaryDialog extends BaseDialog {

  public OrdinaryDialog(Frame mainFrame, IOperationContext context, SModelDescriptor contextModel, String text) throws HeadlessException {
    super(mainFrame, text);
  }

  @Override
  protected JComponent getMainComponent() {
    return null;
  }

  @BaseDialog.Button(position = 1, name = "Cancel", mnemonic = 'C', defaultButton = false)
  public void onCancel() {
    this.dispose();
  }
}
