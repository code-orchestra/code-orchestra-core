package codeOrchestra.actionscript.wizards.newproject.fromexternal.idea;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.wizards.newproject.NewProjectPathHelper;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalModule;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalPanel;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalType;
import codeOrchestra.actionscript.wizards.newproject.util.ASNewModuleUtil;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.smodel.LanguageID;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.UndoHelper;
import jetbrains.mps.util.misc.hash.HashSet;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * @author Anton.I.Neverov
 */
public class ASIdeaType extends ASExternalType {

  public ASIdeaType() {
    settings = new ASIdeaSettings();
  }

  @Override
  public ASExternalPanel getConfigPanel() {
    if (configPanel == null) {
      configPanel = new ASIdeaConfigPanel((ASIdeaSettings) settings);
    }
    return configPanel;
  }

  @Override
  public ASExternalPanel getAdditionalPanel() {
    if (additionalPanel == null) {
      additionalPanel = new ASIdeaAdditionalPanel((ASIdeaSettings) settings);
    }
    return additionalPanel;
  }

  @Override
  public String getName() {
    return "IntelliJ IDEA";
  }

  @Override
  public boolean isEnabled() {
    return true;
  }

  @Override
  public boolean usesAdditionalStep() {
    return false;
  }

}
