package codeOrchestra.environment.view;

import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.options.Configurable;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.project.Project;
import codeOrchestra.environment.Environment;
import codeOrchestra.environment.EnvironmentBasedRedirect;
import codeOrchestra.environment.EnvironmentLibrary;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import org.jdom.Element;
import org.jetbrains.annotations.Nls;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.JComponent;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
@State(
  name = EnvironmentLibraryManager.COMPONENT_NAME,
  storages = {
    @Storage(
      id="other",
      file="$PROJECT_FILE$"
    )
  }
)
public class EnvironmentLibraryManager implements ProjectComponent, PersistentStateComponent<Element>, Configurable {

  public static final String COMPONENT_NAME = "EnvironmentLibraryManager";
  public static final String DISPLAY_NAME = "Environment Libraries";

  private static final List<EnvironmentLibrary> DEFAULT_LIBS = new ArrayList<EnvironmentLibrary>() {{
    add(new EnvironmentLibrary(
      ModuleReference.fromString("3849ec0a-97b3-4a50-8e3c-92d2066b6599(playerglobal_swc)"),
      ModuleReference.fromString("e5f7cdc9-b037-45b7-b458-e595780f6b53(jangaroo-runtime)"),
      Environment.HTML5
    ));
    add(new EnvironmentLibrary(
      ModuleReference.fromString("3849ec0a-97b3-4a50-8e3c-92d2066b6599(playerglobal_swc)"),
      ModuleReference.fromString("d2f2dcff-810f-4fab-957f-72350eb5b4a4(jooflash)"),
      Environment.HTML5
    ));
  }};

  private List<EnvironmentLibrary> environmentLibraries = new ArrayList<EnvironmentLibrary>();
  private EnvironmentBasedRedirect myRedirect;
  private EnvironmentLibraryListEditor myEditor;
  private boolean loadHasOccurred;

  public EnvironmentLibraryManager(Project project) {
    this.myRedirect = new EnvironmentBasedRedirect(project);
  }

  public EnvironmentBasedRedirect getRedirector() {
    return myRedirect;
  }

  public void addEnvironmentLibrary(EnvironmentLibrary environmentLibrary) {
    environmentLibraries.add(environmentLibrary);
  }

  public void remove(EnvironmentLibrary[] environmentLibrariesToRemove) {
    for (EnvironmentLibrary environmentLibraryToRemove : environmentLibrariesToRemove) {
      environmentLibraries.remove(environmentLibraryToRemove);
    }
  }

  public EnvironmentLibrary[] getAllSettings() {
    return environmentLibraries.toArray(new EnvironmentLibrary[environmentLibraries.size()]);
  }

  public boolean isLibraryImplementation(IModule module) {
    ModuleReference moduleReference = module.getModuleReference();
    for (EnvironmentLibrary environmentLibrary : environmentLibraries) {
      if (moduleReference.equals(environmentLibrary.getImplementationReference())) {
        return true;
      }
    }

    return false;
  }

  public List<EnvironmentLibrary> getAllEnvironmentsLibraries(IModule libraryModule) {
    List<EnvironmentLibrary> result = new ArrayList<EnvironmentLibrary>();

    ModuleReference moduleReference = libraryModule.getModuleReference();
    for (EnvironmentLibrary environmentLibrary : environmentLibraries) {
      if (moduleReference.equals(environmentLibrary.getLibraryReference())) {
        result.add(environmentLibrary);
      }
    }

    return result;
  }

  public List<EnvironmentLibrary> getEnvironmentLibraries(IModule libraryModule, Environment environment) {
    List<EnvironmentLibrary> result = new ArrayList<EnvironmentLibrary>();

    ModuleReference moduleReference = libraryModule.getModuleReference();
    for (EnvironmentLibrary environmentLibrary : environmentLibraries) {
      if (environment == environmentLibrary.getEnvironment() && moduleReference.equals(environmentLibrary.getLibraryReference())) {
        result.add(environmentLibrary);
      }
    }

    return result;
  }

  public void clearAll() {
    environmentLibraries.clear();
  }

  @Nls
  @Override
  public String getDisplayName() {
    return DISPLAY_NAME;
  }

  public boolean isModified() {
    return myEditor.isModified();
  }

  public void apply() throws ConfigurationException {
    myEditor.commit();
  }

  public void reset() {
    myEditor.reset();
  }

  public void disposeUIResources() {
    myEditor = null;
  }

  @Override
  public JComponent createComponent() {
    myEditor = new EnvironmentLibraryListEditor(this);
    return myEditor.getPanel();
  }

  @NotNull
  @Override
  public String getComponentName() {
    return COMPONENT_NAME;
  }

  @Override
  public Element getState() {
    // Default settings
    if (!loadHasOccurred) {
      this.loadHasOccurred = true;

      if (!environmentLibraries.containsAll(DEFAULT_LIBS)) {
        environmentLibraries.addAll(DEFAULT_LIBS);
      }
    }

    Element element = new Element(COMPONENT_NAME);
    for (EnvironmentLibrary environmentLibrary : environmentLibraries) {
      element.addContent(environmentLibrary.save());
    }
    return element;
  }

  @Override
  public void loadState(Element state) {
    this.loadHasOccurred = true;
    environmentLibraries.clear();
    for (Element environmentLibraryElement : (Iterable<? extends Element>) state.getChildren("environmentLibrary")) {
      environmentLibraries.add(EnvironmentLibrary.loadFrom(environmentLibraryElement));
    }
  }

  @Override
  public void disposeComponent() {
    this.environmentLibraries.clear();
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }

  @Override
  public void initComponent() {
  }

  @Override
  public Icon getIcon() {
    return null;
  }

  @Override
  public String getHelpTopic() {
    return null;
  }

}
