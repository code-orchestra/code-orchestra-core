/*
 * Copyright 2003-2009 JetBrains s.r.o.
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
package codeOrchestra.actionscript.run.compiler;

import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.chooser.ASClassChooser;
import codeOrchestra.actionscript.run.compiler.utils.CheckMainClassUtil;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.actions.goTo.index.BaseSNodeDescriptorIndex;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.BaseSNodeDescriptor;
import org.apache.commons.lang.StringUtils;

public class MainClassChooser extends ASClassChooser {

  public MainClassChooser(Project project, BaseSNodeDescriptorIndex index) {
    super(project, index);
  }

  @Override
  protected boolean isApplicable(BaseSNodeDescriptor nodeDescriptor) {
    if (StringUtils.isNotEmpty(nodeDescriptor.getModelReference().getStereotype())) {
      return false;
    }

    String conceptFqName = nodeDescriptor.getConceptFqName();
    if (!(CLASS_CONCEPT.equals(conceptFqName) || MXML_COMPONENT.equals(conceptFqName))) {
      return false;
    }

    SModelReference modelReference = nodeDescriptor.getModelReference();
    if (modelReference != null) {
      SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(modelReference);
      if (modelDescriptor != null) {
        SNode sNode = nodeDescriptor.getNode(modelDescriptor.getSModel());
        if (sNode == null) {
          return false;
        }
        return CheckMainClassUtil.isMainClass(sNode);
      }
    }

    return false;
  }


  @Override
  protected boolean isApplicable(SNode sNode) {
    if (StringUtils.isNotEmpty(sNode.getModel().getStereotype())) {
      return false;
    }

    String conceptFqName = sNode.getConceptFqName();
    if (!(CLASS_CONCEPT.equals(conceptFqName) || MXML_COMPONENT.equals(conceptFqName))) {
      return false;
    }

    return CheckMainClassUtil.isMainClass(sNode);
  }

}
