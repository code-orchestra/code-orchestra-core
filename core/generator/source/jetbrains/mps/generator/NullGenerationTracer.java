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
public class NullGenerationTracer implements IGenerationTracer {

  public final static IGenerationTracer INSTANCE = new NullGenerationTracer();

  @Override
  public void pushInputNode(SNode node) {
  }

  @Override
  public void closeInputNode(SNode node) {
  }

  @Override
  public void popInputNode(SNode node) {
  }

  @Override
  public void pushRule(SNodePointer node) {
  }

  @Override
  public void closeRule(SNodePointer node) {
  }

  @Override
  public void pushRuleConsequence(SNodePointer node) {
  }

  @Override
  public void pushSwitch(SNodePointer node) {
  }

  @Override
  public void pushMacro(SNodePointer node) {
  }

  @Override
  public void closeMacro(SNodePointer node) {
  }

  @Override
  public void pushOutputNode(SNode node) {
  }

  @Override
  public void pushOutputNodeToReplaceLater(SNode node) {
  }

  @Override
  public void replaceOutputNode(SNode node, SNode newOutputNode) {
  }


  @Override
  public void pushTemplateNode(SNodePointer node) {
  }

  @Override
  public void closeTemplateNode(SNodePointer node) {
  }

  @Override
  public void pushCopyOperation() {
  }

  @Override
  public void startTracing() {
  }

  @Override
  public void finishTracing() {
  }

  @Override
  public boolean isTracing() {
    return false;
  }

  @Override
  public void startTracing(SModel inputModel, SModel outputModel) {
  }

  @Override
  public void discardTracing() {
  }

  @Override
  public void discardTracing(SModel inputModel, SModel outputModel) {
  }

  @Override
  public List<Pair<SNode, SNode>> getAllAppiedRulesWithInputNodes(SModelReference outputModelReference) {
    return null;
  }

  @Override
  public List<Pair<SNode, String>> getNodesWithTextFromCurrentBranch() {
    return null;
  }

  @Override
  public void registerPreMappingScripts(SModel scriptsInputModel, SModel scriptsOutputModel, List<TemplateMappingScript> preMappingScripts) {
  }

  @Override
  public void registerPostMappingScripts(SModel scriptsInputModel, SModel scriptsOutputModel, List<TemplateMappingScript> postMappingScripts) {
  }
}
