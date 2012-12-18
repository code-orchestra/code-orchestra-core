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
package jetbrains.mps.generator.impl.interpreted;

import jetbrains.mps.generator.impl.RuleUtil;
import jetbrains.mps.generator.runtime.*;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;

import java.util.ArrayList;
import java.util.Collection;

/**
 * Evgeny Gryaznov, Nov 29, 2010
 */
public class TemplateModelInterpreted implements TemplateModel {

  private final TemplateModule myModule;
  private final SModel myModel;
  private Collection<TemplateSwitchMapping> mySwitches;
  private Collection<TemplateMappingConfiguration> myMappings;

  public TemplateModelInterpreted(TemplateModule module, SModel model) {
    myModule = module;
    myModel = model;
    mySwitches = new ArrayList<TemplateSwitchMapping>();
    myMappings = new ArrayList<TemplateMappingConfiguration>();
    init();
  }

  private void init() {
    for(SNode root : myModel.roots()) {
      String conceptName = root.getConceptFqName();
      if(conceptName.equals(RuleUtil.concept_TemplateSwitch)) {
        mySwitches.add(new TemplateSwitchMappingInterpreted(root));
      } else if(conceptName.equals(RuleUtil.concept_MappingConfiguration)) {
        myMappings.add(new TemplateMappingConfigurationInterpreted(this, root));
      }
    }
  }

  @Override
  public Collection<TemplateSwitchMapping> getSwitches() {
    return mySwitches;
  }

  @Override
  public Collection<TemplateMappingConfiguration> getConfigurations() {
    return myMappings;
  }

  @Override
  public TemplateDeclaration loadTemplate(SNodePointer template, Object... arguments) {
    assert template.getModelReference().equals(getSModelReference());
    SNode templateNode = myModel.getNodeById(template.getNodeId());
    if(templateNode == null || !RuleUtil.concept_TemplateDeclaration.equals(templateNode.getConceptFqName())) {
      return null;
    }

    return TemplateDeclarationInterpreted.create(templateNode, arguments);
  }

  @Override
  public String getLongName() {
    return myModel.getLongName();
  }

  @Override
  public SModelReference getSModelReference() {
    return myModel.getSModelReference();
  }

  @Override
  public TemplateModule getModule() {
    return myModule;
  }
}
