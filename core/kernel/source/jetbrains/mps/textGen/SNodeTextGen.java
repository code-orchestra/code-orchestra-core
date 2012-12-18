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

import jetbrains.mps.internal.collections.runtime.SetSequence;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.JavaNameUtil;
import org.jetbrains.annotations.Nullable;

/**
 * Author: Sergey Dmitriev
 * Created Nov 13, 2003
 */
public abstract class SNodeTextGen<BA extends INodeAdapter> {
  private static final Logger LOG = Logger.getLogger(SNodeTextGen.class);

  private TextGenBuffer myBuffer;
  private IOperationContext myContext;
  private SNode mySNode;

  public void setBuffer(TextGenBuffer buffer) {
    myBuffer = buffer;
  }

  public final TextGenBuffer getBuffer() {
    return myBuffer;
  }

  public IOperationContext getContext() {
    return myContext;
  }

  public void setContext(IOperationContext context) {
    myContext = context;
  }

  public SNode getSNode() {
    return mySNode;
  }

  public void setSNode(@Nullable SNode contextNode) {
    mySNode = contextNode;
  }

  //not to generate stub method in each MPS text gen

  protected void doGenerateText(SNode node) {
  }

  public String getExtension(SNode node) {
    return null;
  }

  public void increaseDepth() {
    myBuffer.increaseDepth();
  }

  public void decreaseDepth() {
    myBuffer.decreaseDepth();
  }

  public void append(String s) {
    myBuffer.append(s);
  }

  public void appendNewLine() {
    append(myBuffer.getLineSeparator());
  }

  public void appendWithIndent(String s) {
    myBuffer.appendWithIndent(s);
  }

  public void indentBuffer() {
    myBuffer.indentBuffer();
  }

  public final Object getUserObject(Object key) {
    return myBuffer.getUserObject(key);
  }

  public final void putUserObject(Object key, Object o) {
    myBuffer.putUserObject(key, o);
  }

  public void foundError() {
    foundError(null);
  }

  public void foundError(@Nullable String info) {
    String message = info != null ?
      "textgen error: '" + info + "' in " + getSNode().getDebugText() :
      "textgen error in " + getSNode().getDebugText();
    LOG.error(message, getSNode());
    getBuffer().foundError(message);
  }


  /**
   * @param role - must be 'genuine role'
   *             todo: tmp
   */
  public String getReferentResolveInfoOrName(String role, SNode sourceNode) {
    SReference reference = sourceNode.getReference(role);
    if (reference == null) {
      foundError();
      return "<err:no ref for role '" + role + "'>";
    }

    if (reference instanceof DynamicReference) {
      return reference.getResolveInfo();
    } else {
      SNode targetNode = reference.getTargetNode();
      if (targetNode == null) {
        foundError();
        return "???";
      }
      return targetNode.getResolveInfo();
    }
  }

  public String getReferentPresentation(SReference reference) {
    return getReferentPresentation(reference, true);
  }

  public String getReferentPresentation(SReference reference, boolean uniq) {
    if (reference == null) {
      foundError();
      return "<err:null reference>";
    }

    String shortName;
    String packageName = null;
    if (reference instanceof DynamicReference) {
      shortName = reference.getResolveInfo();
      final SModelReference modelReference = reference.getTargetSModelReference();
      if (modelReference != null) {
        packageName = modelReference.getLongName();
      } else {
        int lastDot = shortName.lastIndexOf('.');
        if(lastDot >= 0) {
          packageName = shortName.substring(0, lastDot);
          shortName = shortName.substring(lastDot + 1);
          if (shortName.indexOf('$') >= 0) {
            shortName = shortName.replace('$', '.');
          }
        }
      }
    } else {
      SNode targetNode = reference.getTargetNode();
      if (targetNode == null) {
        foundError();
        return "???";
      }
      shortName = targetNode.getResolveInfo();
      packageName = targetNode.getModel().getSModelReference().getLongName();
    }
    if (uniq) {
      return (isNeedLongName(shortName, packageName) ? packageName + '.' + shortName : shortName);
    } else {
      return shortName;
    }
  }

  public String getDefaultNoTextGenErrorText(SNode node) {
    return "<!TextGen not found for '" + node.getConceptFqName() + "'!>";
  }

  boolean isNeedLongName(String shortName, String packageName) {
    if (shortName == null || packageName == null || packageName.isEmpty()) return false;
    SetSequence<String> importedNames = (SetSequence<String>) getUserObject(TextGenManager.IMPORT);
    for (String importedName : importedNames) {
      if (JavaNameUtil.shortName(importedName).equals(shortName)
        && !JavaNameUtil.packageName(importedName).equals(packageName)) {
        return true;
      }
    }
    return false;
  }
}
