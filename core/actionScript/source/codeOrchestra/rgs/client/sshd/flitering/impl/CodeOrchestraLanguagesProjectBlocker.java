package codeOrchestra.rgs.client.sshd.flitering.impl;

import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlocker;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlockerCondition;
import codeOrchestra.utils.ProjectHolder;
import org.jetbrains.annotations.NotNull;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class CodeOrchestraLanguagesProjectBlocker implements ISyncBlocker {

  private static final String CodeOrchestra_ACTION_SCRIPT_PROJECT_NAME = "ActionScript";

  private static final ISyncBlockerCondition CONDITION = new ISyncBlockerCondition() {
    @Override
    public boolean met(String relativePath) {
      return
          relativePath.startsWith("modules" + File.separator + "jangaroo-browser") ||
          relativePath.startsWith("modules" + File.separator + "jangaroo-runtime") ||
          relativePath.startsWith("modules" + File.separator + "casalib") ||
          relativePath.startsWith("modules" + File.separator + "jooflash") ||
          relativePath.startsWith("modules" + File.separator + "conveyor") ||
          relativePath.startsWith("modules" + File.separator + "spark_swc") ||
          relativePath.startsWith("modules" + File.separator + "Operators") ||
          relativePath.startsWith("modules" + File.separator + "testCollections") ||
          relativePath.startsWith("modules" + File.separator + "testMxmlCompilation") ||
          relativePath.startsWith("as_samples") ||
          relativePath.startsWith("languages") ||
          relativePath.startsWith("artifacts") ||
          relativePath.startsWith("lib") ||
          relativePath.startsWith("mps") ||
          relativePath.startsWith("solutions") ||
          relativePath.startsWith("ActionScript-compile.xml") ||
          relativePath.startsWith("ActionScript-languages.xml") ||
          relativePath.startsWith("ActionScript.properties") ||
          relativePath.startsWith("build.xml");
    }
  };

  @NotNull
  @Override
  public SyncFileOperation[] getOperations() {
    return new SyncFileOperation[] { SyncFileOperation.MODIFY, SyncFileOperation.UPLOAD, SyncFileOperation.DELETE };
  }

  @NotNull
  @Override
  public ISyncBlockerCondition getCondition() {
    if (ProjectHolder.getProject().getName().equals(CodeOrchestra_ACTION_SCRIPT_PROJECT_NAME)) {
      return CONDITION;
    }
    return ISyncBlocker.FALSE_CONDITION;
  }
}
