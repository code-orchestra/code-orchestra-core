package codeOrchestra.actionscript.wizards.newproject;

import com.intellij.openapi.project.Project;
import jetbrains.mps.workbench.dialogs.project.newproject.ProjectFactory.ProjectNotCreatedException;

import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public interface ASProjectSource {

  String getID();

  String getName();

  String getDescription();

  boolean isEnabled();

  List<ASNewProjectStep> getSteps();

  Project createProject(Project currentProject) throws ProjectNotCreatedException;

  /**
   * @return error message if any, <code>null</code> otherwise
   */
  String createDirs();

  ASNewProjectSettings getSettings();

}
