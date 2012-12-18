package codeOrchestra.rgs.client.sshd.flitering.impl;

import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlocker;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlockerCondition;
import codeOrchestra.utils.ProjectHolder;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class IWSSSyncBlocker implements ISyncBlocker {

  public static final ISyncBlockerCondition CONDITION = new ISyncBlockerCondition() {
    @Override
    public boolean met(String relativePath) {
      return relativePath.startsWith(ProjectHolder.getProject().getName()+ ".iws");
    }
  };

  @NotNull
  @Override
  public SyncFileOperation[] getOperations() {
    return new SyncFileOperation[] { SyncFileOperation.DELETE, SyncFileOperation.MODIFY, SyncFileOperation.UPLOAD };
  }

  @NotNull
  @Override
  public ISyncBlockerCondition getCondition() {
    return CONDITION;
  }
}
