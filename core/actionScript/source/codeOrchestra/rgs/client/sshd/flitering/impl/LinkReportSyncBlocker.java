package codeOrchestra.rgs.client.sshd.flitering.impl;

import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlocker;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlockerCondition;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class LinkReportSyncBlocker implements ISyncBlocker {

  public static final ISyncBlockerCondition CONDITION = new ISyncBlockerCondition() {
    @Override
    public boolean met(String relativePath) {
      return relativePath.endsWith("link-report.xml");
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
