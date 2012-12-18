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
package jetbrains.mps.textGen;

import jetbrains.mps.messages.IMessage;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.traceInfo.ScopePositionInfo;
import jetbrains.mps.traceInfo.TraceablePositionInfo;
import jetbrains.mps.traceInfo.UnitPositionInfo;
import org.jetbrains.annotations.Nullable;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
* Evgeny Gryaznov, 1/18/11
*/
public class TextGenerationResult {
  private Object myResult;
  private boolean myContainErrors;
  private final Collection<IMessage> myProblems;
  private final Map<SNode, TraceablePositionInfo> myPositions;
  private final Map<SNode, ScopePositionInfo> myScopePositions;
  private final Map<SNode, UnitPositionInfo> myUnitPositions;
  private Map<String, List<String>> myDependencies;

  public TextGenerationResult(Object contents,
                              boolean containErrors,
                              Collection<IMessage> problems,
                              @Nullable Map<SNode, TraceablePositionInfo> positions,
                              @Nullable Map<SNode, ScopePositionInfo> scopePositions,
                              @Nullable Map<SNode, UnitPositionInfo> unitPositions,
                              Map<String, List<String>> dependencies) {
    myResult = contents;
    myContainErrors = containErrors;
    myProblems = problems;
    myPositions = positions;
    myScopePositions = scopePositions;
    myUnitPositions = unitPositions;
    myDependencies = dependencies;
  }

  public Object getResult() {
    return myResult;
  }

  public boolean hasErrors() {
    return myContainErrors;
  }

  public Collection<IMessage> problems() {
    return Collections.unmodifiableCollection(myProblems);
  }

  @Nullable
  public Map<SNode, TraceablePositionInfo> getPositions() {
    return myPositions;
  }

  @Nullable
  public Map<SNode, ScopePositionInfo> getScopePositions() {
    return myScopePositions;
  }

  @Nullable
  public Map<SNode, UnitPositionInfo> getUnitPositions() {
    return myUnitPositions;
  }

  public List<String> getDependencies(String value) {
    return myDependencies != null ? myDependencies.get(value) : null;
  }

  public boolean hasDependencies() {
    return myDependencies != null;
  }
}
