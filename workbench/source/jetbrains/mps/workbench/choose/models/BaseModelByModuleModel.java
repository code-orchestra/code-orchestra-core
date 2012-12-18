/*
 * Copyright 2003-2010 JetBrains s.r.o.
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
package jetbrains.mps.workbench.choose.models;

import com.intellij.openapi.project.Project;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.workbench.choose.base.BaseMPSChooseModel;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public abstract class BaseModelByModuleModel extends BaseMPSChooseModel<SModelReferenceByModule> {
  public BaseModelByModuleModel(Project project) {
    super(project, "package");
  }

  public String doGetFullName(Object element) {
    if (element instanceof BaseModelItem) {
      BaseModelItem navigationItem = (BaseModelItem) element;
      SModelReference ref = navigationItem.getModelReference();
      return ref.getLongName() + getStereotypeString(ref);
    } else if (element instanceof BaseModelByModuleItem) {
      BaseModelByModuleItem navigationItem = (BaseModelByModuleItem) element;
      SModelReference ref = navigationItem.getModelByModuleReference().getModelReference();
      return ref.getLongName() + getStereotypeString(ref);
    }
    throw new IllegalStateException("Illegal navigation item type: " + element.getClass().getCanonicalName());
  }

  public String doGetObjectName(SModelReferenceByModule ref) {
    return NameUtil.shortNameFromLongName(ref.getModelReference().getLongName()) + getStereotypeString(ref.getModelReference());
  }

  private String getStereotypeString(SModelReference ref) {
    return ref.hasStereotype() ? ("@" + ref.getStereotype()) : "";
  }

  public SModelReferenceByModule[] find(IScope scope) {
    SModelReference[] uniqueSmodelReferences = getUniqueSmodelReferences(scope);
    return modelRefsToModelByModuleRefs(uniqueSmodelReferences);
  }

  protected SModelReferenceByModule[] modelRefsToModelByModuleRefs(SModelReference[] uniqueSmodelReferences) {
    List<SModelReferenceByModule> resultList = new ArrayList<SModelReferenceByModule>();

    for (SModelReference modelReference : uniqueSmodelReferences) {
      SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(modelReference);
      Set<IModule> modules = SModelRepository.getInstance().getModules(modelDescriptor);
      for (IModule owner : modules) {
        SModelReferenceByModule modelReferenceByModule = new SModelReferenceByModule(modelReference, owner.getModuleReference());
        if (!resultList.contains(modelReferenceByModule)) {
          resultList.add(modelReferenceByModule);
        }
      }
    }

    return resultList.toArray(new SModelReferenceByModule[resultList.size()]);
  }

  public SModelReference[] getUniqueSmodelReferences(IScope scope) {
    List<SModelReference> result = new ArrayList<SModelReference>();
    for (SModelDescriptor sModelDescriptor : scope.getModelDescriptors()) {
      result.add(sModelDescriptor.getSModelReference());
    }
    return result.toArray(new SModelReference[result.size()]);
  }

}
