/*
 * Copyright 2003-2010 JetBrains s.r.o.
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
package jetbrains.mps.workbench.actions.module;

import codeOrchestra.actionscript.util.ReferenceTypeSwitcher;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.WindowManager;
import codeOrchestra.actionscript.view.ActionScriptViewPane;
import com.sun.jna.platform.FileUtils;
import jetbrains.mps.ide.vfs.IdeaFile;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.*;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import javax.swing.JOptionPane;
import java.io.File;
import java.io.IOException;

public class DeleteModuleHelper {
  private static final Logger LOG = Logger.getLogger(DeleteModuleHelper.class);

  public static void deleteModule(Project project, IModule module, boolean safeDelete, boolean deleteFiles) {
    if (safeDelete) {
      safeDelete(project, module, deleteFiles);
    } else {
      delete(project, module, deleteFiles);
    }
  }

  @CodeOrchestraPatch
  private static void delete(Project project, IModule module, boolean deleteFiles) {
    MPSProject mpsProject = project.getComponent(MPSProject.class);
    if (!mpsProject.isProjectModule(module) && !deleteFiles) {
      JOptionPane.showMessageDialog(WindowManager.getInstance().getFrame(project), "Non-project modules can only be deleted with files deletion enabled", "Can't delete module", JOptionPane.WARNING_MESSAGE);
    }

    // CO-4616
    new ReferenceTypeSwitcher(project, module).makeAllReferencesForeign();

    if (deleteFiles) {
      ActionScriptViewPane actionScriptViewPane = ActionScriptViewPane.getInstance(project);
      boolean updateTreeOnModelDelete = actionScriptViewPane.isUpdateTreeOnModelDelete();
      actionScriptViewPane.setUpdateTreeOnModelDelete(false);
      try{
        for (SModelDescriptor model : module.getOwnModelDescriptors()) {
          // RE-4484
          //DeleteModelHelper.delete(module, model, true);
          SModelRepository.getInstance().removeModelDescriptor(model);
        }
      } finally {
        actionScriptViewPane.setUpdateTreeOnModelDelete(updateTreeOnModelDelete);
      }
    }

    //remove from project
    if (mpsProject.isProjectModule(module)) {
      mpsProject.removeProjectModule(module, true);
      project.save();
    }

    if (deleteFiles) {
      MPSModuleRepository.getInstance().removeModule(module);

      // RE-4484
      //module.getDescriptorFile().delete();
      //deleteDirectory(new File(module.getDescriptorFile().getParent().getAbsolutePath())); // RE-1540
      File[] files = new File[1];
      files[0] = new File(module.getDescriptorFile().getParent().getAbsolutePath());
      try {
        FileUtils.getInstance().moveToTrash(files);
      } catch (IOException e) {
        LOG.warning("Cannot move file to trash: " + files[0].getPath());
      }

      ((IdeaFile) module.getDescriptorFile().getParent().getParent()).refresh();
    }
  }

  @CodeOrchestraPatch
  private static boolean deleteDirectory(File path) {
    if( path.exists() ) {
      File[] files = path.listFiles();
      for(int i=0; i<files.length; i++) {
        if(files[i].isDirectory()) {
          deleteDirectory(files[i]);
        }
        else {
          files[i].delete();
        }
      }
    }
    return( path.delete() );
  }

  private static void safeDelete(Project project, IModule module, boolean deleteFiles) {
    LOG.error("SAFE DELETE MODULE - NOT IMPLEMENTED", new Throwable());
  }

}
