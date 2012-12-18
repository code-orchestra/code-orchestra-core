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
package jetbrains.mps.build.ant;

import org.jetbrains.annotations.NotNull;

public interface IBuildServerMessageFormat {
  StringBuffer escapeBuildMessage(@NotNull StringBuffer message);
  String escapeBuildMessage(@NotNull String message);
  String getLinesSeparator();
  String formatTestStart(@NotNull String testName);
  String formatTestFinish(@NotNull String testName);
  CharSequence formatTestFailure(@NotNull String testName, @NotNull String message, @NotNull CharSequence details);
  boolean isBuildServerMessage(@NotNull CharSequence message);
  int hasContinuation(@NotNull String message);
}
