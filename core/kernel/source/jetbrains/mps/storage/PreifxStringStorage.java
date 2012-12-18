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
package jetbrains.mps.storage;

import java.util.ArrayList;
import java.util.StringTokenizer;

public class PreifxStringStorage {
  private char mySeparatorChar;
  private StringObject myRoot = new StringObject(null);

  public PreifxStringStorage(char separatorChar) {
    mySeparatorChar = separatorChar;
  }

  public StringObject get(String s) {
    StringTokenizer st = new StringTokenizer(s, "" + mySeparatorChar);
    StringObject node = myRoot;
    while (st.hasMoreTokens()) {
      node = node.getChild(st.nextToken());
    }
    return node;
  }

  public String getString(StringObject obj) {
    StringBuilder sb = new StringBuilder(500);
    ArrayList<StringObject> stack = new ArrayList<StringObject>(100);

    do {
      stack.add(obj);
      obj = obj.getParent();
    } while (obj != null);

    for (int i = stack.size() - 1; i >= 0; i--) {
      String str = stack.get(i).getString();
      if (str == null) continue;
      sb.append(str).append(mySeparatorChar);
    }
    sb.deleteCharAt(sb.length() - 1);

    return sb.toString();
  }
}
