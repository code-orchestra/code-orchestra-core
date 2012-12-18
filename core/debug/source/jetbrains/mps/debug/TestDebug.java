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
package jetbrains.mps.debug;

import com.sun.jdi.*;
import com.sun.jdi.connect.AttachingConnector;
import com.sun.jdi.connect.Connector.Argument;
import com.sun.jdi.connect.IllegalConnectorArgumentsException;
import com.sun.jdi.event.*;
import com.sun.jdi.request.ClassPrepareRequest;
import com.sun.jdi.request.EventRequestManager;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public class TestDebug {
  private static final String CLAZZ = "com.intellij.ide.actions.AboutAction";

  public static void main(String[] args) throws IllegalConnectorArgumentsException, IOException, IncompatibleThreadStateException, AbsentInformationException, InterruptedException {
    AttachingConnector connector = getConnector();
    Map<String, Argument> connectorArgs = connector.defaultArguments();
    Argument argument = connectorArgs.get("port");
    argument.setValue("5005");
    VirtualMachine machine = connector.attach(connectorArgs);

//    printThreadsInfo(machine);
    setBreakPointAndWaitForIt(machine);
  }

  private static void setBreakPointAndWaitForIt(VirtualMachine machine) throws AbsentInformationException, InterruptedException, IncompatibleThreadStateException {
    machine.suspend();
    EventRequestManager requestManager = machine.eventRequestManager();
    List<ReferenceType> types = machine.classesByName(CLAZZ);
    ClassPrepareRequest prepareRequest = requestManager.createClassPrepareRequest();
    for (ReferenceType type : types) {
      prepareRequest.addClassFilter(type);
      addBreakPoint(requestManager, type);
    }
    prepareRequest.setEnabled(true);
    machine.resume();

    EventQueue eventQueue = machine.eventQueue();
    eventProcessingLoop:
    while (true) {
      EventSet events = eventQueue.remove();
      for (Event e : events) {
        if (e instanceof VMDeathEvent || e instanceof VMDisconnectEvent) {
          System.exit(1);
        } else if (e instanceof ClassPrepareEvent) {
          ClassPrepareEvent ce = (ClassPrepareEvent) e;
          ReferenceType type = ce.referenceType();
          if (type.name().equals(CLAZZ)) {
            addBreakPoint(requestManager, type);
          }
        } else if (e instanceof BreakpointEvent) {
          BreakpointEvent bpe = (BreakpointEvent) e;
          System.out.println("BREAKPOINT WAS HIT!");
          printThreadInfo(bpe.thread());
          machine.suspend();
          break eventProcessingLoop;
        }
      }
      events.resume();
    }
    // Thread.sleep(10000);
    machine.resume();
  }

  private static void addBreakPoint(EventRequestManager requestManager, ReferenceType type) throws AbsentInformationException {
    List<Location> locationList = type.locationsOfLine(63);
    for (Location l : locationList) {
      requestManager.createBreakpointRequest(l).setEnabled(true);
    }
  }

  private static void printThreadsInfo(VirtualMachine machine) throws IncompatibleThreadStateException {
    List<ThreadReference> threads = machine.allThreads();
    machine.suspend();
    for (ThreadReference thread : threads) {
      printThreadInfo(thread);
    }
    machine.resume();
  }

  private static void printThreadInfo(ThreadReference thread) throws IncompatibleThreadStateException {
    System.out.println(thread.name() + "[" + decodeStatus(thread.status()) + "]");
    List<StackFrame> stackFrameList = thread.frames();
    if (stackFrameList.size() > 0) {
      printVariables(stackFrameList.get(0));
    }
    System.out.println("Stack Trace:");
    for (StackFrame frame : stackFrameList) {
      System.out.println("    " + frame.location().toString());
    }
    System.out.println("");
  }

  private static void printVariables(StackFrame stackFrame) {
    try {
      final Map<LocalVariable, Value> values = stackFrame.getValues(stackFrame.visibleVariables());
      System.out.println("Local Varibales:");
      for (LocalVariable v : values.keySet()) {
        System.out.println(v.typeName() + " " + v.name() + " = " + values.get(v));
      }
    } catch (AbsentInformationException e) {
      System.out.println("Information about variables is absent");
    }
  }

  private static String decodeStatus(int status) {
    switch (status) {
      case ThreadReference.THREAD_STATUS_MONITOR:
        return "MONITOR";
      case ThreadReference.THREAD_STATUS_NOT_STARTED:
        return "NOT_STARTED";
      case ThreadReference.THREAD_STATUS_RUNNING:
        return "RUNNING";
      case ThreadReference.THREAD_STATUS_SLEEPING:
        return "SLEEPING";
      case ThreadReference.THREAD_STATUS_UNKNOWN:
        return "UNKNOWN";
      case ThreadReference.THREAD_STATUS_WAIT:
        return "WAIT";
      case ThreadReference.THREAD_STATUS_ZOMBIE:
        return "ZOMBIE";
    }
    return "Can't decode status";
  }

  private static AttachingConnector getConnector() {
    VirtualMachineManager machineManager = Bootstrap.virtualMachineManager();
    AttachingConnector connector = null;
    for (AttachingConnector c : machineManager.attachingConnectors()) {
      if (c.name().equals("com.sun.jdi.SocketAttach")) {
        connector = c;
        break;
      }
    }
    return connector;
  }
}
