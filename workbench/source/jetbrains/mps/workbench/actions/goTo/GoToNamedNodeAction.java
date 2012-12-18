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
package jetbrains.mps.workbench.actions.goTo;

import com.intellij.ide.util.gotoByName.ChooseByNamePopup;
import com.intellij.ide.util.gotoByName.ChooseByNamePopupComponent;
import com.intellij.navigation.NavigationItem;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import com.intellij.openapi.application.ModalityState;
import com.intellij.openapi.project.DumbService;
import com.intellij.openapi.project.Project;
import com.intellij.psi.PsiElement;
import com.intellij.psi.impl.FakePsiElement;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelStereotype;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.ConditionalIterable;
import jetbrains.mps.util.IterableUtil;
import jetbrains.mps.workbench.action.BaseAction;
import jetbrains.mps.workbench.actions.goTo.index.MPSChooseSNodeDescriptor;
import jetbrains.mps.workbench.actions.goTo.index.NamedNodeIndex;
import jetbrains.mps.workbench.choose.base.FakePsiContext;
import jetbrains.mps.workbench.choose.nodes.BaseNodeModel;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class GoToNamedNodeAction extends BaseAction {
  private static boolean myUseCache = true;

  public static void setUseCache(boolean useCache) {
    myUseCache = useCache;
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  public void doExecute(AnActionEvent e, Map<String, Object> _params) {
    final Project project = e.getData(PlatformDataKeys.PROJECT);
    assert project != null;

    DumbService service = DumbService.getInstance(project);
    if (service.isDumb()) {
      return;
    }

    ChooseByNamePopup popup;

    // RE-2096
    if (!myUseCache && !ViewUtils.isInActionScriptView(project)) {
      FakePsiElement fakePsiContext = new FakePsiElement() {
        public PsiElement getParent() {
          return null;
        }
      };

      BaseNodeModel baseNodeModel = new BaseNodeModel(project, "symbol") {
        public SNode[] find(IScope scope) {
          final List<SNode> nodes = new ArrayList<SNode>();
          Iterable<SModelDescriptor> modelDescriptors = scope.getModelDescriptors();

          Condition<SNode> cond = new Condition<SNode>() {
            public boolean met(SNode node) {
              String name = node.getName();
              return name != null && name.length() > 0;
            }
          };

          for (SModelDescriptor modelDescriptor : modelDescriptors) {
            if (!SModelStereotype.isUserModel(modelDescriptor)) continue;

            Iterable<SNode> iter = new ConditionalIterable<SNode>(modelDescriptor.getSModel().nodes(), cond);
            nodes.addAll(IterableUtil.asCollection(iter));
          }
          return nodes.toArray(new SNode[nodes.size()]);
        }
      };
      popup = ChooseByNamePopup.createPopup(project, baseNodeModel, fakePsiContext);
    } else {
      MPSChooseSNodeDescriptor chooseSNodeResult = new MPSChooseSNodeDescriptor(project, new NamedNodeIndex());
      popup = ChooseByNamePopup.createPopup(project, chooseSNodeResult, new FakePsiContext());
    }

    popup.invoke(new ChooseByNamePopupComponent.Callback() {
      public void onClose() {
        //if (GoToRootNodeAction.class.equals(myInAction)) myInAction = null;
      }

      public void elementChosen(Object element) {
        ((NavigationItem) element).navigate(true);
      }
    }, ModalityState.current(), true);
  }
}
