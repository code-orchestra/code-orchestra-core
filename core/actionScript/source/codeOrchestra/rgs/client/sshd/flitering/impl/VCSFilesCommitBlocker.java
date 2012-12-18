package codeOrchestra.rgs.client.sshd.flitering.impl;

import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlocker;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlockerCondition;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class VCSFilesCommitBlocker implements ISyncBlocker {

  private static final ISyncBlockerCondition CONDITION = new ISyncBlockerCondition() {
    @Override
    public boolean met(String relativePath) {
      return relativePath.contains(".svn") || relativePath.contains(".git") || relativePath.contains("dir_conflicts.prej");
    }
  };

  @NotNull
  @Override
  public ISyncBlockerCondition getCondition() {
    return CONDITION;
  }

  @NotNull
  @Override
  public SyncFileOperation[] getOperations() {
    return new SyncFileOperation[] { SyncFileOperation.MODIFY, SyncFileOperation.UPLOAD };
  }

}
