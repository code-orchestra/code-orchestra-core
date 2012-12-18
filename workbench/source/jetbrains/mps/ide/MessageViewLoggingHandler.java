/*
 * Copyright 2003-2010 JetBrains s.r.o.
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
package jetbrains.mps.ide;

import jetbrains.mps.ide.messages.MessagesViewTool;
import jetbrains.mps.logging.ILoggingHandler;
import jetbrains.mps.logging.LogEntry;
import jetbrains.mps.messages.Message;
import jetbrains.mps.messages.MessageKind;

public class MessageViewLoggingHandler implements ILoggingHandler {
  private MessagesViewTool myMessagesView;

  public MessageViewLoggingHandler(MessagesViewTool messagesView) {
    myMessagesView = messagesView;
  }

  public void info(LogEntry e) {
    add(MessageKind.INFORMATION, e);
  }

  public void warning(LogEntry e) {
    add(MessageKind.WARNING, e);
  }

  public void debug(LogEntry e) {
  }

  public void error(LogEntry e) {
    add(MessageKind.ERROR, e);
  }

  public void fatal(LogEntry e) {
    add(MessageKind.ERROR, e);
  }

  private void add(MessageKind kind, LogEntry e) {
    Message message = new Message(kind, e.getSourceClass(), e.getMessage());
    message.setViewMarker(e.getMarker());
    message.setHintObject(e.getHintObject());
    message.setScopeIds(e.getScopeIds());

    long timestamp = e.getTimestamp();
    if (timestamp != 0) {
      message.setTimestamp(timestamp);
    }

    myMessagesView.add(message);
  }
}
