package codeOrchestra.actionscript.flex.settings;

import codeOrchestra.actionscript.flex.settings.FlexURIs.FlexURIsState;
import codeOrchestra.utils.ProjectHolder;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.options.SearchableConfigurable;
import com.intellij.openapi.project.Project;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.w3c.dom.Document;

import javax.swing.Icon;
import javax.swing.JComponent;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
@State(
  name = "FlexURIs",
  storages = {
    @Storage(
      id="other",
      file="$PROJECT_FILE$"
    )
  }
)
public class FlexURIs implements PersistentStateComponent<FlexURIsState>, SearchableConfigurable, ProjectComponent {

  public static FlexURIs getInstance() {
    Project project = ProjectHolder.getProject();
    if (project == null) {
      return null;
    }
    return project.getComponent(FlexURIs.class);
  }

  private FlexURIsState state = new FlexURIsState();
  private FlexURIListEditor myEditor;

  public JComponent createComponent() {
    myEditor = new FlexURIListEditor(this);
    return myEditor.getPanel();
  }

  public void apply() throws ConfigurationException {
    myEditor.commit();
  }

  public FlexURIsState getState() {
    return state;
  }

  public void loadState(FlexURIsState flexURIsState) {
    this.state = flexURIsState;
  }

  @NotNull
  public String getComponentName() {
    return "Flex URIs";
  }

  public void initComponent() {
  }

  public void disposeComponent() {
  }

  public void reset() {
    myEditor.reset();
  }

  public void disposeUIResources() {
    myEditor = null;
  }

  public String getDisplayName() {
    return "Flex URIs";
  }

  public String getHelpTopic() {
    return null;
  }

  public boolean isModified() {
    return myEditor.isModified();
  }

  public Icon getIcon() {
    return null;
  }

  public String getId() {
    return "flex.uris";
  }

  public void clearAllURIs() {
    getState().clear();
  }

  public void addURI(String uri, String file) {
    getState().addURI(uri, file);
  }

  public Set<String> getURIs() {
    return getState().getURIs();
  }

  public String getFilePathByURI(String uri) {
    return getState().getFilePathByURI(uri);
  }

  public List<FlexComponent> getComponentsByURI(String uri) {
    if (uri == null || uri.isEmpty()) {
      throw new IllegalArgumentException("URI argument can't be null/empty");
    }
    List<FlexComponent> result = new ArrayList<FlexComponent>();

    String filePathByURI = getState().getFilePathByURI(uri);
    if (filePathByURI == null) {
      return result;
    }

    File manifestFile = new File(filePathByURI);
    if (!manifestFile.exists()) {
      return result;
    }

    Document manifestDocument = codeOrchestra.actionscript.util.XMLUtils.fileToDOM(manifestFile);
    if (manifestDocument == null) {
      return result;
    }

    FlexComponentDecoder.decode(manifestDocument, result);

    return result;
  }

  @Nullable
  public Runnable enableSearch(String option) {
    return null;
  }

  public static class FlexURIsState {
    private Map<String, String> uris = DefaultFlexURIs.get();

    public Map<String, String> getUris() {
      return uris;
    }

    public void setUris(Map<String, String> uris) {
      this.uris = uris;
    }

    public void clear() {
      uris.clear();
    }

    public void addURI(String uri, String file) {
      uris.put(uri, file);
    }

    public Set<String> getURIs() {
      return uris.keySet();
    }

    public String getFilePathByURI(String uri) {
      return uris.get(uri);
    }

  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }
}
