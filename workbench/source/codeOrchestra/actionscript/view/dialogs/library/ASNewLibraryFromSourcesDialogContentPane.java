package codeOrchestra.actionscript.view.dialogs.library;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.Progressive;
import com.intellij.util.indexing.FileBasedIndex;
import codeOrchestra.actionscript.stubs.SWCStubsRegistry;
import codeOrchestra.actionscript.view.utils.Languages;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.utils.StubSolutionUtils;
import jetbrains.mps.ide.common.PathField;
import jetbrains.mps.ide.ui.filechoosers.treefilechooser.TreeFileChooser;
import jetbrains.mps.ide.vfs.VirtualFileUtils;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.SModelRoot.ManagerNotFoundException;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.model.ModelRootManager;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.persistence.IModelRootManager;
import jetbrains.mps.stubs.BaseStubModelDescriptor;
import jetbrains.mps.stubs.BaseStubModelRootManager;
import jetbrains.mps.uiLanguage.runtime.events.Events;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jdesktop.beansbinding.AutoBinding;
import org.jdesktop.beansbinding.BeanProperty;
import org.jdesktop.beansbinding.Bindings;
import org.jdesktop.beansbinding.Property;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import java.awt.GridLayout;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ASNewLibraryFromSourcesDialogContentPane extends JPanel {

  private static Logger LOG = Logger.getLogger(ASNewLibraryFromSourcesDialogContentPane.class);

  public ASNewLibraryFromSourcesDialogContentPane myThis;
  private JLabel myComponent0;
  private JTextField myModuleNameField;
  private PathField myPath0;
  private String mySourcesPath;
  private boolean myCompileInMPS = true;
  private MPSProject myProject;
  private Solution myResult;
  protected ASNewLibraryFromSourcesDialog myDialog;

  public List<AutoBinding> myBindings = ListSequence.fromList(new ArrayList<AutoBinding>());

  private Events myEvents = new Events(null) {
    {
    }

    public void initialize() {
    }
  };
  private static final String PLAYERGLOBAL_SWC = "playerglobal_swc";

  public ASNewLibraryFromSourcesDialogContentPane() {
    this.myThis = this;
    ASNewLibraryFromSourcesDialogContentPane component = this;
    component.setLayout(new GridLayout(4, 1));
    component.add(this.createComponent0());
    component.add(this.createComponent1());
    component.add(this.createComponent2());
    component.add(this.createComponent3());
    this.myEvents.initialize();
    myThis.setSourcesPath("");
    myThis.myPath0.setName("Path");
    myThis.myPath0.setMode(TreeFileChooser.MODE_DIRECTORIES);
  }

  public Events getEvents() {
    return this.myEvents;
  }

  public void addNotify() {
    super.addNotify();
    this.bind();
  }

  public void removeNotify() {
    this.unbind();
    super.removeNotify();
  }

  private void bind() {
    {
      Object sourceObject = myThis;
      Property sourceProperty = BeanProperty.create("sourcesPath");
      Object targetObject = this.myPath0;
      Property targetProperty = BeanProperty.create("path");
      AutoBinding binding = Bindings.createAutoBinding(AutoBinding.UpdateStrategy.READ_WRITE, sourceObject, sourceProperty, targetObject, targetProperty);
      binding.bind();
      ListSequence.fromList(this.myBindings).addElement(binding);
    }
  }

  private void unbind() {
    for (AutoBinding binding : this.myBindings) {
      if (binding.isBound()) {
        binding.unbind();
      }
    }
  }

  private JLabel createComponent0() {
    JLabel component = new JLabel();
    this.myComponent0 = component;
    component.setText("Library Name:");
    return component;
  }

  private JTextField createComponent1() {
    JTextField component = new JTextField();
    this.myModuleNameField = component;
    return component;
  }

  private JLabel createComponent2() {
    JLabel component = new JLabel();
    this.myComponent0 = component;
    component.setText("Sources Path:");
    return component;
  }

  private PathField createComponent3() {
    PathField component = new PathField();
    this.myPath0 = component;
    return component;
  }




  public String getSourcesPath() {
    return this.mySourcesPath;
  }

  public boolean getCompileInMPS() {
    return this.myCompileInMPS;
  }

  public MPSProject getProject() {
    return this.myProject;
  }

  public Solution getResult() {
    return this.myResult;
  }

  public ASNewLibraryFromSourcesDialog getDialog() {
    return this.myDialog;
  }

  protected void setModuleName(String newValue) {
    myThis.myModuleNameField.setText(newValue);
  }

  public void setSourcesPath(String newValue) {
    String oldValue = this.mySourcesPath;
    this.mySourcesPath = newValue;
    this.firePropertyChange("sourcesPath", oldValue, newValue);
  }

  public void setCompileInMPS(boolean newValue) {
    boolean oldValue = this.myCompileInMPS;
    this.myCompileInMPS = newValue;
    this.firePropertyChange("compileInMPS", oldValue, newValue);
  }

  public void setProject(MPSProject newValue) {
    MPSProject oldValue = this.myProject;
    this.myProject = newValue;
    this.firePropertyChange("project", oldValue, newValue);
  }

  public void setResult(Solution newValue) {
    Solution oldValue = this.myResult;
    this.myResult = newValue;
    this.firePropertyChange("result", oldValue, newValue);
  }

  public void setDialog(ASNewLibraryFromSourcesDialog newValue) {
    ASNewLibraryFromSourcesDialog oldValue = this.myDialog;
    this.myDialog = newValue;
    this.firePropertyChange("dialog", oldValue, newValue);
  }

  protected boolean checkLibraryName(String libraryName) {
    if (MPSModuleRepository.getInstance().getModuleByUID(libraryName) != null) {
      myThis.getDialog().setErrorText("Duplicate library name: " + libraryName);
      return false;
    }
    return true;
  }

  /*package*/ void onOk() {
    if (myThis.getSourcesPath().length() == 0) {
      myThis.getDialog().setErrorText("Enter the sources path");
      return;
    }

    File sourcesDir = new File(myThis.getSourcesPath());

    if (!(sourcesDir.exists())) {
      myThis.getDialog().setErrorText("Specified sources dir doesn't exist");
      return;
    }

    String moduleName = myThis.myModuleNameField.getText();
    // RE-3532
    if (!SolutionUtils.isValidModuleName(moduleName)) {
      myThis.getDialog().setErrorText("Invalid module name");
      return;
    }

    if (moduleName.isEmpty()) {
      myThis.getDialog().setErrorText("Enter the module name");
      return;
    }

    final String libraryName = moduleName;

    if (!checkLibraryName(libraryName)) {
      return;
    }

    String projectPath = FileUtil.getCanonicalPath(myThis.getProject().getProjectFile().getParentFile());
    String solutionDirPath = projectPath + File.separator + "modules" + File.separator + libraryName;

    final String descriptorPath = solutionDirPath + File.separator + libraryName + MPSExtentions.DOT_SOLUTION;

    myThis.getDialog().dispose();

    final List<SModelDescriptor> modelDescriptors = new ArrayList<SModelDescriptor>();

    execute(descriptorPath, modelDescriptors);

    // RE-3181
    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      @Override
      public void run() {
        try {
          SWCStubsRegistry.setAvoidIndexing(true);
          SModelOperations.validateLanguagesAndImportsNew(modelDescriptors, myResult);
        } finally {
          SWCStubsRegistry.setAvoidIndexing(false);
          StubSolutionUtils.invalidateStubSolutionCaches(myResult);
        }
      }
    }, getProject().getProject());
  }


  /*package*/ void execute(String descriptorPath, List<SModelDescriptor> modelDescriptors) {
    createNewLib(descriptorPath, modelDescriptors);
  }

  /*package*/ void createNewLib(final String descriptorPath, final List<SModelDescriptor> modelDescriptors) {

    ModelAccess.instance().runWriteActionWithProgressSynchronously(new Progressive() {
      public void run(ProgressIndicator indicator) {

        indicator.setIndeterminate(true);
        myThis.setResult(myThis.createNewSolution(FileSystem.getInstance().getFileByPath(descriptorPath)));

        // RE-912
        for (final SModelDescriptor sModelDescriptor : myResult.getOwnModelDescriptors()) {
          if (sModelDescriptor instanceof BaseStubModelDescriptor) {
            BaseStubModelDescriptor stubModelDescriptor = (BaseStubModelDescriptor) sModelDescriptor;

            // RF-616
            if (stubModelDescriptor.getLoadingState() == ModelLoadingState.NOT_LOADED) {
              ModelRootManager asStubManager = LanguageID.AS_MANAGER;
              IModelRootManager modelRootManager = null;
              try {
                modelRootManager = BaseStubModelRootManager.create(asStubManager.getModuleId(), asStubManager.getClassName());
              } catch (ManagerNotFoundException e) {
                throw new RuntimeException("Can't locate the AS sources stub model root manager " + asStubManager);
              }
              stubModelDescriptor.setModelRootManager(modelRootManager);
            }

            modelDescriptors.add(sModelDescriptor);
          }
        }

      }
    }, "Creating", false, myThis.getProject().getProject());

  }

  /*package*/ void onCancel() {
    myThis.getDialog().dispose();
  }

  /*package*/ Solution createNewSolution(final IFile solutionDescriptorFile) {
    MPSProject mpsProject = myThis.getProject();

    // Prepare files
    File dir = new File(solutionDescriptorFile.getAbsolutePath()).getParentFile();
    if (!(dir.exists())) {
      dir.mkdirs();
    }
    String solutionFileName = solutionDescriptorFile.getName();
    String solutionName = solutionFileName.substring(0, solutionFileName.length() - 4);

    // Create
    // RE-2448
    ModelRoot modelRoot = new ModelRoot();
    modelRoot.setPrefix("");
    modelRoot.setPath(solutionDescriptorFile.getParent().getAbsolutePath());
    final Solution solution = Solution.createStubSolution(solutionName, solutionDescriptorFile, mpsProject, modelRoot);

    SolutionDescriptor solutionDescriptor = solution.getModuleDescriptor();
    solutionDescriptor.setCompileInMPS(myThis.getCompileInMPS());

    // Add SWC file to the classpath
    ModelRoot stubModelEntry = new ModelRoot();
    stubModelEntry.setPath(myThis.getSourcesPath());
    stubModelEntry.setManager(LanguageID.AS_MANAGER);
    solutionDescriptor.getStubModelEntries().add(stubModelEntry);

    // Add languages refs
    solutionDescriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_INTERNAL));
    solutionDescriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_LOGGING));
    solutionDescriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_ASSETS));

    // Add playerglobal reference
    Dependency playerGlobalDependency = new Dependency();
    playerGlobalDependency.setModuleRef(ModuleReference.fromString(PLAYERGLOBAL_SWC));
    solutionDescriptor.getDependencies().add(playerGlobalDependency);

    // Save the solution descriptor
    ModelAccess.instance().writeFilesInEDT(new Runnable() {
      public void run() {
        solution.save();
      }
    });
    mpsProject.addProjectModule(solution);

    return solution;
  }
}
