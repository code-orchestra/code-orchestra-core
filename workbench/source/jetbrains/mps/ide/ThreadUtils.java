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
package jetbrains.mps.ide;

import jetbrains.mps.logging.Logger;

import javax.swing.SwingUtilities;

public class ThreadUtils {
  private static final Logger LOG = Logger.getLogger(ThreadUtils.class);

  public static void runInUIThreadAndWait(Runnable r) {
    if (SwingUtilities.isEventDispatchThread()) {
      r.run();
    } else {
      try {
        SwingUtilities.invokeAndWait(r);
      } catch (Exception e) {
        LOG.error(e);
      }
    }
  }

  public static void runInUIThreadNoWait(Runnable r) {
    if (SwingUtilities.isEventDispatchThread()) {
      r.run();
    } else {
      try {
        SwingUtilities.invokeLater(r);
      } catch (Exception e) {
        LOG.error(e);
      }
    }
  }

  public static boolean isEventDispatchThread() {
    return SwingUtilities.isEventDispatchThread();
  }

  public static void assertLogIsEDT() {
    if (!isEventDispatchThread()) {
      LOG.errorWithTrace("must be called from EDT");
    }
  }
}
