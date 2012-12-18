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
package jetbrains.mps.ide.java.testMaterial8;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 11.06.2010
 * Time: 10:06:47
 * To change this template use File | Settings | File Templates.
 */
public class OrdinaryClassWithEscapeCharacters {
  private static Map<Character, String> escapeMap = new HashMap<Character, String>();

  static {
    escapeMap.put('\b', "\\b");
    escapeMap.put('\t', "\\t");
    escapeMap.put('\n', "\\n");
    escapeMap.put('\f', "\\f");
    escapeMap.put('\r', "\\r");
    escapeMap.put('\"', "\\\"");
    escapeMap.put('\'', "\\'");
    escapeMap.put('\\', "\\\\");
  }
}
