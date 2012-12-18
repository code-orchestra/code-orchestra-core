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
package jetbrains.mps.workbench.choose.nodes;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.presentation.NodePresentationUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.choose.base.BasePresentation;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;

public class NodePresentation extends BasePresentation {
  private SNode myNode;
  private String myModelName = null;

  public NodePresentation(SNode node) {
    myNode = node;
  }

  public String getModelName() {
    if (myModelName == null) {
      myModelName = ModelAccess.instance().runReadAction(new Computable<String>() {
        public String compute() {
          // RF-774
          try {
            return myNode.getModel().getModelDescriptor().getSModelReference().getSModelFqName().toString();
          } catch (Throwable e) {
            return "(unknown model)";
          }
        }
      });
    }
    return myModelName;
  }

  @NotNull
  @CodeOrchestraPatch
  public String doGetPresentableText() {
    // RF-812
    if (myNode == null) {
      return "";
    }
    return NodePresentationUtil.matchingText(myNode);
  }

  public String doGetLocationString() {
    return "(" + getModelName() + ")";
  }

  public Icon doGetIcon() {
    return IconManager.getIconFor(myNode);
  }
}
