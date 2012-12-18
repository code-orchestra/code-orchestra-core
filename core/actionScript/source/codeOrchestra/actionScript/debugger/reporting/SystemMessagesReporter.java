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
package codeOrchestra.actionScript.debugger.reporting;

import com.intellij.execution.process.ProcessHandler;
import com.intellij.execution.process.ProcessOutputTypes;
import com.intellij.openapi.util.Key;
import com.intellij.openapi.util.Pair;

import java.util.ArrayList;
import java.util.List;

public class SystemMessagesReporter {

  private String myName;
  
  private volatile ProcessHandler myProcessHandler;

  private final List<Pair<String, Key>> myPostponedMessages = new ArrayList<Pair<String, Key>>();

  public void setProcessName(String processName) {
    myName = processName;
  }

  public void reportInformation(String message) {
    reportOrPostpone(message, ProcessOutputTypes.SYSTEM);
  }

  public void reportError(String message) {
    reportOrPostpone(message, ProcessOutputTypes.STDERR);
  }

  private synchronized void reportOrPostpone(String message, Key key) {
    if (myProcessHandler == null) {
      myPostponedMessages.add(new Pair<String, Key>(message, key));
    } else {
      reportInternal(message, key);
    }
  }

  public synchronized void setProcessHandler(ProcessHandler processHandler) {
    myProcessHandler = processHandler;
    for (Pair<String, Key> message : myPostponedMessages) {
      reportInternal(message.first, message.second);
    }
  }

  private void reportInternal(String message, Key key) {
    myProcessHandler.notifyTextAvailable(message + "\n", key);
  }

}
