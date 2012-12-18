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
package jetbrains.mps.debug.runtime.java.programState.watchables;

import com.sun.jdi.AbsentInformationException;
import com.sun.jdi.Location;
import com.sun.jdi.ObjectReference;
import com.sun.jdi.ThreadReference;
import jetbrains.mps.generator.traceInfo.TraceInfoUtil;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.debug.runtime.java.programState.JavaWatchablesCategory;
import jetbrains.mps.debug.runtime.java.programState.proxies.JavaStackFrame;
import jetbrains.mps.debug.runtime.java.programState.proxies.JavaValue;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.SNode;

import javax.swing.Icon;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 09.04.2010
 * Time: 19:05:54
 * To change this template use File | Settings | File Templates.
 */
public class JavaThisObject extends JavaBreakpointWatchable implements IWatchable {
  private static Logger LOG = Logger.getLogger(JavaLocalVariable.class);

  private final ObjectReference myThisObject;
  private final JavaStackFrame myStackFrame;

  public JavaThisObject(ObjectReference objectReference, JavaStackFrame stackFrame, String classFqName, ThreadReference threadReference) {
    super(classFqName, threadReference);
    myThisObject = objectReference;
    myStackFrame = stackFrame;
  }

  public ObjectReference getThisObject() {
    return myThisObject;
  }

  @Override
  public String getName() {
    return "this";
  }

  @Override
  public IValue getValue() {
    return JavaValue.fromJDIValue(myThisObject, myClassFQName, myThreadReference);
  }

  @Override
  public Icon getPresentationIcon() {
    return getValue().getPresentationIcon();
  }

  @Override
  public SNode getNode() {
    try {
      Location location = myStackFrame.getStackFrame().location();
      SNode snode = TraceInfoUtil.getUnitNode(location.declaringType().name(),
        location.sourceName(), location.lineNumber());
      return snode;
    } catch (AbsentInformationException ex) {
      LOG.error(ex);
      return null;
    }
  }

  @Override
  public WatchablesCategory getCategory() {
    return JavaWatchablesCategory.THIS_OBJECT;
  }
}
