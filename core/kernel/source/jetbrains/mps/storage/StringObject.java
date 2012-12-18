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

import java.util.Collection;
import java.util.HashMap;

public class StringObject {
  private StringObject myParent;
  private String myString;
  private HashMap<String, StringObject> myChildren;

  StringObject(String s) {
    myString = s;
  }

  //s is elementary string
  StringObject getChild(String s) {
    //todo ??intern correctly??
    s = s.intern();

    if (myChildren == null) {
      myChildren = new HashMap<String, StringObject>(3);
    } else {
      StringObject o = myChildren.get(s);
      if (o != null) return myChildren.get(s);
    }

    StringObject newObj = new StringObject(s);
    myChildren.put(s, newObj);
    newObj.myParent = this;

    return newObj;
  }

  Collection<String> getChildStrings() {
    return myChildren.keySet();
  }

  StringObject getParent() {
    return myParent;
  }

  String getString() {
    return myString;
  }
}
