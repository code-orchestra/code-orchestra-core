package codeOrchestra.actionScript.debugger.ui;

import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.actionScript.debugger.ui.variable.ASArgument;
import codeOrchestra.actionScript.debugger.ui.variable.ASLocalVariable;
import codeOrchestra.actionScript.debugger.ui.variable.ASThisVariable;
import codeOrchestra.actionScript.debugger.ui.variable.ASVariable;
import flash.tools.debugger.Frame;
import flash.tools.debugger.Variable;
import jetbrains.mps.debug.api.programState.IStackFrame;
import jetbrains.mps.debug.api.programState.IThread;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.Nullable;

import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public class ASStackFrame implements IStackFrame {

  private static final Logger LOG = Logger.getLogger(ASStackFrame.class);

  private FDBEventsProcessor eventsProcessor;
  private final int myIndex;
  private ASThread myThread;

  public ASStackFrame(FDBEventsProcessor eventsProcessor, ASThread asThread, int index) {
    this.eventsProcessor = eventsProcessor;
    this.myIndex = index;
    this.myThread = asThread;
  }
  
  @Override
  public ASLocation getLocation() {
    return getLocationFromFrame(getStackFrame());
  }

  public static ASLocation getLocationFromFrame(Frame stackFrame) {
    return new ASLocation(stackFrame);
  }

  @Override
  public IThread getThread() {
    return myThread;
  }

  @Nullable
  public Frame getStackFrame() {
    try {
      Frame[] frames = eventsProcessor.getFdbSession().getFrames();
      return frames[myIndex];
    } catch (Throwable t) {
      LOG.error(t);
      return null;
    }
  }

  @Override
  public Map<IWatchable, IValue> getWatchableValues() {
    try {
      Map<IWatchable, IValue> result = new LinkedHashMap<IWatchable, IValue>();

      // 0 - return empty result if no frame can be located
      Frame fdbFrame = getStackFrame();
      if (fdbFrame == null) {
        return result;
      }

      // 1 - this
      Variable thisVariable = fdbFrame.getThis(eventsProcessor.getFdbSession());
      if (thisVariable != null) {
        ASVariable asVariable = new ASThisVariable(eventsProcessor, thisVariable, this);
        result.put(asVariable, asVariable.getValue());
      }

      // 2 - arguments
      Variable[] arguments = fdbFrame.getArguments(eventsProcessor.getFdbSession());
      for (Variable argument : arguments) {
        ASVariable asVariable = new ASArgument(eventsProcessor, argument, this);
        result.put(asVariable, asVariable.getValue());
      }

      // 3 - locals
      Variable[] locals = fdbFrame.getLocals(eventsProcessor.getFdbSession());
      for (Variable localVar : locals) {
        ASVariable asVariable = new ASLocalVariable(eventsProcessor, localVar, this);
        result.put(asVariable, asVariable.getValue());
      }

      return result;
    } catch (Throwable t) {
      // ignore
    }
    return Collections.emptyMap();
  }

  @Override
  public IValue getValue(IWatchable watchable) {
    if (watchable instanceof ASVariable) {
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
