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
package jetbrains.mps.workbench.dialogs.project;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task.Modal;
import codeOrchestra.actionscript.run.compiler.ISynchronizable;
import jetbrains.mps.cleanup.CleanupManager;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.ProjectScope;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jdesktop.beansbinding.AutoBinding;
import org.jetbrains.annotations.NotNull;

import javax.swing.JComponent;
import java.awt.GridBagConstraints;
import java.awt.HeadlessException;
import java.awt.Insets;
import java.util.ArrayList;
import java.util.List;

public abstract class BaseBindedDialog extends BaseDialog implements IBindedDialog {
  private static final Logger LOG = Logger.getLogger(BaseBindedDialog.class);

  @CodeOrchestraPatch
  private List<ISynchronizable> synchronizables = new ArrayList<ISynchronizable>();

  protected IOperationContext myOperationContext;
  private List<AutoBinding> myBindings = new ArrayList<AutoBinding>();

  protected BaseBindedDialog(String text, IOperationContext operationContext) throws HeadlessException {
    super(operationContext.getMainFrame(), text, false);
    myOperationContext = operationContext;
    doInit(operationContext.getMainFrame());
  }

  public abstract JComponent getMainComponent();

  public IOperationContext getOperationContext() {
    return myOperationContext;
  }

  @CodeOrchestraPatch
  public void addSynchronizable(ISynchronizable synchronizable) {
    synchronizables.add(synchronizable);
  }

  @CodeOrchestraPatch
  public boolean sync() {
    boolean syncOk = true;
    for (ISynchronizable synchronizable : synchronizables) {
      syncOk &= synchronizable.sync();
    }
    return syncOk;
  }

  public IScope getModuleScope() {
    return getOperationContext().getScope();
  }

  public IScope getProjectScope() {
    return getOperationContext().getProject().getComponent(ProjectScope.class);
  }

  public void addNotify() {
    super.addNotify();
    bind();
  }

  public void removeNotify() {
    unbind();
    super.removeNotify();
  }

  final protected void bind() {
    for (AutoBinding b : myBindings) {
      if (!b.isBound()) {
        b.bind();
      }
    }
  }

  final public void unbind() {
    for (AutoBinding binding : myBindings) {
      if (binding.isBound()) {
        binding.unbind();
      }
    }
  }

  final public void addBinding(AutoBinding binding) {
    myBindings.add(binding);
  }

  /**
   * should be called on "ok", "apply" etc.
   *
   * @return true if no errors and the dialog should be closed
   */
  protected final boolean saveChanges() {
    final boolean[] closeDialog = new boolean[]{true};

    //to save changes in all models before reload not to lose them
    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        SModelRepository.getInstance().saveAll();
      }
    });

    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      public void run() {
        closeDialog[0] = doSaveChanges();
      }
    });

    ProgressManager.getInstance().run(new Modal(getOperationContext().getProject(), "Applying changes", false) {
      public void run(@NotNull ProgressIndicator indicator) {
        indicator.setIndeterminate(true);
        try {
          ModelAccess.instance().runWriteAction(new Runnable() {
            public void run() {
              CleanupManager.getInstance().cleanup();
            }
          });
        } catch (Throwable t) {
          LOG.error(t);
        }
      }
    });

    ApplicationManager.getApplication().saveAll();

    return closeDialog[0];
  }

  protected boolean doSaveChanges() {
    return true;
  }

  public enum ConstraintsType {
    PANEL {
      public GridBagConstraints create(int x, int y) {
        GridBagConstraints c = LIST.create(x, y);
        c.weightx = 1;
        c.weighty = 1;
        return c;
      }},
    LABEL {
      public GridBagConstraints create(int x, int y) {
        GridBagConstraints c = LIST.create(x, y);
        c.weightx = 0;
        c.weighty = 0;
        return c;
      }},
    FIELD {
      public GridBagConstraints create(int x, int y) {
        GridBagConstraints c = LIST.create(x, y);
        c.weighty = 0;
        return c;
      }},
    LIST {
      public GridBagConstraints create(int x, int y) {
        return new GridBagConstraints(x, y, 1, 1, 1, 1, GridBagConstraints.NORTHWEST, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0);
      }};

    public GridBagConstraints create(int y) {
      return create(0, y);
    }

    public abstract GridBagConstraints create(int x, int y);
  }
}
