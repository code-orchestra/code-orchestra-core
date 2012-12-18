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

class Log4jLoggingHandler implements ILoggingHandler {
  private org.apache.log4j.Logger getLogger(String fqName) {
    return org.apache.log4j.Logger.getLogger(fqName);
  }

  public void info(LogEntry e) {
    getLogger(e.getSourceClass()).info(e.getMessage(), e.getThrowable());
  }

  public void warning(LogEntry e) {
    getLogger(e.getSourceClass()).warn(e.getMessage(), e.getThrowable());
  }

  public void debug(LogEntry e) {
    getLogger(e.getSourceClass()).debug(e.getMessage(), e.getThrowable());
  }

  public void error(LogEntry e) {
    getLogger(e.getSourceClass()).error(e.getMessage(), e.getThrowable());
  }

  public void fatal(LogEntry e) {
    getLogger(e.getSourceClass()).fatal(e.getMessage(), e.getThrowable());
  }
}
