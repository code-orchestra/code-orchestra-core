package codeOrchestra.javaScript.debugger.ui;

import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.ui.variable.JSGlobalVarsPlaceholder;
import codeOrchestra.javaScript.debugger.ui.variable.JSLocalVariable;
import codeOrchestra.javaScript.debugger.ui.variable.JSVariable;
import jetbrains.mps.debug.api.programState.IStackFrame;
import jetbrains.mps.debug.api.programState.IThread;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.logging.Logger;
import org.chromium.sdk.CallFrame;
import org.chromium.sdk.DebugContext;
import org.chromium.sdk.JsScope;
import org.chromium.sdk.JsScope.Type;
import org.chromium.sdk.JsVariable;
import org.jetbrains.annotations.Nullable;

import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public class JSStackFrame implements IStackFrame {

  private static final Logger LOG = Logger.getLogger(JSStackFrame.class);

  private ChromeEventsProcessor eventsProcessor;
  private final int myIndex;
  private JSThread myThread;

  public JSStackFrame(ChromeEventsProcessor eventsProcessor, JSThread asThread, int index) {
    this.eventsProcessor = eventsProcessor;
    this.myIndex = index;
    this.myThread = asThread;
  }

  @Override
  public JSLocation getLocation() {
    return getLocationFromFrame(getStackFrame());
  }

  public static JSLocation getLocationFromFrame(CallFrame stackFrame) {
    return new JSLocation(stackFrame);
  }

  @Nullable
  public CallFrame getStackFrame() {
    try {
      DebugContext debugContext = eventsProcessor.getDebugContext();
      if (debugContext == null) {
        return null;
      }
      List<? extends CallFrame> callFrames = debugContext.getCallFrames();
      if (callFrames.isEmpty()) {
        return null;
      }
      return callFrames.get(myIndex);
    } catch (Throwable t) {
      LOG.error(t);
      return null;
    }
  }

  @Override
  public IThread getThread() {
    return myThread;
  }

  @Override
  public Map<IWatchable, IValue> getWatchableValues() {
    Map<IWatchable, IValue> result = new LinkedHashMap<IWatchable, IValue>();

    CallFrame stackFrame = getStackFrame();

    // Global variables
    JSGlobalVarsPlaceholder jsGlobalVarsPlaceholder = new JSGlobalVarsPlaceholder(eventsProcessor, this);
    result.put(jsGlobalVarsPlaceholder, jsGlobalVarsPlaceholder.getValue());

    // Local variables
    for (JsScope jsScope : stackFrame.getVariableScopes()) {
      Type scopeType = jsScope.getType();
      // RE-2970
      if (EnumSet.of(Type.CATCH, Type.LOCAL).contains(scopeType)) {
        for (JsVariable jsVariable : jsScope.getVariables()) {
          JSVariable variable = new JSLocalVariable(eventsProcessor, jsVariable, this, scopeType);
          result.put(variable, getValue(variable));
        }
        break;
      }
    }

    return result;
  }

  @Override
  public IValue getValue(IWatchable watchable) {
    if (watchable instanceof JSVariable) {
      return watchable.getValue();
    }
    throw new IllegalStateException("Unknown watchable: " + watchable.getClass().getSimpleName() + " " + watchable);
  }

  @Override
  public List<IWatchable> getVisibleWatchables() {
    Set<IWatchable> iWatchables = getWatchableValues().keySet();
    return new ArrayList<IWatchable>(iWatchables);
  }
}
