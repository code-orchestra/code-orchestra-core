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
package jetbrains.mps.generator;

import jetbrains.mps.generator.runtime.TemplateMappingScript;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.Pair;

import java.util.List;

/**
 * Evgeny Gryaznov, Feb 17, 2010
 */
public interface IGenerationTracer {

  void pushInputNode(SNode node);

  void closeInputNode(SNode node);

  void popInputNode(SNode node);

  void pushRule(SNodePointer node);

  void closeRule(SNodePointer node);

  void pushRuleConsequence(SNodePointer node);

  void pushSwitch(SNodePointer node);

  void pushMacro(SNodePointer node);

  void closeMacro(SNodePointer node);

  void pushOutputNode(SNode node);

  void pushOutputNodeToReplaceLater(SNode node);

  void replaceOutputNode(SNode node, SNode newOutputNode);

  void pushTemplateNode(SNodePointer node);

  void closeTemplateNode(SNodePointer node);

  void pushCopyOperation();

  void startTracing();

  void finishTracing();

  boolean isTracing();

  List<Pair<SNode, String>> getNodesWithTextFromCurrentBranch();

  void startTracing(SModel inputModel, SModel outputModel);

  void discardTracing();

  void discardTracing(SModel inputModel, SModel outputModel);

  List<Pair<SNode, SNode>> getAllAppiedRulesWithInputNodes(SModelReference outputModelReference);

  void registerPreMappingScripts(SModel scriptsInputModel, SModel scriptsOutputModel, List<TemplateMappingScript> preMappingScripts);

  void registerPostMappingScripts(SModel scriptsInputModel, SModel scriptsOutputModel, List<TemplateMappingScript> postMappingScripts);
}
