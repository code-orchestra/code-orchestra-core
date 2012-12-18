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

import jetbrains.mps.debug.api.AbstractDebugSession;
import jetbrains.mps.debug.api.SessionChangeAdapter;

public abstract class SessionStopDisposer {
  private final DebugSession myDebugSession;

  public SessionStopDisposer(DebugSession debugSession) {
    myDebugSession = debugSession;

    myDebugSession.addChangeListener(new SessionChangeAdapter() {
      @Override
      public void resumed(AbstractDebugSession session) {
        if (session == myDebugSession && myDebugSession.isStopped()) {
          myDebugSession.removeChangeListener(this);
          doDispose();
        }
      }
    });
  }

  public abstract void doDispose();
}
