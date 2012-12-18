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
package jetbrains.mps.debugger.api.ui.tree;

import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import java.util.List;

public class WatchableNode extends AbstractWatchableNode {
  public static final String EMPTY_VALUE_PRESENTATION = "$EMPTY$";
  private boolean myInitialized;
  @NotNull
  private IWatchable myWatchable;

  public WatchableNode(@NotNull IWatchable watchable) {
    this(null, watchable);
  }

  public WatchableNode(IOperationContext context, @NotNull IWatchable watchable) {
    super(context, watchable.getNode());
    myWatchable = watchable;
    setNodeIdentifier(calculateNodeId());
    setIcon(getNodeIcon());
  }

  protected void doUpdate() {
    this.removeAllChildren();
    myInitialized = false;
  }

  public boolean isInitialized() {
    return myInitialized;
  }

  protected Icon getNodeIcon() {
    //  if (myNode != null) {
    //    return jetbrains.mps.ide.projectPane.Icons.DEFAULT_ICON;
    //  }
    return myWatchable.getPresentationIcon();
  }

  @CodeOrchestraPatch
  protected String calculateNodeId() {
    String valuePresentation = getValuePresentation(myWatchable.getValue());

    if (EMPTY_VALUE_PRESENTATION.equals(valuePresentation)) {
      return myWatchable.getName();
    }

    return myWatchable.getName()
      + " = "
      + valuePresentation;
  }

  @NotNull
  protected String getValuePresentation(IValue value) {
    if (value == null) return "null";
    return value.getValuePresentation();
  }

  @Override
  public boolean isLeaf() {
    IValue value = getValue();
    return value == null || !value.isStructure();
  }

  protected IValue getValue() {
    return myWatchable.getValue();
  }

  @Override
  protected void doInit() {
    removeAllChildren();
    if (!isLeaf()) {
      List<IWatchable> subvalues = getValue().getSubvalues();
      for (IWatchable watchable : subvalues) {
        add(new WatchableNode(watchable));
      }
    }
    updatePresentation();
    myInitialized = true;
  }
}
