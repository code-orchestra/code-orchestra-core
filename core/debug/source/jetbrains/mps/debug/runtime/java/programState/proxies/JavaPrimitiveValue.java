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

import com.sun.jdi.ThreadReference;
import com.sun.jdi.Value;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.evaluation.proxies.MirrorUtil;
import jetbrains.mps.debug.integration.ui.icons.Icons;

import javax.swing.Icon;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 19.06.2010
 * Time: 16:56:49
 * To change this template use File | Settings | File Templates.
 */
public class JavaPrimitiveValue extends JavaValue {
  public JavaPrimitiveValue(Value value, String classFQname, ThreadReference threadReference) {
    super(value, classFQname, threadReference);
  }

  @Override
  public List<IWatchable> getSubvalues() {
    return new ArrayList<IWatchable>();
  }

  @Override
  public Icon getPresentationIcon() {
    return Icons.VARIABLE_PRIMITIVE;
  }

  @Override
  public boolean isStructure() {
    return false;
  }

  @Override
  public String getValuePresentation() {
    if (myValue == null) return "null";
    return myValue.toString();
  }

  public Object getJavaValue() {
    if (myValue == null) return null;
    return MirrorUtil.getJavaValue(myValue);
  }
}
