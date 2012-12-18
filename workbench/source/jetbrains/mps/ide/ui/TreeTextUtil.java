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
package jetbrains.mps.ide.ui;

import org.apache.commons.lang.StringUtils;

public class TreeTextUtil {

  private final static String[] _charsToEntities;
  private final static String _entitiesChars;

  static {
    _charsToEntities = new String[128];
    _charsToEntities['<'] = "&lt;";
    _charsToEntities['>'] = "&gt;";
    _charsToEntities['&'] = "&amp;";
    _charsToEntities['"'] = "&quot;";
    //_charsToEntities.put('\'', "&apos;");
    // There is no apos entity in SGML http://www.w3.org/TR/html4/sgml/entities.html
    _charsToEntities['\''] = "&#39;";

    // _entitiesChars are exactly the keys of _charsToEntities
    _entitiesChars = "<>&\"'";
  }

  public static String toHtml(final String str) {
    if (str == null) return "";
    if (StringUtils.indexOfAny(str, _entitiesChars) < 0) {
      return str;
    }
    final int capacity = str.length();
    final StringBuilder builder = new StringBuilder(capacity + 100);
    for (int i = 0; i < capacity; i++) {
      final char c = str.charAt(i);
      final String entity = (c >= 0 && c < _charsToEntities.length) ? _charsToEntities[c] : null;
      if (entity == null) {
        builder.append(c);
      } else {
        builder.append(entity);
      }
    }
    return builder.toString();
  }

  public static void main(String[] args) {
    System.out.println(toHtml("<mama>papa<s s s>><<s s s>'''&&"));
  }
}
