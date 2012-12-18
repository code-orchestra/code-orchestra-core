package codeOrchestra.rgs.client.sshd.flitering.impl;

import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlocker;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlockerCondition;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class OutputSWFSyncBlocker implements ISyncBlocker {

  private static final String OUTPUT_SWF = "output_swf";

  private static final ISyncBlockerCondition CONDITION = new ISyncBlockerCondition() {
    @Override
    public boolean met(String relativePath) {
      return relativePath.contains(OUTPUT_SWF);
    }
  };

  @NotNull
  @Override
  public SyncFileOperation[] getOperations() {
    return new SyncFileOperation[] { SyncFileOperation.MODIFY, SyncFileOperation.UPLOAD, SyncFileOperation.DELETE };
  }

  @Override
  public ISyncBlockerCondition getCondition() {
    return CONDITION;
  }

}
