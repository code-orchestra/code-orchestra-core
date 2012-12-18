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

import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.smodel.LanguageID;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.util.List;

public class SolutionDescriptor extends ModuleDescriptor {
  private String myOutputPath;
  private boolean myDontLoadClasses;
  private CompilerSettings compilerSettings;

  @CodeOrchestraPatch
  private String gitHubUrl;

  @CodeOrchestraPatch
  private String localUrl;


  @CodeOrchestraPatch
  private String gitTimeUpdate;

  @CodeOrchestraPatch
  private boolean gitAutoUpgrade;

  @CodeOrchestraPatch
  private String assetsDirName;

  @CodeOrchestraPatch
  private ModelRoot assetModelRoot;

  @CodeOrchestraPatch
  private String relativeAsDocPath;

  @CodeOrchestraPatch
  public String getRelativeAsDocPath() {
    return relativeAsDocPath;
  }

  @CodeOrchestraPatch
  public void setRelativeAsDocPath(String relativeAsDocPath) {
    this.relativeAsDocPath = relativeAsDocPath;
  }

  @Override
  public List<ModelRoot> getStubModelEntries() {
    List<ModelRoot> stubModelEntries = super.getStubModelEntries();

    if (assetModelRoot != null && !stubModelEntries.contains(assetModelRoot)) {
      stubModelEntries.add(assetModelRoot);
    }

    return stubModelEntries;
  }

  public CompilerSettings getCompilerSettings() {
    if (compilerSettings == null) {
      compilerSettings = new CompilerSettings(this);
    }
    return compilerSettings;
  }

  public void setCompilerSettings(CompilerSettings compilerSettings) {
    this.compilerSettings = compilerSettings;
  }

  @CodeOrchestraPatch
  public String getAssetsDirName() {
    return assetsDirName;
  }

  @CodeOrchestraPatch
  public void setAssetsDirName(@NotNull String assetsDirName, final IFile file) {
    this.assetsDirName = assetsDirName;

    if (file == null) {
      return;
    }

    // Assure the assets dir is created
    String moduleAssetsDirPath = file.getParent().getPath() + File.separator + assetsDirName;
    File moduleAssetsDir = new File(moduleAssetsDirPath);
    if (!moduleAssetsDir.exists()) {
      if (!moduleAssetsDir.mkdirs()) {
        LOG.warning("Can't create module assets dir: " + moduleAssetsDirPath);
      }
    }

    // Create assets model root
    this.assetModelRoot = new ModelRoot();
    this.assetModelRoot.setPath(moduleAssetsDirPath);
    this.assetModelRoot.setManager(LanguageID.ASSETS_MANAGER);
  }

  public String getGitHubUrl() {
    return gitHubUrl;
  }

  public String getGitTimeUpdate() {
    return gitTimeUpdate;
  }

  public String getLocalUrl() {
    return this.localUrl;
  }

  public void setLocalUrl(String localUrl) {
    this.localUrl = localUrl;
  }

  public void setGitHubUrl(String gitHubUrl) {
    this.gitHubUrl = gitHubUrl;
  }

  public void setGitTimeUpdate(String gitTimeUpdate) {
    this.gitTimeUpdate = gitTimeUpdate;
  }

  public void setGitAutoUpgrade(boolean gitAutoUpgrade) {
    this.gitAutoUpgrade = gitAutoUpgrade;
  }

  public String getOutputPath() {
    return myOutputPath;
  }

  public void setOutputPath(String outputPath) {
    myOutputPath = outputPath;
  }

  public boolean isDontLoadClasses() {
    return myDontLoadClasses;
  }

  public void setDontLoadClasses(boolean dontLoadClasses) {
    myDontLoadClasses = dontLoadClasses;
  }
}
