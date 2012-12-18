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
package jetbrains.mps.make;

import jetbrains.mps.messages.IMessage;
import jetbrains.mps.messages.MessageKind;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

/**
 * Evgeny Gryaznov, Aug 20, 2010
 */
public class MPSCompilationResult implements Serializable {
  private static final long serialVersionUID = -4445402451448540384L;

  private int myErrors;
  private int myWarnings;
  private boolean myAborted;
  private boolean myCompiledAnything;
  private List<? extends IMessage> myMessages;

  public MPSCompilationResult(int errors, int warnings, boolean aborted, boolean compiled) {
    this(errors, warnings, aborted, compiled, Collections.<IMessage>emptyList());
  }

  public MPSCompilationResult(int errors, int warnings, boolean aborted, boolean compiled, List<? extends IMessage> messages) {
    myErrors = errors;
    myWarnings = warnings;
    myAborted = aborted;
    myCompiledAnything = compiled;
    myMessages = messages;
  }

  public int getErrors() {
    return myErrors;
  }

  public int getWarnings() {
    return myWarnings;
  }

  public boolean isAborted() {
    return myAborted;
  }

  public boolean isCompiledAnything() {
    return myCompiledAnything;
  }

  public boolean isOk() {
    return (getErrors() == 0) && !isAborted();
  }

  public boolean isReloadingNeeded() {
    return isOk() && isCompiledAnything();
  }

  public List<IMessage> getMessages() {
    return myMessages != null ? Collections.unmodifiableList(myMessages) : Collections.<IMessage>emptyList();
  }

  public String getErrorsText() {
    StringBuilder sb = new StringBuilder();
    for (IMessage m : myMessages) {
      if (m.getKind() == MessageKind.ERROR) {
        sb.append(m.getText()).append('\n');
      }
    }
    return sb.toString();
  }

  public String toString() {
    if (!isAborted()) {
      return "compilation finished : errors: " + getErrors() + " warnings: " + getWarnings()
          + (getErrors() > 0 ? "\n" + getErrorsText() : "");
    } else {
      return "compilation aborted";
    }
  }
}
