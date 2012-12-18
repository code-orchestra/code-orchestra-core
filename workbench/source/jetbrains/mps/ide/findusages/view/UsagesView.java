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
package jetbrains.mps.ide.findusages.view;

import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task.Modal;
import com.intellij.openapi.project.Project;
import jetbrains.mps.generator.GeneratorManager;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import jetbrains.mps.ide.findusages.IExternalizeable;
import jetbrains.mps.ide.findusages.INavigator;
import jetbrains.mps.ide.findusages.model.IResultProvider;
import jetbrains.mps.ide.findusages.model.SearchQuery;
import jetbrains.mps.ide.findusages.model.SearchResults;
import jetbrains.mps.ide.findusages.model.holders.IHolder;
import jetbrains.mps.ide.findusages.model.holders.VoidHolder;
import jetbrains.mps.ide.findusages.view.icons.IconManager;
import jetbrains.mps.ide.findusages.view.icons.Icons;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.INodeRepresentator;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.UsagesTreeComponent;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.ViewOptions;
import jetbrains.mps.make.IMakeService;
import jetbrains.mps.make.MakeSession;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.resources.ModelsToResources;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

public abstract class UsagesView implements IExternalizeable, INavigator {
  //read/write constants
  private static final String QUERY = "query";
  private static final String RESULT_PROVIDER = "result_provider";
  private static final String CLASS_NAME = "class_name";
  private static final String BUTTONS = "buttons";
  private static final String TREE_WRAPPER = "tree_wrapper";

  private Project myProject;

  //my components
  private JPanel myPanel;
  private UsagesTreeComponent myTreeComponent;

  //model components
  private IResultProvider myResultProvider;
  private SearchQuery mySearchQuery;
  private ButtonConfiguration myButtonConfiguration;

  // note: this field is not restored from XML
  private SearchResults myLastResults;

  //for assertions - check invariant - constructor -> read|setRunOpts
  private boolean myIsInitialized = false;
  private AtomicReference<MakeSession> myMakeSession = new AtomicReference<MakeSession>();

  public UsagesView(Project project, ViewOptions defaultOptions) {
    myProject = project;

    myPanel = new JPanel(new BorderLayout());

    myTreeComponent = new UsagesTreeComponent(defaultOptions) {
      public Project getProject() {
        return myProject;
      }
    };

    JPanel treeWrapperPanel = new JPanel(new BorderLayout());
    JPanel treeToolbarPanel = new JPanel(new BorderLayout());
    treeToolbarPanel.add(myTreeComponent.getViewToolbar(), BorderLayout.NORTH);
    treeWrapperPanel.add(treeToolbarPanel, BorderLayout.WEST);
    treeWrapperPanel.add(myTreeComponent, BorderLayout.CENTER);
    myPanel.add(treeWrapperPanel, BorderLayout.CENTER);

    myPanel.setMinimumSize(new Dimension());
  }

  public void dispose() {
    myTreeComponent.dispose();
  }

  //----RUN STUFF----

  public void setRunOptions(IResultProvider resultProvider, SearchQuery searchQuery, ButtonConfiguration buttonConfiguration) {
    assert ThreadUtils.isEventDispatchThread() : "must be called from EDT";
    assert !myIsInitialized;
    myIsInitialized = true;
    myResultProvider = resultProvider;
    mySearchQuery = searchQuery;
    myButtonConfiguration = buttonConfiguration;
    myPanel.add(new ActionsToolbar(buttonConfiguration), BorderLayout.WEST);
  }

  public void setRunOptions(IResultProvider resultProvider, SearchQuery searchQuery, ButtonConfiguration buttonConfiguration, SearchResults results) {
    setRunOptions(resultProvider, searchQuery, buttonConfiguration);
    myTreeComponent.setContents(results);
  }

  public void setCustomNodeRepresentator(INodeRepresentator nodeRepresentator) {
    myTreeComponent.setCustomRepresentator(nodeRepresentator);
  }

  public void run(ProgressIndicator indicator) {
    assert myIsInitialized;
    myLastResults = FindUtils.getSearchResults(indicator, mySearchQuery, myResultProvider);
    myLastResults.removeDuplicates();
    myTreeComponent.setContents(myLastResults);
  }

  private void regenerate() {
    List<SModelDescriptor> models = new ArrayList<SModelDescriptor>();
    for (SModelDescriptor modelDescriptor : myTreeComponent.getIncludedModels()) {
      if (GeneratorManager.isDoNotGenerate(modelDescriptor) || !modelDescriptor.isGeneratable()) continue;
      models.add(modelDescriptor);
    }

    ProjectOperationContext context = ProjectOperationContext.get(myProject);
    if (myMakeSession.compareAndSet(null, new MakeSession(context))) {
      try {
        if (IMakeService.INSTANCE.get().openNewSession(myMakeSession.get())) {
          IMakeService.INSTANCE.get().make(myMakeSession.get(), new ModelsToResources(context, models).resources(false));
        }
      }
      finally {
        myMakeSession.set(null);
      }
    }
//    GeneratorUIFacade.getInstance().generateModels(context, models, GeneratorUIFacade.getInstance().getDefaultGenerationHandler(), true, false);
  }

  public void goToNext() {
    myTreeComponent.goToNext();
  }

  public void goToPrevious() {
    myTreeComponent.goToPrevious();
  }

  //----COMPONENT STUFF----

  public JComponent getComponent() {
    return myPanel;
  }

  public String getCaption() {
    return mySearchQuery.getCaption();
  }

  public Icon getIcon() {
    return IconManager.getIconForIHolder(mySearchQuery.getObjectHolder());
  }

  public abstract void close();

  //----RESULTS MANIPUALTION STUFF----

  public List<SModelDescriptor> getIncludedModels() {
    return myTreeComponent.getIncludedModels();
  }

  public List<SModelDescriptor> getAllModels() {
    return myTreeComponent.getAllModels();
  }

  public List<SNodePointer> getIncludedResultNodes() {
    return myTreeComponent.getIncludedResultNodes();
  }

  public List<SNodePointer> getAllResultNodes() {
    return myTreeComponent.getAllResultNodes();
  }

  public SearchResults getSearchResults() {
    return myLastResults;
  }

  //----SAVE/LOAD STUFF----

  public void read(Element element, Project project) throws CantLoadSomethingException {
    assert !myIsInitialized;
    myIsInitialized = true;

    Element optionsXML = element.getChild(BUTTONS);
    myButtonConfiguration = new ButtonConfiguration(optionsXML, project);
    myPanel.add(new ActionsToolbar(myButtonConfiguration), BorderLayout.WEST);

    Element resultProviderXML = element.getChild(RESULT_PROVIDER);
    String className = resultProviderXML.getAttributeValue(CLASS_NAME);
    try {
      myResultProvider = (IResultProvider) Class.forName(className).newInstance();
    } catch (Throwable t) {
      throw new CantLoadSomethingException("Can't instantiate result provider: " + className, t);
    }
    myResultProvider.read(resultProviderXML, project);

    Element queryXML = element.getChild(QUERY);
    mySearchQuery = new SearchQuery(queryXML, project);

    Element treeWrapperXML = element.getChild(TREE_WRAPPER);
    myTreeComponent.read(treeWrapperXML, project);
  }

  public void write(Element element, Project project) throws CantSaveSomethingException {
    Element optionsXML = new Element(BUTTONS);
    myButtonConfiguration.write(optionsXML, project);
    element.addContent(optionsXML);

    Element resultProviderXML = new Element(RESULT_PROVIDER);
    resultProviderXML.setAttribute(CLASS_NAME, myResultProvider.getClass().getName());
    myResultProvider.write(resultProviderXML, project);
    element.addContent(resultProviderXML);

    Element queryXML = new Element(QUERY);
    mySearchQuery.write(queryXML, project);
    element.addContent(queryXML);

    Element treeWrapperXML = new Element(TREE_WRAPPER);
    myTreeComponent.write(treeWrapperXML, project);
    element.addContent(treeWrapperXML);
  }

  public static class ButtonConfiguration implements IExternalizeable {
    private static final String RERUN = "rerun";
    private static final String REGENERATE = "rebuild";
    private static final String CLOSE = "close";

    private boolean myShowRerunButton;
    private boolean myShowRegenerateButton;
    private boolean myShowCloseButton;

    public ButtonConfiguration(boolean showRerun, boolean showRegenerate, boolean showClose) {
      myShowRerunButton = showRerun;
      myShowRegenerateButton = showRegenerate;
      myShowCloseButton = showClose;
    }

    public ButtonConfiguration(boolean showRerun) {
      myShowRerunButton = showRerun;
      myShowRegenerateButton = true;
      myShowCloseButton = true;
    }

    public ButtonConfiguration(Element optionsXML, Project project) {
      read(optionsXML, project);
    }

    public boolean isShowRegenerateButton() {
      return myShowRegenerateButton;
    }

    public boolean isShowRerunButton() {
      return myShowRerunButton;
    }

    public boolean isShowCloseButton() {
      return myShowCloseButton;
    }

    public void read(Element element, Project project) {
      myShowRerunButton = Boolean.parseBoolean(element.getAttributeValue(RERUN));
      myShowRegenerateButton = Boolean.parseBoolean(element.getAttributeValue(REGENERATE));
      myShowCloseButton = Boolean.parseBoolean(element.getAttributeValue(CLOSE));
    }

    public void write(Element element, Project project) {
      element.setAttribute(RERUN, Boolean.toString(myShowRerunButton));
      element.setAttribute(REGENERATE, Boolean.toString(myShowRegenerateButton));
      element.setAttribute(CLOSE, Boolean.toString(myShowCloseButton));
    }
  }

  private class ActionsToolbar extends JPanel {
    private ActionsToolbar(ButtonConfiguration buttonConfiguration) {
      super();
      createButtons(buttonConfiguration);
    }

    private void createButtons(ButtonConfiguration buttonConfiguration) {
      DefaultActionGroup actionGroup = new DefaultActionGroup();
      if (buttonConfiguration.isShowRerunButton()) {
        actionGroup.addAction(new AnAction(getRerunSearchTooltip(), "", Icons.RERUN_ICON) {
          public void actionPerformed(AnActionEvent e) {
            assert mySearchQuery != null;
            if (mySearchQuery.getScope() == null) return;
            IHolder holder = mySearchQuery.getObjectHolder();
            if (!(holder instanceof VoidHolder)) {
              if (holder.getObject() == null) return; //object was deleted
            }
            ProgressManager.getInstance().run(new Modal(myProject, getSearchProgressTitle(), true) {
              public void run(@NotNull final ProgressIndicator indicator) {
                indicator.setIndeterminate(true);
                UsagesView.this.run(indicator);
              }
            });
          }
        });
      }
      if (buttonConfiguration.isShowRegenerateButton()) {
        actionGroup.addAction(new AnAction("Rebuild models", "", Icons.MAKE_ICON) {
          public void actionPerformed(AnActionEvent e) {
            regenerate();
          }

          @Override
          public void update(AnActionEvent e) {
            e.getPresentation().setEnabled(myMakeSession.get() == null && !IMakeService.INSTANCE.get().isSessionActive());
          }
        });
      }

      actionGroup.addAll(myTreeComponent.getActionsToolbar());

      if (buttonConfiguration.isShowCloseButton()) {
        AnAction action = new AnAction("Close", "", Icons.CLOSE_ICON) {
          public void actionPerformed(AnActionEvent e) {
            close();
          }
        };
        actionGroup.addAction(action);
      }

      ActionToolbar actionToolbar = ActionManager.getInstance().createActionToolbar(ActionPlaces.UNKNOWN, actionGroup, false);
      actionToolbar.setOrientation(SwingConstants.VERTICAL);
      add(actionToolbar.getComponent());
    }

    protected EmptyBorder createBorder() {
      return new EmptyBorder(2, 1, 2, 1);
    }
  }

  protected String getRerunSearchTooltip() {
    return "Rerun search";
  }

  protected String getSearchProgressTitle() {
    return "Searching";
  }
}
