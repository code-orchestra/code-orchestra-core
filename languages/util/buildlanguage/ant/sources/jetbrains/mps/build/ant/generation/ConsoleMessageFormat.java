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
package jetbrains.mps.build.ant.generation;

import jetbrains.mps.build.ant.IBuildServerMessageFormat;
import org.jetbrains.annotations.NotNull;

public class ConsoleMessageFormat implements IBuildServerMessageFormat {
  @Override
  public StringBuffer escapeBuildMessage(@NotNull StringBuffer message) {
    return message;
  }

  @Override
  public String escapeBuildMessage(@NotNull String message) {
    return message;
  }

  @Override
  public String getLinesSeparator() {
    return System.getProperty("line.separator");
  }

  @Override
  public String formatTestStart(@NotNull String testName) {
    return "Test Started: " + testName;
  }

  @Override
  public String formatTestFinish(@NotNull String testName) {
    return "Test Finished: " + testName;
  }

  @Override
  public CharSequence formatTestFailure(@NotNull String testName, @NotNull String message, @NotNull CharSequence details) {
    return "Test Failed: " + testName + " with message:\n" + message + "\n" + details;
  }

  @Override
  public boolean isBuildServerMessage(@NotNull CharSequence message) {
    return false;
  }

  @Override
  public int hasContinuation(@NotNull String message) {
    return 0;
  }
}
