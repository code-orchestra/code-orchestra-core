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
package jetbrains.mps.nodeEditor;

import com.intellij.ide.DataManager;
import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.application.RuntimeInterruptedException;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.Messages;
import com.intellij.openapi.ui.popup.JBPopupFactory;
import com.intellij.openapi.ui.popup.ListPopup;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.util.Pair;
import com.intellij.ui.awt.RelativePoint;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.ide.projectPane.ProjectPane;
import jetbrains.mps.intentions.*;
import jetbrains.mps.intentions.IntentionsManager.QueryDescriptor;
import jetbrains.mps.intentions.icons.Icons;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.nodeEditor.selection.Selection;
import jetbrains.mps.nodeEditor.selection.SelectionListener;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.action.BaseAction;
import jetbrains.mps.workbench.action.BaseGroup;
import jetbrains.mps.workbench.editors.MPSEditorOpener;
import org.jetbrains.annotations.NotNull;

import javax.swing.AbstractAction;
import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.KeyStroke;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import java.awt.Dimension;
import java.awt.Point;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

public class IntentionsSupport {
  static final long INTENTION_SHOW_DELAY = 1000;

  private AbstractAction myShowIntentionsAction;
  private Point myLightBulbLocation = new Point();
  private LightBulbMenu myLightBulb;

  private AtomicReference<Thread> myShowIntentionsThread = new AtomicReference<Thread>();

  @NotNull
  private EditorComponent myEditor;

  public IntentionsSupport(@NotNull EditorComponent editor) {
    myEditor = editor;

    myLightBulb = new LightBulbMenu() {
      public void activate() {
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            checkAndShowMenu();
          }
        });
      }
    };

    myEditor.getViewport().addChangeListener(new ChangeListener() {
      public void stateChanged(ChangeEvent e) {
        adjustLightBulbLocation();
      }
    });

    myShowIntentionsAction = new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            checkAndShowMenu();
          }
        });
      }
    };
    myEditor.registerKeyboardAction(myShowIntentionsAction, KeyStroke.getKeyStroke("alt ENTER"), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

    myEditor.addFocusListener(new FocusAdapter() {
      public void focusGained(FocusEvent e) {
        updateIntentionsStatus();
      }

      public void focusLost(FocusEvent e) {
        hideLightBulb();
      }
    });


    myEditor.getSelectionManager().addSelectionListener(new SelectionListener() {
      @Override
      public void selectionChanged(EditorComponent editorComponent, Selection oldSelection, Selection newSelection) {
        if (!editorComponent.isFocusOwner()) return;
        updateIntentionsStatus();
      }
    });
  }

  private void checkAndShowMenu() {
    if (isInconsistentEditor()) return;
    if (myEditor.isReadOnly() || myEditor.getSelectedNode().getModel().isNotEditable()) return;
    if (!hasIntentions()) return;

    showIntentionsMenu();
  }

  private void updateIntentionsStatus() {
    Thread thread = myShowIntentionsThread.get();
    if (thread != null) {
      thread.interrupt();
    }

    hideLightBulb();

    myShowIntentionsThread.set(new Thread("Intentions") {
      public void run() {
        try {
          Thread.sleep(IntentionsSupport.INTENTION_SHOW_DELAY);

          boolean show = ModelAccess.instance().runReadAction(new Computable<Boolean>() {
            public Boolean compute() {
              if (isInconsistentEditor() || myEditor.isReadOnly()) return false;
              return !getEnabledIntentions(false).isEmpty();
            }
          });

          if (!show) return;
          if (interrupted()) return;

          ModelAccess.instance().runReadInEDT(new Runnable() {
            public void run() {
              if (isInconsistentEditor() || myEditor.isReadOnly()) return;

              if (myEditor.getSelectedCell() == null) {
                hideLightBulb();
              } else {
                adjustLightBulbLocation();
                showLightBulb(new Computable<Boolean>() {
                  public Boolean compute() {
                    return interrupted();
                  }
                });
              }
            }
          });

        } catch (InterruptedException e) {

        } catch (RuntimeInterruptedException e) {

        } finally {
          myShowIntentionsThread.compareAndSet(this, null);
        }
      }
    });

    myShowIntentionsThread.get().start();
  }

  private boolean isInconsistentEditor() {
    return myEditor.isDisposed() || myEditor.getEditedNode() == null || myEditor.getEditedNode().isDisposed() || !myEditor.hasValidSelectedNode();
  }

  private void adjustLightBulbLocation() {
    EditorCell selectedCell = myEditor.getSelectedCell();
    if (selectedCell == null) return;

    Point p = getLightBulbLocation(selectedCell);

    myLightBulbLocation.setLocation(p);

    myLightBulb.setLocation(myLightBulbLocation);
  }

  private void showLightBulbComponent(Icon icon) {
    myLightBulb.setIcon(icon);
    myEditor.add(myLightBulb);
    myLightBulb.setLocation(myLightBulbLocation);
    myEditor.repaint();
  }

  private void hideLightBulb() {
    myEditor.remove(myLightBulb);
  }

  @NotNull
  private Point getInsertedPosition(@NotNull Rectangle parentView, @NotNull Dimension childDim, @NotNull Point preferredLoc) {
    Point p = new Point(preferredLoc);

    p.x = Math.max(p.x, parentView.x + 2);
    p.y = Math.max(p.y, parentView.y + 2);

    p.x = Math.min(p.x, parentView.x + parentView.width - 2 - childDim.width);
    p.y = Math.min(p.y, parentView.y + parentView.height - 2 - childDim.height);

    return p;
  }

  @NotNull
  private Point getLightBulbLocation(@NotNull EditorCell selectedCell) {
    int x = myEditor.getRootCell().getX() - myEditor.getShiftX();// - myLightBulb.getWidth() - 6;
    int y = selectedCell.getY();

    Rectangle viewRect = myEditor.getViewport().getViewRect();
    return getInsertedPosition(viewRect, myLightBulb.getPreferredSize(), new Point(x, y));
  }

  @CodeOrchestraPatch
  private AnAction getIntentionAction(final Intention intention, final SNode node) {
    Icon icon = null;
    try {
      icon = intention.getType().getIcon();
    } catch (Throwable t) {
      icon = IntentionType.getLowestPriorityType().getIcon();
    }
    String text = intention.getDescription(node, myEditor.getEditorContext());
    return new BaseAction(text, null, icon) {
      @Override
      protected boolean isEnabledInASView() {
        return true;
      }

      @Override
      protected void doExecute(AnActionEvent e, Map<String, Object> params) {
        Project project = myEditor.getOperationContext().getProject();
        if(project == null) {
          return;
        }

        ModelAccess.instance().runCommandInEDT(new Runnable() {
          public void run() {
            intention.execute(node, myEditor.getEditorContext());
          }
        }, project);
      }
    };
  }

  private AnAction getIntentionGroup(final Intention intention, final SNode node) {
    // RE-1467
    Icon icon = null;
    try {
      icon = intention.getType().getIcon();
    } catch (Throwable t) {
      icon = IntentionType.getLowestPriorityType().getIcon();
    }

    final IntentionsManager intentionsManager = IntentionsManager.getInstance();

    final DefaultActionGroup intentionActionGroup = new DefaultActionGroup(intention.getDescription(node, myEditor.getEditorContext()), true) {
      @Override
      public boolean canBePerformed(DataContext c) {
        return true;
      }

      @Override
      public void actionPerformed(AnActionEvent e) {
        Project project = myEditor.getOperationContext().getProject();
        if(project == null) {
          return;
        }

        ModelAccess.instance().runCommandInEDT(new Runnable() {
          public void run() {
            intention.execute(node, myEditor.getEditorContext());
          }
        }, project);
      }
    };

    intentionActionGroup.add(new BaseAction("Go to Intention Declaration", "Go to declaration of this intention", icon) {
      @Override
      protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            SNode intentionNode = intentionsManager.getNodeByIntention(intention);
            if (intentionNode == null) {
              Messages.showErrorDialog(myEditor.getOperationContext().getProject(),
                "Could not find declaration for " + intention.getClass().getSimpleName()
                  + " intention (" + intention.getClass().getName() + ")", "Intention Declaration");
            } else {
              myEditor.getOperationContext().getComponent(MPSEditorOpener.class).editNode(intentionNode, myEditor.getOperationContext());
              ProjectPane.getInstance(myEditor.getOperationContext().getProject()).selectNode(intentionNode, false);
            }
          }
        });
      }
    });

    final boolean enabled = !intentionsManager.intentionIsDisabled(intention);
    intentionActionGroup.add(new BaseAction((enabled ? "Disable" : "Enable") + " This Intention", (enabled ? "Disables" : "Enables") + " this intention type", icon) {

      @Override
      protected boolean isEnabledInASView() {
        return true;
      }

      @Override
      protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
        if (enabled) {
          intentionsManager.disableIntention(intention);
        } else {
          intentionsManager.enableIntention(intention);
        }
      }
    });

    intentionActionGroup.getTemplatePresentation().setIcon(icon);
    return intentionActionGroup;
  }

  private BaseGroup getIntentionsGroup() {
    BaseGroup group = new BaseGroup("");
    List<Pair<Intention, SNode>> groupItems = new ArrayList<Pair<Intention, SNode>>();
    groupItems.addAll(getEnabledIntentions(true));
    if (groupItems.isEmpty()) {
      return null;
    }
    Collections.sort(groupItems, new Comparator<Pair<Intention, SNode>>() {
      public int compare(Pair<Intention, SNode> o1, Pair<Intention, SNode> o2) {
        Intention intention1 = o1.getFirst();
        Intention intention2 = o2.getFirst();
        boolean disabled1 = IntentionsManager.getInstance().intentionIsDisabled(intention1);
        boolean disabled2 = IntentionsManager.getInstance().intentionIsDisabled(intention2);
        if (disabled1 && !disabled2) return 1;
        if (!disabled1 && disabled2) return -1;

        // RE-1467 - Additional sorting - error intentions first
        boolean error1 = o1.getFirst().getType() == IntentionType.ERROR || o1.getFirst().getType() == IntentionType.QUICKFIX;
        boolean error2 = o2.getFirst().getType() == IntentionType.ERROR || o2.getFirst().getType() == IntentionType.QUICKFIX;
        if (error1 && !error2) return -1;
        if (!error1 && error2) return 1;

        SNode node1 = o1.getSecond();
        SNode node2 = o2.getSecond();
        EditorContext context = myEditor.getEditorContext();
        return intention1.getDescription(node1, context).compareTo(intention2.getDescription(node2, context));
      }
    });

    // RE-2604
    if (ViewUtils.isInActionScriptView()) {
      for (final Pair<Intention, SNode> pair : groupItems) {
        group.add(getIntentionAction(pair.getFirst(), pair.getSecond()));
      }
    } else {
      for (final Pair<Intention, SNode> pair : groupItems) {
        group.add(getIntentionGroup(pair.getFirst(), pair.getSecond()));
      }
    }

    return group;
  }

  private void showIntentionsMenu() {
    EditorContext editorContext = myEditor.getEditorContext();
    final EditorCell selectedCell = editorContext.getSelectedCell();
    int x = selectedCell.getX();
    int y = selectedCell.getY();
    if (selectedCell instanceof EditorCell_Label) {
      y += ((EditorCell_Label) selectedCell).getHeight();
    }
    final DataContext dataContext = DataManager.getInstance().getDataContext(editorContext.getNodeEditorComponent(), x, y);
    ListPopup popup = ModelAccess.instance().runReadAction(new Computable<ListPopup>() {
      public ListPopup compute() {
        ActionGroup group = getIntentionsGroup();
        ListPopup popup = null;
        if (group != null) {
          popup = JBPopupFactory.getInstance()
            .createActionGroupPopup("Intentions",
              group,
              dataContext,
              JBPopupFactory.ActionSelectionAid.SPEEDSEARCH,
              false);
        }
        return popup;
      }
    });
    RelativePoint relativePoint = new RelativePoint(editorContext.getNodeEditorComponent(), new Point(x, y));
    if (popup != null) {
      popup.show(relativePoint);
    }
  }

  private void showLightBulb(Computable<Boolean> terminated) {
    SNode node = myEditor.getEditedNode();
    if (node == null || node.getModel().isDisposed() || node.getModel().isNotEditable()) return;

    Set<Pair<Intention, SNode>> enabledIntentions = getEnabledIntentions(false);
    if (enabledIntentions.isEmpty()) return;

    IntentionType typeToShow = IntentionType.getLowestPriorityType();
    for (Pair<Intention, SNode> pair : enabledIntentions) {
      if (pair.first.getType().getPriority() < typeToShow.getPriority()) {
        typeToShow = pair.first.getType();
      }
    }

    // RE-3238
    if (!getEnabledIntentions(true).isEmpty()) {
      showLightBulbComponent(typeToShow == IntentionType.NORMAL ? Icons.INTENTION : typeToShow.getIcon());
    }
  }

  private boolean hasIntentions() {
    SNode node = myEditor.getSelectedNode();
    EditorContext editorContext = myEditor.getEditorContext();

    QueryDescriptor query = new QueryDescriptor();
    query.setIntentionClass(BaseIntention.class);

    return !IntentionsManager.getInstance().getAvailableIntentions(query, node, editorContext).isEmpty();
  }

  private Set<Pair<Intention, SNode>> getAvailableIntentions() {
    final Set<Pair<Intention, SNode>> result = new LinkedHashSet<Pair<Intention, SNode>>();
    SNode node = myEditor.getSelectedNode();
    EditorContext editorContext = myEditor.getEditorContext();
    if (node != null && editorContext != null) {
      QueryDescriptor query = new QueryDescriptor();
      query.setIntentionClass(BaseIntention.class);
      query.setInstantiate(true);
      result.addAll(IntentionsManager.getInstance().getAvailableIntentions(query, node, editorContext));
    }
    return result;
  }

  private Set<Pair<Intention, SNode>> getEnabledIntentions(boolean instantiateParameterized) {
    final Set<Pair<Intention, SNode>> result = new LinkedHashSet<Pair<Intention, SNode>>();
    SNode node = myEditor.getSelectedNode();
    EditorContext editorContext = myEditor.getEditorContext();
    if (node != null && editorContext != null) {
      QueryDescriptor query = new QueryDescriptor();
      query.setIntentionClass(BaseIntention.class);
      query.setEnabledOnly(true);
      query.setInstantiate(instantiateParameterized);
      result.addAll(IntentionsManager.getInstance().getAvailableIntentions(query, node, editorContext));
    }
    return result;
  }

  public boolean isLightBulbVisible() {
    return myLightBulb.isVisible();
  }
}
