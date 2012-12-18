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
package jetbrains.mps.workbench.dialogs.project.utildialogs.clonemodel;

import jetbrains.mps.project.SModelRoot;
import jetbrains.mps.project.structure.model.RootReference;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.ModelRootUtil;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelOperations;
import jetbrains.mps.smodel.SModelReference;

import java.util.ArrayList;
import java.util.List;

public class CloneModelProperties {
  public static final String PROPERTY_NAME = "longName";
  public static final String PROPERTY_PATH = "root";
  public static final String PROPERTY_STEREOTYPE = "stereotype";

  private String myLongName;
  private String myStereotype;
  private int myVersion;

  private RootReference myRoot;

  private List<ModuleReference> myImportedLanguages;
  private List<SModelReference> myImportedModels;
  private List<ModuleReference> myImportedDevkits;
  private List<ModuleReference> myLanguagesInGeneration;

  public CloneModelProperties() {
    myImportedLanguages = new ArrayList<ModuleReference>();
    myImportedModels = new ArrayList<SModelReference>();
    myImportedDevkits = new ArrayList<ModuleReference>();
    myLanguagesInGeneration = new ArrayList<ModuleReference>();
  }

  public String getLongName() {
    return myLongName;
  }

  public void setLongName(String longName) {
    myLongName = longName;
  }

  public String getStereotype() {
    return myStereotype;
  }

  public void setStereotype(String stereotype) {
    myStereotype = stereotype;
  }

  public int getVersion() {
    return myVersion;
  }

  public void setVersion(int version) {
    myVersion = version;
  }

  public RootReference getRoot() {
    return myRoot;
  }

  public void setRoot(RootReference root) {
    myRoot = root;
  }

  public List<ModuleReference> getImportedLanguages() {
    return myImportedLanguages;
  }

  public List<SModelReference> getImportedModels() {
    return myImportedModels;
  }

  public List<ModuleReference> getImportedDevkits() {
    return myImportedDevkits;
  }

  public List<ModuleReference> getLanguagesInGeneration() {
    return myLanguagesInGeneration;
  }

  public void loadFrom(SModel model) {
    myLongName = model.getLongName();

    myStereotype = model.getStereotype();
    SModelRoot modelRoot = ModelRootUtil.getSModelRoot(model.getModelDescriptor());
    if (modelRoot != null) {
      myRoot = new RootReference();
      myRoot.setPath(modelRoot.getPath());
      myRoot.setPrefix(modelRoot.getPrefix());
    }

    myImportedLanguages.addAll(model.importedLanguages());
    myImportedModels.addAll(SModelOperations.getImportedModelUIDs(model));
    myImportedDevkits.addAll(model.importedDevkits());
    myLanguagesInGeneration.addAll(model.engagedOnGenerationLanguages());
  }
}
