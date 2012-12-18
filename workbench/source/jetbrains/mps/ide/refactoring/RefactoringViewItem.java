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
import jetbrains.mps.ide.findusages.findalgorithm.finders.specific.ConstantFinder;
import jetbrains.mps.ide.findusages.findalgorithm.finders.specific.ConstantFinder.ConstantHolder;
import jetbrains.mps.ide.findusages.model.SearchQuery;
import jetbrains.mps.ide.findusages.model.SearchResults;
import jetbrains.mps.ide.findusages.view.FindUtils;
import jetbrains.mps.ide.findusages.view.UsagesView;
import jetbrains.mps.ide.findusages.view.UsagesView.ButtonConfiguration;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.ViewOptions;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.refactoring.framework.ILoggableRefactoring;
import jetbrains.mps.refactoring.framework.RefactoringContext;
import jetbrains.mps.smodel.ModelAccess;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public abstract class RefactoringViewItem {
  private RefactoringViewAction myRefactoringViewAction;
  private SearchResults mySearchResults;
  private UsagesView myUsagesView;
  private JPanel myPanel;
  private JPanel myButtonsPanel;
  private JButton myDoRefactorButton;
  private JButton myCancelButton;
  @Nullable
  private RefactoringContext myRefactoringContext = null;
  private JCheckBox myGenerateModelsCheckbox;
  private JCheckBox myIsLocalCheckbox;

  public RefactoringViewItem(@NotNull RefactoringContext refactoringContext, @NotNull RefactoringViewAction refactoringViewAction, SearchResults searchResults, boolean hasModelsToGenerate) {
    myRefactoringContext = refactoringContext;
    init(refactoringViewAction, searchResults, hasModelsToGenerate, refactoringContext.getSelectedProject());
  }

  public RefactoringViewItem(Project p, RefactoringViewAction refactoringViewAction, SearchResults searchResults, boolean hasModelsToGenerate) {
    init(refactoringViewAction, searchResults, hasModelsToGenerate, p);
  }

  private void init(RefactoringViewAction refactoringViewAction, SearchResults searchResults, boolean hasModelsToGenerate, final Project project) {
    myRefactoringViewAction = refactoringViewAction;
    mySearchResults = searchResults;
    if (mySearchResults == null) {
      throw new IllegalArgumentException("search result is null");
    }
    myPanel = new JPanel(new BorderLayout());
    myUsagesView = new UsagesView(project, new ViewOptions()) {
      public void close() {
        RefactoringViewItem.this.close();
      }

      public String getCaption() {
        return "";
      }

      public Icon getIcon() {
        return null;
      }

      public void read(Element element, Project p) {
      }

      public void write(Element element, Project p) {
      }
    };
    myButtonsPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));

    myDoRefactorButton = new JButton(new AbstractAction("Do Refactor") {
      public void actionPerformed(ActionEvent e) {
        doRefactor();
      }
    });
    myDoRefactorButton.addKeyListener(new KeyAdapter() {
      @Override
      public void keyTyped(KeyEvent e) {
        if (e.getKeyChar() == '\n') {
          doRefactor();
        }
      }
    });
    myButtonsPanel.add(myDoRefactorButton);

    myCancelButton = new JButton(new AbstractAction("Cancel") {
      public void actionPerformed(ActionEvent e) {
        close();
      }
    });
    myButtonsPanel.add(myCancelButton);

    if (myRefactoringContext != null) {
      addCheckboxes(hasModelsToGenerate);
    }

    myPanel.add(myUsagesView.getComponent(), BorderLayout.CENTER);
    myPanel.add(myButtonsPanel, BorderLayout.SOUTH);

    final FocusTraversalPolicy ftp = myPanel.getFocusTraversalPolicy();
    myPanel.setFocusTraversalPolicy(new MyFocusTraversalPolicy(ftp));
  }

  private void addCheckboxes(boolean hasModelsToGenerate) {
    if (hasModelsToGenerate) {
      myGenerateModelsCheckbox = new JCheckBox("rebuild models");
      myGenerateModelsCheckbox.setSelected(true);
      myButtonsPanel.add(myGenerateModelsCheckbox);
    }

    //noinspection ConstantConditions
    if (myRefactoringContext.getRefactoring() instanceof ILoggableRefactoring) {
      myIsLocalCheckbox = new JCheckBox("is local");
      myIsLocalCheckbox.setSelected(true);
      myButtonsPanel.add(myIsLocalCheckbox);
    }
  }

  public JComponent getComponent() {
    return myPanel;
  }

  public JButton getOkButton() {
    return myDoRefactorButton;
  }

  public UsagesView getUsagesView() {
    return myUsagesView;
  }

  /*package*/ void initUsagesView() {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        myUsagesView.setRunOptions(FindUtils.makeProvider(new ConstantFinder()),
          new SearchQuery(new ConstantHolder(mySearchResults), GlobalScope.getInstance()),
          new ButtonConfiguration(false, false, true),
          mySearchResults);
      }
    });
  }

  private void doRefactor() {
    if (myRefactoringContext != null) {
      if (myRefactoringContext.getRefactoring() instanceof ILoggableRefactoring) {
        //noinspection ConstantConditions
        myRefactoringContext.setLocal(myIsLocalCheckbox.isSelected());
      }
      if (myGenerateModelsCheckbox != null) {
        //noinspection ConstantConditions
        myRefactoringContext.setDoesGenerateModels(myGenerateModelsCheckbox.isSelected());
      } else {
        //noinspection ConstantConditions
        myRefactoringContext.setDoesGenerateModels(false);
      }
    }

    myRefactoringViewAction.performAction(this);
  }

  public abstract void close();

  public void dispose() {
    myUsagesView.dispose();
  }

  public void requestFocus() {
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        myDoRefactorButton.requestFocus();
      }
    });
  }

  private class MyFocusTraversalPolicy extends FocusTraversalPolicy {
    private final FocusTraversalPolicy myFtp;

    public MyFocusTraversalPolicy(FocusTraversalPolicy ftp) {
      myFtp = ftp;
    }

    public Component getComponentAfter(Container aContainer, Component aComponent) {
      return myFtp.getComponentAfter(aContainer, aComponent);
    }

    public Component getComponentBefore(Container aContainer, Component aComponent) {
      return myFtp.getComponentBefore(aContainer, aComponent);
    }

    public Component getFirstComponent(Container aContainer) {
      return myFtp.getFirstComponent(aContainer);
    }

    public Component getLastComponent(Container aContainer) {
      return myFtp.getLastComponent(aContainer);
    }

    public Component getDefaultComponent(Container aContainer) {
      return myDoRefactorButton;
    }
  }
}
