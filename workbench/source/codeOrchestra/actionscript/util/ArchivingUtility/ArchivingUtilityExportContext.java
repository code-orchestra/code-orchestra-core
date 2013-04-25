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
package codeOrchestra.actionscript.util.ArchivingUtility;

import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.ui.Messages;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.vfs.IFile;

import java.awt.Frame;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @author olegchir
 */
public class ArchivingUtilityExportContext {
  private AnActionEvent event;
  private IOperationContext operationContext;
  private IModule module;
  private MPSProject mpsProject = null;
  private Frame frame;
  private List<IModule> modulesToExport = new ArrayList<IModule>();
  private IFile destinationVirtualDirectory = null;
  private File destinationFile = null;
  private List<String> assetsToExport = new ArrayList<String>();
  private IModule assetsModule = null;
  private String targetType = null;
  private boolean abortAll = false;
  private String abortMessage = null;
  private String abortMessageTitle = null;

  public void abort(String abortMessage, String abortMessageTitle, boolean instant) {
    this.abortMessage = abortMessage;
    this.abortMessageTitle = abortMessageTitle;
    this.abortAll = true;
    if (instant) {
      displayAbortMessage();
    }
  }

  public boolean displayAbortMessage() {
    if (isAbortAll()) {
      Messages.showErrorDialog(getAbortMessage(),getAbortMessageTitle());
      return true;
    } else {
      return false;
    }
  }

  public AnActionEvent getEvent() {
    return event;
  }

  public void setEvent(AnActionEvent event) {
    this.event = event;
  }

  public IOperationContext getOperationContext() {
    return operationContext;
  }

  public void setOperationContext(IOperationContext operationContext) {
    this.operationContext = operationContext;
  }

  public IModule getModule() {
    return module;
  }

  public void setModule(IModule module) {
    this.module = module;
  }

  public Frame getFrame() {
    return frame;
  }

  public void setFrame(Frame frame) {
    this.frame = frame;
  }

  public IModule getAssetsModule() {
    return assetsModule;
  }

  public void setAssetsModule(IModule assetsModule) {
    this.assetsModule = assetsModule;
  }

  public File getDestinationFile() {
    return destinationFile;
  }

  public void setDestinationFile(File destinationFile) {
    this.destinationFile = destinationFile;
  }

  public MPSProject getMpsProject() {
    return mpsProject;
  }

  public void setMpsProject(MPSProject mpsProject) {
    this.mpsProject = mpsProject;
  }

  public IFile getDestinationVirtualDirectory() {
    return destinationVirtualDirectory;
  }

  public void setDestinationVirtualDirectory(IFile destinationVirtualDirectory) {
    this.destinationVirtualDirectory = destinationVirtualDirectory;
  }

  public List<IModule> getModulesToExport() {
    return modulesToExport;
  }

  public void setModulesToExport(List<IModule> modulesToExport) {
    this.modulesToExport = modulesToExport;
  }

  public List<String> getAssetsToExport() {
    return assetsToExport;
  }

  public void setAssetsToExport(List<String> assetsToExport) {
    this.assetsToExport = assetsToExport;
  }

  public String getTargetType() {
    return targetType;
  }

  public void setTargetType(String targetType) {
    this.targetType = targetType;
  }

  public boolean isAbortAll() {
    return abortAll;
  }

  public void setAbortAll(boolean abortAll) {
    this.abortAll = abortAll;
  }

  public String getAbortMessage() {
    return abortMessage;
  }

  public void setAbortMessage(String abortMessage) {
    this.abortMessage = abortMessage;
  }

  public String getAbortMessageTitle() {
    return abortMessageTitle;
  }

  public void setAbortMessageTitle(String abortMessageTitle) {
    this.abortMessageTitle = abortMessageTitle;
  }
}
