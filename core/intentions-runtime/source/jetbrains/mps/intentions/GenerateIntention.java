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
package jetbrains.mps.intentions;

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.EditorContext;

public abstract class GenerateIntention extends AbstractIntention {
  public boolean executeUI(final SNode node, final EditorContext editorContext, IntentionContext intentionContext) {
    return true;
  }

  public void execute(final SNode node, final EditorContext editorContext, IntentionContext intentionContext) {
  }

  public void execute(final SNode node, final EditorContext editorContext) {
    execute(node, editorContext, new IntentionContext()); 
  }
}
