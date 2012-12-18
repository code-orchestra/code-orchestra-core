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
package jetbrains.mps.ide.refactoring;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.ToolWindowAnchor;
import jetbrains.mps.ide.findusages.model.SearchResults;
import jetbrains.mps.ide.findusages.view.TabbedUsagesTool;
import jetbrains.mps.ide.findusages.view.UsagesView;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.refactoring.framework.RefactoringContext;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

public class RefactoringView extends TabbedUsagesTool {
  private List<RefactoringViewItem> myRefactoringViews = new ArrayList<RefactoringViewItem>();

  protected RefactoringView(Project project) {
    super(project, "RefactoringView", -1, Icons.DEFAULT_ICON, ToolWindowAnchor.BOTTOM, true);
  }

  protected UsagesView getUsagesView(int index) {
    return myRefactoringViews.get(index).getUsagesView();
  }

  protected void onRemove(int index) {
    myRefactoringViews.remove(index);
  }

  protected boolean forceCloseOnReload() {
    return true;
  }

  public void showRefactoringView(RefactoringContext refactoringContext, @NotNull RefactoringViewAction refactoringViewAction,
                                  SearchResults searchResults, boolean hasModelsToGenerate) {
    RefactoringViewItem refactoringViewItem = new MyRefactoringViewItem(refactoringContext, refactoringViewAction, searchResults, hasModelsToGenerate);
    myRefactoringViews.add(refactoringViewItem);
    addContent(refactoringViewItem.getComponent(), refactoringContext.getRefactoring().getUserFriendlyName(), null, false);
    refactoringViewItem.initUsagesView();
    openTool(true);
  }

  public void showRefactoringView(Project p, @NotNull RefactoringViewAction refactoringViewAction,
                                  SearchResults searchResults, boolean hasModelsToGenerate) {

    RefactoringViewItem refactoringViewItem = new MyRefactoringViewItem(p, refactoringViewAction, searchResults, hasModelsToGenerate);
    myRefactoringViews.add(refactoringViewItem);
    addContent(refactoringViewItem.getComponent(), "refactoring", null, false);
    refactoringViewItem.initUsagesView();
    openTool(true);
  }

  public int getPriority() {
    return -1;
  }

  private class MyRefactoringViewItem extends RefactoringViewItem {
    public MyRefactoringViewItem(RefactoringContext refactoringContext, RefactoringViewAction refactoringViewAction, SearchResults searchResults, boolean hasModelsToGenerate) {
      super(refactoringContext, refactoringViewAction, searchResults, hasModelsToGenerate);
    }

    public MyRefactoringViewItem(Project p, RefactoringViewAction refactoringViewAction, SearchResults searchResults, boolean hasModelsToGenerate) {
      super(p, refactoringViewAction, searchResults, hasModelsToGenerate);
    }

    public void close() {
      int index = myRefactoringViews.indexOf(this);
      RefactoringView.this.closeTab(index);
    }
  }
}
