package jetbrains.mps.workbench.dialogs.project.components.parts.renderers;


import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.choose.models.SModelReferenceByModule;
import jetbrains.mps.workbench.dialogs.project.components.parts.StateUtil;

import javax.swing.JList;
import java.awt.Color;
import java.awt.Component;

@CodeOrchestraPatch
public class ModelByModuleRenderer extends ProjectLevelRenderer {
  public ModelByModuleRenderer(IScope moduleScope, IScope projectScope) {
    super(moduleScope, projectScope);
  }

  public String getItemLabel(Object value) {
    final SModelReferenceByModule modelReferenceByModule = (SModelReferenceByModule) value;
    return modelReferenceByModule.getModelReference().getSModelFqName().toString() + " (" + modelReferenceByModule.getModuleReference().getModuleFqName() + ")";
  }

  public Component getListCellRendererComponent(JList list, final Object value, int index, boolean isSelected, boolean cellHasFocus) {
    Component result = super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
    final SModelReferenceByModule modelReferenceByModule = (SModelReferenceByModule) value;
    setText(getItemLabel(value));
    if (!(isSelected)) {
      if (!(StateUtil.isAvailable(modelReferenceByModule.getModelReference()))) {
        setForeground(Color.RED);
      } else if (!(StateUtil.isInScope(getModuleScope(), modelReferenceByModule.getModelReference()))) {
        setForeground(new Color(128, 0, 128));
      }
    }
    return result;
  }
}
