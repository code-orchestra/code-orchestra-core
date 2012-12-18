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
package jetbrains.mps.workbench.action;

import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DefaultActionGroup;
import com.intellij.openapi.actionSystem.Presentation;
import jetbrains.mps.InternalFlag;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.util.Condition;
import jetbrains.mps.workbench.ActionPlace;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import java.util.Arrays;
import java.util.List;

public class BaseGroup extends DefaultActionGroup {
  private String myId = "";
  private boolean myIsInternal = false;
  private boolean myIsAlwaysVisible = true;

  public BaseGroup(String name) {
    this(name, name);
  }

  public BaseGroup(String text, String id) {
    this(text, id, null);
  }

  public BaseGroup(String text, String id, Icon icon) {
    super(text, false);
    myId = id;
    getTemplatePresentation().setIcon(icon);
  }

  public void setIsAlwaysVisible(boolean isAlwaysVisible) {
    myIsAlwaysVisible = isAlwaysVisible;
  }

  public void setIsInternal(boolean isInternal) {
    myIsInternal = isInternal;
  }

  public void setMnemonic(char mnemonic) {
    String text = getTemplatePresentation().getText();
    int pos = text.indexOf(Character.toUpperCase(mnemonic));
    if (pos == -1) pos = text.indexOf(Character.toLowerCase(mnemonic));
    StringBuilder newText = new StringBuilder(text);
    newText.insert(pos, '_');
    getTemplatePresentation().setText(newText.toString());
  }

  public String getId() {
    return myId;
  }

  public void disable(Presentation p) {
    p.setEnabled(false);
    p.setVisible(myIsAlwaysVisible);
  }

  public void enable(Presentation p) {
    p.setEnabled(true);
    p.setVisible(true);
  }

  protected void setEnabledState(Presentation p, boolean state) {
    if (state) enable(p);
    else disable(p);
  }

  public void update(final AnActionEvent e) {
    super.update(e);
    if (myIsInternal && !InternalFlag.isInternalMode()) {
      e.getPresentation().setEnabled(false);
      e.getPresentation().setVisible(false);
    } else {
      ModelAccess.instance().runReadAction(new Runnable() {
        public void run() {
          doUpdate(e);
        }
      });
    }
  }

  public void addPlace(ActionPlace place, @Nullable Condition<BaseAction> condition) {
    List actionList = Arrays.asList(getChildren(null));
    addPlaceToActionList(actionList, place, condition);
  }

  protected void doUpdate(AnActionEvent e) {

  }

  protected static void addPlaceToActionList(List<AnAction> actions, ActionPlace place, @Nullable Condition<BaseAction> condition) {
    for (AnAction child : actions) {
      if (child instanceof BaseGroup) {
        ((BaseGroup) child).addPlace(place, condition);
      } else if (child instanceof BaseAction) {
        BaseAction action = (BaseAction) child;
        if (condition == null || condition.met(action)) {
          action.addPlace(place);
        }
      }
    }
  }
}
