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
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.evaluation.proxies.IValueProxy;
import jetbrains.mps.debug.evaluation.proxies.MirrorUtil;
import jetbrains.mps.debug.runtime.java.programState.watchables.CustomJavaWatchable;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 19.06.2010
 * Time: 16:43:53
 * To change this template use File | Settings | File Templates.
 */
public abstract class ValueWrapper extends JavaValue implements IValue {
  protected final JavaValue myWrappedValue;
  @NotNull
  protected final IValueProxy myValueProxy;

  public ValueWrapper(JavaValue value) {
    super(value.getValue(), value.getClassFQName(), value.myThreadReference);
    myWrappedValue = value;
    myValueProxy = MirrorUtil.getValueProxy(value.getValue(), value.myThreadReference);
  }

  @Override
  public Icon getPresentationIcon() {
    return myWrappedValue.getPresentationIcon();
  }

  @Override
  public String getValuePresentation() {
    return myWrappedValue.getValuePresentation();
  }

  @Override
  public List<IWatchable> getSubvalues() {
    List<IWatchable> result = new ArrayList<IWatchable>();
    for (IWatchable watchable : getSubvaluesImpl()) {
      result.add(watchable);
    }
    return result;
  }

  protected abstract List<CustomJavaWatchable> getSubvaluesImpl();

  @Override
  public boolean isStructure() {
    return true;
  }

  public ThreadReference getThreadReference() {
    return myThreadReference;
  }

}
