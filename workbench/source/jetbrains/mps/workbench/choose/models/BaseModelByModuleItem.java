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

import com.intellij.navigation.ItemPresentation;
import com.intellij.navigation.NavigationItem;
import com.intellij.openapi.vcs.FileStatus;
import codeOrchestra.actionscript.view.ASPackageTreeNode;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;

public abstract class BaseModelByModuleItem implements NavigationItem {
  protected SModelReferenceByModule modelByModuleReference;

  public BaseModelByModuleItem(SModelReferenceByModule modelByModuleReference) {
    this.modelByModuleReference = modelByModuleReference;
  }

  public SModelReferenceByModule getModelByModuleReference() {
    return modelByModuleReference;
  }

  public String getName() {
    return null;
  }

  @Override
  public ItemPresentation getPresentation() {
    return new ModelPresentation(modelByModuleReference.getModelReference()) {
      public Icon doGetIcon() {
        if (ViewUtils.isInActionScriptView()) {
          return ASPackageTreeNode.PACKAGE_ICON;
        }
        return super.doGetIcon();
      }

      @NotNull
      @Override
      public String doGetPresentableText() {
        if (ViewUtils.isInActionScriptView()) {
          String packageName = myModelReference.getLongName();
          if (StringUtils.isEmpty(packageName)) {
            packageName = "(default)";
          }
          return packageName + (myModelReference.hasStereotype() ? " (library)" : "");
        }
        return super.doGetPresentableText();
      }

      public String doGetLocationString() {
        String moduleNamespace = MPSModuleRepository.getInstance().getModule(modelByModuleReference.getModuleReference()).toString();
        return "(" + moduleNamespace + ")";
      }
    };
  }

  public FileStatus getFileStatus() {
    boolean changed = false;
    SModelDescriptor md = SModelRepository.getInstance().getModelDescriptor(modelByModuleReference.getModelReference());
    if (md instanceof EditableSModelDescriptor) {
      changed = ((EditableSModelDescriptor) md).isChanged();
    }
    return changed ? FileStatus.MODIFIED : FileStatus.NOT_CHANGED;
  }

  public boolean canNavigate() {
    return true;
  }

  public boolean canNavigateToSource() {
    return false;
  }
}
