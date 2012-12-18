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
package jetbrains.mps.debug.runtime;

import org.jetbrains.annotations.NotNull;

public abstract class DebugProcessAdapter implements DebugProcessListener {
  @Override
  public void connectorIsReady() {
  }

  @Override
  public void paused(@NotNull SuspendContext suspendContext) {
  }

  @Override
  public void resumed(@NotNull SuspendContext suspendContext) {
  }

  @Override
  public void processDetached(@NotNull DebugVMEventsProcessor process, boolean closedByUser) {
  }

  @Override
  public void processAttached(@NotNull DebugVMEventsProcessor process) {
  }
}
