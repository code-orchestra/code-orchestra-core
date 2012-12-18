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

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.traceInfo.PositionInfo;
import jetbrains.mps.traceInfo.ScopePositionInfo;
import jetbrains.mps.traceInfo.TraceablePositionInfo;
import jetbrains.mps.traceInfo.UnitPositionInfo;
import org.jetbrains.annotations.NotNull;
import org.objectweb.asm.util.Traceable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TraceInfoGenerationUtil {
  public static final String POSITION_INFO = "POSITION_INFO";
  public static final String SCOPE_INFO = "SCOPE_INFO";
  public static final String UNIT_INFO = "UNIT_INFO";

  public static <T> void putUserObject(TextGenBuffer buffer, String type, SNode node, T object) {
    TraceInfoGenerationUtil.<T>getUserObjects(buffer, type).put(node, object);
  }

  @NotNull
  public static <T> Map<SNode, T> getUserObjects(TextGenBuffer buffer, String type) {
    Map<SNode, T> userObjects = (Map<SNode, T>) buffer.getUserObject(type);
    if (userObjects == null) {
      userObjects = new HashMap<SNode, T>();
      buffer.putUserObject(type, userObjects);
    }
    return userObjects;
  }

  public static <T> T getUserObject(TextGenBuffer buffer, String type, SNode node) {
    Map<SNode, T> userObjects = getUserObjects(buffer, type);
    return userObjects.get(node);
  }

  public static void createPositionInfo(SNodeTextGen nodeTextGen, SNode node) {
    TextGenBuffer buffer = nodeTextGen.getBuffer();
    if(!buffer.hasPositionsSupport()) return;

    TraceablePositionInfo info = new TraceablePositionInfo();
    info.setStartLine(buffer.getLineNumber());
    info.setStartPosition(buffer.getPosition());
    putUserObject(buffer, POSITION_INFO, node, info);
  }

  public static void fillPositionInfo(SNodeTextGen nodeTextGen, SNode node, String propertyString) {
    TextGenBuffer buffer = nodeTextGen.getBuffer();
    if(!buffer.hasPositionsSupport()) return;

    TraceablePositionInfo info = getUserObject(buffer, POSITION_INFO, node);
    info.setEndLine(buffer.getLineNumber());
    info.setEndPosition(buffer.getPosition());
    info.setConceptFqName(node.getConceptFqName());
    info.setPropertyString(propertyString);
  }

  public static void createScopeInfo(SNodeTextGen nodeTextGen, SNode node) {
    TextGenBuffer buffer = nodeTextGen.getBuffer();
    if(!buffer.hasPositionsSupport()) return;

    ScopePositionInfo info = new ScopePositionInfo();
    info.setStartLine(buffer.getLineNumber());
    info.setStartPosition(buffer.getPosition());
    putUserObject(buffer, SCOPE_INFO, node, info);
  }

  public static void fillScopeInfo(SNodeTextGen nodeTextGen, SNode node, List<SNode> vars) {
    TextGenBuffer buffer = nodeTextGen.getBuffer();
    if(!buffer.hasPositionsSupport()) return;

    ScopePositionInfo info = getUserObject(buffer, SCOPE_INFO, node);
    info.setEndLine(buffer.getLineNumber());
    info.setEndPosition(buffer.getPosition());
    for (SNode var : vars) {
      if (var != null) {
        info.addVarInfo(var);
      }
    }
  }

  public static void createUnitInfo(SNodeTextGen nodeTextGen, SNode node) {
    TextGenBuffer buffer = nodeTextGen.getBuffer();
    if(!buffer.hasPositionsSupport()) return;

    UnitPositionInfo info = new UnitPositionInfo();
    info.setStartLine(buffer.getLineNumber());
    info.setStartPosition(buffer.getPosition());
    putUserObject(buffer, UNIT_INFO, node, info);
  }

  public static void fillUnitInfo(SNodeTextGen nodeTextGen, SNode node, String unitName) {
    TextGenBuffer buffer = nodeTextGen.getBuffer();
    if(!buffer.hasPositionsSupport()) return;

    UnitPositionInfo info = getUserObject(buffer, UNIT_INFO, node);
    info.setEndLine(buffer.getLineNumber());
    info.setEndPosition(buffer.getPosition());
    info.setUnitName(unitName);
  }
}
