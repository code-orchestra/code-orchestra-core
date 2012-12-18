package codeOrchestra.actionScript.debugger.ui;

import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.actionScript.debugger.icons.Icons;
import codeOrchestra.actionScript.debugger.ui.variable.ASMember;
import codeOrchestra.actionScript.debugger.ui.variable.ASVariable;
import flash.tools.debugger.*;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.util.misc.hash.HashSet;

import javax.swing.Icon;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public class ASValue implements IValue {

  private final static Set<Integer> primitiveTypes = new HashSet<Integer>() {{
    add(VariableType.BOOLEAN);
    add(VariableType.NULL);
    add(VariableType.NUMBER);
    add(VariableType.STRING);
    add(VariableType.UNDEFINED);
  }};

  private FDBEventsProcessor eventsProcessor;
  private ASStackFrame stackFrame;
  private Value value;
  private ASVariable variable;

  public ASValue(ASVariable variable, Value value, ASStackFrame stackFrame, FDBEventsProcessor eventsProcessor) {
    this.value = value;
    this.stackFrame = stackFrame;
    this.eventsProcessor = eventsProcessor;
    this.variable = variable;
  }

  @Override
  public String getValuePresentation() {
    if (isPrimitive()) {
      return value.getValueAsString();
    }
    return "{" + value.getTypeName() + "} [" + value.getValueAsString() + "]";
  }

  public boolean isPrimitive() {
    return primitiveTypes.contains(value.getType());
  }

  @Override
  public Icon getPresentationIcon() {
    return Icons.VARIABLE_OBJECT;
  }

  @Override
  public boolean isStructure() {
    return value.getType() == VariableType.OBJECT;
  }

  @Override
  public List<IWatchable> getSubvalues() {
    List<IWatchable> result = new ArrayList<IWatchable>();

    try {
      for (Variable variable : value.getMembers(eventsProcessor.getFdbSession())) {
        result.add(new ASMember(eventsProcessor, variable, stackFrame, this.variable));
      }
    } catch (NotSuspendedException e) {
      // do nothing
    } catch (NoResponseException e) {
      // do nothing
    } catch (NotConnectedException e) {
      // do nothing
    }

    return result;
  }
}
