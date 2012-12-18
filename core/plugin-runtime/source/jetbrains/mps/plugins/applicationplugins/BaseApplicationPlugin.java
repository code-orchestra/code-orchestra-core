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
package jetbrains.mps.plugins.applicationplugins;

import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.Anchor;
import com.intellij.openapi.actionSystem.Constraints;
import com.intellij.openapi.actionSystem.DefaultActionGroup;
import com.intellij.openapi.actionSystem.ex.ActionManagerEx;
import com.intellij.openapi.extensions.PluginId;
import jetbrains.mps.plugins.pluginparts.actions.GeneratedAction;
import jetbrains.mps.plugins.pluginparts.custom.BaseCustomApplicationPlugin;
import jetbrains.mps.workbench.action.BaseGroup;
import jetbrains.mps.workbench.action.BaseKeymapChanges;
import jetbrains.mps.workbench.action.MPSActions;

import java.util.ArrayList;
import java.util.List;

public abstract class BaseApplicationPlugin {
  private ActionManagerEx myActionManager = ActionManagerEx.getInstanceEx();

  private List<BaseCustomApplicationPlugin> myCustomParts;
  private List<BaseGroup> myGroups = new ArrayList<BaseGroup>();
  private List<BaseKeymapChanges> myKeymapChanges = new ArrayList<BaseKeymapChanges>();

  //----------plugin id------------

  protected abstract PluginId getId();

  //------actions and groups-------

  public void createGroups() {

  }

  public final void adjustGroups() {
    adjustInterfaceGroups();
    adjustRegularGroups();
  }

  public void adjustInterfaceGroups() {

  }

  public void adjustRegularGroups() {

  }

  protected void insertInterfaceGroupIntoAnother(String whatId, String toId, String labelName) {
    DefaultActionGroup gTo = (DefaultActionGroup) ActionManager.getInstance().getAction(toId);
    DefaultActionGroup gWhat = (DefaultActionGroup) ActionManager.getInstance().getAction(whatId);
    if (gTo == null || gWhat == null) {
      return;
    }
    if (labelName != null) {
      Constraints constraints = new Constraints(Anchor.AFTER, labelName);
      gTo.add(gWhat, constraints);
    } else {
      gTo.add(gWhat);
    }
  }

  protected void insertGroupIntoAnother(String whatId, String toId, String labelName) {
    insertInterfaceGroupIntoAnother(whatId, toId, labelName);
    //todo with this method, we can use Idea's ActionStubs
  }

  public void addParameterizedAction(GeneratedAction action, Object... params) {
    addAction(action);

    String shortId = action.getClass().getName();
    for (BaseKeymapChanges kc : myKeymapChanges) {
      kc.parameterizedActionCreated(shortId, action.getActionId(), params);
    }
  }

  protected void addAction(GeneratedAction action) {
    myActionManager.registerAction(action.getActionId(), action, getId());
  }

  protected void addGroup(BaseGroup group) {
    myActionManager.registerAction(group.getId(), group, getId());
    myGroups.add(group);
  }

  //----------custom parts----------

  public final void createCustomParts() {
    myCustomParts = initCustomParts();
  }

  protected List<BaseCustomApplicationPlugin> initCustomParts() {
    return new ArrayList<BaseCustomApplicationPlugin>();
  }

  //-------------keymaps------------

  public void createKeymaps() {
    myKeymapChanges = initKeymaps();
    for (BaseKeymapChanges change : myKeymapChanges) {
      change.init();
    }
  }

  protected List<BaseKeymapChanges> initKeymaps() {
    return new ArrayList<BaseKeymapChanges>();
  }

  //-------------common-------------

  public final void dispose() {
    //groups are disposed in ActionFactory
    //keymaps are unregistered in ActionFactory
    for (BaseCustomApplicationPlugin part : myCustomParts) {
      part.dispose();
    }

    for (BaseKeymapChanges change : myKeymapChanges) {
      change.dispose();
    }
    myKeymapChanges.clear();

    MPSActions.getInstance().unregisterGroups(myGroups);
    myGroups.clear();
    MPSActions.getInstance().unregisterActions(getId());
  }
}
