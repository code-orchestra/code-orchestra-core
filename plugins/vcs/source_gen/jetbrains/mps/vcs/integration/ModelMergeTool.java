package jetbrains.mps.vcs.integration;

/*Generated by MPS */

import com.intellij.openapi.diff.DiffTool;
import jetbrains.mps.logging.Logger;
import com.intellij.openapi.diff.DiffRequest;
import com.intellij.openapi.diff.DiffManager;
import com.intellij.openapi.diff.DiffContent;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.vcs.ModelMergeRequestConstants;
import jetbrains.mps.vcs.diff.merge.ui.MergeModelsDialog;
import javax.swing.SwingUtilities;
import jetbrains.mps.vcs.ModelUtils;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelRepository;
import com.intellij.openapi.ui.Messages;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.vcs.diff.ui.OldMergeModelsDialog;
import java.io.IOException;

public class ModelMergeTool implements DiffTool {
  private static final Logger LOG = Logger.getLogger(ModelMergeTool.class);

  public ModelMergeTool() {
  }

  private void showTextMerge(DiffRequest request) {
    DiffTool ideaDiffTool = DiffManager.getInstance().getIdeaDiffTool();
    if (ideaDiffTool.canShow(request)) {
      ideaDiffTool.show(request);
    }
  }

  public void show(final DiffRequest request) {
    ModelMergeRequest mrequest = (ModelMergeRequest) request;
    try {
      DiffContent[] contents = mrequest.getContents();
      final SModel baseModel = ModelDiffTool.readModel(contents[ModelMergeRequestConstants.ORIGINAL], mrequest.getFile().getPath());
      final SModel mineModel = ModelDiffTool.readModel(contents[ModelMergeRequestConstants.CURRENT], mrequest.getFile().getPath());
      final SModel newModel = ModelDiffTool.readModel(contents[ModelMergeRequestConstants.LAST_REVISION], mrequest.getFile().getPath());

      if (isNewMergeEnabled()) {
        final MergeModelsDialog dialog = new MergeModelsDialog(baseModel, mineModel, newModel, mrequest);
        SwingUtilities.invokeLater(new Runnable() {
          public void run() {
            dialog.toFront();
          }
        });
        dialog.showDialog();
        if (dialog.getResultModel() != null) {
          byte[] bytes = ModelUtils.modelToBytes(dialog.getResultModel());
          mrequest.resolved(bytes);
        }
      } else {
        SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(baseModel.getSModelReference());
        if (modelDescriptor == null) {
          modelDescriptor = SModelRepository.getInstance().getModelDescriptor(mineModel.getSModelFqName());
        }
        String errorMsg = null;
        if (modelDescriptor == null) {
          errorMsg = "Model " + mineModel.getLongName() + " is not in model repository.";
        } else if (modelDescriptor.getModule() == null) {
          errorMsg = "Model " + mineModel.getLongName() + " is not owned by any module.";
        }
        if (errorMsg != null) {
          int result = Messages.showYesNoDialog(request.getProject(), errorMsg + " If you want to merge it using MPS merger," + " you need to cancel it now and invoke merge tool from project where this model" + "is owned by any visible module. Also, you can use text merge.\n" + "Do you want to use text merge tool?", "Can't Merge Model", Messages.getErrorIcon());
          if (result == 0) {
            showTextMerge(request);
          }
          return;
        }
        assert modelDescriptor != null;
        IOperationContext context = new ModuleContext(modelDescriptor.getModule(), request.getProject());
        final OldMergeModelsDialog dialog = new OldMergeModelsDialog(context, baseModel, mineModel, newModel);

        SwingUtilities.invokeLater(new Runnable() {
          public void run() {
            dialog.toFront();
          }
        });
        dialog.showDialog();
        if (dialog.getResultModel() != null) {
          byte[] bytes = ModelUtils.modelToBytes(dialog.getResultModel());
          mrequest.resolved(bytes);
        }
      }
    } catch (ModelDiffTool.ReadException e) {
      LOG.warning("Can't read models. Using text based diff...", e);
      showTextMerge(request);
    } catch (IOException e) {
      LOG.error(e);
    }
  }

  public boolean canShow(DiffRequest request) {
    return request instanceof ModelMergeRequest;
  }

  public static boolean isNewMergeEnabled() {
    return !("false".equals(System.getProperty("mps.newmerge")));
  }
}
