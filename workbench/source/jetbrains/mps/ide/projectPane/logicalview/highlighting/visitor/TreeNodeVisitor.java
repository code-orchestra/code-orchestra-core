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
package jetbrains.mps.ide.projectPane.logicalview.highlighting.visitor;

import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModuleTreeNode;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;

import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public abstract class TreeNodeVisitor {
  private static ThreadPoolExecutor myExecutor = new ThreadPoolExecutor(0, 2, 5, TimeUnit.SECONDS, new LinkedBlockingDeque<Runnable>());

  public final void visitNode(final MPSTreeNode node) {
    myExecutor.execute(new Runnable() {
      public void run() {
        if (node instanceof SModelTreeNode) {
          visitModelNode(((SModelTreeNode) node));
        }
        if (node instanceof ProjectModuleTreeNode) {
          visitModuleNode(((ProjectModuleTreeNode) node));
        }
        if (node instanceof ProjectTreeNode) {
          visitProjectNode(((ProjectTreeNode) node));
        }
      }
    });
  }

  protected abstract void visitModelNode(SModelTreeNode node);

  protected abstract void visitModuleNode(ProjectModuleTreeNode node);

  protected abstract void visitProjectNode(ProjectTreeNode node);
}
