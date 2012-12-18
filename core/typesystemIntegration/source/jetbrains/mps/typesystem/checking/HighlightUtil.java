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
package jetbrains.mps.typesystem.checking;

import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.errors.MessageStatus;
import jetbrains.mps.errors.SimpleErrorReporter;
import jetbrains.mps.errors.messageTargets.NodeMessageTarget;
import jetbrains.mps.nodeEditor.*;
import jetbrains.mps.nodeEditor.checking.BaseEditorChecker;
import jetbrains.mps.nodeEditor.checking.EditorCheckerAdapter;
import jetbrains.mps.smodel.SNode;

import java.awt.Color;

public class HighlightUtil {
  public static HighlighterMessage createHighlighterMessage(SNode node, String message, IErrorReporter errorReporter, BaseEditorChecker checker, EditorContext editorContext) {
    if (errorReporter == null) {
      errorReporter = new SimpleErrorReporter(node, message, null, null, MessageStatus.ERROR, new NodeMessageTarget());
    }
    final MessageStatus status = errorReporter.getMessageStatus();
    HighlighterMessage error = new HighlighterMessage(
      node,
      status,
      errorReporter.getErrorTarget(),
      getMessageColor(status),
      message,
      checker);
    error.setErrorReporter(errorReporter);
    return error;
  }

  public static HighlighterMessage createHighlighterMessage(SNode node, String message, EditorCheckerAdapter checker, EditorContext editorContext) {
    return createHighlighterMessage(node, message, (IErrorReporter) null, checker, editorContext);
  }

  public static Color getMessageColor(MessageStatus messageStatus) {
    if (messageStatus == MessageStatus.ERROR) return Color.RED;
    if (messageStatus == MessageStatus.WARNING) return Color.YELLOW;
    if (messageStatus == MessageStatus.OK) return Color.LIGHT_GRAY;
    return Color.BLACK;
  }
}
