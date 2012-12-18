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
package jetbrains.mps.nodeEditor.cellActions;

import jetbrains.mps.baseLanguage.tuples.runtime.Tuples._3;
import jetbrains.mps.ide.datatransfer.CopyPasteUtil;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.SNode;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class CellAction_CutNode extends CellAction_CopyNode {

  public boolean canExecute(EditorContext context) {
    return super.canExecute(context);
    // todo: what about read-only models?
  }

  public void execute(EditorContext context) {
    _3<List<SNode>, Map<SNode, Set<SNode>>, String> tuple = extractSelection(context);
    if (tuple == null) return;
    CopyPasteUtil.copyNodesAndTextToClipboard(tuple._0(), tuple._1(), tuple._2());
    for (SNode node : tuple._0()) {
      node.delete();
    }
  }
}
