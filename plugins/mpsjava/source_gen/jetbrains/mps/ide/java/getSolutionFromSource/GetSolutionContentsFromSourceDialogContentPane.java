package jetbrains.mps.ide.java.getSolutionFromSource;

/*Generated by MPS */

import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.JTextField;
import jetbrains.mps.ide.common.PathField;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import java.util.List;
import org.jdesktop.beansbinding.AutoBinding;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.uiLanguage.runtime.events.Events;
import java.awt.GridLayout;
import org.jdesktop.beansbinding.Property;
import org.jdesktop.beansbinding.BeanProperty;
import org.jdesktop.beansbinding.Bindings;
import java.io.File;
import jetbrains.mps.ide.java.parser.JavaCompiler;
import jetbrains.mps.project.ModuleContext;

public class GetSolutionContentsFromSourceDialogContentPane extends JPanel {
  public GetSolutionContentsFromSourceDialogContentPane myThis;
  private JLabel myComponent_b0;
  private JTextField myName_c0;
  private JLabel myComponent_d0;
  private PathField mySourcePath_e0;
  private String mySolutionName;
  private String mySourcePath;
  private MPSProject myProject;
  private Solution mySolution;
  private GetSolutionContentsFromSourceDialog myDialog;
  public List<AutoBinding> myBindings = ListSequence.fromList(new ArrayList<AutoBinding>());
  private Events myEvents = new Events(null) {
    {
    }

    public void initialize() {
    }
  };

  public GetSolutionContentsFromSourceDialogContentPane() {
    this.myThis = this;
    GetSolutionContentsFromSourceDialogContentPane component = this;
    component.setLayout(new GridLayout(4, 1));
    component.add(this.createComponent_b0());
    component.add(this.createComponent_c0());
    component.add(this.createComponent_d0());
    component.add(this.createComponent_e0());
    this.myEvents.initialize();
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
      Property sourceProperty = BeanProperty.create("solutionName");
      Object targetObject = this.myName_c0;
      Property targetProperty = BeanProperty.create("text");
      AutoBinding binding = Bindings.createAutoBinding(AutoBinding.UpdateStrategy.READ_WRITE, sourceObject, sourceProperty, targetObject, targetProperty);
      binding.bind();
      ListSequence.fromList(this.myBindings).addElement(binding);
    }
    {
      Object sourceObject = myThis;
      Property sourceProperty = BeanProperty.create("sourcePath");
      Object targetObject = this.mySourcePath_e0;
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

  private JLabel createComponent_b0() {
    JLabel component = new JLabel();
    this.myComponent_b0 = component;
    component.setText("Name:");
    return component;
  }

  private JTextField createComponent_c0() {
    JTextField component = new JTextField();
    this.myName_c0 = component;
    return component;
  }

  private JLabel createComponent_d0() {
    JLabel component = new JLabel();
    this.myComponent_d0 = component;
    component.setText("Source Path:");
    return component;
  }

  private PathField createComponent_e0() {
    PathField component = new PathField();
    this.mySourcePath_e0 = component;
    return component;
  }

  public String getSolutionName() {
    return this.mySolutionName;
  }

  public String getSourcePath() {
    return this.mySourcePath;
  }

  public MPSProject getProject() {
    return this.myProject;
  }

  public Solution getSolution() {
    return this.mySolution;
  }

  public GetSolutionContentsFromSourceDialog getDialog() {
    return this.myDialog;
  }

  public void setSolutionName(String newValue) {
    String oldValue = this.mySolutionName;
    this.mySolutionName = newValue;
    this.firePropertyChange("solutionName", oldValue, newValue);
  }

  public void setSourcePath(String newValue) {
    String oldValue = this.mySourcePath;
    this.mySourcePath = newValue;
    this.firePropertyChange("sourcePath", oldValue, newValue);
  }

  public void setProject(MPSProject newValue) {
    MPSProject oldValue = this.myProject;
    this.myProject = newValue;
    this.firePropertyChange("project", oldValue, newValue);
  }

  public void setSolution(Solution newValue) {
    Solution oldValue = this.mySolution;
    this.mySolution = newValue;
    this.firePropertyChange("solution", oldValue, newValue);
  }

  public void setDialog(GetSolutionContentsFromSourceDialog newValue) {
    GetSolutionContentsFromSourceDialog oldValue = this.myDialog;
    this.myDialog = newValue;
    this.firePropertyChange("dialog", oldValue, newValue);
  }

  /*package*/ void onCancel() {
    myThis.getDialog().dispose();
  }

  /*package*/ void onOk() {
    File chosenFile = new File(myThis.getSourcePath());
    JavaCompiler javaCompiler = new JavaCompiler(new ModuleContext(myThis.getSolution(), myThis.getProject()), myThis.getSolution(), chosenFile, true);
    javaCompiler.compile();
  }
}
