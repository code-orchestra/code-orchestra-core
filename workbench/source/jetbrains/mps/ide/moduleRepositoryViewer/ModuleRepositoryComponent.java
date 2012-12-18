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
package jetbrains.mps.ide.moduleRepositoryViewer;

import com.intellij.openapi.actionSystem.ActionGroup;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.command.CommandProcessorEx;
import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.projectPane.SortUtil;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.*;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.action.BaseAction;

import javax.swing.JComponent;
import javax.swing.JScrollPane;
import java.util.Map;

public class ModuleRepositoryComponent {
  private MPSTree myTree = new MyTree();
  private JScrollPane myComponent = ScrollPaneFactory.createScrollPane(myTree);
  private DeferringEventHandler myDeferringEventHandler = new DeferringEventHandler();

  public ModuleRepositoryComponent() {
  }

  public JComponent getComponent() {
    return myComponent;
  }

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

  private class MyTree extends MPSTree {
    protected MPSTreeNode rebuild() {
      final TextTreeNode[] root = new TextTreeNode[1];

      ModelAccess.instance().runReadAction(new Runnable() {
        public void run() {
          root[0] = new TextTreeNode("Loaded Modules") {
            {
              setIcon(Icons.PROJECT_ICON);
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

          for (IModule module : SortUtil.sortModules(MPSModuleRepository.getInstance().getAllModules())) {
            root[0].add(new LanguageTreeNode(module));
          }
        }
      });

      return root[0];
    }

    private class LanguageTreeNode extends MPSTreeNode {
      private IModule myModule;

      public LanguageTreeNode(IModule module) {
        super(null);
        myModule = module;
        setNodeIdentifier(myModule.toString());
        setIcon(IconManager.getIconFor(myModule));
        for (MPSModuleOwner owner : MPSModuleRepository.getInstance().getOwners(myModule)) {
          add(new OwnerTreeNode(owner));
        }
      }
    }

    private class OwnerTreeNode extends MPSTreeNode {
      private MPSModuleOwner myOwner;

      public OwnerTreeNode(MPSModuleOwner owner) {
        super(null);
        myOwner = owner;
        setNodeIdentifier(myOwner.toString());
        setIcon(IconManager.getIconFor(myOwner));
      }

      public boolean isLeaf() {
        return true;
      }
    }
  }

  private class DeferringEventHandler extends ModelAccessAdapter {
    private boolean myDeferredUpdate = false;
    private final ModuleRepositoryAdapter myRepositoryListener;

    private DeferringEventHandler() {
      myRepositoryListener = new ModuleRepositoryAdapter() {
        @Override
        public void repositoryChanged() {
          DeferringEventHandler.this.repositoryChanged();
        }
      };
    }

    public void installListeners() {
      ModelAccess.instance().addCommandListener(this);
      MPSModuleRepository.getInstance().addModuleRepositoryListener(myRepositoryListener);
    }

    public void unInstallListeners() {
      MPSModuleRepository.getInstance().removeModuleRepositoryListener(myRepositoryListener);
      ModelAccess.instance().removeCommandListener(this);
    }

    public void repositoryChanged() {
      if (CommandProcessorEx.getInstance().getCurrentCommand() != null) {
        myDeferredUpdate = true;
      } else {
        ModelAccess.instance().runReadInEDT(new Runnable() {
          public void run() {
            myTree.rebuildNow();
          }
        });
      }
    }

    public void commandFinished() {
      if (!myDeferredUpdate) return;

      myDeferredUpdate = false;
      ModelAccess.instance().runReadInEDT(new Runnable() {
        public void run() {
          myTree.rebuildNow();
        }
      });
    }
  }
}
