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

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 17.12.2009
 * Time: 17:13:01
 * To change this template use File | Settings | File Templates.
 */
public interface DebugProcessListener {
  //executed in manager thread

  void connectorIsReady();

  //executed in manager thread

  void paused(@NotNull SuspendContext suspendContext);

  //executed in manager thread

  void resumed(@NotNull SuspendContext suspendContext);

  //executed in manager thread

  void processDetached(@NotNull DebugVMEventsProcessor process, boolean closedByUser);

  //executed in manager thread

  void processAttached(@NotNull DebugVMEventsProcessor process);
}
