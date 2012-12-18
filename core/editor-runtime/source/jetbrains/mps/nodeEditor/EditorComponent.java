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

import com.intellij.ide.CopyProvider;
import com.intellij.ide.CutProvider;
import com.intellij.ide.DataManager;
import com.intellij.ide.PasteProvider;
import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.keymap.KeymapManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.openapi.wm.IdeFrame;
import com.intellij.openapi.wm.IdeGlassPane;
import com.intellij.openapi.wm.WindowManager;
import com.intellij.openapi.wm.ex.StatusBarEx;
import com.intellij.ui.ScrollPaneFactory;
import com.intellij.ui.components.JBScrollBar;
import com.intellij.ui.components.JBScrollPane;
import com.intellij.util.ui.ButtonlessScrollBarUI;
import codeOrchestra.actionscript.cache.CacheManagerFacade;
import jetbrains.mps.MPSCore;
import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.ide.actions.EditorInternal_ActionGroup;
import jetbrains.mps.ide.actions.EditorPopup_ActionGroup;
import jetbrains.mps.ide.actions.GoByCurrentReference_Action;
import jetbrains.mps.ide.tooltips.MPSToolTipManager;
import jetbrains.mps.ide.tooltips.TooltipComponent;
import jetbrains.mps.ide.ui.MPSErrorDialog;
import jetbrains.mps.intentions.*;
import jetbrains.mps.intentions.IntentionsManager.QueryDescriptor;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorManager.EditorCell_STHint;
import jetbrains.mps.nodeEditor.NodeEditorActions.CompleteNoAuto;
import jetbrains.mps.nodeEditor.NodeEditorActions.CompleteSmart;
import jetbrains.mps.nodeEditor.NodeEditorActions.ShowMessage;
import jetbrains.mps.nodeEditor.cellActions.*;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteChooser;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteInfo;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstitutePatternEditor;
import jetbrains.mps.nodeEditor.cells.*;
import jetbrains.mps.nodeEditor.folding.*;
import jetbrains.mps.nodeEditor.leftHighlighter.LeftEditorHighlighter;
import jetbrains.mps.nodeEditor.selection.*;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.reloading.ReloadListener;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.action.INodeSubstituteAction;
import jetbrains.mps.smodel.event.*;
import jetbrains.mps.typesystem.inference.ITypeContextOwner;
import jetbrains.mps.typesystem.inference.TypeCheckingContext;
import jetbrains.mps.typesystem.inference.TypeContextManager;
import jetbrains.mps.typesystem.util.GoToTypeErrorRuleUtil;
import jetbrains.mps.util.NodesParetoFrontier;
import jetbrains.mps.util.Pair;
import jetbrains.mps.util.WeakSet;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.util.annotation.UseCarefully;
import jetbrains.mps.workbench.ActionPlace;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.action.BaseAction;
import jetbrains.mps.workbench.action.BaseGroup;
import jetbrains.mps.workbench.highlighter.EditorComponentCreateListener;
import jetbrains.mps.workbench.nodesFs.MPSNodeVirtualFile;
import jetbrains.mps.workbench.nodesFs.MPSNodesVirtualFileSystem;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import javax.swing.border.LineBorder;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.plaf.ScrollBarUI;
import javax.swing.plaf.basic.BasicScrollBarUI;
import java.awt.*;
import java.awt.event.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.*;
import java.util.List;

public abstract class EditorComponent extends JComponent implements Scrollable, DataProvider, ITypeContextOwner, TooltipComponent {
  private static final Logger LOG = Logger.getLogger(EditorComponent.class);
  public static final String EDITOR_POPUP_MENU_ACTIONS = EditorPopup_ActionGroup.ID;
  public static final String EDITOR_POPUP_MENU_ACTIONS_INTERNAL = EditorInternal_ActionGroup.ID;
  public static final Color CARET_ROW_COLOR = new Color(255, 255, 215);

  private static final int SCROLL_GAP = 15;

  @CodeOrchestraPatch
  private static final int CODE_COMPLETE_POPUP_TIMEOUT = 1000;

  private final Object myAdditionalPaintersLock = new Object();

  private long lastNodeSubstituteChooserOpen;
  private boolean inTestMode;


  public void setInTestMode(boolean inTestMode) {
    this.inTestMode = inTestMode;
  }

  public static void turnOnAliasingIfPossible(Graphics2D g) {
    if (EditorSettings.getInstance().isUseAntialiasing()) {
      Toolkit tk = Toolkit.getDefaultToolkit();
      //noinspection HardCodedStringLiteral
      Map map = (Map) tk.getDesktopProperty("awt.font.desktophints");
      if (map != null) {
        g.addRenderingHints(map);
      } else {
        g.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
      }
    }
  }

  private WeakHashMap<EditorCell, Set<SNode>> myCellsToNodesToDependOnMap = new WeakHashMap<EditorCell, Set<SNode>>();

  private WeakHashMap<SNode, WeakReference<EditorCell>> myNodesToBigCellsMap = new WeakHashMap<SNode, WeakReference<EditorCell>>();

  private WeakHashMap<EditorCell, Set<SNodePointer>> myCellsToRefTargetsToDependOnMap = new WeakHashMap<EditorCell, Set<SNodePointer>>();
  private HashMap<Pair<SNodePointer, String>, WeakSet<EditorCell_Property>> myNodePropertiesAccessedCleanlyToDependentCellsMap = new HashMap<Pair<SNodePointer, String>, WeakSet<EditorCell_Property>>();
  private HashMap<Pair<SNodePointer, String>, WeakSet<EditorCell>> myNodePropertiesAccessedDirtilyToDependentCellsMap = new HashMap<Pair<SNodePointer, String>, WeakSet<EditorCell>>();
  private HashMap<Pair<SNodePointer, String>, WeakSet<EditorCell>> myNodePropertiesWhichExistenceWasCheckedToDependentCellsMap = new HashMap<Pair<SNodePointer, String>, WeakSet<EditorCell>>();

  private Set<EditorCell> myFoldedCells = new HashSet<EditorCell>();
  private Set<EditorCell> myBracesEnabledCells = new HashSet<EditorCell>();

  private CellTracker myCellTracker = new CellTracker();

  private boolean myIsEditable = true;

  private boolean myDisposed = false;
  private Throwable myDisposedTrace = null;

  private Set<AdditionalPainter> myAdditionalPainters = new TreeSet<AdditionalPainter>(new Comparator<AdditionalPainter>() {
    @Override
    public int compare(AdditionalPainter o1, AdditionalPainter o2) {
      if (o1.isAbove(o2, EditorComponent.this)) {
        return 1;
      }
      if (o2.isAbove(o1, EditorComponent.this)) {
        return -1;
      }
      return o1.equals(o2) ? 0 : Integer.signum(System.identityHashCode(o1) - System.identityHashCode(o2));
    }
  });
  private Map<Object, AdditionalPainter> myItemsToAdditionalPainters = new HashMap<Object, AdditionalPainter>();

  private final List<LeftMarginMouseListener> myLeftMarginPressListeners = new ArrayList<LeftMarginMouseListener>(0);

  private EditorSettingsListener mySettingsListener = new EditorSettingsListener() {
    public void settingsChanged() {
      rebuildEditorContent();
    }
  };
  private ReloadListener myReloadListener = new ReloadAdapter() {
    public void onAfterReload() {
      ModelAccess.instance().runReadInEDT(new Runnable() {
        @Override
        public void run() {
          if (isModuleDisposed() || isProjectDisposed() || isNodeDisposed()) return;
          rebuildEditorContent();
          myNodeSubstituteChooser.clearContent();
        }
      });
    }
  };

  private boolean myHasLastCaretX = false;
  private int myLastCaretX;
  private boolean myReadOnly = false;
  private String myLastWrittenStatus = "";

  @NotNull
  private JScrollPane myScrollPane;
  @NotNull
  private MyScrollBar myVerticalScrollBar;
  @NotNull
  private JComponent myContainer;
  protected EditorCell myRootCell;
  private boolean myCellSwapInProgress;
  private int myShiftX = 15;
  private int myShiftY = 10;

  private SelectionManager mySelectionManager = new SelectionManager(this);

  private Stack<KeyboardHandler> myKbdHandlersStack;
  private MouseListener myMouseEventHandler;
  private HashMap<CellActionType, EditorCellAction> myActionMap;

  private NodeSubstituteChooser myNodeSubstituteChooser;
  private NodeInformationDialog myNodeInformationDialog;
  private HashMap<Object, Object> myUserDataMap = new HashMap<Object, Object>();

  private MyEventsCollector myEventsCollector = new MyEventsCollector();
  private MySimpleModelListener mySimpleModelListener = new MySimpleModelListener();
  private Set<SModelDescriptor> myModelDescriptorsWithListener = new HashSet<SModelDescriptor>();

  private List<RebuildListener> myRebuildListeners = new ArrayList<RebuildListener>();
  private List<EditorDisposeListener> myDisposeListeners = new ArrayList<EditorDisposeListener>();
  private PropertyChangeListener myFocusListener;
  private NodeHighlightManager myHighlightManager = new NodeHighlightManager(this);

  private IOperationContext myOperationContext;

  private MessagesGutter myMessagesGutter = new MessagesGutter(this);
  private LeftEditorHighlighter myLeftHighlighter;
  @Nullable
  protected SNode myNode;
  @Nullable
  private MPSNodeVirtualFile myVirtualFile;
  private boolean myNoVirtualFile;

  @Nullable
  protected SNodePointer myNodePointer;
  private EditorContext myEditorContext;
  private List<CellSynchronizationWithModelListener> myCellSynchronizationListeners = new ArrayList<CellSynchronizationWithModelListener>();
  private CellInfo myRecentlySelectedCellInfo = null;
  private final EditorMessageOwner myOwner = new EditorMessageOwner() {
  };

  private boolean myInsideOfCommand = false;

  private IntentionsSupport myIntentionsSupport;
  @SuppressWarnings({"UnusedDeclaration"})
  private AutoValidator myAutoValidator;
  private SearchPanel mySearchPanel = null;
  private JPanel myUpperPanel = null;
  private Map<String, JComponent> myUpperComponents = new HashMap<String, JComponent>();
  @SuppressWarnings({"UnusedDeclaration"})
  private ReferenceUnderliner myReferenceUnderliner = new ReferenceUnderliner();
  private BracesHighlighter myBracesHighlighter = new BracesHighlighter(this);
  private boolean myPopupMenuEnabled = true;
  private boolean myIsInFiguresHierarchy = false;

  public EditorComponent(IOperationContext operationContext) {
    this(operationContext, false, false);
  }

  @CodeOrchestraPatch
  public EditorComponent(final IOperationContext operationContext, boolean showErrorsGutter, boolean rightToLeft) {
    assert operationContext == null || operationContext.getModule() != null || operationContext.isTestMode() : "No module for operation context: " + operationContext;
    myOperationContext = operationContext;
    setEditorContext(new EditorContext(this, null, operationContext));



    setBackground(Color.white);

    setFocusCycleRoot(true);
    setFocusTraversalPolicy(new FocusTraversalPolicy() {
      public Component getComponentAfter(Container aContainer, Component aComponent) {
        if (myIsInFiguresHierarchy) {
          executeComponentAction(CellActionType.NEXT);
        }
        return myIsInFiguresHierarchy ? aContainer : null;
      }

      public Component getComponentBefore(Container aContainer, Component aComponent) {
        if (myIsInFiguresHierarchy) {
          executeComponentAction(CellActionType.PREV);
        }
        return myIsInFiguresHierarchy ? aContainer : null;
      }

      public Component getFirstComponent(Container aContainer) {
        return myIsInFiguresHierarchy ? aContainer : null;
      }

      public Component getLastComponent(Container aContainer) {
        return myIsInFiguresHierarchy ? aContainer : null;
      }

      public Component getDefaultComponent(Container aContainer) {
        return myIsInFiguresHierarchy ? aContainer : null;
      }
    });
    setFocusTraversalKeysEnabled(false);

    setDoubleBuffered(true);
    myScrollPane = ScrollPaneFactory.createScrollPane();
    if (rightToLeft) {
      myScrollPane.setComponentOrientation(ComponentOrientation.RIGHT_TO_LEFT);
    }
    myScrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
    myScrollPane.setVerticalScrollBar(myVerticalScrollBar = new MyScrollBar(Adjustable.VERTICAL));
    myScrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
    myScrollPane.setViewportView(this);
    myScrollPane.getViewport().addChangeListener(new ChangeListener() {

      @CodeOrchestraPatch
      public void stateChanged(ChangeEvent e) {
        // RE-3832
        if (System.currentTimeMillis() - lastNodeSubstituteChooserOpen > CODE_COMPLETE_POPUP_TIMEOUT) {
          deactivateSubstituteChooser();
        }
      }
    });

    myContainer = new JPanel() {
      @Override
      public void addNotify() {
        super.addNotify();
        myIsInFiguresHierarchy = true;
      }

      @Override
      public void removeNotify() {
        myIsInFiguresHierarchy = false;
        super.removeNotify();
      }
    };
    myContainer.setMinimumSize(new Dimension(0, 0));
    myContainer.setLayout(new BorderLayout());
    myContainer.add(myScrollPane, BorderLayout.CENTER);

    myScrollPane.setBorder(new LineBorder(Color.LIGHT_GRAY));

    if (showErrorsGutter) {
      myContainer.add(myMessagesGutter, BorderLayout.EAST);
    }

    myNodeSubstituteChooser = new NodeSubstituteChooser(this);

    // --- keyboard handling ---
    myKbdHandlersStack = new Stack<KeyboardHandler>();
    myKbdHandlersStack.push(new EditorComponentKeyboardHandler());

    // --- init action map --   
    myActionMap = new HashMap<CellActionType, EditorCellAction>();
    // -- navigation
    myActionMap.put(CellActionType.LEFT, new NodeEditorActions.MoveLeft());
    myActionMap.put(CellActionType.RIGHT, new NodeEditorActions.MoveRight());
    myActionMap.put(CellActionType.UP, new NodeEditorActions.MoveUp());
    myActionMap.put(CellActionType.DOWN, new NodeEditorActions.MoveDown());
    myActionMap.put(CellActionType.NEXT, new NodeEditorActions.MoveNext());
    myActionMap.put(CellActionType.PREV, new NodeEditorActions.MovePrev());
    myActionMap.put(CellActionType.LOCAL_HOME, new NodeEditorActions.MoveLocal(true));
    myActionMap.put(CellActionType.LOCAL_END, new NodeEditorActions.MoveLocal(false));

    myActionMap.put(CellActionType.ROOT_HOME, new NodeEditorActions.MoveToRoot(true));
    myActionMap.put(CellActionType.ROOT_END, new NodeEditorActions.MoveToRoot(false));
    myActionMap.put(CellActionType.HOME, new NodeEditorActions.MoveHome());
    myActionMap.put(CellActionType.END, new NodeEditorActions.MoveEnd());
    myActionMap.put(CellActionType.PAGE_DOWN, new NodeEditorActions.MovePageUp());
    myActionMap.put(CellActionType.PAGE_UP, new NodeEditorActions.MovePageDown());

    myActionMap.put(CellActionType.SELECT_UP, new NodeEditorActions.SelectUp());
    myActionMap.put(CellActionType.SELECT_DOWN, new NodeEditorActions.SelectDown());
    myActionMap.put(CellActionType.SELECT_RIGHT, new NodeEditorActions.SideSelect(CellSide.RIGHT));
    myActionMap.put(CellActionType.SELECT_LEFT, new NodeEditorActions.SideSelect(CellSide.LEFT));
    myActionMap.put(CellActionType.SELECT_NEXT, new NodeEditorActions.EnlargeSelection(true));
    myActionMap.put(CellActionType.SELECT_PREVIOUS, new NodeEditorActions.EnlargeSelection(false));

    myActionMap.put(CellActionType.COPY, new CellAction_CopyNode());
    myActionMap.put(CellActionType.CUT, new CellAction_CutNode());
    myActionMap.put(CellActionType.PASTE, new CellAction_PasteNode());
    myActionMap.put(CellActionType.PASTE_BEFORE, new CellAction_PasteNodeRelative(true));
    myActionMap.put(CellActionType.PASTE_AFTER, new CellAction_PasteNodeRelative(false));

    myActionMap.put(CellActionType.FOLD, new CellAction_FoldCell());
    myActionMap.put(CellActionType.UNFOLD, new CellAction_UnfoldCell());
    myActionMap.put(CellActionType.FOLD_ALL, new CellAction_FoldAll());
    myActionMap.put(CellActionType.UNFOLD_ALL, new CellAction_UnfoldAll());
    myActionMap.put(CellActionType.TOGGLE_FOLDING, new CallAction_ToggleCellFolding());

    myActionMap.put(CellActionType.RIGHT_TRANSFORM, new CellAction_SideTransform(CellSide.RIGHT));
    myActionMap.put(CellActionType.LEFT_TRANSFORM, new CellAction_SideTransform(CellSide.LEFT));

    myActionMap.put(CellActionType.COMPLETE, new NodeEditorActions.Complete());
    myActionMap.put(CellActionType.COMPLETE_SMART, new CompleteSmart());

    myActionMap.put(CellActionType.COMPLETE_NO_AUTO, new CompleteNoAuto()); // RE-3611

    myActionMap.put(CellActionType.SHOW_MESSAGE, new ShowMessage());

    registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        goToNextErrorCell(false);
      }
    }, KeyStroke.getKeyStroke("F2"), WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

    registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        goToNextErrorCell(true);
      }
    }, KeyStroke.getKeyStroke("shift F2"), WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

    registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        goToNextHighlightedCell(false);
      }
    }, KeyStroke.getKeyStroke("F3"), WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

    registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        goToNextHighlightedCell(true);
      }
    }, KeyStroke.getKeyStroke("shift F3"), WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

    registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        final EditorCell cell = getSelectedCell();
        if (cell == null) return;
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            showPopupMenu(cell.getX(), cell.getY());
          }
        });
      }
    }, KeyStroke.getKeyStroke("CONTEXT_MENU"), WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

    addMouseListener(new MouseAdapter() {
      public void mousePressed(final MouseEvent e) {
        if (areMouseEventsBlocked()) {
          return;
        }
        if (e.isPopupTrigger()) {
          processPopupMenu(e);
        } else {
          processMousePressed(e);
        }
      }

      public void mouseClicked(MouseEvent e) {
        if (areMouseEventsBlocked()) {
          return;
        }
        EditorCell selectedCell = getSelectedCell();
        if (e.getClickCount() == 2 && myRootCell.findLeaf(e.getX(), e.getY()) == selectedCell &&
          selectedCell instanceof EditorCell_Label) {
          ((EditorCell_Label) selectedCell).selectAll();
          repaint();
        }
      }

      public void mouseReleased(MouseEvent e) {
        if (areMouseEventsBlocked()) {
          return;
        }
        if (e.isPopupTrigger()) {
          processPopupMenu(e);
        }
        super.mouseReleased(e);
      }
    });

    addKeyListener(new KeyAdapter() {
      public void keyPressed(final KeyEvent e) {
        processKeyPressed(e);
      }

      public void keyTyped(KeyEvent e) {
        processKeyTyped(e);
      }

      public void keyReleased(final KeyEvent e) {
        processKeyReleased(e);
      }
    });

    myLeftHighlighter = new LeftEditorHighlighter(this, rightToLeft);
    myLeftHighlighter.addMouseListener(new MouseAdapter() {
      @Override
      public void mousePressed(MouseEvent e) {
        for (LeftMarginMouseListener listener : new ArrayList<LeftMarginMouseListener>(myLeftMarginPressListeners)) {
          listener.mousePressed(e, EditorComponent.this);
        }
      }

      @Override
      public void mouseReleased(MouseEvent e) {
        for (LeftMarginMouseListener listener : new ArrayList<LeftMarginMouseListener>(myLeftMarginPressListeners)) {
          listener.mouseReleased(e, EditorComponent.this);
        }
      }

      @Override
      public void mouseClicked(MouseEvent e) {
        for (LeftMarginMouseListener listener : new ArrayList<LeftMarginMouseListener>(myLeftMarginPressListeners)) {
          listener.mouseClicked(e, EditorComponent.this);
        }
      }
    });
    myScrollPane.setRowHeaderView(myLeftHighlighter);

    addFocusListener(new FocusListener() {
      public void focusGained(FocusEvent e) {
        if (isDisposed()) {
          return;
        }
        if (getSelectionManager().getSelection() == null) {
          EditorCell rootCell = getRootCell();
          if (rootCell instanceof EditorCell_Collection) {
            EditorCell focusPolicyCell = FocusPolicyUtil.findCellToSelectDueToFocusPolicy(rootCell);
            EditorCell toSelect;
            if (focusPolicyCell == null || (focusPolicyCell == rootCell && !focusPolicyCell.hasFocusPolicy())) {
              toSelect = rootCell.findChild(CellFinders.or(CellFinders.FIRST_EDITABLE, CellFinders.FIRST_SELECTABLE_LEAF));
            } else {
              toSelect = focusPolicyCell;
            }
            if (toSelect == null) toSelect = rootCell;
            changeSelection(toSelect);
            repaint();
            return;
          }
          if (rootCell != null && rootCell.isSelectable()) {
            changeSelection(rootCell);
          }
        }
        repaint();
      }

      public void focusLost(FocusEvent e) {
        repaint();
        if (myNodeSubstituteChooser.getWindow() != null &&
          (myNodeSubstituteChooser.getWindow().isAncestorOf(e.getOppositeComponent()) || myNodeSubstituteChooser.getWindow() == e.getOppositeComponent()))
          return;
        deactivateSubstituteChooser();
      }
    });

    myIntentionsSupport = new IntentionsSupport(this);
    myAutoValidator = new AutoValidator(this);

    MPSToolTipManager.getInstance().registerComponent(this);

    CaretBlinker.getInstance().registerEditor(this);

    KeyboardFocusManager.getCurrentKeyboardFocusManager().addPropertyChangeListener("focusOwner", myFocusListener = new PropertyChangeListener() {
      public void propertyChange(PropertyChangeEvent evt) {
        Component focusOwner = KeyboardFocusManager.getCurrentKeyboardFocusManager().getFocusOwner();
        if (EditorComponent.this.isAncestorOf(focusOwner)) {
          Component current = focusOwner;
          while (current.getParent() != EditorComponent.this) {
            current = current.getParent();
          }
          selectComponentCell(current);
        }
      }
    });
    EditorSettings.getInstance().addEditorSettingsListener(mySettingsListener);
    ClassLoaderManager.getInstance().addReloadHandler(myReloadListener);

    addFocusListener(new FocusAdapter() {
      public void focusLost(FocusEvent e) {
        commitAll();
      }
    });

    getSelectionManager().addSelectionListener(new SelectionListener() {
      @Override
      public void selectionChanged(EditorComponent editorComponent, Selection oldSelection, Selection newSelection) {
        updateStatusBarMessage();
      }
    });
  }

  protected void notifyCreation() {
    if (myOperationContext == null) {
      LOG.warning("Trying to notify EditorComponent creation with null operation context");
    } else {
      if (myOperationContext.getProject() == null) {
        return;
      }
      EditorComponentCreateListener listener = myOperationContext.getProject().getMessageBus().syncPublisher(EditorComponentCreateListener.EDITOR_COMPONENT_CREATION);
      listener.editorComponentCreated(this);
    }
  }

  protected void notifyDisposal() {
    if (myOperationContext == null) {
      LOG.warning("Trying to notify disposal with empty operation context");
      return;
    }
    if (myOperationContext.getProject() == null) {
      return;
    }
    if (myOperationContext.getProject().isDisposed()) {
      LOG.error("Trying to notify disposal of EditorComponent related to disposed project. This may cause memory leaks.");
      return;
    }
    EditorComponentCreateListener listener = myOperationContext.getProject().getMessageBus().syncPublisher(EditorComponentCreateListener.EDITOR_COMPONENT_CREATION);
    listener.editorComponentDisposed(this);
  }

  public boolean onEscape() {
    return false;
  }

  public void setNoVirtualFile(boolean noVirtualFile) {
    myNoVirtualFile = noVirtualFile;
  }

  public int getShiftX() {
    return myShiftX;
  }

  public JViewport getViewport() {
    return myScrollPane.getViewport();
  }

  @NotNull
  public MyScrollBar getVerticalScrollBar() {
    return myVerticalScrollBar;
  }

  public SNode getSelectedNode() {
    EditorCell selectedCell = getSelectedCell();
    if (selectedCell == null) {
      return null;
    }
    return selectedCell.getSNode();
  }

  public List<SNode> getSelectedNodes() {
    Selection selection = mySelectionManager.getSelection();
    return selection != null ? selection.getSelectedNodes() : Collections.<SNode>emptyList();
  }

  public EditorMessageOwner getHighlightMessagesOwner() {
    return myOwner;
  }

  @CodeOrchestraPatch
  public void moveCurrentUp() {
    // RE-3600
    EditorCell selectedCell = getSelectedCell();
    if (selectedCell != null) {
      if (selectedCell.canExecuteAction(CellActionType.MOVE_NODES_UP)) {
        selectedCell.executeAction(CellActionType.MOVE_NODES_UP);
        return;
      }
    }

    Selection selection = getSelectionManager().getSelection();
    if (selection instanceof SingularSelection || selection instanceof NodeRangeSelection) {
      new IntelligentNodeMover(getEditorContext(), getSelectedNodes(), false).move();
    }
  }

  @CodeOrchestraPatch
  public void moveCurrentDown() {
    // RE-3600
    EditorCell selectedCell = getSelectedCell();
    if (selectedCell != null) {
      if (selectedCell.canExecuteAction(CellActionType.MOVE_NODES_DOWN)) {
        selectedCell.executeAction(CellActionType.MOVE_NODES_DOWN);
        return;
      }
    }

    Selection selection = getSelectionManager().getSelection();
    if (selection instanceof SingularSelection || selection instanceof NodeRangeSelection) {
      new IntelligentNodeMover(getEditorContext(), getSelectedNodes(), true).move();
    }
  }

  private void goToNextErrorCell(boolean backwards) {
    if (getSelectedCell() == null) {
      return;
    }
    new CellNavigator(this) {
      boolean isSuitableCell(EditorCell cell) {
        if (cell.hasErrorMessages()) {
          return true;
        }
        return false;

      }
    }.goToNextCell(backwards);
  }

  private void goToNextHighlightedCell(boolean backwards) {
    if (getSelectedCell() == null) {
      return;
    }
    new CellNavigator(this) {
      boolean isSuitableCell(EditorCell cell) {
        for (EditorMessage m : getHighlightManager().getMessagesFor(cell.getSNode())) {
          if (m.getOwner() == getHighlightMessagesOwner()) {
            return true;
          }
        }
        return false;
      }
    }.goToNextCell(backwards);
  }

  public SNode getEditedNode() {
    return myNode;
  }

  @Nullable
  public MPSNodeVirtualFile getVirtualFile() {
    return myVirtualFile;
  }

  public SNodePointer getEditedNodePointer() {
    return myNodePointer;
  }

  public String getMPSTooltipText(final MouseEvent event) {
    return ModelAccess.instance().tryRead(new Computable<String>() {
      public String compute() {
        if (myRootCell == null) {
          return null;
        }

        EditorCell cell = myRootCell.findLeaf(event.getX(), event.getY());
        if (cell == null) {
          return null;
        }
        return getMessageTextFor(cell);
      }
    });
  }

  @Override
  public Point getToolTipLocation(final MouseEvent event) {
    return ModelAccess.instance().tryRead(new Computable<Point>() {
      public Point compute() {
        if (myRootCell == null) {
          return null;
        }

        EditorCell cell = myRootCell.findLeaf(event.getX(), event.getY());
        if (cell == null) {
          return null;
        }
        if (getMessageTextFor(cell) != null) {
          return new Point(event.getX(), event.getY());
        } else {
          return null;
        }
      }
    });
  }

  public void updateStatusBarMessage() {
    ModelAccess.instance().runReadInEDT(new Runnable() {
      public void run() {
        if (!isFocusOwner()) return;
        if (getOperationContext() == null || getOperationContext().getProject() == null) return;
        if (isProjectDisposed()) return;

        EditorCell selection = getSelectedCell();
        String info = "";
        if (selection != null) {
          String message = getMessageTextFor(selection);
          if (message != null) {
            info = message;
          }
        }

        Project project = getOperationContext().getProject();
        IdeFrame ideFrame = WindowManager.getInstance().getIdeFrame(project);
        StatusBarEx statusBar = (StatusBarEx) ideFrame.getStatusBar();

        //current info is significant or the editor removes its own message
        if (!info.equals("") || myLastWrittenStatus.equals(statusBar.getInfo())) {
          statusBar.setInfo(info);
          if (!info.equals("")) {
            myLastWrittenStatus = info;
          }
        }
      }
    });
  }

  private String getMessageTextFor(EditorCell cell) {
    EditorMessage message = getHighlighterMessageFor(cell);
    if (message != null) {
      return message.getMessage();
    }
    return null;
  }

  private HighlighterMessage getHighlighterMessageFor(EditorCell cell) {
    EditorCell parent = cell;
    while (parent != null) {
      if (cell.getBounds().getMaxY() < parent.getBounds().getMaxY() && parent.getSNode() != cell.getSNode()) {
        return null;
      }
      List<HighlighterMessage> messages = parent.getMessages(HighlighterMessage.class);
      if (!messages.isEmpty()) {
        return messages.get(0);
      }
      parent = parent.getParent();
    }

    return null;
  }

  public IErrorReporter getErrorReporterFor(EditorCell cell) {
    HighlighterMessage message = getHighlighterMessageFor(cell);
    if (message == null) return null;
    return message.getErrorReporter();
  }

  public void showMessageTooltip() {
    EditorCell cell = getSelectedCell();
    if (cell == null) {
      return;
    }
    String text = getMessageTextFor(cell);
    Point point = new Point(cell.getX(), cell.getY() + cell.getHeight());
    MPSToolTipManager.getInstance().showToolTip(text, this, point);
  }


  @Override
  public boolean isFocusOwner() {
    if (inTestMode)
    {
      return true;
    }
    return super.isFocusOwner();    //To change body of overridden methods use File | Settings | File Templates.
  }

  public void hideMessageToolTip() {
    MPSToolTipManager.getInstance().hideToolTip();
  }

  public void editNode(SNode node, IOperationContext operationContext) {
    if (operationContext == null) {
      LOG.errorWithTrace("Opening editor with null context");
    }
    setOperationContext(operationContext);
    editNode(node);
    setReadOnly(node == null || node.isDeleted() || node.getModel().isNotEditable());
  }

  protected void editNode(final SNode node) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        IOperationContext operationContext = getOperationContext();
        disposeTypeCheckingContext();
        myNode = node;
        myNodePointer = myNode != null ? new SNodePointer(myNode) : null;
        myVirtualFile = myNode != null && !myNoVirtualFile ? MPSNodesVirtualFileSystem.getInstance().getFileFor(node) : null;
        SModel model = node == null ? null : node.getModel();
        setEditorContext(new EditorContext(EditorComponent.this, model, operationContext));
        rebuildEditorContent();
        getTypeCheckingContext();
      }
    });
  }

  public void addAdditionalPainter(AdditionalPainter additionalPainter) {
    synchronized (myAdditionalPaintersLock) {
      if (!myAdditionalPainters.contains(additionalPainter)) {
        myAdditionalPainters.add(additionalPainter);
        myItemsToAdditionalPainters.put(additionalPainter.getItem(), additionalPainter);
        additionalPainter.afterAdding(this);
      }
    }
  }

  public void removeAdditionalPainter(AdditionalPainter additionalPainter) {
    synchronized (myAdditionalPaintersLock) {
      if (myAdditionalPainters.contains(additionalPainter)) {
        additionalPainter.beforeRemoval(this);
        myAdditionalPainters.remove(additionalPainter);
        myItemsToAdditionalPainters.remove(additionalPainter.getItem());
      }
    }
  }

  public void removeAdditionalPainterByItem(Object item) {
    synchronized (myAdditionalPaintersLock) {
      AdditionalPainter additionalPainter = myItemsToAdditionalPainters.get(item);
      if (additionalPainter != null) {
        additionalPainter.beforeRemoval(this);
        myItemsToAdditionalPainters.remove(item);
        myAdditionalPainters.remove(additionalPainter);
      }
    }
  }

  public Color getAdditionalCellFontColor(@NotNull EditorCell_Label cell) {
    synchronized (myAdditionalPaintersLock) {
      for (AdditionalPainter additionalPainter : myAdditionalPainters) {
        Rectangle coverageArea = additionalPainter.getCoverageArea(this);
        if (coverageArea != null) {
          if (coverageArea.contains(cell.getBounds())) {
            Color color = additionalPainter.getCellsFontColor(cell);
            if (color != null) return color;
          }
        }
      }
      return null;
    }
  }

  public AdditionalPainter getAdditionalPainterByItem(Object item) {
    synchronized (myAdditionalPaintersLock) {
      AdditionalPainter additionalPainter = myItemsToAdditionalPainters.get(item);
      return additionalPainter;
    }
  }

  public List<AdditionalPainter> getAdditionalPainters() {
    List<AdditionalPainter> result;
    synchronized (myAdditionalPaintersLock) {
      result = new ArrayList<AdditionalPainter>(myAdditionalPainters);
    }
    return result;
  }

  // TODO pool this method up to NodeEditorComponent
  @NotNull
  public MessagesGutter getMessagesGutter() {
    return myMessagesGutter;
  }

  @NotNull
  public LeftEditorHighlighter getLeftEditorHighlighter() {
    return myLeftHighlighter;
  }

  @NotNull
  public SearchPanel getSearchPanel() {
    if (mySearchPanel == null) {
      mySearchPanel = new SearchPanel(this);
    }
    return mySearchPanel;
  }

  public boolean isSearchPanelVisible() {
    return mySearchPanel != null && mySearchPanel.isVisible();
  }

  public JPanel getUpperPanel() {
    if (myUpperPanel == null) {
      myUpperPanel = new JPanel();
      myUpperPanel.setLayout(new GridLayout(0, 1));
      myContainer.add(myUpperPanel, BorderLayout.NORTH);
    }
    return myUpperPanel;
  }

  public void addUpperComponent(JComponent component) {
    getUpperPanel().add(component);
  }

  public void addUpperComponent(JComponent component, String id) {
    getUpperPanel().add(component);
    myUpperComponents.put(id, component);
  }

  public void removeUpperComponent(JComponent component) {
    if (myUpperPanel == null) return;
    getUpperPanel().remove(component);
    for (String key : new HashSet<String>(myUpperComponents.keySet())) {
      if (component == myUpperComponents) {
        myUpperComponents.remove(key);
      }
    }
  }

  public void removeUpperComponent(String id) {
    JComponent component = myUpperComponents.get(id);
    if (component != null) {
      removeUpperComponent(component);
    }
  }

  public void updateMessages() {

    //todo remove
    getExternalComponent().repaint();
  }

  protected Set<EditorMessage> getMessages() {
    return new LinkedHashSet<EditorMessage>(myHighlightManager.getMessages());
  }

  public IOperationContext getOperationContext() {
    return myOperationContext;
  }

  public void setOperationContext(IOperationContext operationContext) {
    assert operationContext == null || operationContext.getModule() != null || operationContext.isTestMode();
    myOperationContext = operationContext;
  }

  private EditorCell_Component findCellForComponent(Component component, EditorCell root) {
    if (root instanceof EditorCell_Component && ((EditorCell_Component) root).getComponent() == component) {
      return (EditorCell_Component) root;
    }

    if (root instanceof EditorCell_Collection) {
      EditorCell_Collection collection = (EditorCell_Collection) root;
      for (EditorCell cell : collection) {
        EditorCell_Component result = findCellForComponent(component, cell);
        if (result != null) return result;
      }
    }

    return null;
  }

  private void processPopupMenu(final MouseEvent e) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        showPopupMenu(e);
      }
    });
  }

  private void showPopupMenu(MouseEvent e) {
    showPopupMenu(e.getX(), e.getY());
  }

  private void showPopupMenu(int x, int y) {
    if (!myPopupMenuEnabled) {
      return;
    }
    BaseGroup baseGroup = ActionUtils.getGroup(EDITOR_POPUP_MENU_ACTIONS);
    if (baseGroup == null) return;

    baseGroup.setPopup(false);

    DefaultActionGroup group = ActionUtils.groupFromActions(
      baseGroup,
      new Separator(),
      // RE-1321
      getGenerateIntentionsGroup(),
      getIntentionsGroup(),
      getCellActionsGroup()
    );

    JPopupMenu popupMenu = ActionManager.getInstance().createActionPopupMenu(ActionPlaces.EDITOR_POPUP, group).getComponent();
    popupMenu.show(EditorComponent.this, x, y);
  }

  @CodeOrchestraPatch
  private DefaultActionGroup getGenerateIntentionsGroup() {
    DefaultActionGroup result = new DefaultActionGroup("Generate", true);
    final EditorContext context = getEditorContext();
    for (final com.intellij.openapi.util.Pair<GenerateIntention, SNode> pair : getAvailableGenerateIntentions()) {
      String description = pair.first.getDescription(pair.second, context);
      Icon icon = pair.first.getType().getIcon();
      BaseAction mpsAction = new BaseAction(description, "Execute intention", icon) {
        @Override
        protected boolean isEnabledInASView() {
          return true;
        }

        protected void doExecute(AnActionEvent e, Map<String, Object> params) {
          SwingUtilities.invokeLater(new Runnable() {
            public void run() {
              final IntentionContext intentionContext = new IntentionContext();
              final GenerateIntention generateIntention = (GenerateIntention) pair.getFirst();
              if (generateIntention.executeUI(pair.getSecond(), context, intentionContext)) {
                ModelAccess.instance().runWriteActionInCommand(new Runnable() {
                  public void run() {
                    generateIntention.execute(pair.getSecond(), context, intentionContext);
                  }
                });
              }
            }
          });
        }
      };
      mpsAction.addPlace(ActionPlace.EDITOR);
      result.add(mpsAction);
    }
    return result;
  }

  private Set<com.intellij.openapi.util.Pair<GenerateIntention, SNode>> getAvailableGenerateIntentions() {
    final Set<com.intellij.openapi.util.Pair<GenerateIntention, SNode>> result = new LinkedHashSet<com.intellij.openapi.util.Pair<GenerateIntention, SNode>>();
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        SNode node = getSelectedNode();
        EditorContext editorContext = getEditorContext();
        if (node != null && editorContext != null) {
          QueryDescriptor query = new QueryDescriptor();
          query.setIntentionClass(GenerateIntention.class);
          query.setInstantiate(true);
          final Collection<com.intellij.openapi.util.Pair<Intention,SNode>> pairCollection = IntentionsManager.getInstance().getAvailableIntentions(query, node, editorContext);
          for (com.intellij.openapi.util.Pair<Intention,SNode> intentionPair : pairCollection) {
            result.add(new com.intellij.openapi.util.Pair((GenerateIntention) intentionPair.first, intentionPair.second));
          }
        }
      }
    });
    return result;
  }

  private DefaultActionGroup getIntentionsGroup() {
    DefaultActionGroup result = new DefaultActionGroup("Intentions", true);
    final EditorContext context = getEditorContext();
    for (final com.intellij.openapi.util.Pair<Intention, SNode> pair : getAvailableIntentions()) {
      String description = pair.first.getDescription(pair.second, context);
      Icon icon = pair.first.getType().getIcon();
      BaseAction mpsAction = new BaseAction(description, "Execute intention", icon) {
        @Override
        protected boolean isEnabledInASView() {
          return true;
        }
        protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
          executeIntention(pair.first, pair.second, context);
        }
      };
      mpsAction.addPlace(ActionPlace.EDITOR);
      result.add(mpsAction);
    }
    return result;
  }

  private Set<com.intellij.openapi.util.Pair<Intention, SNode>> getAvailableIntentions() {
    final Set<com.intellij.openapi.util.Pair<Intention, SNode>> result = new LinkedHashSet<com.intellij.openapi.util.Pair<Intention, SNode>>();
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        SNode node = getSelectedNode();
        EditorContext editorContext = getEditorContext();
        if (node != null && editorContext != null) {
          QueryDescriptor query = new QueryDescriptor();
          query.setIntentionClass(BaseIntention.class);
          query.setInstantiate(true);
          result.addAll(IntentionsManager.getInstance().getAvailableIntentions(query, node, editorContext));
        }
      }
    });
    return result;
  }


  public void executeIntention(final Intention intention, final SNode node, final EditorContext context) {
    context.executeCommand(new Runnable() {
      public void run() {
        try {
          intention.execute(node, context);
        } catch (Throwable t) {
          LOG.error("Intention execution failed: " + t.getMessage(), t);
        }
      }
    });
  }

  private DefaultActionGroup getCellActionsGroup() {
    DefaultActionGroup result = new DefaultActionGroup("Cell actions", true);
    result.setPopup(false);
    EditorCell cell = getSelectedCell();

    final EditorContext editorContext = createEditorContextForActions();
    for (final EditorCellKeyMapAction action : KeyMapUtil.getRegisteredActions(cell, editorContext)) {
      try {
        if (!(action.isShownInPopupMenu() && action.canExecute(null, editorContext))) continue;
        BaseAction mpsAction = new MyBaseAction(action, editorContext);
        mpsAction.addPlace(ActionPlace.EDITOR);
        result.add(mpsAction);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }

    return result;
  }

  private EditorContext createEditorContextForActions() {
    return new EditorContext(this, null, getOperationContext());
  }

  private void selectComponentCell(Component component) {
    EditorCell_Component cell = findCellForComponent(component, myRootCell);
    if (cell == null) return;
    changeSelection(cell);
  }

  @NotNull
  public JComponent getExternalComponent() {
    return myContainer;
  }

  public EditorContext getEditorContext() {
    return myEditorContext;
  }

  public EditorCell createRootCell() {
    return createRootCell(null);
  }

  protected abstract EditorCell createRootCell(List<SModelEvent> events);

  public void setFolded(EditorCell cell, boolean folded) {
    if (folded) {
      myFoldedCells.add(cell);
    } else {
      myFoldedCells.remove(cell);
    }
  }

  public Set<EditorCell> getFoldedCells() {
    return new HashSet<EditorCell>(myFoldedCells);
  }

  void clearFoldedCells() {
    myFoldedCells.clear();
  }

  public void setBracesEnabled(EditorCell cell, boolean enabled) {
    if (enabled) {
      myBracesEnabledCells.add(cell);
    } else {
      myBracesEnabledCells.remove(cell);
    }
  }

  public Set<EditorCell> getBracesEnabledCells() {
    return new HashSet<EditorCell>(myBracesEnabledCells);
  }

  void clearBracesEnabledCells() {
    myBracesEnabledCells.clear();
  }

  public void flushEvents() {
    // RF-630
    if (!myEventsCollector.isDisposed()) {
      myEventsCollector.flush();
    }
  }

  public void dispose() {
    if (myDisposed) throw new IllegalStateException(myDisposedTrace);
    fireEditorWillBeDisposed();
    myDisposed = true;
    myDisposedTrace = new Throwable("Editor was disposed by: ");
    if (!MPSCore.getInstance().isTestMode()) {
      hideMessageToolTip();
    }

    disposeTypeCheckingContext();
    myHighlightManager.dispose();

    removeOurListeners();

    EditorSettings.getInstance().removeEditorSettingsListener(mySettingsListener);
    ClassLoaderManager.getInstance().removeReloadHandler(myReloadListener);
    KeyboardFocusManager.getCurrentKeyboardFocusManager().removePropertyChangeListener("focusOwner", myFocusListener);

    clearCaches();

    myEventsCollector.dispose();
    myLeftHighlighter.dispose();
    myMessagesGutter.dispose();

    setEditorContext(null);

    if (myNodeSubstituteChooser != null) {
      myNodeSubstituteChooser.dispose();
    }
    if (myRootCell != null) {
      ((EditorCell_Basic) myRootCell).onRemove();
      myRootCell = null;
    }
    mySelectionManager.dispose();

    myLeftMarginPressListeners.clear();
  }

  public boolean hasValidSelectedNode() {
    SNode selectedNode = getSelectedNode();
    return selectedNode != null && selectedNode.getModel() != null;
  }

  public boolean isDisposed() {
    return myDisposed;
  }

  /*
    Can be used to check if editor is in valid state or not.
    Editor can be in invalid state then corresponding model
    was reloaded, but current editor instance was not
    updated yet.
   */
  private boolean isInvalid() {
    return getEditorContext() == null ||
      getEditedNode() == null ||
      getEditedNode().isDisposed() ||
      getEditedNode().getModel() == null ||
      getEditedNode().getModel().isDisposed() ||
      getEditedNode().getModel().getModelDescriptor() == null;
  }

  private void addOurListeners(@NotNull SModelDescriptor sm) {
    myEventsCollector.add(sm);
    sm.addModelListener(mySimpleModelListener);
    myModelDescriptorsWithListener.add(sm);
  }

  private void removeOurListeners(@NotNull SModelDescriptor sm) {
    myEventsCollector.remove(sm);
    sm.removeModelListener(mySimpleModelListener);
    myModelDescriptorsWithListener.remove(sm);
  }

  private void removeOurListeners() {
    for (SModelDescriptor sm : myModelDescriptorsWithListener.toArray(new SModelDescriptor[myModelDescriptorsWithListener.size()])) {
      removeOurListeners(sm);
    }
  }

  private void clearCaches() {
    myCellsToNodesToDependOnMap.clear();
    removeOurListeners();
    myCellsToRefTargetsToDependOnMap.clear();
    myNodesToBigCellsMap.clear();
    myNodePropertiesAccessedCleanlyToDependentCellsMap.clear();
    myNodePropertiesAccessedDirtilyToDependentCellsMap.clear();
    myNodePropertiesWhichExistenceWasCheckedToDependentCellsMap.clear();
  }

  private void setRootCell(EditorCell rootCell) {
    Set<SNode> oldNodesToDependOn = myCellsToNodesToDependOnMap.get(myRootCell);
    Set<SNodePointer> oldRefTargetsToDependsOn = myCellsToRefTargetsToDependOnMap.get(myRootCell);

    if (myRootCell != null) {
      ((EditorCell_Basic) myRootCell).onRemove();
    }

    myRootCell = rootCell;

    if (myRootCell != null) {
      ((EditorCell_Basic) myRootCell).onAdd();
    }

    Set<SModelDescriptor> oldModelsToDependOn = getModels(oldNodesToDependOn);
    Set<SModelDescriptor> newModelsToDependOn = getModels(myCellsToNodesToDependOnMap.get(myRootCell));
    oldModelsToDependOn.addAll(getModelsAndPurgeOrphaned(oldRefTargetsToDependsOn));
    newModelsToDependOn.addAll(getModelsAndPurgeOrphaned(myCellsToRefTargetsToDependOnMap.get(myRootCell)));

    for (SModelDescriptor newDep : newModelsToDependOn) {
      if (!oldModelsToDependOn.contains(newDep)) {
        addOurListeners(newDep);
      }
    }
    for (SModelDescriptor oldDep : oldModelsToDependOn) {
      if (!newModelsToDependOn.contains(oldDep)) {
        removeOurListeners(oldDep);
      }
    }

    revalidate();
    repaint();
  }

  private Set<SModelDescriptor> getModelsAndPurgeOrphaned(Set<SNodePointer> nodePointers) {
    if (nodePointers == null) {
      return Collections.emptySet();
    }
    Set<SModelDescriptor> modelDescriptors = new HashSet<SModelDescriptor>();
    Set<SNodePointer> nodeProxiesToDelete = new HashSet<SNodePointer>();
    for (SNodePointer nodeProxy : nodePointers) {
      SModelDescriptor model = nodeProxy.getModel();
      if (model == null) {
        nodeProxiesToDelete.add(nodeProxy);
      } else {
        modelDescriptors.add(model);
      }
    }
    nodePointers.removeAll(nodeProxiesToDelete);
    return modelDescriptors;
  }

  private Set<SModelDescriptor> getModels(@Nullable Set<SNode> nodes) {
    if (nodes == null) {
      return Collections.emptySet();
    }
    Set<SModelDescriptor> result = new HashSet<SModelDescriptor>();
    for (SNode node : nodes) {
      SModelDescriptor modelDescriptor = node.getModel().getModelDescriptor();
      if (modelDescriptor != null) {
        result.add(modelDescriptor);
      }
    }
    return result;
  }

  public EditorCell getRootCell() {
    return myRootCell;
  }

  @NotNull
  public NodeHighlightManager getHighlightManager() {
    return myHighlightManager;
  }

  public CellActionType getActionType(KeyEvent keyEvent, EditorContext editorContext) {
    if (keyEvent.getKeyCode() == KeyEvent.VK_HOME && shiftDown(keyEvent)) {
      return CellActionType.SELECT_HOME;
    }
    if (keyEvent.getKeyCode() == KeyEvent.VK_END && shiftDown(keyEvent)) {
      return CellActionType.SELECT_END;
    }
    if (keyEvent.getKeyCode() == KeyEvent.VK_PAGE_DOWN && noKeysDown(keyEvent)) {
      return CellActionType.PAGE_DOWN;
    }
    if (keyEvent.getKeyCode() == KeyEvent.VK_PAGE_UP && noKeysDown(keyEvent)) {
      return CellActionType.PAGE_UP;
    }
    if (keyEvent.getKeyCode() == KeyEvent.VK_TAB && noKeysDown(keyEvent)) {
      return CellActionType.NEXT;
    }
    if (keyEvent.getKeyCode() == KeyEvent.VK_TAB && shiftDown(keyEvent)) {
      return CellActionType.PREV;
    }

    // RE-1600
    Shortcut[] codeCompletions = KeymapManager.getInstance().getActiveKeymap().getShortcuts("CodeCompletion");
    KeyStroke keyStroke = KeyStroke.getKeyStrokeForEvent(keyEvent);
    for (Shortcut shortcut : codeCompletions) {
      if (shortcut instanceof KeyboardShortcut) {
        KeyboardShortcut completitionShortcut = (KeyboardShortcut) shortcut;
        if (keyStroke != null) {
          if (keyStroke.equals(completitionShortcut.getFirstKeyStroke())) {
            return CellActionType.COMPLETE;
          }
        }
      }
    }
    /*
    if (keyEvent.getKeyCode() == KeyEvent.VK_SPACE && ctrlDown(keyEvent)) {
      return CellActionType.COMPLETE;
    }
    */

    // RE-3291
    Shortcut[] smartCodeCompletions = KeymapManager.getInstance().getActiveKeymap().getShortcuts("SmartTypeCompletion");
    for (Shortcut shortcut : smartCodeCompletions) {
      if (shortcut instanceof KeyboardShortcut) {
        KeyboardShortcut completitionShortcut = (KeyboardShortcut) shortcut;
        if (keyStroke != null) {
          if (keyStroke.equals(completitionShortcut.getFirstKeyStroke())) {
            return CellActionType.COMPLETE_SMART;
          }
        }
      }
    }
    /*
    if (keyEvent.getKeyCode() == KeyEvent.VK_SPACE && ctrlShiftDown(keyEvent)) {
      return CellActionType.COMPLETE_SMART;
    }
    */

    if (keyEvent.getModifiers() == KeyEvent.CTRL_MASK && keyEvent.getKeyCode() == KeyEvent.VK_F1) {
      return CellActionType.SHOW_MESSAGE;
    }

    // ---
    if (keyTyped(keyEvent) && keyEvent.getKeyChar() == ' ' && noKeysDown(keyEvent)) {
      EditorCell selectedCell = editorContext.getNodeEditorComponent().getSelectedCell();

      if (!(selectedCell instanceof EditorCell_STHint)) {
        if (!(selectedCell instanceof EditorCell_Label)) {
          return CellActionType.RIGHT_TRANSFORM;
        }
        EditorCell_Label labelCell = (EditorCell_Label) selectedCell;

        // caret at the end of text ?
        String text = labelCell.getText();
        int caretPosition = labelCell.getCaretPosition();
        //System.out.println("text:" + text + " len:" + text.length() + "caret at:" + caretPosition);
        if (caretPosition == text.length()) {
          return CellActionType.RIGHT_TRANSFORM;
        }

        if (caretPosition == 0) {
          return CellActionType.LEFT_TRANSFORM;
        }
      }
    }
    return null;
  }

  private boolean ctrlShiftDown(KeyEvent keyEvent) {
    return keyEvent.getModifiers() == (KeyEvent.CTRL_MASK + KeyEvent.SHIFT_MASK);
  }

  private boolean shiftDown(KeyEvent keyEvent) {
    return keyEvent.getModifiers() == KeyEvent.SHIFT_MASK;
  }

  private boolean noKeysDown(KeyEvent keyEvent) {
    return keyEvent.getModifiers() == 0;
  }

  private boolean keyTyped(KeyEvent keyEvent) {
    return keyEvent.getID() == KeyEvent.KEY_TYPED;
  }

  private boolean ctrlDown(KeyEvent keyEvent) {
    return keyEvent.getModifiers() == KeyEvent.CTRL_MASK;
  }

  boolean executeComponentAction(CellActionType type) {
    final EditorCellAction action = getComponentAction(type);
    if (action != null && action.executeInCommand()) {
      executeCommand(new Runnable() {
        public void run() {
          EditorContext editorContext = getEditorContext();
          if (!editorContext.getOperationContext().isValid()) return;
          action.execute(editorContext);
        }
      });

      return true;
    }
    return false;
  }

  public EditorCellAction getComponentAction(final CellActionType type) {
    return ModelAccess.instance().runReadAction(new Computable<EditorCellAction>() {
      public EditorCellAction compute() {
        EditorCellAction action = myActionMap.get(type);
        if (action != null && action.canExecute(getEditorContext())) {
          return action;
        }
        return null;
      }
    });
  }

  public void relayout() {
    doRelayout();
    revalidate();
    repaint();
    myMessagesGutter.repaint();
  }

  public void revalidateAndRepaint() {
    myLeftHighlighter.relayout(false);
    repaint();
  }

  private void doRelayout() {
    if (myRootCell == null) return;

    myRootCell.setX(myShiftX);
    myRootCell.setY(myShiftY);
    myRootCell.relayout();
    myLeftHighlighter.relayout(true);
    if (mySearchPanel != null && mySearchPanel.isVisible()) {
      mySearchPanel.search(false);
    }
  }

  public void leftHighlightCell(EditorCell cell, Color c) {
    myLeftHighlighter.highlight(cell, cell, c);
  }

  public void leftHighlightCells(EditorCell cell, EditorCell cell2, Color c) {
    myLeftHighlighter.highlight(cell, cell2, c);
  }

  public void leftUnhighlightCell(EditorCell cell) {
    myLeftHighlighter.unHighlight(cell);
  }

  public void selectNode(final SNode node) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        EditorCell nodeCell = findNodeCell(node);
        if (nodeCell != null) {
          changeSelection(nodeCell);
        }
      }
    });
  }

  public void selectNode(final SNode node, final String cellId) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        EditorCell nodeCell = findCellWithId(node, cellId);
        if (nodeCell != null) {
          changeSelection(nodeCell);
        }
      }
    });
  }

  public void selectRefCell(SReference reference) {
    SNode sourceNode = reference.getSourceNode();
    String role = reference.getRole();
    EditorCell cell;
    if (role == null) {
      cell = findNodeCell(sourceNode);
    } else {
      cell = findNodeCellWithRole(sourceNode, role);
      if (cell == null) cell = findNodeCell(sourceNode);
    }
    if (cell == null) {
      return;
    }
    changeSelection(cell.getLastLeaf(CellConditions.SELECTABLE));
  }

  @Nullable
  public EditorCell findNodeCell(final SNode node) {
    WeakReference<EditorCell> weakReference = myNodesToBigCellsMap.get(node);
    if (weakReference == null) return null;
    EditorCell result = weakReference.get();
    if (result != null && (result.getRootParent() != getRootCell() || result.isUnderFolded())) {
      return null;
    }
    return result;
  }

  public EditorCell findNodeCellWithRole(SNode node, String role) {
    EditorCell rootCell = findNodeCell(node);
    if (rootCell == null) return null;
    return findNodeCellWithRole(rootCell, role, node);
  }

  private EditorCell findNodeCellWithRole(EditorCell rootCell, String role, SNode node) {
    if (role == null) return null;
    if (role.equals(rootCell.getCellRole()) && node == rootCell.getSNode()) {
      return rootCell;
    }
    if (rootCell instanceof EditorCell_Collection) {
      EditorCell_Collection collection = (EditorCell_Collection) rootCell;
      for (EditorCell child : collection) {
        EditorCell result = findNodeCellWithRole(child, role, node);
        if (result != null) return result;
      }
    }
    return null;
  }

  public EditorCell findCellWithId(SNode node, @NotNull String id) {
    EditorCell bigCell = findNodeCell(node);

    if (bigCell == null) {
      return null;
    }

    return findCellWithIdWithingBigCell(bigCell, id, node);
  }

  private EditorCell findCellWithIdWithingBigCell(EditorCell root, String id, SNode node) {
    if (id == null) {
      return null;
    }

    if (id.equals(root.getCellId()) && root.getSNode() == node) {
      return root;
    }

    if (root instanceof EditorCell_Collection) {
      for (EditorCell child : ((EditorCell_Collection) root)) {
        SNode childNode = child.getSNode();
        if (childNode == node || (childNode != null && AttributeOperations.isAttribute(childNode) && childNode.getParent() == node)) {
          EditorCell result = findCellWithIdWithingBigCell(child, id, node);
          if (result != null) {
            return result;
          }
        }
      }
    }

    return null;
  }

  public void rebuildEditorContent() {
    LOG.assertLog(ModelAccess.instance().isInEDT(), "You should do this in EDT");

    clearCaches();
    clearUserData();
    rebuildEditorContent(null);

    relayout();
  }

  public void rebuildEditorContent(final List<SModelEvent> events) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        //i.e. we are disposed. it's too late to rebuild
        if (getEditorContext() == null) {
          return;
        }

        if (getComponents().length > 0) {
          removeAll();
        }

        if (events != null) {
          revertErrorCells(events);
        }

        runSwapCellsActions(new Runnable() {
          public void run() {
            setRootCell(createRootCell(events));
          }
        });

        for (EditorCell_Component component : getCellTracker().getComponentCells()) {
          EditorComponent.this.add(component.getComponent());
        }

        for (RebuildListener listener : myRebuildListeners) {
          listener.editorRebuilt(EditorComponent.this);
        }

        updateMessages();
      }
    });
  }

  private void fireEditorWillBeDisposed() {
    for (EditorDisposeListener listener : new ArrayList<EditorDisposeListener>(myDisposeListeners)) {
      listener.editorWillBeDisposed(this);
    }
  }

  public void addDisposeListener(EditorDisposeListener listener) {
    if (!myDisposeListeners.contains(listener)) {
      myDisposeListeners.add(listener);
    }
  }

  public void removeDisposeListener(EditorDisposeListener listener) {
    myDisposeListeners.remove(listener);
  }

  public void addRebuildListener(RebuildListener listener) {
    myRebuildListeners.add(listener);
  }

  public void removeRebuildListener(RebuildListener listener) {
    myRebuildListeners.remove(listener);
  }

  public void addSynchronizationListener(CellSynchronizationWithModelListener listener) {
    myCellSynchronizationListeners.add(listener);
  }

  public void removeSynchronizationListener(CellSynchronizationWithModelListener listener) {
    myCellSynchronizationListeners.remove(listener);
  }

  private void fireCellSynchronized(EditorCell cell) {
    for (CellSynchronizationWithModelListener listener : myCellSynchronizationListeners) {
      listener.cellSynchronizedWithModel(cell);
    }
  }

  public EditorCell findCellWeak(int x, int y) {
    EditorCell cell = myRootCell.findLeaf(x, y);
    if (cell == null) {
      cell = myRootCell.findCellWeak(x, y);
    }
    return cell;
  }

  private void processMousePressed(MouseEvent mouseEvent) {
    requestFocus();
    processCoordSelection(mouseEvent);

    if (mouseEvent.getButton() == MouseEvent.BUTTON2) {
      goByCurrentReference();
    }

    boolean ctrlDown = com.intellij.openapi.util.SystemInfo.isMac ? mouseEvent.isMetaDown() : mouseEvent.isControlDown();
    if (ctrlDown) {
      if (mouseEvent.isAltDown()) {
        showCellError();
      } else {
        goByCurrentReference();
      }
    }
  }

  private void goByCurrentReference() {
    final DataContext dataContext = DataManager.getInstance().getDataContext(this);
    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        AnAction action = ActionManager.getInstance().getAction(GoByCurrentReference_Action.class.getName());
        AnActionEvent event = ActionUtils.createEvent(ActionPlaces.EDITOR_POPUP, dataContext);
        ActionUtils.updateAndPerformAction(action, event);
      }
    });
  }

  private void showCellError() {
    final EditorCell selectedCell = getSelectedCell();
    if (selectedCell != null) {
      ModelAccess.instance().runReadAction(new Runnable() {
        public void run() {
          final HighlighterMessage message = getHighlighterMessageFor(selectedCell);
          if (message == null) return;
          final IErrorReporter herror = message.getErrorReporter();
          SwingUtilities.invokeLater(new Runnable() {
            public void run() {
              String s = message.getMessage();
              final MPSErrorDialog dialog = new MPSErrorDialog(myEditorContext.getMainFrame(), s, message.getStatus().getPresentation(), false);
              if (herror.getRuleModel() != null && herror.getRuleId() != null) {
                final boolean hasAdditionalRuleIds = !herror.getAdditionalRulesIds().isEmpty();
                final JButton button = new JButton();
                AbstractAction action = new AbstractAction("Go To Rule") {
                  public void actionPerformed(ActionEvent e) {
                    if (hasAdditionalRuleIds) {
                      JPopupMenu popupMenu = new JPopupMenu();
                      for (final Pair<String, String> id : herror.getAdditionalRulesIds()) {
                        popupMenu.add(new AbstractAction("Go To Rule " + id.o2) {
                          public void actionPerformed(ActionEvent e) {
                            ModelAccess.instance().runReadAction(new Runnable() {
                              public void run() {
                                GoToTypeErrorRuleUtil.goToRuleById(myOperationContext, id);
                                dialog.dispose();
                              }
                            });
                          }
                        });
                      }
                      popupMenu.add(new AbstractAction("Go To Immediate Rule") {
                        public void actionPerformed(ActionEvent e) {
                          ModelAccess.instance().runReadAction(new Runnable() {
                            public void run() {
                              GoToTypeErrorRuleUtil.goToRuleById(myOperationContext, new Pair<String, String>(herror.getRuleModel(),
                                herror.getRuleId()));
                              dialog.dispose();
                            }
                          });
                        }
                      });
                      popupMenu.show(dialog, button.getX(), button.getY() + button.getHeight());
                    } else {
                      ModelAccess.instance().runReadAction(new Runnable() {
                        public void run() {
                          GoToTypeErrorRuleUtil.goToRuleById(myOperationContext, new Pair<String, String>(herror.getRuleModel(),
                            herror.getRuleId()));
                          dialog.dispose();
                        }
                      });
                    }
                  }
                };
                button.setAction(action);
                dialog.addButton(button);
              }
              dialog.initializeUI();
              dialog.setVisible(true);
            }
          });
          return;
        }
      });
    }
  }

  public void addLeftMarginPressListener(LeftMarginMouseListener listener) {
    myLeftMarginPressListeners.add(listener);
  }

  public void removeLeftMarginPressListener(LeftMarginMouseListener listener) {
    myLeftMarginPressListeners.remove(listener);
  }

  public List<LeftMarginMouseListener> getLeftMarginPressListeners(){
    return Collections.unmodifiableList(myLeftMarginPressListeners);
  }

  public void clearLeftMarginListeners() {
    myLeftMarginPressListeners.clear();
  }

  private void processCoordSelection(MouseEvent mouseEvent) {
    EditorCell newSelectedCell = myRootCell.findLeaf(mouseEvent.getX(), mouseEvent.getY(), CellConditions.SELECTABLE);
    if (newSelectedCell != null && newSelectedCell.isUnderFolded()) {
      // mouse was pressed on a cell representing folded collection
      return;
    }
    if (newSelectedCell == null || !newSelectedCell.isSelectable()) {
      newSelectedCell = myRootCell.findCellWeak(mouseEvent.getX(), mouseEvent.getY(), CellConditions.SELECTABLE);
    }

    EditorCell selectedCell = getSelectedCell();
    if (newSelectedCell != null && (mouseEvent.getButton() != MouseEvent.BUTTON3 || selectedCell == null || !selectedCell.isAncestorOf(newSelectedCell))) {
      resetLastCaretX();
      deactivateSubstituteChooser();
      mySelectionManager.setSelection(newSelectedCell);
      newSelectedCell.processMousePressed(mouseEvent);
      revalidateAndRepaint();
    }
  }

  public void clearSelectionStack() {
    getSelectionManager().clearSelection();
  }

  public void pushSelection(EditorCell cell) {
    getSelectionManager().pushSelection(getSelectionManager().createSelection(cell));
  }

  public EditorCell popSelection() {
    Selection selection = getSelectionManager().popSelection();
    return selection instanceof SingularSelection ? ((SingularSelection) selection).getEditorCell() : null;
  }

  public EditorCell peekSelection() {
    return getSelectedCell();
  }

  public boolean selectionStackContains(EditorCell cell) {
    for (Selection nextSelection : getSelectionManager().getSelectionStackIterable()) {
      if (nextSelection instanceof SingularSelection) {
        if (((SingularSelection) nextSelection).getEditorCell().equals(cell)) {
          return true;
        }
      }
    }
    return false;
  }

  public void changeSelection(EditorCell newSelectedCell) {
    changeSelection(newSelectedCell, true);
  }

  void changeSelection(@NotNull EditorCell newSelectedCell, boolean resetLastCaretX) {
    if (resetLastCaretX) {
      resetLastCaretX();
    }
    deactivateSubstituteChooser();
    mySelectionManager.setSelection(newSelectedCell);
    showCellInViewPort(newSelectedCell);
    repaint();
  }

  @UseCarefully
  public void setSelectionDontClearStack(EditorCell newSelectedCell, boolean resetLastCaretX) {
    if (resetLastCaretX) {
      resetLastCaretX();
    }

    if (getSelectedCell() != newSelectedCell) {
      deactivateSubstituteChooser();
      mySelectionManager.pushSelection(mySelectionManager.createSelection(newSelectedCell));
    }

    if (newSelectedCell != null) {
      showCellInViewPort(newSelectedCell);
    }
    repaint();
  }

  // TODO: think about replacing this method with one of ensureVisible()/scrollToCell()
  private void showCellInViewPort(@NotNull EditorCell newSelectedCell) {
    if (getVisibleRect().isEmpty()) {
      final JViewport viewport = getViewport();
      viewport.addChangeListener(new ChangeListener() {
        @Override
        public void stateChanged(ChangeEvent e) {
          if (!getVisibleRect().isEmpty()) {
            if (getSelectedCell() != null) {
              scrollToCell(getSelectedCell());
            }
            viewport.removeChangeListener(this);
          }
        }
      });
    } else {
      scrollToCell(newSelectedCell);
    }
  }

  public void scrollToNode(SNode node) {
    EditorCell cell = findNodeCell(node);
    if (cell != null) {
      scrollToCell(cell);
    }
  }

  public void ensureSelectionVisible() {
    if (getSelectedCell() == null) {
      return;
    }
    scrollToCell(getSelectedCell());
  }

  public void scrollToCell(@NotNull EditorCell cell) {
    if (getVisibleRect().isEmpty()) {
      return;
    }

    EditorCell largestVerticalBigCell = cell;

    int viewportWidth = getViewport().getWidth();

    int x0;
    int width;

    if (cell instanceof EditorCell_Label) {
      EditorCell_Label cellLabel = (EditorCell_Label) cell;
      int caretX = cellLabel.getCaretX();
      int charWidth = cellLabel.getCharWidth();
      width = 4 * charWidth;
      x0 = caretX - 2 * charWidth;
    } else if (getDeepestSelectedCell() instanceof EditorCell_Label && cell.getWidth() > viewportWidth) {
      EditorCell_Label cellLabel = (EditorCell_Label) getDeepestSelectedCell();
      int caretX = cellLabel.getCaretX();
      int charWidth = cellLabel.getCharWidth();
      x0 = Math.max(cell.getX(), caretX + 2 * charWidth - viewportWidth);
      width = viewportWidth;
    } else {
      x0 = cell.getX();
      width = cell.getWidth();
    }

    Rectangle visibleRect = getVisibleRect();
    Rectangle rectangle = new Rectangle(x0, visibleRect.y, width, visibleRect.height);
    if (!rectangle.isEmpty()) {
      boolean adjustHorizontally = !visibleRect.contains(rectangle);
      if (adjustHorizontally) {
        if (width <= viewportWidth) {
          int x1 = Math.max(0, x0 + width - viewportWidth);
          scrollToRectIfNotVisible(
            expandRectangleOneLine(
              new Rectangle(
                x1, largestVerticalBigCell.getY(),
                x0 - x1 + width, largestVerticalBigCell.getHeight()
              )));
        } else {
          scrollToRectIfNotVisible(
            expandRectangleOneLine(
              new Rectangle(
                x0 - SCROLL_GAP, largestVerticalBigCell.getY(),
                viewportWidth + SCROLL_GAP, largestVerticalBigCell.getHeight()
              )));
        }
      } else {
        scrollToRectIfNotVisible(
          expandRectangleOneLine(
            new Rectangle(
              x0, largestVerticalBigCell.getY(),
              width, largestVerticalBigCell.getHeight()
            )));
      }
    }
  }

  private void scrollToRectIfNotVisible(Rectangle rect) {
    if (getVisibleRect().contains(rect)) return;

    scrollRectToVisible(rect);
  }

  private Rectangle expandRectangleOneLine(Rectangle r) {
    Font defaultFont = EditorSettings.getInstance().getDefaultEditorFont();
    FontMetrics fontMetrics = getFontMetrics(defaultFont);
    int height = fontMetrics.getHeight();
    Rectangle rectangle = new Rectangle(r.x, r.y - height, r.width, r.height + 2 * height);
    return rectangle;
  }

  protected void paintComponent(Graphics gg) {
    Graphics2D g = (Graphics2D) gg;

    turnOnAliasingIfPossible(g);

    g.setColor(getBackground());
    Rectangle bounds = g.getClipBounds();

    g.fillRect(bounds.x, bounds.y, bounds.width, bounds.height);

    EditorCell deepestCell = getDeepestSelectedCell();
    if (deepestCell instanceof EditorCell_Label) {
      EditorCell_Label label = (EditorCell_Label) deepestCell;

      g.setColor(CARET_ROW_COLOR);
      g.fillRect(0, deepestCell.getY(), getWidth(),
        deepestCell.getHeight() - deepestCell.getTopInset() - deepestCell.getBottomInset());

      g.setColor(new Color(230, 230, 190));
      g.fillRect(deepestCell.getX() + label.getLeftInset(),
        deepestCell.getY(),
        deepestCell.getWidth() - label.getLeftInset() - label.getRightInset(),
        deepestCell.getHeight() - deepestCell.getTopInset() - deepestCell.getBottomInset());
    }

    List<AdditionalPainter> additionalPainters = getAdditionalPainters();
    for (AdditionalPainter additionalPainter : additionalPainters) {
      if (additionalPainter.paintsBackground()) {
        additionalPainter.paintBackground(g, this);
      }
    }

    if (myRootCell != null) {
      EditorSettings setting = EditorSettings.getInstance();
      g.setColor(Color.LIGHT_GRAY);
      int boundPosition = myRootCell.getX() + setting.getVerticalBoundWidth();
      g.drawLine(boundPosition, 0, boundPosition, getHeight());

      myRootCell.paint(g, ParentSettings.createDefaultSetting());
    }

    for (AdditionalPainter additionalPainter : additionalPainters) {
      if (additionalPainter.paintsAbove()) {
        additionalPainter.paint(g, this);
      }
    }

  }

  public Dimension getPreferredSize() {
    if (myRootCell == null) {
      JViewport viewport = myScrollPane.getViewport();
      Rectangle viewRect = viewport.getViewRect();
      return new Dimension(viewRect.width, viewRect.height);
    }
    return new Dimension(myRootCell.getWidth() + myShiftX + 10, myRootCell.getHeight() + myShiftY + 10);
  }

  public Dimension getPreferredScrollableViewportSize() {
    return getPreferredSize();
  }

  public int getScrollableUnitIncrement(Rectangle visibleRect, int orientation, int direction) {
    if (orientation == SwingConstants.VERTICAL) {
      return 20;
    } else { // if orientation == SwingConstants.HORIZONTAL
      return 20;
    }
  }

  public int getScrollableBlockIncrement(Rectangle visibleRect, int orientation, int direction) {
    return visibleRect.height;
  }

  public boolean getScrollableTracksViewportWidth() {
    return myScrollPane.getViewport().getWidth() > getPreferredSize().width;
  }

  public boolean getScrollableTracksViewportHeight() {
    return myScrollPane.getViewport().getHeight() > getPreferredSize().height;
  }

  public EditorCell getDeepestSelectedCell() {
    if (isDisposed()) {
      return null;
    }
    Selection deepestSelection = getSelectionManager().getDeepestSelection();
    return deepestSelection instanceof SingularSelection ? ((SingularSelection) deepestSelection).getEditorCell() : null;
  }

  @Nullable
  public EditorCell getSelectedCell() {
    if (isDisposed()) {
      return null;
    }
    Selection currentSelection = getSelectionManager().getSelection();
    return currentSelection instanceof SingularSelection ? ((SingularSelection) currentSelection).getEditorCell() : null;
  }

  @NotNull
  public SelectionManager getSelectionManager() {
    return mySelectionManager;
  }

  public KeyboardHandler peekKeyboardHandler() {
    return myKbdHandlersStack.peek();
  }

  public KeyboardHandler popKeyboardHandler() {
    return myKbdHandlersStack.pop();
  }

  public void pushKeyboardHandler(KeyboardHandler kbdHandler) {
    myKbdHandlersStack.push(kbdHandler);
  }

  public void setMouseEventHandler(MouseListener l) {
    assert myMouseEventHandler == null : "Mouse event handler was already specified";
    addMouseListener(myMouseEventHandler = l);
  }

  public void removeMouseEventHandler() {
    assert myMouseEventHandler != null : "Mouse event handler was was not specified";
    removeMouseListener(myMouseEventHandler);
    myMouseEventHandler = null;
  }

  private boolean areMouseEventsBlocked() {
    return myMouseEventHandler != null;
  }

  public Object getUserData(Object key) {
    return myUserDataMap.get(key);
  }

  public void putUserData(Object key, Object data) {
    myUserDataMap.put(key, data);
  }

  public void clearUserData() {
    myUserDataMap.clear();
  }

  public TypeCheckingContext getTypeCheckingContext() {
    return TypeContextManager.getInstance().getOrCreateContext(myNode, this, true);
  }

  protected void disposeTypeCheckingContext() {
    TypeContextManager.getInstance().removeOwnerForRootNodeContext(myNode, this);
  }

  public void sendKeyEvent(KeyEvent keyEvent) {
    if (keyEvent.getID() == KeyEvent.KEY_PRESSED) {
      processKeyPressed(keyEvent);
    } else if (keyEvent.getID() == KeyEvent.KEY_RELEASED) {
      processKeyReleased(keyEvent);
    }
  }

  @CodeOrchestraPatch
  public void update() {
    if (!Highlighter.isUpdateEditorLocked()) { // RE-3343
    Highlighter.runUpdateMessagesAction(new Runnable() {
      public void run() {
        // RE-3144
        ModelAccess.instance().tryRead(new Runnable() {
          public void run() {
            SNode sNode = getRootCell().getSNode();
            if (sNode == null) {
              return;
            }

            // RE-2568
            CacheManagerFacade.getInstance().clearCache();
            SModel model = sNode.getModel();
            if (model != null) {
              SModelDescriptor modelDescriptor = model.getModelDescriptor();
              CacheManagerFacade.getInstance().removeUserObjects(modelDescriptor);
            }

            TypeCheckingContext typeCheckingContext = getTypeCheckingContext();
            typeCheckingContext.clear();
            Highlighter highlighter = getOperationContext().getComponent(Highlighter.class);
            if (highlighter != null) {
              highlighter.resetCheckedState(EditorComponent.this);
            } else {
              typeCheckingContext.checkRoot();
            }
            rebuildEditorContent();
          }
        });
      }
    });
    }
  }

  public void processKeyPressed(final KeyEvent keyEvent) {
    if (keyEvent.isConsumed()) return;

    // hardcoded "update" action
    if (keyEvent.getKeyCode() == KeyEvent.VK_F5 && noKeysDown(keyEvent)) {
      //this lock should be obtained before the following read action to avoid deadlock
      update();
      keyEvent.consume();
      return;
    }

    if (keyEvent.getKeyCode() == KeyEvent.VK_F11 && noKeysDown(keyEvent)) {
      relayout();
      keyEvent.consume();
      return;
    }

    // all other processing should be performed inside command
    EditorContext editorContext = getEditorContext();
    if (editorContext == null) {
      return; //i.e. editor is disposed
    }

    if (isKeyboardHandlerProcessingEnabled(keyEvent) && peekKeyboardHandler().processKeyPressed(editorContext, keyEvent)) {
      keyEvent.consume();
    }
    revalidateAndRepaint();
  }

  public void processKeyReleased(final KeyEvent keyEvent) {
    if (keyEvent.isConsumed()) return;

    if (isKeyboardHandlerProcessingEnabled(keyEvent) && peekKeyboardHandler().processKeyReleased(getEditorContext(), keyEvent)) {
      keyEvent.consume();
    }

    revalidateAndRepaint();
  }

  public void processKeyTyped(final KeyEvent keyEvent) {
    if (keyEvent.isConsumed()) return;

    if (isKeyboardHandlerProcessingEnabled(keyEvent) && peekKeyboardHandler().processKeyTyped(getEditorContext(), keyEvent)) {
      keyEvent.consume();
    }

    revalidateAndRepaint();
  }

  private boolean isKeyboardHandlerProcessingEnabled(KeyEvent keyEvent) {
    if (!isReadOnly()) {
      return true;
    }
    CellActionType actionType = getActionType(keyEvent, getEditorContext());
    if (actionType != null) {
      switch (actionType) {
        case SELECT_LEFT:
        case SELECT_RIGHT:
        case SELECT_HOME:
        case SELECT_END:
        case PAGE_UP:
        case PAGE_DOWN:
        case NEXT:
        case PREV:
          return true;
      }
    }
    return false;
  }

  void executeCommand(final Runnable r) {
    myInsideOfCommand = true;
    try {
      ModelAccess.instance().runWriteActionInCommand(new Runnable() {
        public void run() {
          r.run();
        }
      }, getCurrentProject());
    } finally {
      myInsideOfCommand = false;
    }

    relayout();
  }

  <T> T executeCommand(final Computable<T> c) {
    myInsideOfCommand = true;
    try {
      return ModelAccess.instance().runWriteActionInCommand(c, getCurrentProject());
    } finally {
      myInsideOfCommand = false;
    }
  }

  private Project getCurrentProject() {
    if (getEditorContext() == null || getEditorContext().getOperationContext() == null) {
      return null;
    }
    return getEditorContext().getOperationContext().getProject();
  }

  boolean isForcedFocusChangeEnabled() {
    return myInsideOfCommand;
  }

  @CodeOrchestraPatch
  public boolean activateNodeSubstituteChooserNoAuto(EditorCell editorCell) {
    if (myNodeSubstituteChooser.isVisible()) {
      return true;
      //todo: rebuild menu if smartness changed
    }

    // try to obtain substitute info
    NodeSubstituteInfo substituteInfo = null;
    if (editorCell != null) {
      substituteInfo = editorCell.getSubstituteInfo();
    }

    return activateNodeSubstituteChooser(editorCell, substituteInfo, false, false, false);
  }

  public boolean activateNodeSubstituteChooser(EditorCell editorCell, boolean resetPattern) {
    return activateNodeSubstituteChooser(editorCell, resetPattern, false);
  }

  public boolean activateNodeSubstituteChooser(EditorCell editorCell, boolean resetPattern, boolean isSmart) {
    if (myNodeSubstituteChooser.isVisible()) {
      return true;
      //todo: rebuild menu if smartness changed
    }

    // try to obtain substitute info
    NodeSubstituteInfo substituteInfo = null;
    if (editorCell != null) {
      substituteInfo = editorCell.getSubstituteInfo();
    }

    return activateNodeSubstituteChooser(editorCell, substituteInfo, resetPattern, isSmart);
  }

  public boolean activateNodeSubstituteChooser(EditorCell editorCell, NodeSubstituteInfo substituteInfo, boolean resetPattern) {
    return activateNodeSubstituteChooser(editorCell, substituteInfo, resetPattern, false);
  }

  @CodeOrchestraPatch
  public boolean activateNodeSubstituteChooser(EditorCell editorCell, NodeSubstituteInfo substituteInfo, boolean resetPattern, boolean isSmart) {
    return activateNodeSubstituteChooser(editorCell, substituteInfo, resetPattern, isSmart, true);
  }

  @CodeOrchestraPatch
  public boolean activateNodeSubstituteChooser(EditorCell editorCell, NodeSubstituteInfo substituteInfo, boolean resetPattern, boolean isSmart, boolean instantSubstitute) {
    if (substituteInfo == null) {
      return false;
    }

    // do substitute...
    LOG.debug("substitute info : " + substituteInfo);
    NodeSubstitutePatternEditor patternEditor = editorCell.createSubstitutePatternEditor();
    if (resetPattern) {
      patternEditor.setCaretPosition(0);
    }
    String pattern = patternEditor.getPattern();

    boolean trySubstituteNow =
      !patternEditor.getText().equals(substituteInfo.getOriginalText()) || // user changed text or cell has no text
        pattern.equals(patternEditor.getText()); // caret at the end

    // 1st - try to do substitution with current pattern (if cursor at the end of text)
    if (trySubstituteNow) {
      List<INodeSubstituteAction> matchingActions = isSmart ? substituteInfo.getSmartMatchingActions(pattern, false, editorCell) :
        substituteInfo.getMatchingActions(pattern, false);
      if (matchingActions.size() == 1 && pattern.length() > 0) {
        INodeSubstituteAction matchingAction = matchingActions.get(0);

        // RE-3611
        if (instantSubstitute || pattern.equals(matchingAction.getVisibleMatchingText(pattern))) {
          matchingAction.substitute(this.getEditorContext(), pattern);
          return true;
        }
      }
    }

    myNodeSubstituteChooser.setNodeSubstituteInfo(substituteInfo);
    myNodeSubstituteChooser.setPatternEditor(patternEditor);
    myNodeSubstituteChooser.setLocationRelative(editorCell);
    myNodeSubstituteChooser.setIsSmart(isSmart);
    myNodeSubstituteChooser.setContextCell(editorCell);
    myNodeSubstituteChooser.setVisible(true);

    // RE-2089
    myNodeSubstituteChooser.getPopupWindow().resetScroller();

    // RE-3611
    myNodeSubstituteChooser.setAutoEnter(!instantSubstitute);

    // RE-3832
    this.lastNodeSubstituteChooserOpen = System.currentTimeMillis();

    return true;
  }

  private void deactivateSubstituteChooser() {
    myNodeSubstituteChooser.setVisible(false);
  }

  public NodeSubstituteChooser getNodeSubstituteChooser() {
    return myNodeSubstituteChooser;
  }

  void setNodeInformationDialog(NodeInformationDialog dialog) {
    myNodeInformationDialog = dialog;
  }

  public boolean hasNodeInformationDialog() {
    return myNodeInformationDialog != null;
  }

  public void paint(Graphics g) {
    super.paint(g);
    Selection selection = getSelectionManager().getSelection();
    if (selection != null) {
      selection.paintSelection((Graphics2D) g);
    }
  }

  // last caret X

  boolean hasLastCaretX() {
    return myHasLastCaretX;
  }

  int getLastCaretX() {
    return myLastCaretX;
  }

  public void resetLastCaretX() {
    myHasLastCaretX = false;
  }

  void saveLastCaretX(int lastCaretX) {
    myLastCaretX = lastCaretX;
    myHasLastCaretX = true;
  }

  public void addCellDependentOnNodeProperty(EditorCell_Property cell, Pair<SNodePointer, String> pair) {
    WeakSet<EditorCell_Property> dependentCells = myNodePropertiesAccessedCleanlyToDependentCellsMap.get(pair);
    if (dependentCells == null) {
      dependentCells = new WeakSet<EditorCell_Property>();
      myNodePropertiesAccessedCleanlyToDependentCellsMap.put(pair, dependentCells);
    }
    dependentCells.add(cell);
  }

  public void addCellDependentOnNodePropertyWhichWasAccessedDirtily(EditorCell cell, Pair<SNodePointer, String> pair) {
    WeakSet<EditorCell> dependentCells = myNodePropertiesAccessedDirtilyToDependentCellsMap.get(pair);
    if (dependentCells == null) {
      dependentCells = new WeakSet<EditorCell>();
      myNodePropertiesAccessedDirtilyToDependentCellsMap.put(pair, dependentCells);
    }
  }

  public void addCellDependentOnNodePropertyWhichExistenceWasChecked(EditorCell cell, Pair<SNodePointer, String> pair) {
    WeakSet<EditorCell> dependentCells = myNodePropertiesWhichExistenceWasCheckedToDependentCellsMap.get(pair);
    if (dependentCells == null) {
      dependentCells = new WeakSet<EditorCell>();
      myNodePropertiesWhichExistenceWasCheckedToDependentCellsMap.put(pair, dependentCells);
    }
    dependentCells.add(cell);
  }

  public void putCellAndNodesToDependOn(EditorCell cell, Set<SNode> nodes, Set<SNodePointer> refTargets) {
    myCellsToNodesToDependOnMap.put(cell, nodes);
    myCellsToRefTargetsToDependOnMap.put(cell, refTargets);
  }

  public Set<SNode> getNodesCellDependOn(EditorCell cell) {
    Set<SNode> nodes = myCellsToNodesToDependOnMap.get(cell);
    if (nodes == null) return null;
    return Collections.unmodifiableSet(nodes);
  }

  public Set<SNodePointer> getCopyOfRefTargetsCellDependsOn(EditorCell cell) {
    Set<SNodePointer> nodeProxies = myCellsToRefTargetsToDependOnMap.get(cell);
    if (nodeProxies == null) return null;
    return new HashSet<SNodePointer>(nodeProxies);
  }

  public boolean doesCellDependOnNode(EditorCell cell, SNode node) {
    if ((cell == null) && node != null) return true;
    Set<SNode> sNodes = myCellsToNodesToDependOnMap.get(cell);
    Set<SNodePointer> nodeProxies = myCellsToRefTargetsToDependOnMap.get(cell);
    return ((sNodes != null) && (sNodes.contains(node))) || ((nodeProxies != null && nodeProxies.contains(new SNodePointer(node))));
  }

  public void clearNodesCellDependsOn(EditorCell cell, EditorManager editorManager) {
    if (editorManager == EditorManager.getInstanceFromContext(myOperationContext)) {
      myCellsToNodesToDependOnMap.remove(cell);
      myCellsToRefTargetsToDependOnMap.remove(cell);
      if (myRootCell == cell) {
        removeOurListeners();
      }
    }
  }

  void registerAsBigCell(EditorCell cell, EditorManager manager) {
    if (manager == EditorManager.getInstanceFromContext(myOperationContext)) {
      myNodesToBigCellsMap.put(cell.getSNode(), new WeakReference<EditorCell>(cell));
    }
  }

  @Nullable
  public EditorCell getBigValidCellForNode(SNode node) {
    EditorCell result = findNodeCell(node);
    if (isValid(result)) return result;
    return null;
  }

  public boolean isValid(EditorCell cell) {
    if (cell == null) return false;
    return ((EditorCell_Basic) cell).isInTree() && cell.getEditor() == this;
  }

  public EditorCell changeSelectionWRTFocusPolicy(@NotNull EditorCell cell) {
    EditorCell focusPolicyCell = FocusPolicyUtil.findCellToSelectDueToFocusPolicy(cell);
    EditorCell toSelect;
    if (focusPolicyCell == null || (focusPolicyCell == cell && !focusPolicyCell.hasFocusPolicy())) {
      toSelect = cell.findChild(CellFinders.or(CellFinders.FIRST_ERROR, CellFinders.FIRST_EDITABLE));
      if (toSelect == null) {
        toSelect = cell.findChild(CellFinders.FIRST_SELECTABLE_LEAF);
      }
    } else {
      toSelect = focusPolicyCell;
    }
    if (toSelect == null) toSelect = cell;
    changeSelection(toSelect);

    if (toSelect instanceof EditorCell_Label) {
      EditorCell_Label label = (EditorCell_Label) toSelect;
      if (label.getDefaultCaretPosition() != null) {
        if (label.getDefaultCaretPosition() == CaretPosition.FIRST) {
          label.home();
        }
        if (label.getDefaultCaretPosition() == CaretPosition.LAST) {
          label.end();
        }
      } else if (!toSelect.isErrorState()) {
        label.end();
      }
    }

    return toSelect;
  }

  protected void setEditorContext(EditorContext editorContext) {
    assert editorContext == null || editorContext.getOperationContext() == null
      || editorContext.getOperationContext().getModule() != null || editorContext.getOperationContext().isTestMode();
    myEditorContext = editorContext;
  }

  private void runSwapCellsActions(Runnable action) {
    try {
      myCellSwapInProgress = true;
      if (getSelectedCell() != null) myRecentlySelectedCellInfo = getSelectedCell().getCellInfo();
      Object memento = null;
      if (getEditorContext() != null) {
        memento = getEditorContext().createMemento();
      }
      action.run();
      if (getEditorContext() != null) {
        getEditorContext().setMemento(memento);
      }
      myRecentlySelectedCellInfo = null;
    } finally {
      myCellSwapInProgress = false;
    }
  }

  boolean isCellSwapInProgress() {
    return myCellSwapInProgress;
  }

  CellInfo getRecentlySelectedCellInfo() {
    return myRecentlySelectedCellInfo;
  }

  public boolean isReadOnly() {
    return myReadOnly;
  }

  public void setReadOnly(boolean readOnly) {
    myReadOnly = readOnly;
  }

  public void setPopupMenuEnabled(boolean popupMenuEnabled) {
    myPopupMenuEnabled = popupMenuEnabled;
  }

  @Nullable
  public Object getData(@NonNls String dataId) {
    //MPSDK
    if (dataId.equals(MPSDataKeys.NODE.getName())) {
      List<SNode> selectedNodes = getSelectedNodes();
      return selectedNodes.isEmpty() ? getRootCell().getSNode() : selectedNodes.iterator().next();
    }
    if (dataId.equals(MPSDataKeys.NODES.getName())) return getSelectedNodes();
    if (dataId.equals(MPSDataKeys.CONTEXT_MODEL.getName())) {
      return ModelAccess.instance().runReadAction(new Computable() {
        public Object compute() {
          SNode node = getRootCell().getSNode();
          if (node == null) return null;
          SModel model = node.getModel();
          if (model == null) return null; //removed model
          return model.getModelDescriptor();
        }
      });
    }
    if (dataId.equals(MPSDataKeys.CONTEXT_MODULE.getName())) {
      IOperationContext operationContext = getOperationContext();
      if (operationContext == null) return null;
      return operationContext.getModule();
    }
    if (dataId.equals(MPSDataKeys.OPERATION_CONTEXT.getName())) return getOperationContext();
    if (dataId.equals(MPSDataKeys.EDITOR_CONTEXT.getName())) return createEditorContextForActions();
    if (dataId.equals(MPSDataKeys.EDITOR_CELL.getName())) return getSelectedCell();
    if (dataId.equals(MPSDataKeys.EDITOR_COMPONENT.getName())) return this;
    if (dataId.equals(MPSDataKeys.PLACE.getName())) return ActionPlace.EDITOR;

    //PDK
    if (dataId.equals(PlatformDataKeys.CUT_PROVIDER.getName())) return new MyCutProvider();
    if (dataId.equals(PlatformDataKeys.COPY_PROVIDER.getName())) return new MyCopyProvider();
    if (dataId.equals(PlatformDataKeys.PASTE_PROVIDER.getName()) && (isFocusOwner() || IdeMain.getTestMode() == TestMode.CORE_TEST))
      return new MyPasteProvider();
    if (dataId.equals(PlatformDataKeys.VIRTUAL_FILE_ARRAY.getName())) {
      return getVirtualFile() != null ? new VirtualFile[]{getVirtualFile()} : new VirtualFile[0];
    }

    //not found
    return null;
  }

  private void handleEvents(List<SModelEvent> events) {
    if (EventUtil.isDetachedOnlyChange(events)) {
      return;
    }

    SNode lastSelectedNode = getSelectedNode();

    if (!EventUtil.isDramaticalChange(events)) {
      if (EventUtil.isPropertyChange(events)) {
        String propertyName = ((SModelPropertyEvent) events.get(0)).getPropertyName();
        SNodePointer nodeProxy = new SNodePointer(((SModelPropertyEvent) events.get(0)).getNode());
        Pair<SNodePointer, String> pair = new Pair<SNodePointer, String>(nodeProxy, propertyName);
        Set<EditorCell_Property> editorCell_properties = myNodePropertiesAccessedCleanlyToDependentCellsMap.get(pair);
        Set<EditorCell> editorCells = myNodePropertiesAccessedDirtilyToDependentCellsMap.get(pair);
        Set<EditorCell> editorCellsDependentOnExistence = myNodePropertiesWhichExistenceWasCheckedToDependentCellsMap.get(pair);
        if (editorCellsDependentOnExistence != null) {
          if (EventUtil.isPropertyAddedOrRemoved(events.get(0))) {
            rebuildEditorContent(events);
          } else {
            for (EditorCell cell : editorCellsDependentOnExistence) {
              cell.synchronizeViewWithModel();
              fireCellSynchronized(cell);
            }
            if (editorCell_properties != null) {
              for (EditorCell cell : editorCell_properties) {
                cell.synchronizeViewWithModel();
                fireCellSynchronized(cell);
              }
            }
          }
          relayout();
          return;
        }
        if (editorCells != null) {
          rebuildEditorContent(events);
          relayout();
          updateSelection(events, lastSelectedNode);
        } else if (editorCell_properties != null) {
          for (EditorCell_Property cell : editorCell_properties) {
            cell.synchronizeViewWithModel();
            fireCellSynchronized(cell);
          }
          revertErrorCells(events);
        }
      } else {
        rebuildEditorContent(events);
      }
    } else {// "dramatical" change
      rebuildEditorContent(events);

      if (!hasFocus() && !myIntentionsSupport.isLightBulbVisible()) {
        return;
      }

      revertErrorCells(events);
      relayout();
      updateSelection(events, lastSelectedNode);
    }

    if (!myInsideOfCommand) {
      relayout();
    }
  }

  private void updateSelection(List<SModelEvent> events, SNode lastSelectedNode) {
    SModelEvent lastAdd = null;
    SModelEvent lastRemove = null;

    List<SNode> childAddedEventNodes = new ArrayList<SNode>();

    for (SModelEvent e : events) {
      if (e instanceof SModelChildEvent) {
        SModelChildEvent ce = (SModelChildEvent) e;
        if (ce.getParent().getAncestors(true).contains(getEditedNode())) {
          if (ce.isAdded()) {
            lastAdd = ce;
            childAddedEventNodes.add(ce.getChild());
          }
          if (ce.isRemoved()) {
            lastRemove = ce;
          }
        }
      }

      if (e instanceof SModelReferenceEvent) {
        SModelReferenceEvent re = (SModelReferenceEvent) e;
        if (re.isAdded()) lastAdd = re;
        if (re.isRemoved()) lastRemove = re;
      }
    }

    if (lastAdd != null && isForcedFocusChangeEnabled()) {
      if (lastAdd instanceof SModelChildEvent) {
        List<NodesParetoFrontier.NodeBox> frontier = NodesParetoFrontier.findParetoFrontier(childAddedEventNodes);
        SNode addedChild = frontier.get(frontier.size() - 1).getNode();
        EditorCell cell = findNodeCell(addedChild);
        if (cell != null) {
          // similar to: IntellijentInputUtil.applyRigthTransform() logic
          EditorCell errorCell = cell.findChild(CellFinders.FIRST_ERROR, true);
          if (errorCell != null) {
            changeSelectionWRTFocusPolicy(errorCell);
          } else {
            changeSelectionWRTFocusPolicy(cell);
          }
        }
        return;
      } else {
        //noinspection ConstantConditions
        if (lastAdd instanceof SModelReferenceEvent) {
          SModelReferenceEvent re = (SModelReferenceEvent) lastAdd;
          selectRefCell(re.getReference());
          return;
        } else {
          //
        }
      }
    }

    if (lastRemove != null) {
      if (lastRemove instanceof SModelChildEvent && (lastSelectedNode == null || lastSelectedNode.isDeleted())) {
        SModelChildEvent ce = (SModelChildEvent) lastRemove;
        int childIndex = ce.getChildIndex();
        String role = ce.getChildRole();
        SNode parent = ce.getParent();

        List<SNode> siblings = parent.getChildren(role);
        if (siblings.isEmpty()) {
          EditorCell nullCell = findNodeCellWithRole(parent, role);
          if (nullCell == null) {
            EditorCell cell = findNodeCell(parent);
            if (cell != null) {
              EditorCell lastLeaf = cell.getLastLeaf(CellConditions.SELECTABLE);
              if (lastLeaf == null) {
                return;
              }
              changeSelection(lastLeaf);
              lastLeaf.end();
              return;
            }
          } else {
            changeSelectionWRTFocusPolicy(nullCell);
          }
        } else {
          SNode target = null;
          for (SNode sibling : siblings) {
            int index = parent.getChildren().indexOf(sibling);
            if (index < childIndex) {
              target = sibling;
            }
          }

          if (target != null) {
            EditorCell cell = findNodeCell(target);
            if (cell != null) {
              EditorCell lastLeaf = cell.getLastLeaf(CellConditions.SELECTABLE);
              if (lastLeaf == null) {
                return;
              }
              changeSelection(lastLeaf);
              lastLeaf.end();
              return;
            }
          } else {
            EditorCell cell = findNodeCell(siblings.get(0));
            if (cell != null) {
              EditorCell lastLeaf = cell.getFirstLeaf(CellConditions.SELECTABLE);
              if (lastLeaf == null) {
                return;
              }
              changeSelection(lastLeaf);
              lastLeaf.home();
              return;
            }
          }
        }
      }

      //noinspection ConstantConditions
      if (lastRemove instanceof SModelReferenceEvent && isForcedFocusChangeEnabled()) {
        SModelReferenceEvent re = (SModelReferenceEvent) lastRemove;
        SReference ref = re.getReference();
        SNode sourceNode = ref.getSourceNode();
        String role = ref.getRole();
        EditorCell nullCell = findNodeCellWithRole(sourceNode, role);
        if (nullCell == null) {
          EditorCell cell = findNodeCell(sourceNode);
          if (cell != null) {
            changeSelectionWRTFocusPolicy(cell);
          }
        } else {
          changeSelectionWRTFocusPolicy(nullCell);
        }
      }
    }

    if (getSelectedNode() == null) {
      EditorCell lastSelectedNodeCell = findNodeCell(lastSelectedNode);
      if (lastSelectedNodeCell != null) {
        EditorCell child = lastSelectedNodeCell.findChild(CellFinders.FIRST_SELECTABLE_LEAF);
        if (child != null) {
          changeSelection(child);
        }
      }
    }
  }

  private void revertErrorCells(List<SModelEvent> events) {
    final boolean[] wereReverted = new boolean[1];
    for (SModelEvent e : events) {
      e.accept(new SModelEventVisitorAdapter() {
        public void visitPropertyEvent(SModelPropertyEvent event) {
          EditorCell cell = findNodeCell(event.getNode());
          if (cell != null && isErrorWithinBigCell(cell)) {
            synchronizeWithModelWithinBigCell(cell);
            wereReverted[0] = true;
          }
        }

        public void visitReferenceEvent(SModelReferenceEvent event) {
          EditorCell cell = findNodeCell(event.getReference().getSourceNode());
          if (cell != null && isErrorWithinBigCell(cell)) {
            synchronizeWithModelWithinBigCell(cell);
            wereReverted[0] = true;
          }
        }

        private boolean isErrorWithinBigCell(EditorCell cell) {
          if (cell.isErrorState()) return true;

          if (cell instanceof EditorCell_Collection) {
            EditorCell_Collection collection = (EditorCell_Collection) cell;

            for (EditorCell child : collection) {
              if (child.isBigCell()) continue;
              if (isErrorWithinBigCell(child)) return true;
            }
          }

          return false;
        }
      });
    }
  }

  private void synchronizeWithModelWithinBigCell(EditorCell cell) {
    if (cell instanceof EditorCell_Collection) {
      EditorCell_Collection collection = (EditorCell_Collection) cell;
      for (EditorCell child : collection) {
        if (child.getSNode() == cell.getSNode()) {
          synchronizeWithModelWithinBigCell(child);
        }
      }
    } else {
      cell.synchronizeViewWithModel();
    }
  }


  private void commitAll() {
    if (getOperationContext() == null) {
      return;
    }
    Project project = getOperationContext().getProject();
    if (project == null) {
      return;
    }

    ModelAccess.instance().runCommandInEDT(new Runnable() {
      public void run() {
        doCommitAll(getRootCell());
      }
    }, project);
  }

  private void doCommitAll(EditorCell current) {
    if (current instanceof EditorCell_Property) {
      ((EditorCell_Property) current).commit();
    }
    if (current instanceof EditorCell_Collection) {
      EditorCell_Collection collection = (EditorCell_Collection) current;
      for (EditorCell cell : collection) {
        doCommitAll(cell);
      }
    }
  }

  /**
   * It's possible that associated module was already removed from MPSModuleRepository (for example - transient models
   * modules are currently removed from MPSModuleRepository before next code generation session). In this case currently
   * open editor should be closed as a result of another notification processing. We need to suppress editor update
   * process in this case because an editor is not in valid state right now.
   */
  private boolean isModuleDisposed() {
    return myOperationContext != null && myOperationContext.getModule() == null;
  }

  private boolean isProjectDisposed() {
    return getOperationContext() != null && getOperationContext().getProject() != null && getOperationContext().getProject().isDisposed();
  }

  private boolean isNodeDisposed() {
    return getEditedNode() != null && getEditedNode().isDisposed();
  }

  public boolean isEditable() {
    return myIsEditable;
  }

  public void setEditable(boolean isEditable) {
    myIsEditable = isEditable;
    if (!isEditable) {
      setFocusable(false);
    }
  }

  public CellTracker getCellTracker() {
    return myCellTracker;
  }

  public BracesHighlighter getBracesHighlighter() {
    return myBracesHighlighter;
  }

  private static class MyBaseAction extends BaseAction {
    private final EditorCellKeyMapAction myAction;
    private final EditorContext myEditorContext;

    public MyBaseAction(EditorCellKeyMapAction action, EditorContext editorContext) {
      super("" + action.getDescriptionText());
      myAction = action;
      myEditorContext = editorContext;
      String keyStroke = action.getKeyStroke();
      if (keyStroke != null && keyStroke.length() != 0) {
        KeyboardShortcut shortcut = new KeyboardShortcut(KeyStroke.getKeyStroke(keyStroke), null);
        KeymapManager.getInstance().getKeymap(KeymapManager.DEFAULT_IDEA_KEYMAP).addShortcut(getActionId(), shortcut);
      }
    }

    @Override
    protected boolean isEnabledInASView() {
      return true;
    }

    protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
      try {
        myAction.execute(null, myEditorContext);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private class MySimpleModelListener extends SModelAdapter {
    public void modelReplaced(final SModelDescriptor sm) {
      assert SwingUtilities.isEventDispatchThread() : "Model reloaded notification expected in EventDispatchThread";
      if (myNode != null) {
        if (myNode.getModel().getSModelReference().equals(sm.getSModelReference())) {
          SNodeId oldId = myNode.getSNodeId();
          myNode = sm.getSModel().getNodeById(oldId);
        }
      }
      rebuildEditorContent();
    }
  }

  private class MyEventsCollector extends EventsCollector {
    protected void eventsHappened(List<SModelEvent> events) {
      handleEvents(events);
    }
  }

  public static interface RebuildListener {
    public void editorRebuilt(EditorComponent editor);
  }

  public static interface CellSynchronizationWithModelListener {
    public void cellSynchronizedWithModel(EditorCell cell);
  }

  public static interface EditorDisposeListener {
    public void editorWillBeDisposed(EditorComponent component);
  }

  public void repaint() {
    super.repaint();
    if (myLeftHighlighter != null) {
      myLeftHighlighter.repaint();
    }
  }

  private class MPSActionProxy extends AbstractAction {
    private List<BaseAction> myActions = new ArrayList<BaseAction>();
    private String myPlace = ActionPlaces.UNKNOWN;

    public void add(String place, BaseAction a) {
      myPlace = place;
      myActions.add(a);
    }

    public List<String> getActionNames() {
      List<String> result = new ArrayList<String>();
      for (BaseAction baseAction : myActions) {
        result.add(baseAction.getClass().getSimpleName());
      }
      return result;
    }

    public List<BaseAction> getActiveActions() {
      List<BaseAction> result = new ArrayList<BaseAction>();
      for (final BaseAction action : myActions) {
        if (isActionActive(action)) {
          result.add(action);
        }
      }
      return result;
    }

    public boolean isActionActive(BaseAction action) {
      EditorCell selectedCell = getSelectedCell();
      if (selectedCell == null || selectedCell.getSNode() == null) {
        return false;
      }
      DataContext context = DataManager.getInstance().getDataContext(EditorComponent.this);
      AnActionEvent event = ActionUtils.createEvent(myPlace, context);

      action.update(event);
      return event.getPresentation().isEnabled();
    }

    public void actionPerformed(ActionEvent e) {
      for (final BaseAction action : myActions) {
        if (isActionActive(action)) {
          DataContext context = DataManager.getInstance().getDataContext(EditorComponent.this);
          AnActionEvent event = ActionUtils.createEvent(myPlace, context);
          action.actionPerformed(event);
        }
      }
    }
  }

  private class ReferenceUnderliner {
    private EditorCell myLastReferenceCell;

    private ReferenceUnderliner() {
      addKeyListener(new KeyAdapter() {
        public void keyPressed(KeyEvent e) {
          if (e.getKeyCode() == getKeyCode()) {
            setControlOver();
          }
        }

        public void keyReleased(KeyEvent e) {
          if (e.getKeyCode() == getKeyCode()) {
            clearControlOver();
          }
        }

        private int getKeyCode() {
          return com.intellij.openapi.util.SystemInfo.isMac ? KeyEvent.VK_META : KeyEvent.VK_CONTROL;
        }
      });
      addMouseMotionListener(new MouseMotionListener() {
        public void mouseDragged(MouseEvent e) {
        }

        public void mouseMoved(MouseEvent e) {
          if (!myEditorContext.getNodeEditorComponent().isFocusOwner()) return;

          clearControlOver();
          if (!(com.intellij.openapi.util.SystemInfo.isMac ? e.isMetaDown() : e.isControlDown())) {
            myLastReferenceCell = null;
            return;
          }

          if (myRootCell == null) {
            myLastReferenceCell = null;
            return;
          }
          final EditorCell editorCell = myRootCell.findLeaf(e.getX(), e.getY());
          if (editorCell == null) {
            myLastReferenceCell = null;
            return;
          }
          SNode snodeWRTReference = ModelAccess.instance().runReadAction(new Computable<SNode>() {
            public SNode compute() {
              return editorCell.getSNodeWRTReference();
            }
          });
          if (editorCell.getSNode() == snodeWRTReference) {
            myLastReferenceCell = null;
            return;
          }
          myLastReferenceCell = editorCell;

          setControlOver();
        }
      });
      addFocusListener(new FocusListener() {
        public void focusGained(FocusEvent e) {
        }

        public void focusLost(FocusEvent e) {
          clearControlOver();
          myLastReferenceCell = null;
        }
      });
    }

    private void clearControlOver() {
      if (myLastReferenceCell != null) {
        myLastReferenceCell.getStyle().set(StyleAttributes.CONTROL_OVERED_REFERENCE, false);
        setCursor(Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR));
        repaint();
      }
    }

    private void setControlOver() {
      if (myLastReferenceCell != null) {
        myLastReferenceCell.getStyle().set(StyleAttributes.CONTROL_OVERED_REFERENCE, true);
        setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        repaint();
      }
    }
  }


  @CodeOrchestraPatch
  private class MyCutProvider implements CutProvider {
    public void performCut(DataContext dataContext) {
      ModelAccess.instance().runWriteActionInCommand(new Runnable() {
        public void run() {
          EditorCell selectedCell = getSelectedCell();
          if (selectedCell != null) {
            // RE-960
            selectedCell.executeAction(CellActionType.COPY);
            selectedCell.executeAction(CellActionType.DELETE);
          } else {
            // RE-960
            getSelectionManager().getSelection().executeAction(CellActionType.COPY);
            getSelectionManager().getSelection().executeAction(CellActionType.DELETE);
          }
        }
      }, getCurrentProject());
    }

    public boolean isCutEnabled(DataContext dataContext) {
      return ModelAccess.instance().runReadAction(new Computable<Boolean>() {
        public Boolean compute() {
          if (isDisposed() || isInvalid() || isReadOnly()) {
            return false;
          }
          EditorCell selectedCell = getSelectedCell();
          return selectedCell != null ? selectedCell.canExecuteAction(CellActionType.CUT) : getSelectionManager().getSelection() != null;
        }
      });
    }

    public boolean isCutVisible(DataContext dataContext) {
      return true;
    }
  }

  private class MyCopyProvider implements CopyProvider {
    public void performCopy(DataContext dataContext) {
      ModelAccess.instance().runWriteActionInCommand(new Runnable() {
        public void run() {
          EditorCell selectedCell = getSelectedCell();
          if (selectedCell != null) {
            selectedCell.executeAction(CellActionType.COPY);
          } else {
            getSelectionManager().getSelection().executeAction(CellActionType.COPY);
          }
        }
      }, getCurrentProject());
    }

    public boolean isCopyEnabled(DataContext dataContext) {
      return ModelAccess.instance().runReadAction(new Computable<Boolean>() {
        public Boolean compute() {
          if (isDisposed() || isInvalid()) {
            return false;
          }
          EditorCell selectedCell = getSelectedCell();
          return selectedCell != null ? selectedCell.canExecuteAction(CellActionType.COPY) : getSelectionManager().getSelection() != null;
        }
      });
    }

    public boolean isCopyVisible(DataContext dataContext) {
      return true;
    }
  }

  private class MyPasteProvider implements PasteProvider {
    public void performPaste(DataContext dataContext) {
      ModelAccess.instance().runWriteActionInCommand(new Runnable() {
        public void run() {
          EditorCell selectedCell = getSelectedCell();
          if (selectedCell != null) {
            selectedCell.executeAction(CellActionType.PASTE);
          } else {
            getSelectionManager().getSelection().executeAction(CellActionType.PASTE);
          }
        }
      }, getCurrentProject());
    }

    public boolean isPastePossible(DataContext dataContext) {
      return ModelAccess.instance().runReadAction(new Computable<Boolean>() {
        public Boolean compute() {
          if (isDisposed() || isInvalid() || isReadOnly()) {
            return false;
          }
          EditorCell selectedCell = getSelectedCell();
          return selectedCell != null ? selectedCell.canExecuteAction(CellActionType.PASTE) : getSelectionManager().getSelection() != null;
        }
      });
    }

    public boolean isPasteEnabled(DataContext dataContext) {
      return true;
    }
  }

  /**
   * This is a copy of com.intellij.openapi.editor.impl.EditorImpl.MyScrollBar classwith some additional code
   */
  private static final Field decrButtonField;
  private static final Field incrButtonField;

  static {
    try {
      decrButtonField = BasicScrollBarUI.class.getDeclaredField("decrButton");
      decrButtonField.setAccessible(true);

      incrButtonField = BasicScrollBarUI.class.getDeclaredField("incrButton");
      incrButtonField.setAccessible(true);
    } catch (NoSuchFieldException e) {
      throw new IllegalStateException(e);
    }
  }

  class MyScrollBar extends JBScrollBar implements IdeGlassPane.TopComponent {
    @NonNls
    private static final String APPLE_LAF_AQUA_SCROLL_BAR_UI_CLASS = "apple.laf.AquaScrollBarUI";
    private ScrollBarUI myPersistentUI;

    MyScrollBar(int orientation) {
      super(orientation);
    }

    void setPersistentUI(ScrollBarUI ui) {
      myPersistentUI = ui;
      setUI(ui);
    }

    @Override
    public boolean canBePreprocessed(MouseEvent e) {
      return JBScrollPane.canBePreprocessed(e, this);
    }

    @Override
    public void setUI(ScrollBarUI ui) {
      if (myPersistentUI == null) myPersistentUI = ui;
      super.setUI(myPersistentUI);
    }

    /**
     * This is helper method. It returns height of the top (decrease) scroll bar
     * button. Please note, that it's possible to return real height only if scroll bar
     * is instance of BasicScrollBarUI. Otherwise it returns fake (but good enough :) )
     * value.
     */
    int getDecScrollButtonHeight() {
      ScrollBarUI barUI = getUI();
      Insets insets = getInsets();
      if (barUI instanceof ButtonlessScrollBarUI) {
        return insets.top + ((ButtonlessScrollBarUI) barUI).getDecrButtonHeight();
      } else if (barUI instanceof BasicScrollBarUI) {
        try {
          JButton decrButtonValue = (JButton) decrButtonField.get(barUI);
          LOG.assertLog(decrButtonValue != null);
          return insets.top + decrButtonValue.getHeight();
        } catch (Exception exc) {
          throw new IllegalStateException(exc);
        }
      } else {
        return insets.top + 15;
      }
    }

    /**
     * This is helper method. It returns height of the bottom (increase) scroll bar
     * button. Please note, that it's possible to return real height only if scroll bar
     * is instance of BasicScrollBarUI. Otherwise it returns fake (but good enough :) )
     * value.
     */
    int getIncScrollButtonHeight() {
      ScrollBarUI barUI = getUI();
      Insets insets = getInsets();
      if (barUI instanceof ButtonlessScrollBarUI) {
        return insets.top + ((ButtonlessScrollBarUI) barUI).getIncrButtonHeight();
      } else if (barUI instanceof BasicScrollBarUI) {
        try {
          JButton incrButtonValue = (JButton) incrButtonField.get(barUI);
          LOG.assertLog(incrButtonValue != null);
          return insets.bottom + incrButtonValue.getHeight();
        } catch (Exception exc) {
          throw new IllegalStateException(exc.getMessage());
        }
      } else if (APPLE_LAF_AQUA_SCROLL_BAR_UI_CLASS.equals(barUI.getClass().getName())) {
        return insets.bottom + 30;
      } else {
        return insets.bottom + 15;
      }
    }

    public int getUnitIncrement(int direction) {
      JViewport vp = myScrollPane.getViewport();
      Rectangle vr = vp.getViewRect();
      return getScrollableUnitIncrement(vr, SwingConstants.VERTICAL, direction);
    }

    public int getBlockIncrement(int direction) {
      JViewport vp = myScrollPane.getViewport();
      Rectangle vr = vp.getViewRect();
      return getScrollableBlockIncrement(vr, SwingConstants.VERTICAL, direction);
    }
  }
}
