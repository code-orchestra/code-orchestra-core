package codeOrchestra.actionscript.view.dialogs.library;

import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.workbench.actions.module.DeleteModuleHelper;

import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class ASSwitchLibraryToSourcesDialogContentPane extends ASNewLibraryFromSourcesDialogContentPane {

  private String defaultName;

  public ASSwitchLibraryToSourcesDialogContentPane(String defaultName) {
    super();
    setModuleName(defaultName);
    this.defaultName = defaultName;
  }

  protected boolean checkLibraryName(String libraryName) {
    // It is ok to have same library name because old library will be deleted
    return defaultName.equals(libraryName) || super.checkLibraryName(libraryName);
  }

  /*package*/ void execute(String descriptorPath, List<SModelDescriptor> modelDescriptors) {

    ModelAccess.instance().runWriteAction(new Runnable() {
      @Override
      public void run() {
        DeleteModuleHelper.deleteModule(myDialog.getProject().getProject(), ((ASSwitchLibraryToSourcesDialog) myDialog).getOldModule(), false, true);
      }
    });

    super.execute(descriptorPath, modelDescriptors);
  }

}
