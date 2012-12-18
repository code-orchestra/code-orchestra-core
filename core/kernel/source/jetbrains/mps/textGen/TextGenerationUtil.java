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
package jetbrains.mps.textGen;

import jetbrains.mps.messages.IMessage;
import jetbrains.mps.messages.Message;
import jetbrains.mps.messages.MessageKind;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;

import java.util.Collections;

public class TextGenerationUtil {

  public static final String NO_TEXTGEN = "\33\33NO TEXTGEN\33\33";

  public static TextGenerationResult generateText(IOperationContext context, SNode node) {
    return TextGenerationUtil.generateText(context, node, false, false, null);
  }

  public static TextGenerationResult generateText(IOperationContext context, SNode node, boolean failIfNoTextgen, boolean withDebugInfo, StringBuilder[] buffers) {
    if (TextGenManager.instance().canGenerateTextFor(node)) {
      return TextGenManager.instance().generateText(context, node, withDebugInfo, buffers);
    } else if (failIfNoTextgen) {
      String error = "Can't generate text from " + node;
      Message m = new Message(MessageKind.ERROR, error);
      if (node != null && node.isRegistered() && node.getModel() != null && !node.getModel().isTransient()) {
        m.setHintObject(new SNodePointer(node));
      }
      return new TextGenerationResult(NO_TEXTGEN, true, Collections.<IMessage>singleton(m), null, null, null, null);
    } else {
      return new TextGenerationResult(NO_TEXTGEN, false, null, null, null, null, null);
    }
  }
}
                                                            
