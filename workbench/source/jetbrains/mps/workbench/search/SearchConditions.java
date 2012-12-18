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
package jetbrains.mps.workbench.search;

import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

public class SearchConditions {
  public static Pattern containsWholeWord(final String pattern, final boolean ignoreCase) {
    return getPattern("\\b" + Pattern.quote(pattern) + "\\b", ignoreCase);
  }

  public static Pattern containsString(final String pattern, final boolean ignoreCase) {
    return getPattern(Pattern.quote(pattern), ignoreCase);
  }

  public static Pattern containsRegexp(final String pattern, final boolean ignoreCase) {
    try {
      return getPattern(pattern, ignoreCase);
    } catch (PatternSyntaxException pse) {
      return null;
    }
  }

  private static Pattern getPattern(String pattern, boolean ignoreCase) {
    return Pattern.compile(pattern, ignoreCase ? 0 : Pattern.CASE_INSENSITIVE);
  }
}
