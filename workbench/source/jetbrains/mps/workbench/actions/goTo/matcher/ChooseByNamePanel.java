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
package jetbrains.mps.workbench.actions.goTo.matcher;

import com.intellij.ide.DataManager;
import com.intellij.ide.util.gotoByName.ChooseByNameModel;
import com.intellij.ide.util.gotoByName.ChooseByNamePopup;
import com.intellij.ide.util.gotoByName.temp.ItemProvider;
import com.intellij.openapi.application.ModalityState;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.choose.base.FakePsiContext;

import javax.swing.JComponent;
import javax.swing.JPanel;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.util.List;

public class ChooseByNamePanel extends ChooseByNamePopup {
  private JPanel myPanel;
  private boolean myCheckboxVisible = false;

  ChooseByNamePanel(ChooseByNameModel model, boolean checkboxVisible, ItemProvider provider) {
    super(MPSDataKeys.PROJECT.getData(DataManager.getInstance().getDataContext()), model, provider, null, new FakePsiContext(), "");
    myCheckboxVisible = checkboxVisible;
  }

  protected void initUI(Callback callback, ModalityState modalityState, boolean allowMultipleSelection) {
    super.initUI(callback, modalityState, allowMultipleSelection);

    myTextFieldPanel.setBorder(null);

    myPanel = new JPanel(new GridBagLayout());

    myPanel.add(myTextFieldPanel, new GridBagConstraints(0, 0, 1, 1, 1, 0, GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
    myPanel.add(myListScrollPane, new GridBagConstraints(0, 1, 1, 1, 1, 1, GridBagConstraints.WEST, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0));
    myPanel.add(new JPanel(), new GridBagConstraints(0, 2, 1, 1, 1, 0.001, GridBagConstraints.WEST, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0));

    myTextFieldPanel.setOpaque(false);
  }

  public JComponent getPreferredFocusedComponent() {
    return myTextField;
  }

  public List<Object> getChosenElements() {
    return super.getChosenElements();
  }

  protected void showList() {
  }

  protected void hideList() {
  }

  protected void close(boolean isOk) {
    for (Object element : getChosenElements()) {
      myActionListener.elementChosen(element);
    }
  }

  protected boolean isShowListForEmptyPattern() {
    return true;
  }

  protected boolean isCloseByFocusLost() {
    return false;
  }

  protected boolean isCheckboxVisible() {
    return myCheckboxVisible;
  }

  protected void showTextFieldPanel() {
    return;
  }

  public JPanel getPanel() {
    return myPanel;
  }
}
