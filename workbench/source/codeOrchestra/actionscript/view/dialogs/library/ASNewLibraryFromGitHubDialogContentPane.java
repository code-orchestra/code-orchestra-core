package codeOrchestra.actionscript.view.dialogs.library;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Progressive;
import codeOrchestra.actionscript.stubs.SWCStubsRegistry;
import codeOrchestra.actionscript.view.dialogs.library.util.GitHelper;
import codeOrchestra.actionscript.view.dialogs.library.util.GitHubUtil;
import codeOrchestra.actionscript.view.utils.Languages;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.utils.StubSolutionUtils;
import jetbrains.mps.ide.common.PathField;
import jetbrains.mps.ide.ui.filechoosers.treefilechooser.TreeFileChooser;
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

import javax.swing.*;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ASNewLibraryFromGitHubDialogContentPane extends JPanel {

  private static Logger LOG = Logger.getLogger(ASNewLibraryFromGitHubDialogContentPane.class);
  private final String gitPath;

  public ASNewLibraryFromGitHubDialogContentPane myThis;
  private JLabel myComponent0;

  private JTextField myModuleNameField;
  private JTextField myGitHubUrl;
  private Boolean errorWithGit;


  private JTextField myAuthor;
  private JTextField myRepoName;
  private ButtonGroup radioButtons;
  private JRadioButton byUrl;
  private JRadioButton byAuthor;
  private Boolean cloneByUrl;


  private String gitHubUrl;


  private String gitTimeUpdate;
  private PathField myPathToClone;
  private String mySourcesPath;
  private boolean myCompileInMPS = true;
  private MPSProject myProject;
  private Solution myResult;
  protected ASNewLibraryFromGitHubDialog myDialog;

  public List<AutoBinding> myBindings = ListSequence.fromList(new ArrayList<AutoBinding>());

  private Events myEvents = new Events(null) {
    {
    }

    public void initialize() {
    }
  };
  private static final String PLAYERGLOBAL_SWC = "playerglobal_swc";

  public ASNewLibraryFromGitHubDialogContentPane() {
    this.myThis = this;
    gitPath = GitHelper.getGitPath();
    radioButtons = new ButtonGroup();
    cloneByUrl = true;
    ASNewLibraryFromGitHubDialogContentPane component = this;
    component.setLayout(new GridLayout(13, 1));
    component.add(this.createComponent0());
    component.add(this.createComponent1());
    component.add(this.createComponent2());
    component.add(this.createComponent3());
    component.add(this.createComponent13());
    component.add(this.createComponent14());
    component.add(this.createComponent5());
    component.add(this.createComponent6());
    this.myEvents.initialize();

  }

  public Boolean getErrorWithGit() {
    return this.errorWithGit;
  }

  private void setErrorWithGit(Boolean value) {
    this.errorWithGit = value;
  }

  public Events getEvents() {
    return this.myEvents;
  }


  public void removeNotify() {
    this.unbind();
    super.removeNotify();
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


  private JRadioButton createComponent2() {
    byUrl = new JRadioButton("Download By URL");
    byUrl.addActionListener(new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent e) {
        setTypeOfClone();
      }
    });
    byUrl.setSelected(true);
    radioButtons.add(byUrl);

    return byUrl;
  }


  private JRadioButton createComponent3() {
    byAuthor = new JRadioButton("Download by Author and Repository Name");
    byAuthor.addActionListener(new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent e) {
        setTypeOfClone();
      }
    });

    radioButtons.add(byAuthor);

    return byAuthor;

  }

  private void setTypeOfClone() {
    if (byUrl.isSelected()) {
      if (!this.cloneByUrl) {
        this.cloneByUrl = true;
        this.remove(9);
        this.remove(8);
        this.remove(7);
        this.remove(6);

      }
      if (this.getComponentCount() == 6) {
        this.add(this.createComponent5());
        this.add(this.createComponent6());
        this.revalidate();
        this.repaint();
      }
    } else if (byAuthor.isSelected()) {
      if (this.cloneByUrl) {
        this.remove(7);
        this.remove(6);
        this.cloneByUrl = false;
      }
      if (this.getComponentCount() == 6) {
        this.add(this.createComponent7());
        this.add(this.createComponent8());
        this.add(this.createComponent9());
        this.add(this.createComponent10());
        this.revalidate();
        this.repaint();
      }
    }

  }

  private JLabel createComponent5() {
    JLabel component = new JLabel();
    this.myComponent0 = component;
    component.setText("Library GitHub Url:");
    return component;
  }

  private JTextField createComponent6() {
    JTextField component = new JTextField();
    this.myGitHubUrl = component;
    return component;
  }

  private JLabel createComponent7() {
    JLabel component = new JLabel();
    this.myComponent0 = component;
    component.setText("Author:");
    return component;
  }

  private JTextField createComponent8() {
    JTextField component = new JTextField();
    this.myAuthor = component;
    return component;
  }

  private JLabel createComponent9() {
    JLabel component = new JLabel();
    this.myComponent0 = component;
    component.setText("Repository Name:");
    return component;
  }

  private JTextField createComponent10() {
    JTextField component = new JTextField();
    this.myRepoName = component;
    return component;
  }

  private JLabel createComponent13() {
    JLabel component = new JLabel();
    this.myComponent0 = component;
    component.setText("Clone Repository To:");
    return component;
  }

  private PathField createComponent14() {
    PathField component = new PathField();
    this.myPathToClone = component;
    return component;
  }

  public String getGitHubUrl() {
    return this.gitHubUrl;
  }


  public void setGitHubUrl(String gitHubUrl) {
    this.gitHubUrl = gitHubUrl;
  }

  public String getGitTimeUpdate() {
    return gitTimeUpdate;
  }

  public void setGitTimeUpdate(String gitTimeUpdate) {
    this.gitTimeUpdate = gitTimeUpdate;
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

  public ASNewLibraryFromGitHubDialog getDialog() {
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

  public void setDialog(ASNewLibraryFromGitHubDialog newValue) {
    ASNewLibraryFromGitHubDialog oldValue = this.myDialog;
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

  /*package*/ void onOk() throws IOException, InterruptedException {
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

    cloneRepository();

    if (myThis.getSourcesPath().length() == 0) {
      onCancel();
    }

    File sourcesDir = new File(myThis.getSourcesPath());

    if (!(sourcesDir.exists())) {
      myThis.getDialog().setErrorText("Specified sources dir doesn't exist");
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

  /*package*/ void cloneRepository() throws InterruptedException, IOException, ArrayIndexOutOfBoundsException {
    myThis.setErrorWithGit(false);

    ProgressManager.getInstance().runProcessWithProgressSynchronously(new Runnable() {
      public void run() {

        ProgressIndicator indicator = ProgressManager.getInstance().getProgressIndicator();
        indicator.setIndeterminate(true);
        try {
          if (myThis.cloneByUrl) {
            GitHubUtil.gitClone(myThis.myGitHubUrl.getText(), myThis.myPathToClone.getPath(), gitPath);
          } else {
            GitHubUtil.gitClone(myThis.myAuthor.getText(), myThis.myRepoName.getText(), myThis.myPathToClone.getPath(), gitPath);
          }
        } catch (IOException e) {
          myThis.getDialog().setErrorText("Can't find repository");
          myThis.setErrorWithGit(true);
        } catch (ArrayIndexOutOfBoundsException e) {
          myThis.getDialog().setErrorText("URL is not correct");
          myThis.setErrorWithGit(true);
        } catch (InterruptedException e) {
          myThis.getDialog().setErrorText("Error with GIT configuration");
          myThis.setErrorWithGit(true);
        }
      }


    }, "Clone", false, myThis.getProject().getProject());

    if (!myThis.getErrorWithGit()) {
      myThis.setGitHubUrl(myThis.myGitHubUrl.getText());
      myThis.setGitTimeUpdate(GitHubUtil.getLastUpdateTime(myThis.gitHubUrl));
      TreeFileChooser chooser = new TreeFileChooser();
      chooser.setMode(TreeFileChooser.MODE_DIRECTORIES);
      chooser.setInitialFile(FileSystem.getInstance().getFileByPath(""));
      chooser.setTitle("Select root sources path ");
      IFile result = chooser.showDialog();
      if (result != null) {
        myThis.setSourcesPath(result.getPath());
      }
      if (result == null) {
        myThis.setSourcesPath("");
      }

    }
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

    // Add GitHub depence
    solutionDescriptor.setGitHubUrl(myThis.getGitHubUrl());
    solutionDescriptor.setLocalUrl(myThis.myPathToClone.getPath());
    solutionDescriptor.setGitTimeUpdate(myThis.getGitTimeUpdate());

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
