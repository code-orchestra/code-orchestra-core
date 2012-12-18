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
package jetbrains.mps.project.structure.modules;

import codeOrchestra.actionScript.flexsdk.FlexSDKLibsManager;
import codeOrchestra.actionScript.flexsdk.FlexSDKNotPresentException;
import codeOrchestra.actionscript.view.ASMessageMarker;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ModuleDescriptor {

  protected static final Logger LOG = Logger.getLogger(ModuleDescriptor.class);

  private String myUUID;
  private String myNamespace;
  private String myTimestamp;
  private boolean myCompileInMPS = true;

  private boolean myEnableJavaStubs;

  private List<jetbrains.mps.project.structure.model.ModelRoot> myModelRoots;
  private List<Dependency> myDependencies;
  private List<ModuleReference> myUsedLanguages;
  private List<ModuleReference> myUsedDevkits;
  private List<ModelRoot> myStubModels;
  private List<String> mySourcePaths;
  private DeploymentDescriptor myDeploymentDescriptor;

  public ModuleDescriptor() {
    myModelRoots = new ArrayList<jetbrains.mps.project.structure.model.ModelRoot>();
    myDependencies = new ArrayList<Dependency>();
    myUsedLanguages = new ArrayList<ModuleReference>();
    myUsedDevkits = new ArrayList<ModuleReference>();
    myStubModels = new ArrayList<ModelRoot>();
    mySourcePaths = new ArrayList<String>();
  }

  public String getUUID() {
    return myUUID;
  }

  public void setUUID(String UUID) {
    myUUID = UUID;
  }

  public String getNamespace() {
    return myNamespace;
  }

  public void setNamespace(String namespace) {
    myNamespace = namespace;
  }

  public ModuleReference getModuleReference() {
    return new ModuleReference(getNamespace(), myUUID);
  }

  public String getTimestamp() {
    return myTimestamp;
  }

  public void setTimestamp(String timestamp) {
    myTimestamp = timestamp;
  }

  public boolean getCompileInMPS() {
    return myCompileInMPS;
  }

  public void setCompileInMPS(boolean compileInMPS) {
    myCompileInMPS = compileInMPS;
  }

  public boolean getEnableJavaStubs() {
    return myEnableJavaStubs;
  }

  public void setEnableJavaStubs(boolean enableJavaStubs) {
    myEnableJavaStubs = enableJavaStubs;
  }

  public List<ModelRoot> getModelRoots() {
    return myModelRoots;
  }

  public List<Dependency> getDependencies() {
    return myDependencies;
  }

  public List<ModuleReference> getUsedLanguages() {
    return myUsedLanguages;
  }

  public List<ModuleReference> getUsedDevkits() {
    return myUsedDevkits;
  }

  @CodeOrchestraPatch
  public List<ModelRoot> getStubModelEntries() {
    if (myNamespace != null) {
      if (this instanceof SolutionDescriptor && FlexSDKLibsManager.getInstance().isFlexLib(myNamespace)) {
        // In case myStubModels is still empty and getStubModelEntries() is called to add the new model roots(s)
        if (myStubModels.isEmpty()) {
          return myStubModels;
        }

        ModelRoot stubModelRoot = myStubModels.get(0);

        try {
          stubModelRoot.setPath(FlexSDKLibsManager.getInstance().getLibPath(myNamespace));
        } catch (FlexSDKNotPresentException e) {
          LOG.warning(e.getMessage());
        }

        List<ModelRoot> singleModelRoot = new ArrayList<ModelRoot>();
        singleModelRoot.add(stubModelRoot);

        return singleModelRoot;
      }
    }
    return myStubModels;
  }

  public List<String> getSourcePaths() {
    return mySourcePaths;
  }

  public DeploymentDescriptor getDeploymentDescriptor() {
    return myDeploymentDescriptor;
  }

  public void setDeploymentDescriptor(DeploymentDescriptor deploymentDescriptor) {
    myDeploymentDescriptor = deploymentDescriptor;
  }

  public boolean updateModelRefs() {
    return false;
  }

  public boolean updateModuleRefs() {
    return RefUpdateUtil.composeUpdates(
      RefUpdateUtil.updateModuleRefs(myUsedLanguages),
      RefUpdateUtil.updateModuleRefs(myUsedDevkits),
      RefUpdateUtil.updateDependencies(myDependencies)
    );
  }
}
