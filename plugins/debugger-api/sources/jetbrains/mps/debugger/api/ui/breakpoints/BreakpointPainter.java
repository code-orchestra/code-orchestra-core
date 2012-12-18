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
package jetbrains.mps.debugger.api.ui.breakpoints;

import jetbrains.mps.debug.api.breakpoints.IBreakpoint;
import jetbrains.mps.debug.api.breakpoints.ILocationBreakpoint;
import jetbrains.mps.smodel.SNode;

import java.awt.Color;

class BreakpointPainter extends EditorCellPainter<IBreakpoint> {
  private static final Color CELL_BACKGROUND_COLOR = new Color(255, 200, 200, 50);
  private static final Color STRIPE_BACKGROUND_COLOR = new Color(255, 200, 200);
  private static final Color FRAME_COLOR = new Color(255, 100, 100);

  private final IBreakpoint myBreakpoint;

  public BreakpointPainter(IBreakpoint mpsBreakpoint) {
    myBreakpoint = mpsBreakpoint;
  }

  @Override
  protected SNode getSNode() {
    if (myBreakpoint instanceof ILocationBreakpoint) {
      return ((ILocationBreakpoint) myBreakpoint).getLocation().getSNode();
    } else {
      return null;
    }
  }

  @Override
  protected Color getCellBackgroundColor() {
    return CELL_BACKGROUND_COLOR;
  }

  @Override
  protected Color getStripeBackgroundColor() {
    return STRIPE_BACKGROUND_COLOR;
  }

  @Override
  protected Color getFrameColor() {
    return FRAME_COLOR;
  }

  @Override
  public IBreakpoint getItem() {
    return myBreakpoint;
  }

}
