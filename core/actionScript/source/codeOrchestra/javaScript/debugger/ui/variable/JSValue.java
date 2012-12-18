package codeOrchestra.javaScript.debugger.ui.variable;

import codeOrchestra.actionScript.debugger.icons.Icons;
import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.ui.JSStackFrame;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import org.chromium.sdk.JsObject;
import org.chromium.sdk.JsValue;
import org.chromium.sdk.JsVariable;

import javax.swing.Icon;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class JSValue implements IValue {

  private ChromeEventsProcessor eventsProcessor;
  private JSStackFrame stackFrame;
  private JsValue value;
  private JSVariable variable;

  public JSValue(ChromeEventsProcessor eventsProcessor, JSStackFrame stackFrame, JsValue value, JSVariable variable) {
    this.eventsProcessor = eventsProcessor;
    this.stackFrame = stackFrame;
    this.value = value;
    this.variable = variable;
  }

  @Override
  public String getValuePresentation() {
    try {
      return value.getValueString();
    } catch (Throwable t) {
      return "(unknown value)";
    }
  }

  @Override
  public Icon getPresentationIcon() {
    return Icons.VARIABLE_OBJECT;
  }

  @Override
  public boolean isStructure() {
    return JsValue.Type.isObjectType(value.getType());
  }

  @Override
  public List<IWatchable> getSubvalues() {
    List<IWatchable> result = new ArrayList<IWatchable>();

    JsObject jsObject = value.asObject();
    if (jsObject != null) {
      for (JsVariable jsVariable : jsObject.getProperties()) {
        result.add(new JSVariable(eventsProcessor, jsVariable, stackFrame, variable.getScopeType()));
      }
    }

    return result;
  }
}
