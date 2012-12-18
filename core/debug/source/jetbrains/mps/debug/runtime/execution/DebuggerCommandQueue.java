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
package jetbrains.mps.debug.runtime.execution;

import jetbrains.mps.debug.runtime.execution.IDebuggerCommand.CommandPriority;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;

import java.util.LinkedList;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class DebuggerCommandQueue {
  private static final Logger LOG = Logger.getLogger(DebuggerCommandQueue.class);

  private final LinkedList[] myCommands;
  private final ReentrantLock myLock;
  private final Condition myCommandsAvailable;

  private volatile IDebuggerCommand myCurrentCommand;

  private volatile boolean myIsClosed = false;

  public DebuggerCommandQueue() {
    myLock = new ReentrantLock();
    myCommandsAvailable = myLock.newCondition();
    myCommands = new LinkedList[CommandPriority.values().length];
    for (int i = 0; i < myCommands.length; i++) {
      myCommands[i] = new LinkedList<IDebuggerCommand>();
    }
  }

  public void pushBack(@NotNull IDebuggerCommand debuggerCommand, int priority) {
    LOG.debug("pushBack command " + debuggerCommand);

    myLock.lock();
    try {
      getCommandsList(priority).addFirst(debuggerCommand);
      myCommandsAvailable.signalAll();
    } finally {
      myLock.unlock();
    }
  }

  public void put(@NotNull IDebuggerCommand command, int priority) {
    LOG.debug("put command " + command);

    myLock.lock();
    try {
      getCommandsList(priority).offer(command);
      myCommandsAvailable.signalAll();
    } finally {
      myLock.unlock();
    }
  }

  private LinkedList<IDebuggerCommand> getCommandsList(final int priority) {
    return (LinkedList<IDebuggerCommand>) myCommands[priority];
  }

  public void close() {
    myLock.lock();
    try {
      myIsClosed = true;
      myCommandsAvailable.signalAll();
    } finally {
      myLock.unlock();
    }
  }

  private IDebuggerCommand getCommand() throws DebuggerCommandQueueClosedException {
    myLock.lock();
    try {
      while (true) {
        if (myIsClosed) {
          throw new DebuggerCommandQueueClosedException();
        }
        for (int i = 0; i < myCommands.length; i++) {
          final IDebuggerCommand debuggerCommand = getCommandsList(i).poll();
          if (debuggerCommand != null) {
            return debuggerCommand;
          }
        }
        myCommandsAvailable.awaitUninterruptibly();
      }
    } finally {
      myLock.unlock();
    }
  }

  /* package */ IDebuggerCommand get() throws DebuggerCommandQueueClosedException {
    return myCurrentCommand = getCommand();
  }

  public boolean isClosed() {
    return myIsClosed;
  }

  public IDebuggerCommand getCurrentCommand() {
    return myCurrentCommand;
  }
}