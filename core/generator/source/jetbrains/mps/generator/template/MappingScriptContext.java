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
package jetbrains.mps.generator.template;

import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;

public class MappingScriptContext extends TemplateQueryContext {
  private final SNode myScript;
  private final SNodePointer myScriptPointer;
  private SModel myModel;

  public MappingScriptContext(SModel model, SNode mappingScript, ITemplateGenerator generator) {
    super(null, null, null, generator);
    myScript = mappingScript;
    myScriptPointer = null;
    myModel = model;
  }

  public MappingScriptContext(SModel model, SNodePointer mappingScript, ITemplateGenerator generator) {
    super(null, null, null, generator);
    myScript = null;
    myScriptPointer = mappingScript;
    myModel = model;
  }

  /**
   * 'model'  parameter mapping
   */
  public SModel getModel() {
    return myModel;
  }

  public SNode getInputNode() {
    return null;
  }

  public SModel getInputModel() {
    return myModel;
  }

  public SModel getOutputModel() {
    return myModel;
  }

  public SNode getTemplateNodeForLogging() {
    return myScript != null ? myScript :
      myScriptPointer != null ? myScriptPointer.getNode() : null;
  }
}
