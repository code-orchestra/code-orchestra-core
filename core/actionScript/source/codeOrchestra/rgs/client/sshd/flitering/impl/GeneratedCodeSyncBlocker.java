package codeOrchestra.rgs.client.sshd.flitering.impl;

import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlocker;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlockerCondition;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class GeneratedCodeSyncBlocker implements ISyncBlocker {

  private static final String SOURCE_GEN = "source_gen";
  private static final String CLASSES_GEN = "classes_gen";

  private static final ISyncBlockerCondition CONDITION = new ISyncBlockerCondition() {
    @Override
    public boolean met(String relativePath) {
      return relativePath.contains(SOURCE_GEN) || relativePath.contains(CLASSES_GEN);
    }
  };

  @NotNull
  @Override
  public SyncFileOperation[] getOperations() {
    return new SyncFileOperation[] { SyncFileOperation.MODIFY, SyncFileOperation.UPLOAD, SyncFileOperation.DELETE };
  }

  @Override
  @NotNull
  public ISyncBlockerCondition getCondition() {
    return CONDITION;
  }

}
