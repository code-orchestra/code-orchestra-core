package codeOrchestra.editor;

import com.intellij.openapi.application.impl.LaterInvocator;
import codeOrchestra.actionScript.Concepts;
import codeOrchestra.actionscript.view.utils.NodeUtils;
import jetbrains.mps.ide.tooltips.MPSToolTipManager;
import jetbrains.mps.nodeEditor.CellActionType;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteChooser;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteInfo;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstitutePatternEditor;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.action.INodeSubstituteAction;
import org.apache.commons.lang.ObjectUtils;

import java.awt.Point;
import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * RE-3295
 * @author Alexander Eliseyev
 */
public final class InputTooltipDisplay {

  private static final String MULTIPLE_CHOICES_AVAILABLE_TOOLTIP = "Multiple choices available - press CTRL+SPACE";

  private static InputTooltipDisplay INSTANCE;

  public synchronized static InputTooltipDisplay getInstance() {
    if (INSTANCE == null) {
      INSTANCE = new InputTooltipDisplay();
    }
    return INSTANCE;
  }

  private final List<NodeTimestampWrapper> nodesToShow = new ArrayList<NodeTimestampWrapper>();
  private final Object nodesToShowMonitor = new Object();
  private final InputTooltipDisplay.TooltipDisplayThread myTooltipDisplayThread;

  private InputTooltipDisplay() {
    this.myTooltipDisplayThread = new TooltipDisplayThread();
    this.myTooltipDisplayThread.start();
  }

  public void tryDisplayMultipleChoiceHint(final EditorCell_Label cell, String oldText, String textToSet, KeyEvent keyEvent) {
    boolean isValidText = cell.isValidText(textToSet);
    boolean isDynamicAndShouldShowPopup = isDynamicAndShouldShowPopup(cell);

    // RE-3496
    if (!isValidText || isDynamicAndShouldShowPopup) {
      if (shouldDisplayAutoСomplete(cell, oldText, textToSet)) {
        if (cell.canExecuteAction(CellActionType.COMPLETE_NO_AUTO)) {
          cell.executeAction(CellActionType.COMPLETE_NO_AUTO);
          if (keyEvent != null) {
            keyEvent.consume();
          }

          return;
        }
      }
    }

    if (!isValidText) {
      synchronized (nodesToShowMonitor) {
        nodesToShow.add(new NodeTimestampWrapper(cell));
      }
    }
  }

  private boolean isDynamicAndShouldShowPopup(EditorCell_Label cell) {
    SNode node = cell.getSNode();
    if (node != null) {
      if (node.isInstanceOfConcept(Concepts.ANNOTATION_PROPERTY_VALUE)) {
        return true;
      }

      if (node.isInstanceOfConcept(Concepts.DYNAMIC_ACCESS_OPERATION_CONCEPT)) {
        return NodeUtils.shouldShowAutoPopup(node);
      }

      if (node.isInstanceOfConcept(Concepts.IDYNAMIC_ACCESS_CONCEPT)) {
        return !NodeUtils.isDynamicAccess(node);
      }
    }
    return false;
  }

  private boolean shouldDisplayAutoСomplete(EditorCell_Label cell, String oldText, String textToSet) {
    if (oldText == null || textToSet == null) {
      return false;
    }
    if (textToSet.length() <= oldText.length()) {
      return false;
    }
    if (!cell.isLastCaretPosition()) {
      return false;
    }

    // RE-4728
    if (textToSet.endsWith("*")) {
      return false;
    }

    if (textToSet.length() == 2) {
      if (Character.isLetter(textToSet.charAt(0)) && Character.isLetter(textToSet.charAt(1))) {
        if (Character.isUpperCase(textToSet.charAt(0))) {
          return false;
        }
        if (Character.isLowerCase(textToSet.charAt(1))) {
          return false;
        }
        return hasOptions(cell);
      }
      return false;
    } else if (textToSet.length() > 2 && oldText.length() <= 2) {
      return hasOptions(cell);
    }

    return false;
  }

  private boolean hasOptions(EditorCell_Label cell) {
    NodeSubstituteInfo substituteInfo = cell.getSubstituteInfo();
    if (substituteInfo == null) {
      return false;
    }

    NodeSubstitutePatternEditor patternEditor = cell.createSubstitutePatternEditor();
    final List<INodeSubstituteAction> matchingActions = substituteInfo.getMatchingActions(patternEditor.getPattern(), false);

    return !matchingActions.isEmpty();
  }

  /*
  private boolean hasMoreThanOneOption(EditorCell_Label cell) {
    NodeSubstituteInfo substituteInfo = cell.getSubstituteInfo();
    if (substituteInfo == null) {
      return false;
    }

    NodeSubstitutePatternEditor patternEditor = cell.createSubstitutePatternEditor();
    final List<INodeSubstituteAction> matchingActions = substituteInfo.getMatchingActions(patternEditor.getPattern(), false);

    return matchingActions.size() > 1;
  }
  */

  private class TooltipDisplayThread extends Thread {
    public static final int CHECK_INTERVAL = 50;
    public static final int DISPLAY_TIMEOUT = 1500;

    @Override
    public void run() {
      while (true) {
        // Sleep a bit
        try { Thread.sleep(CHECK_INTERVAL); } catch (InterruptedException e) {}

        // Go through the cells collection
        synchronized (nodesToShowMonitor) {
          Iterator<NodeTimestampWrapper> nodesIterator = nodesToShow.iterator();
          while (nodesIterator.hasNext()) {
            // Get the node wrapper
            NodeTimestampWrapper nodeTimestampWrapper = nodesIterator.next();

            // Check if the auto-complete popup is on
            NodeSubstituteChooser nodeSubstituteChooser = nodeTimestampWrapper.getCell().getEditor().getNodeSubstituteChooser();
            if (nodeSubstituteChooser != null && nodeSubstituteChooser.isVisible()) {
              nodesIterator.remove();
              continue;
            }

            // Check if the text has changed and remove the wrapper if so
            if (nodeTimestampWrapper.isTextChanged()) {
              nodesIterator.remove();
              continue;
            }

            // Check if the timeout is reached. If so, display the tooltip and
            long delta = System.currentTimeMillis() - nodeTimestampWrapper.getTimestamp();
            if (delta > DISPLAY_TIMEOUT) {
              displayTooltip(nodeTimestampWrapper);
              nodesIterator.remove();
            }
          }
        }
      }
    }

    private void displayTooltip(final NodeTimestampWrapper nodeTimestampWrapper) {
      LaterInvocator.invokeLater(new Runnable() {
        @Override
        public void run() {
          EditorCell_Label cell = nodeTimestampWrapper.getCell();
          if (!cell.isSelected()) {
            return;
          }

          NodeSubstituteInfo substituteInfo = cell.getSubstituteInfo();
          if (substituteInfo == null) {
            return;
          }

          NodeSubstitutePatternEditor patternEditor = cell.createSubstitutePatternEditor();
          final String pattern = patternEditor.getPattern();
          final List<INodeSubstituteAction> matchingActions = substituteInfo.getMatchingActions(pattern, false);
          if (matchingActions.size() > 1) {
            // Don't display the tooltip if there's an action with matching text equal to the cell text
            final boolean[] equalMatchingTextFound = new boolean[1];
            ModelAccess.instance().tryRead(new Runnable() {
              @Override
              public void run() {
                for (INodeSubstituteAction matchingAction : matchingActions) {
                  if (ObjectUtils.equals(matchingAction.getVisibleMatchingText(pattern), nodeTimestampWrapper.getInitialText())) {
                    equalMatchingTextFound[0] = true;
                    return;
                  }
                }
              }
            });

            if (equalMatchingTextFound[0]) {
              Point point = new Point(cell.getX(), cell.getY() + cell.getHeight());
              MPSToolTipManager.getInstance().showToolTip(MULTIPLE_CHOICES_AVAILABLE_TOOLTIP, cell.getEditor(), point);
            }
          }
        }
      });
    }
  }

  private static class NodeTimestampWrapper {
    private EditorCell_Label cell;
    private long timestamp;
    private String initialText;

    private NodeTimestampWrapper(EditorCell_Label cell) {
      this.cell = cell;
      this.initialText = cell.getText();
      this.timestamp = System.currentTimeMillis();
    }

    public String getInitialText() {
      return initialText;
    }

    public EditorCell_Label getCell() {
      return cell;
    }

    public long getTimestamp() {
      return timestamp;
    }

    public boolean isTextChanged() {
      return !ObjectUtils.equals(initialText, cell.getText());
    }

    @Override
    public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      NodeTimestampWrapper that = (NodeTimestampWrapper) o;

      if (timestamp != that.timestamp) return false;
      if (cell != null ? !cell.equals(that.cell) : that.cell != null) return false;

      return true;
    }

    @Override
    public int hashCode() {
      int result = cell != null ? cell.hashCode() : 0;
      result = 31 * result + (int) (timestamp ^ (timestamp >>> 32));
      return result;
    }
  }

}
