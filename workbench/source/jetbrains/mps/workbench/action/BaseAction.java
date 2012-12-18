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

import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.project.DumbAware;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.view.ActionScriptViewPane;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import gnu.trove.THashMap;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.util.annotation.Hack;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.ActionPlace;
import jetbrains.mps.workbench.MPSDataKeys;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.KeyStroke;
import java.awt.event.KeyEvent;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public abstract class BaseAction extends AnAction implements DumbAware {
  private boolean myIsAlwaysVisible = true;
  private boolean myExecuteOutsideCommand = false;
  private boolean myDisableOnNoProject = true;
  private Set<ActionPlace> myPlaces = null;

  public BaseAction() {
    this(null, null, null);
  }

  public BaseAction(String text) {
    this(text, null, null);
  }

  public BaseAction(@Nullable String text, @Nullable String description, @Nullable Icon icon) {
    super(text, description, icon);
    setEnabledInModalContext(true);
  }

  // Dirty hack
  @CodeOrchestraPatch
  public boolean _collectionActionData(AnActionEvent e, Map<String, Object> params) {
    return collectActionData(e, params);
  }

  @CodeOrchestraPatch
  protected boolean isEnabledInASView() {
    return false;
  }

  public void setExecuteOutsideCommand(boolean executeOutsideCommand) {
    myExecuteOutsideCommand = executeOutsideCommand;
  }

  public void setIsAlwaysVisible(boolean isAlwaysVisible) {
    myIsAlwaysVisible = isAlwaysVisible;
  }

  public void setDisableOnNoProject(boolean disableOnNoProject) {
    myDisableOnNoProject = disableOnNoProject;
  }

  public void setMnemonic(char mnemonic) {
    String text = getTemplatePresentation().getText();
    int pos = text.indexOf(Character.toUpperCase(mnemonic));
    if (pos == -1) pos = text.indexOf(Character.toLowerCase(mnemonic));
    StringBuilder newText = new StringBuilder(text);
    newText.insert(pos, '_');
    getTemplatePresentation().setText(newText.toString());
  }

  @CodeOrchestraPatch
  public final void update(final AnActionEvent e) {
    super.update(e);

    ActionPlace place = e.getData(MPSDataKeys.PLACE);

    if (e.getInputEvent() instanceof KeyEvent) {
      if (!getPlaces().contains(null)) {
        if (!getPlaces().contains(place)) {
          disable(e.getPresentation());
          return;
        }
      }
    }

    // Hide and disable the action if we're in the AS-mode
    Project project = e.getData(MPSDataKeys.PROJECT);
    IProjectPane iProjectPane = ViewUtils.getCurrentPane(project);
    if (project != null && !isEnabledInASView() && iProjectPane != null && iProjectPane instanceof ActionScriptViewPane) {
      e.getPresentation().setEnabled(false);
      e.getPresentation().setVisible(false);
      return;
    }

    // TODO rewrite! do not start read action in EDT directly (to avoid UI freeze)
    ModelAccess.instance().tryRead(new Runnable() { // RE-2300 - tryRead
      public void run() {
        if (myDisableOnNoProject && e.getData(PlatformDataKeys.PROJECT) == null) {
          disable(e.getPresentation());
          return;
        }
        THashMap<String, Object> params = new THashMap<String, Object>();
        if (!collectActionData(e, params)) {
          disable(e.getPresentation());
          return;
        }
        doUpdate(e, params);
      }
    });
  }

  public final void actionPerformed(final AnActionEvent e) {
    final THashMap<String, Object> params = new THashMap<String, Object>();
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        collectActionData(e, params);
      }
    });
    final ModelAccess access = ModelAccess.instance();
    if (myExecuteOutsideCommand) {
      doExecute(e, params);
    } else {
      access.runWriteActionInCommand(new Runnable() {
        public void run() {
          doExecute(e, params);
        }
      });
    }
  }

  protected void disable(Presentation p) {
    p.setEnabled(false);
    p.setVisible(myIsAlwaysVisible);
  }

  protected void enable(final Presentation p) {
    p.setEnabled(true);
    p.setVisible(true);
  }

  //made public just to use in MPS classifiers, workaround on MPS-3472

  public void setEnabledState(Presentation p, boolean state) {
    if (state) enable(p);
    else disable(p);
  }

  public void addPlace(ActionPlace place) {
    if (myPlaces == null) myPlaces = new HashSet<ActionPlace>();
    myPlaces.add(place);
  }

  public Set<ActionPlace> getPlaces() {
    if (myPlaces != null) return myPlaces;
    Set<ActionPlace> result = new HashSet<ActionPlace>();
    result.add(null);
    return result;
  }

  protected boolean collectActionData(AnActionEvent e, Map<String, Object> params) {
    return true;
  }

  protected void doUpdate(AnActionEvent e, Map<String, Object> params) {
    e.getPresentation().setVisible(true);
    e.getPresentation().setEnabled(true);
  }

  public String getActionId() {
    return getClass().getName();
  }

  @CodeOrchestraPatch
  @Hack
  public void _doExecute(AnActionEvent e, Map<String, Object> params) {
    doExecute(e, params);
  }

  @CodeOrchestraPatch
  @Hack
  public void _doUpdate(AnActionEvent e, Map<String, Object> params) {
    doUpdate(e, params);
  }

  protected abstract void doExecute(AnActionEvent e, Map<String, Object> params) ;
}
