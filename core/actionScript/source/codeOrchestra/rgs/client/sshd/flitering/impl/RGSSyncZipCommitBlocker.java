package codeOrchestra.rgs.client.sshd.flitering.impl;

import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlocker;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlockerCondition;
import codeOrchestra.rgs.server.artifact.AbstractArtifactPreparer;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class RGSSyncZipCommitBlocker implements ISyncBlocker {

  private static final ISyncBlockerCondition CONDITION = new ISyncBlockerCondition() {
    @Override
    public boolean met(String relativePath) {
      return relativePath.endsWith(AbstractArtifactPreparer.RGSOUTPUT_ZIP);
    }
  };

  @NotNull
  @Override
  public SyncFileOperation[] getOperations() {
    return new SyncFileOperation[] { SyncFileOperation.MODIFY, SyncFileOperation.UPLOAD };
  }

  @NotNull
  @Override
  public ISyncBlockerCondition getCondition() {
    return CONDITION;
  }
}
