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
package jetbrains.mps.ide.modelRepositoryViewer;

import com.intellij.openapi.actionSystem.ActionGroup;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.projectPane.SortUtil;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.smodel.event.SModelListener;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.action.BaseAction;

import javax.swing.JComponent;
import javax.swing.JScrollPane;
import java.awt.Color;
import java.awt.Font;
import java.util.Map;

public class ModelRepositoryComponent {
  private MPSTree myTree = new MyTree();
  private JScrollPane myComponent = ScrollPaneFactory.createScrollPane(myTree);
  private DeferringEventHandler myDeferringEventHandler = new DeferringEventHandler();

  private final Object myLock = new Object();
  private boolean myUpdateNeeded = false;

  public void install() {
    ModelAccess.instance().runReadInEDT(new Runnable() {
      public void run() {
        myTree.rebuildNow();
      }
    });
    myDeferringEventHandler.installListeners();
  }

  public void uninstall() {
    myDeferringEventHandler.unInstallListeners();
  }

  public JComponent getComponent() {
    return myComponent;
  }

  private class MyTree extends MPSTree {
    private MyTree() {
    }

    protected MPSTreeNode rebuild() {
      final TextTreeNode[] root = new TextTreeNode[1];
      ModelAccess.instance().runReadAction(new Runnable() {
        public void run() {
          root[0] = new TextTreeNode("Loaded Models") {
            {
              setIcon(Icons.PROJECT_MODELS_ICON);
            }

            protected boolean propogateErrorUpwards() {
              return false;
            }

            public ActionGroup getActionGroup() {
              BaseAction refreshAction = new BaseAction("Refresh") {

                @Override
                protected boolean isEnabledInASView() {
                  return true;
                }

                protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
                  myTree.rebuildNow();
                }
              };
              return ActionUtils.groupFromActions(refreshAction);
            }
          };

          if (IdeMain.getTestMode() == TestMode.CORE_TEST) return;

          for (SModelDescriptor modelDescriptor : SortUtil.sortModels(SModelRepository.getInstance().getModelDescriptors())) {
            root[0].add(new ModelTreeNode(modelDescriptor));
          }
        }
      });


      return root[0];
    }

    private class ModelTreeNode extends MPSTreeNode {
      private SModelDescriptor myModelDescriptor;

      public ModelTreeNode(SModelDescriptor modelDescriptor) {
        super(null);
        myModelDescriptor = modelDescriptor;
        setNodeIdentifier(myModelDescriptor.getLongName());
        for (ModelOwner owner : SModelRepository.getInstance().getOwners(myModelDescriptor)) {
          add(new OwnerTreeNode(owner));
        }
      }

      protected void doUpdatePresentation() {
        setIcon(IconManager.getIconFor(myModelDescriptor));
        if ((myModelDescriptor instanceof EditableSModelDescriptor) &&
          ((EditableSModelDescriptor) myModelDescriptor).isChanged()) {
          setFontStyle(getFontStyle() | Font.BOLD);
          //setColor(new Color(0x00, 0x00, 0x90));
        }
        setColor(Color.BLACK);
        setText(myModelDescriptor.getLongName() + ("(" + myModelDescriptor.getLoadingState().toString() + ")"));
      }
    }

    private class OwnerTreeNode extends MPSTreeNode {
      private ModelOwner myOwner;

      public OwnerTreeNode(ModelOwner owner) {
        super(null);
        myOwner = owner;
        setNodeIdentifier(myOwner.toString());

        if (myOwner instanceof Generator) {
          setIcon(Icons.GENERATOR_ICON);
        } else if (myOwner instanceof Language) {
          setIcon(Icons.LANGUAGE_ICON);
        } else if (myOwner instanceof MPSProject) {
          setIcon(Icons.PROJECT_ICON);
        } else if (myOwner instanceof Solution) {
          setIcon(Icons.SOLUTION_ICON);
        } else {
          setIcon(Icons.DEFAULT_ICON);
        }
      }

      public boolean isLeaf() {
        return true;
      }
    }
  }

  private void requestUpdate() {
    ModelAccess.instance().runReadInEDT(new Runnable() {
      public void run() {
        synchronized (myLock) {
          if (!myUpdateNeeded) return;
          myUpdateNeeded = false;
        }
        myTree.rebuildNow();
      }
    });
  }

  private class DeferringEventHandler {
    private SModelRepositoryListener myRepoListener = new SModelRepositoryAdapter() {
      public void modelRepositoryChanged() {
        requestUpdate();
      }
    };

    private SModelListener myModelListener = new SModelAdapter() {
      public void modelLoadingStateChanged(SModelDescriptor sm, ModelLoadingState oldState, ModelLoadingState newState) {
        requestUpdate();
      }
    };

    private ModelAccessListener myModelAccessListener = new ModelAccessAdapter() {
      public void commandFinished() {
        requestUpdate();
      }
    };

    public void installListeners() {
      ModelAccess.instance().addCommandListener(myModelAccessListener);
      SModelRepository.getInstance().addModelRepositoryListener(myRepoListener);
      GlobalSModelEventsManager.getInstance().addGlobalModelListener(myModelListener);
    }

    public void unInstallListeners() {
      ModelAccess.instance().removeCommandListener(myModelAccessListener);
      SModelRepository.getInstance().removeModelRepositoryListener(myRepoListener);
      GlobalSModelEventsManager.getInstance().removeGlobalModelListener(myModelListener);
    }


  }
}
