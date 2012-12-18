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
package jetbrains.mps.debug.runtime.java.programState.proxies;

import com.sun.jdi.StringReference;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.Value;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 02.07.2010
 * Time: 15:55:06
 * To change this template use File | Settings | File Templates.
 */
public class JavaStringValue extends JavaObjectValue {
  public JavaStringValue(Value value, String classFQname, ThreadReference threadReference) {
    super(value, classFQname, threadReference);
  }

  public String getJavaStringValue() {
    StringReference ref = (StringReference) myValue;
    return ref.value();
  }
}
