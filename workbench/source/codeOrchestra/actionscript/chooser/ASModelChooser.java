package codeOrchestra.actionscript.chooser;

import codeOrchestra.actionscript.view.utils.ViewUtils;
import com.intellij.navigation.NavigationItem;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelStereotype;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.ConditionalIterable;
import jetbrains.mps.workbench.choose.models.BaseModelItem;
import jetbrains.mps.workbench.choose.models.BaseModelModel;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASModelChooser extends BaseModelModel {

  private ASModelChooseCallback modelChooseCallback;

  public ASModelChooser(Project project, ASModelChooseCallback modelChooseCallback) {
    super(project);
    this.modelChooseCallback = modelChooseCallback;
  }

  public SModelReference[] find(IScope scope) {
    IProjectPane projectPane = ViewUtils.getCurrentPane(getProject().getComponent(Project.class));
    if (projectPane != null && projectPane.goToOperationsEnabled()) {
      return projectPane.getModelReferences();
    }

    Condition<SModelDescriptor> condition = new Condition<SModelDescriptor>() {
      public boolean met(SModelDescriptor modelDescriptor) {
        boolean rightStereotype = SModelStereotype.isUserModel(modelDescriptor)
          || SModelStereotype.JAVA_STUB.equals(modelDescriptor.getStereotype())
          || SModelStereotype.SWC_STUB.equals(modelDescriptor.getStereotype());
        boolean hasModule = modelDescriptor.getModule() != null;
        return rightStereotype && hasModule;
      }
    };

    ConditionalIterable<SModelDescriptor> conditionalIterable = new ConditionalIterable<SModelDescriptor>(scope.getModelDescriptors(), condition);

    List<SModelReference> result = new ArrayList<SModelReference>();
    for (SModelDescriptor md : conditionalIterable) {
      result.add(md.getSModelReference());
    }
    return result.toArray(new SModelReference[result.size()]);
  }

  public NavigationItem doGetNavigationItem(SModelReference object) {
    return new BaseModelItem(object) {
      public void navigate(boolean b) {
        modelChooseCallback.onModelChosen(getModelReference());
      }
    };
  }

}
