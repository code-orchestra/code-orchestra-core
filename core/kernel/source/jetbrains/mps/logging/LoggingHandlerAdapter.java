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
package jetbrains.mps.logging;

/**
 * Igor Alshannikov
 * Oct 17, 2007
 */
public abstract class LoggingHandlerAdapter implements ILoggingHandler {
  public abstract void addLogEntry(LogEntry e);

  public final void info(LogEntry e) {
    addLogEntry(e);
  }

  public final void warning(LogEntry e) {
    addLogEntry(e);
  }

  public final void debug(LogEntry e) {
    addLogEntry(e);
  }

  public final void error(LogEntry e) {
    addLogEntry(e);
  }

  public final void fatal(LogEntry e) {
    addLogEntry(e);
  }
}
