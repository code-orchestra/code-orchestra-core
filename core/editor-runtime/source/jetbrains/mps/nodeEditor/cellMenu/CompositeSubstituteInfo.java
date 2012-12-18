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
package jetbrains.mps.nodeEditor.cellMenu;

import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.action.INodeSubstituteAction;
import jetbrains.mps.logging.Logger;

import java.util.LinkedList;
import java.util.List;

/**
 * Igor Alshannikov
 * Date: Nov 29, 2006
 */
public class CompositeSubstituteInfo extends AbstractNodeSubstituteInfo {
  private static final Logger LOG = Logger.getLogger(CompositeSubstituteInfo.class);

  private CellContext myCellContext;
  private SubstituteInfoPart[] myParts;


  public CompositeSubstituteInfo(EditorContext editorContext, CellContext cellContext, SubstituteInfoPart[] parts) {
    super(editorContext);
    myCellContext = cellContext;
    myParts = parts;
  }

  protected List<INodeSubstituteAction> createActions() {
    List<INodeSubstituteAction> actions = new LinkedList<INodeSubstituteAction>();
    for (SubstituteInfoPart menuPart : myParts) {
      try {
        actions.addAll(menuPart.createActions(myCellContext, getEditorContext()));
      } catch (Throwable e) {
        LOG.error(e);
      }
    }
    return actions;
  }
}
