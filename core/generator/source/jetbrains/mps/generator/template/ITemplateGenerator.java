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

import com.intellij.openapi.progress.ProgressIndicator;
import jetbrains.mps.generator.GenerationSessionContext;
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;

import java.util.List;

public interface ITemplateGenerator {

  ProgressIndicator getProgressMonitor();

  SModel getInputModel();

  SModel getOutputModel();

  /**
   * @deprecated
   */
  SModel getSourceModel();

  /**
   * @deprecated
   */
  SModel getTargetModel();

  boolean areMappingsAvailable();

  SNode findOutputNodeByInputNodeAndMappingName(SNode inputNode, String mappingName);

  List<SNode> findAllOutputNodesByInputNodeAndMappingName(SNode inputNode, String mappingName);

  SNode findCopiedOutputNodeForInputNode(SNode inputNode);

  GenerationSessionContext getGeneratorSessionContext();

  IScope getScope();

  boolean isStrict();

  boolean isDirty(SNode node);

  IGeneratorLogger getLogger();

  void showErrorMessage(SNode inputNode, SNode templateNode, String message);

  void showErrorMessage(SNode inputNode, SNode templateNode, SNode ruleNode, String message);
}
