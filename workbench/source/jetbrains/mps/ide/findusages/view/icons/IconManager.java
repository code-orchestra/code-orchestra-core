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
package jetbrains.mps.ide.findusages.view.icons;

import jetbrains.mps.ide.findusages.findalgorithm.finders.specific.ConstantFinder;
import jetbrains.mps.ide.findusages.model.CategoryKind;
import jetbrains.mps.ide.findusages.model.holders.*;
import jetbrains.mps.smodel.SNode;

import javax.swing.Icon;

public class IconManager {
  public static Icon getIconForIHolder(IHolder holder) {
    if (holder instanceof NodeHolder) {
      SNode node = ((NodeHolder) holder).getObject();
      return node == null ? null : jetbrains.mps.ide.icons.IconManager.getIconFor(node);
    } else if (holder instanceof ModelHolder) {
      return jetbrains.mps.ide.projectPane.Icons.MODEL_ICON;
    } else if (holder instanceof ModelsHolder) {
      return jetbrains.mps.ide.projectPane.Icons.MODEL_ICON;
    } else if (holder instanceof ModuleHolder) {
      return jetbrains.mps.ide.icons.IconManager.getIconFor(((ModuleHolder) holder).getObject());
    } else if (holder instanceof ModulesHolder) {
      return jetbrains.mps.ide.projectPane.Icons.SOLUTION_ICON;
    } else if (holder instanceof VoidHolder) {
      return ((VoidHolder) holder).getIcon();
    } else if (holder instanceof ConstantFinder.ConstantHolder) {
      return ((ConstantFinder.ConstantHolder) holder).getIcon();
    }
    // StringHolder, AspectMethodsFinder.AspectMethodsHolder
    return null;
  }

  public static Icon getIconForCategoryKind(CategoryKind categoryKind) {
    if (categoryKind == CategoryKind.DEFAULT_CATEGORY_KIND) {
      return Icons.CATEGORY_ICON;
    }
    return categoryKind.getIcon();
  }
}
