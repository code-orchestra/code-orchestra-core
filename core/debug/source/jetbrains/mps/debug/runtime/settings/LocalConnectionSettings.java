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
package jetbrains.mps.debug.runtime.settings;

import com.intellij.util.net.NetUtils;

import java.io.IOException;

public class LocalConnectionSettings extends DebugConnectionSettings {
  public LocalConnectionSettings(boolean useSockets) {
    super(useSockets, "localhost", 5005, "");
    if (useSockets) {
      int freePort = getPort();
      try {
        freePort = NetUtils.findAvailableSocketPort();
      } catch (IOException ignored) {
      }
      setPort(freePort);
    }
  }

  @Override
  public boolean isServerMode() {
    return true;
  }

  @Override
  public boolean isSuspend() {
    return true;
  }
}
