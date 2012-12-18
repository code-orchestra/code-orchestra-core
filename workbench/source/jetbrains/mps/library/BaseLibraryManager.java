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
package jetbrains.mps.library;

import com.intellij.openapi.components.BaseComponent;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.options.Configurable;
import com.intellij.openapi.options.ConfigurationException;
import jetbrains.mps.ide.library.LibraryManagerPreferences;
import jetbrains.mps.library.BaseLibraryManager.MyState;
import jetbrains.mps.library.contributor.LibraryContributor;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.util.MacrosFactory;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.JComponent;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public abstract class BaseLibraryManager implements BaseComponent, Configurable, PersistentStateComponent<MyState>, LibraryContributor {
  protected final MPSModuleRepository myRepository;

  public BaseLibraryManager(MPSModuleRepository repo) {
    myRepository = repo;
  }

  //-------libraries

  public final Set<String> getLibraries() {
    Set<String> result = new HashSet<String>();
    for (Library l : getUILibraries()) {
      result.add(l.getPath());
    }
    return result;
  }

  public Library addLibrary(String name) {
    Library library = new Library();
    library.setName(name);
    myState.getLibraries().put(library.getName(), library);
    return library;
  }

  public void remove(Library l) {
    myState.getLibraries().remove(l.getName());
  }

  public Set<Library> getUILibraries() {
    Set<Library> result = new HashSet<Library>();
    result.addAll(myState.getLibraries().values());
    return result;
  }

  //-------macro stuff

  private MyState removeMacros(MyState state) {
    MyState result = new MyState();
    for (Entry<String, Library> entry : state.getLibraries().entrySet()) {
      result.getLibraries().put(entry.getKey(), removeMacros(entry.getValue()));
    }
    return result;
  }

  private Library addMacros(Library l) {
    Library result = l.copy();
    result.setPath(addMacros(result.getPath()));
    return result;
  }

  private Library removeMacros(Library l) {
    Library result = l.copy();
    result.setPath(removeMacros(result.getPath()));
    return result;
  }

  protected String addMacros(String path) {
    return MacrosFactory.mpsHomeMacros().shrinkPath(path, (IFile) null);
  }

  protected String removeMacros(String path) {
    return MacrosFactory.mpsHomeMacros().expandPath(path, (IFile) null);
  }

  //-------configurable stuff

  private LibraryManagerPreferences myPreferences;

  private LibraryManagerPreferences getPreferences() {
    if (myPreferences == null) {
      myPreferences = new LibraryManagerPreferences(this);
    }
    return myPreferences;
  }

  @Nullable
  public Icon getIcon() {
    return getPreferences().getIcon();
  }

  @Nullable
  @NonNls
  public String getHelpTopic() {
    return null;
  }

  public JComponent createComponent() {
    return getPreferences().getComponent();
  }

  public boolean isModified() {
    return getPreferences().isModified();
  }

  public void apply() throws ConfigurationException {
    getPreferences().commit();
  }

  public void reset() {
    getPreferences().reset();
  }

  public void disposeUIResources() {

  }

  //-------component stuff

  private MyState myState = new MyState();

  public void initComponent() {
    LibraryInitializer.getInstance().addContributor(this);
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        LibraryInitializer.getInstance().update(true);
      }
    });
  }

  public void disposeComponent() {
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "Library Manager";
  }

  public MyState getState() {
    MyState result = new MyState();
    for (Entry<String, Library> entry : myState.getLibraries().entrySet()) {
      result.getLibraries().put(entry.getKey(), addMacros(entry.getValue()));
    }
    return result;
  }

  public void loadState(MyState state) {
    myState = removeMacros(state);
  }

  public static class MyState {
    private Map<String, Library> myLibraries = new HashMap<String, Library>();

    public Map<String, Library> getLibraries() {
      return myLibraries;
    }

    public void setLibraries(Map<String, Library> libraries) {
      myLibraries = libraries;
    }
  }
}
