package codeOrchestra.javaScript.debugger.ui.variable;

import codeOrchestra.actionScript.debugger.icons.Icons;
import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.ui.JSStackFrame;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.debugger.api.ui.tree.WatchableNode;
import jetbrains.mps.smodel.SNode;
import org.chromium.sdk.CallFrame;
import org.chromium.sdk.JsScope;
import org.chromium.sdk.JsScope.Type;
import org.chromium.sdk.JsValue;
import org.chromium.sdk.JsVariable;

import javax.swing.Icon;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class JSGlobalVarsPlaceholder implements IWatchable {

  private JSStackFrame stackFrame;
  private ChromeEventsProcessor eventsProcessor;
  private final JSGlobalVarsPlaceholder.JSGlobalVarsPlaceholderValue value;

  public JSGlobalVarsPlaceholder(ChromeEventsProcessor eventsProcessor, JSStackFrame stackFrame) {
    this.stackFrame = stackFrame;
    this.eventsProcessor = eventsProcessor;
    this.value = new JSGlobalVarsPlaceholderValue();
  }

  @Override
  public String getName() {
    return "Global Variables";
  }

  @Override
  public WatchablesCategory getCategory() {
    return JSWatchablesCategory.GLOBAL_PLACEHOLDER;
  }

  @Override
  public IValue getValue() {
    return value;
  }

  @Override
  public Icon getPresentationIcon() {
    return Icons.CHROMIUM;
  }

  @Override
  public SNode getNode() {
    return null;
  }

  private class JSGlobalVarsPlaceholderValue implements IValue {
    @Override
    public String getValuePresentation() {
      return WatchableNode.EMPTY_VALUE_PRESENTATION;
    }

    @Override
    public Icon getPresentationIcon() {
      return Icons.CHROMIUM;
    }

    @Override
    public boolean isStructure() {
      return true;
    }

    @Override
    public List<IWatchable> getSubvalues() {
      List<IWatchable> result = new ArrayList<IWatchable>();

      CallFrame chromeCallFrame = stackFrame.getStackFrame();
      if (chromeCallFrame == null) {
        return result;
      }

      for (JsScope jsScope : chromeCallFrame.getVariableScopes()) {
        if (jsScope.getType() == Type.GLOBAL) {
          for (JsVariable jsVariable : jsScope.getVariables()) {
            // Skip global functions for now
            if (jsVariable.getValue().getType() != JsValue.Type.TYPE_FUNCTION) {
              JSVariable variable = new JSVariable(eventsProcessor, jsVariable, stackFrame, jsScope.getType());
              result.add(variable);
            }
          }
          break;
        }
      }

      return result;
    }
  }

}
