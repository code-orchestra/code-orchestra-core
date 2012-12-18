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
package jetbrains.mps.workbench.actions.goTo.index;

import com.intellij.navigation.ItemPresentation;
import com.intellij.navigation.NavigationItem;
import com.intellij.openapi.vcs.FileStatus;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.BaseSNodeDescriptor;

public class RootNodeElement implements NavigationItem {
  private BaseSNodeDescriptor myNodeResult;

  public RootNodeElement(BaseSNodeDescriptor nodeResult) {
    myNodeResult = nodeResult;
  }

  public BaseSNodeDescriptor getNodeResult() {
    return myNodeResult;
  }

  public String getName() {
    return myNodeResult.getNodeName();
  }

  public ItemPresentation getPresentation() {
    return new SNodeDescriptorPresentation(myNodeResult);
  }

  public FileStatus getFileStatus() {
    return FileStatus.NOT_CHANGED;
  }

  public SModelReference getModel() {
    return myNodeResult.getModelReference();
  }

  public void navigate(boolean requestFocus) {
  }

  public boolean canNavigate() {
    return true;
  }

  public boolean canNavigateToSource() {
    return true;
  }
}
