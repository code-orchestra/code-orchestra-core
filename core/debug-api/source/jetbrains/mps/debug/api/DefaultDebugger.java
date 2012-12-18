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
package jetbrains.mps.debug.api;

import jetbrains.mps.debug.api.breakpoints.BreakpointProvidersManager;
import jetbrains.mps.debug.api.breakpoints.DefaultProvider;
import jetbrains.mps.debug.api.breakpoints.IBreakpointsProvider;
import jetbrains.mps.debug.api.evaluation.DummyEvaluationProvider;
import jetbrains.mps.debug.api.evaluation.IEvaluationProvider;
import jetbrains.mps.util.annotation.ToRemove;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Deprecated
@ToRemove(version = 2.0)
public abstract class DefaultDebugger extends AbstractDebugger {
  public DefaultDebugger() {
    super("Dummy", Debuggers.getInstance(), BreakpointProvidersManager.getInstance());
  }

  @NotNull
  @Override
  public IBreakpointsProvider getBreakpointsProvider() {
    return new DefaultProvider(BreakpointProvidersManager.getInstance());
  }

  @Nullable
  public IEvaluationProvider getEvaluationProvider(AbstractDebugSession session) {
    return new DummyEvaluationProvider(session);
  }
}
