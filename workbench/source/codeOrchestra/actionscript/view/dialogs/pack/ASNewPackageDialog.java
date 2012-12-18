package codeOrchestra.actionscript.view.dialogs.pack;

import codeOrchestra.actionScript.Keywords;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.view.utils.Languages;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.view.utils.ModelUtils;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.*;

import javax.swing.*;
import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.HeadlessException;
import java.util.EnumSet;

/**
 * @author Alexander Eliseyev
 */
public class ASNewPackageDialog extends BaseDialog {

  private Solution solution;
  private JPanel myContentPane = new JPanel(new BorderLayout());
  private JTextField myModelName = new JTextField();
  private SModelDescriptor myResult;
  private String namespace;
  private IOperationContext operationContext;

  public ASNewPackageDialog(Solution solution, String namespace, IOperationContext context) throws HeadlessException {
    super(context.getMainFrame(), "New Package");
    this.solution = solution;
    this.namespace = namespace;
    this.operationContext = context;

    assert this.solution.getSModelRoots().size() > 0 : "Can't create a model in a solution with no module roots";

    initContentPane();
  }

  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(100, 100, 400, 160);
  }

  public SModelDescriptor getResult() {
    return myResult;
  }

  private void initContentPane() {
    JPanel mainPanel = new JPanel(new GridLayout(0, 1));
    mainPanel.add(new JLabel("Package name:"));
    mainPanel.add(myModelName);

    myContentPane.add(mainPanel, BorderLayout.NORTH);
    myContentPane.add(new JPanel(), BorderLayout.CENTER);
  }

  @BaseDialog.Button(position = 0, name = "OK", mnemonic = 'O', defaultButton = true)
  public void buttonOk() {
    myResult = ModelAccess.instance().runWriteActionInCommand(new Computable<SModelDescriptor>() {
      public SModelDescriptor compute() {
        String packageName = myModelName.getText();

        /*
        if (packageName.length() == 0) {
          setErrorText("Empty package name isn't allowed");
          return null;
        }
        */

        if (Keywords.isKeyword(packageName)) {
          setErrorText("'" + packageName + "' is a reserved keyword");
          return null;
        }

        if (packageName.length() != 0 && namespace != null && !namespace.isEmpty()) {
          packageName = namespace + "." + packageName;
        }

        // Check if the module already owns a model with such a name
        for (SModelDescriptor ownModelDescriptor : solution.getOwnModelDescriptors()) {
          if (ownModelDescriptor.getLongName().equals(packageName)) {
            setErrorText("Package with a name " + packageName + " already belongs to the module");
            return null;
          }
        }

        // Add/attach a model to the solution
        SModelFqName modelUID = new SModelFqName(packageName, "");
        SModelDescriptor modelDescriptor = solution.createModel(modelUID, solution.getSModelRoots().get(0));

        final SModel sModel = modelDescriptor.getSModel();

        // Add used languages
        sModel.addLanguage(Languages.getReference(Languages.ACTION_SCRIPT_INTERNAL));
        sModel.addLanguage(Languages.getReference(Languages.ACTION_SCRIPT_LOGGING));
        sModel.addLanguage(Languages.getReference(Languages.ACTION_SCRIPT_ASSETS));
        sModel.addEngagedOnGenerationLanguage(Languages.getReference(Languages.ACTION_SCRIPT_LOGGING));

        // RE-2727 - Add AS2JS generator dependency if the owner solution has HTML5 output type
        SolutionDescriptor moduleDescriptor = solution.getModuleDescriptor();
        if (moduleDescriptor != null) {
          OutputType outputType = moduleDescriptor.getCompilerSettings().getOutputType();
          if (EnumSet.of(OutputType.HTML5_APPLICATION, OutputType.HTML5_LIBRARY).contains(outputType)) {
            ModelUtils.toggleAS2JSDependency(sModel, true);
          }
        }

        // Add default imports
        ModelUtils.addDefaultModelImports(sModel, operationContext.getProject());

        return modelDescriptor;
      }
    });

    if (myResult == null) {
      return;
    }

    dispose();
  }

  @BaseDialog.Button(position = 1, name = "Cancel", mnemonic = 'C')
  public void buttonCancel() {
    dispose();
  }

  protected JComponent getMainComponent() {
    return myContentPane;
  }

}
