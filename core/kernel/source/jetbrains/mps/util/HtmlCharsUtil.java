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
package jetbrains.mps.util;

public class HtmlCharsUtil {
  public static String asHtml(String s, boolean xml) {
    StringBuilder builder = new StringBuilder(s);
    int i = 0;
    while (i < builder.length()) {
      char c = builder.charAt(i);
      if (c == '>') {
        builder.replace(i, i + 1, "&gt;");
        i += 3;
      }
      if (c == '<') {
        builder.replace(i, i + 1, "&lt;");
        i += 3;
      }
      if (!xml && c == '\n') {
        builder.replace(i, i + 1, "<br/>");
        i += 4;
      }
      if (!xml && c == '\r' && i + 1 < builder.length() && builder.charAt(i + 1) == '\n') {
        builder.replace(i, i + 2, "<br/>");
        i += 4;
      }
      if (!xml && c == ' ') {
        builder.replace(i, i + 1, "&nbsp;");
        i += 5;
      }
      i++;
    }
    return builder.toString();
  }
}
