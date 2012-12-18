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
package jetbrains.mps.plugin;

import java.io.Serializable;

public class CompilationResult implements Serializable {
  private static final long serialVersionUID = -4445402451448540384L;

  private int myErrors;
  private int myWarnings;
  private boolean myAborted;
  private boolean myCompiledAnything;

  public CompilationResult(int errors, int warnings, boolean aborted) {
    this(errors, warnings, aborted, true);
  }

  public CompilationResult(int errors, int warnings, boolean aborted, boolean compiled) {
    myErrors = errors;
    myWarnings = warnings;
    myAborted = aborted;
    myCompiledAnything = compiled;
  }

  public int getErrors() {
    return myErrors;
  }

  public int getWarnings() {
    return myWarnings;
  }

  public boolean isAborted() {
    return myAborted;
  }

  public boolean isCompiledAnything() {
    return myCompiledAnything;
  }

  public boolean isOk() {
    return (getErrors() == 0) && !isAborted();
  }

  public boolean isReloadingNeeded() {
    return isOk() && isCompiledAnything();
  }

  public String toString() {
    if (!isAborted()) {
      return "compilation finished : errors: " + getErrors() + " warnings: " + getWarnings();
    } else {
      return "compilation aborted";
    }
  }
}
