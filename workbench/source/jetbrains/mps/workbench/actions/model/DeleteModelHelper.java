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
package jetbrains.mps.workbench.actions.model;

import com.intellij.ide.DataManager;
import com.intellij.openapi.actionSystem.ActionPlaces;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.openapi.project.Project;
import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.ide.findusages.findalgorithm.finders.specific.ModelUsagesFinder;
import jetbrains.mps.ide.findusages.model.SearchQuery;
import jetbrains.mps.ide.findusages.model.SearchResults;
import jetbrains.mps.ide.findusages.view.FindUtils;
import jetbrains.mps.ide.messages.MessagesViewTool;
import jetbrains.mps.ide.refactoring.GenericRefactoringAction;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.messages.Message;
import jetbrains.mps.messages.MessageKind;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.project.Solution;
import jetbrains.mps.refactoring.framework.*;
import jetbrains.mps.refactoring.framework.RefactoringUtil.Applicability;
import jetbrains.mps.smodel.*;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.ActionUtils;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.Nullable;

import java.util.Set;

public class DeleteModelHelper {
  private static final Logger LOG = Logger.getLogger(DeleteModelHelper.class);

  public static void deleteModel(Project project, IModule contextModule, SModelDescriptor modelDescriptor, boolean safeDelete, boolean deleteFiles) {
    LanguageAspect aspect = Language.getModelAspect(modelDescriptor);

    if (aspect == LanguageAspect.STRUCTURE) {
      Message msg = new Message(MessageKind.WARNING, DeleteModelHelper.class, "Can't delete structure model " + modelDescriptor.getLongName());
      project.getComponent(MessagesViewTool.class).add(msg);
      return;
    }

    deleteGeneratedFiles(modelDescriptor);

    if (safeDelete) {
      safeDelete(project, modelDescriptor, deleteFiles);
    } else {
      delete(contextModule, modelDescriptor, deleteFiles);
    }
  }

  public static void deleteGeneratedFiles(SModelDescriptor modelDescriptor) {
    IFile moduleOutput = FileSystem.getInstance().getFileByPath(modelDescriptor.getModule().getOutputFor(modelDescriptor));
    FileGenerationUtil.getDefaultOutputDir(modelDescriptor, moduleOutput).delete();
    FileGenerationUtil.getDefaultOutputDir(modelDescriptor, FileGenerationUtil.getCachesDir(moduleOutput)).delete();
  }

  public static void delete(IModule contextModule, SModelDescriptor modelDescriptor, boolean deleteFiles) {
    boolean deleteIfAsked = true;
    if (contextModule instanceof Language) {
      deleteIfAsked = deleteModelFromLanguage((Language) contextModule, modelDescriptor);
    } else if (contextModule instanceof Solution) {
      deleteModelFromSolution((Solution) contextModule, modelDescriptor);
    } else if (contextModule instanceof Generator) {
      deleteModelFromGenerator((Generator) contextModule, modelDescriptor);
    } else {
      LOG.warning("Module type " + contextModule.getClass().getSimpleName() + " is not supported by delete refactoring. Changes will not be saved automatically for modules of this type.");
    }

    if (deleteFiles && deleteIfAsked) {
      SModelRepository.getInstance().deleteModel(modelDescriptor);
    }

    contextModule.save();
  }

  public static void safeDelete(final Project project, final SModelDescriptor modelDescriptor, boolean deleteFiles) {
    IRefactoring ref = OldRefactoringAdapter.createAdapterFor(new SafeDeleteModelRefactoring(deleteFiles));
    GenericRefactoringAction safeDeleteAction = new GenericRefactoringAction(ref) {
      protected Applicability getMinApplicabilityLevel() {
        return Applicability.OVERRIDDEN;
      }
    };

    DataContext dc = new DataContext() {
      private DataContext myRealContext = DataManager.getInstance().getDataContext();

      @Nullable
      public Object getData(@NonNls String dataId) {
        if (dataId.equals(MPSDataKeys.PROJECT.getName())) return project;
        else if (dataId.equals(MPSDataKeys.CONTEXT_MODEL.getName())) return modelDescriptor;
        else if (dataId.equals(MPSDataKeys.OPERATION_CONTEXT.getName())) {
          Object operationContext = myRealContext.getData(dataId);
          if (operationContext == null) {
            operationContext = ProjectOperationContext.get(project);
          }
          return operationContext;
        }
        else return myRealContext.getData(dataId);
      }
    };

    AnActionEvent event = ActionUtils.createEvent(ActionPlaces.UNKNOWN, dc);
    ActionUtils.updateAndPerformAction(safeDeleteAction, event);
  }

  private static boolean deleteModelFromLanguage(Language language, SModelDescriptor modelDescriptor) {
    if (language.isAccessoryModel(modelDescriptor.getSModelReference())) {
      language.removeAccessoryModel(modelDescriptor);
      return false;
    } else {
      return true;
    }
  }

  private static void deleteModelFromSolution(Solution solution, SModelDescriptor modelDescriptor) {

  }

  private static void deleteModelFromGenerator(Generator generator, SModelDescriptor modelDescriptor) {
    generator.deleteReferenceFromPriorities(modelDescriptor.getSModelReference());
  }

  private static class SafeDeleteModelRefactoring extends AbstractLoggableRefactoring {
    private boolean myDeleteFiles;

    public SafeDeleteModelRefactoring(boolean deleteFiles) {
      myDeleteFiles = deleteFiles;
    }

    public String getUserFriendlyName() {
      return "Delete model";
    }

    public RefactoringTarget getRefactoringTarget() {
      return RefactoringTarget.MODEL;
    }

    public boolean isApplicableToModel() {
      return true;
    }

    public boolean isApplicableToModel(SModelDescriptor model) {
      return true;
    }

    public boolean refactorImmediatelyIfNoUsages() {
      return true;
    }

    public boolean doesUpdateModel() {
      return false;
    }

    public boolean showsAffectedNodes() {
      return true;
    }

    public boolean askForInfo(RefactoringContext refactoringContext) {
      return true;
    }

    public void doRefactor(RefactoringContext refactoringContext) {
      SModelDescriptor modelDescriptor = refactoringContext.getSelectedModel();
      Set<ModelOwner> owners = SModelRepository.getInstance().getOwners(modelDescriptor);
      for (ModelOwner modelOwner : owners) {
        if (!(modelOwner instanceof IModule)) {
          LOG.warning("Model owner type " + modelOwner.getClass().getSimpleName() + " is not supported by delete refactoring. Changes will not be saved automatically for owners of this type.");
          continue;
        }
        if ((IModule) modelOwner instanceof Language) {
          deleteModelFromLanguage((Language) (IModule) modelOwner, modelDescriptor);
        } else if ((IModule) modelOwner instanceof Solution) {
          deleteModelFromSolution((Solution) (IModule) modelOwner, modelDescriptor);
        } else if ((IModule) modelOwner instanceof Generator) {
          deleteModelFromGenerator((Generator) (IModule) modelOwner, modelDescriptor);
        } else {
          LOG.warning("Module type " + ((IModule) modelOwner).getClass().getSimpleName() + " is not supported by delete refactoring. Changes will not be saved automatically for modules of this type.");
        }
      }

      // delete imports from available models, helps if there are no references to deleted model
      for (SModelDescriptor md : SModelRepository.getInstance().getModelDescriptors()) {
        if (SModelStereotype.isUserModel(md) && new ModelFindOperations(md).hasImportedModel(modelDescriptor)) {
          md.getSModel().deleteModelImport(modelDescriptor.getSModelReference());
        }
      }

      if (myDeleteFiles) {
        SModelRepository.getInstance().deleteModel(modelDescriptor);
      }

      //todo: check correctness - they are not ALL model owners
      for (ModelOwner modelOwner : owners) {
        if (modelOwner instanceof IModule) {
          ((IModule) modelOwner).save();
        }
      }
    }

    public SearchResults getAffectedNodes(RefactoringContext refactoringContext) {
      SearchQuery searchQuery = new SearchQuery(refactoringContext.getSelectedModel().getSModel(), GlobalScope.getInstance());
      return FindUtils.getSearchResults(new EmptyProgressIndicator(), searchQuery, new ModelUsagesFinder());
    }
  }

}
