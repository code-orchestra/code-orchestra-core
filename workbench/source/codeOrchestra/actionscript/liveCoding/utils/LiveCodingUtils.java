package codeOrchestra.actionscript.liveCoding.utils;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.Progressive;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.view.utils.Languages;
import codeOrchestra.actionscript.view.utils.ModelUtils;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.rgs.client.facade.RemoteProjectUpdateFacade;
import codeOrchestra.rgs.client.settings.RGSClientSettings;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelFqName;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.vfs.FileSystem;

import javax.swing.SwingUtilities;
import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public final class LiveCodingUtils {

  public static final SModelFqName LIVE_CODING_MODEL_FQNAME = new SModelFqName(LiveCodingManager.LIVE_CODING_MODEL_NAME, "");

  public static Solution createLiveCodingModule(final Project project) {
    Solution liveCodingSolution;

    final Solution[] result = new Solution[1];
    ModelAccess.instance().runWriteActionWithProgressSynchronously(new Progressive() {
      public void run(ProgressIndicator indicator) {
        // 1 - Solution
        final String descriptorPath = getLiveCodingModuleDescriptorPath(project);
        Solution liveCodingSolution = SolutionUtils.createNewSolution(FileSystem.getInstance().getFileByPath(descriptorPath), project, OutputType.FLEX_LIBRARY, Languages.LIVE_CODING);
        result[0] = liveCodingSolution;

        // 2 - Model
        final SModelDescriptor modelDescriptor;
        SModelFqName modelUID = LIVE_CODING_MODEL_FQNAME;
        modelDescriptor = liveCodingSolution.createModel(modelUID, liveCodingSolution.getSModelRoots().get(0));

        SModel sModel = modelDescriptor.getSModel();
        sModel.setLoading(true);

        // Add model imports
        ModelUtils.addDefaultModelImports(sModel, project);

        // Add language imports
        sModel.addLanguage(Languages.getReference(Languages.ACTION_SCRIPT_INTERNAL));
        sModel.addLanguage(Languages.getReference(Languages.ACTION_SCRIPT_LOGGING));
        sModel.addLanguage(Languages.getReference(Languages.ACTION_SCRIPT_ASSETS));
        sModel.addEngagedOnGenerationLanguage(Languages.getReference(Languages.ACTION_SCRIPT_LOGGING));

        Runnable runnable = new Runnable() {
          @Override
          public void run() {
            ModelAccess.instance().tryWriteInCommand(new Computable<Void>() {
              @Override
              public Void compute() {
                ((EditableSModelDescriptor) modelDescriptor).save();
                modelDescriptor.getSModel().setLoading(false);

                // Force RGS sync
                if (RGSClientSettings.getInstance().isUseRemoteGeneration()) {
                  new RemoteProjectUpdateFacade(project).syncTheProject();
                }

                return null;
              }
            }, project);
          }
        };
        if (ModelAccess.instance().isInEDT()) {
          runnable.run();
        } else {
          SwingUtilities.invokeLater(runnable);
        }
      }
    }, "Initializing Live-Coding Module", false, project);
    liveCodingSolution = result[0];

    return liveCodingSolution;
  }

  private static String getLiveCodingModuleDescriptorPath(Project project) {
    String liveCodingModuleName = LiveCodingManager.getLiveCodingModuleName(project);

    File modulesDir = new File(project.getBaseDir().getPath(), "modules");
    File liveCodingModuleDir = new File(modulesDir, liveCodingModuleName);
    File descriptorFile = new File(liveCodingModuleDir, liveCodingModuleName + MPSExtentions.DOT_SOLUTION);

    return descriptorFile.getPath();
  }


}
