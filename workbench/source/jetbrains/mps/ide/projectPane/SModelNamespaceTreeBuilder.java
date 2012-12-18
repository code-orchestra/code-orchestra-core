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
package jetbrains.mps.ide.projectPane;

import jetbrains.mps.ide.ui.smodel.SModelTreeNode;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.util.NameUtil;

public class SModelNamespaceTreeBuilder extends DefaultNamespaceTreeBuilder<SModelTreeNode> {
  protected String getNamespace(SModelTreeNode node) {
    SModelDescriptor d = node.getSModelDescriptor();
    return NameUtil.namespaceFromLongName(d.getSModelReference().getLongName());
  }

  @Override
  protected void addNode(SModelTreeNode node, NamespaceTextNode namespace) {
    int count = SModelsSubtree.getCountNamePart(node.getSModelDescriptor(), namespace.getNamespace());
    node.setCountAdditionalNamePart(count);
    super.addNode(node, namespace);
  }
}
