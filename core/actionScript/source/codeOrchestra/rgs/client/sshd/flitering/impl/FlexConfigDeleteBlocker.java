package codeOrchestra.rgs.client.sshd.flitering.impl;

import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlocker;
import codeOrchestra.rgs.client.sshd.flitering.ISyncBlockerCondition;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class FlexConfigDeleteBlocker implements ISyncBlocker {

  private static final ISyncBlockerCondition FLEX_CONFIG_CONDITION = new ISyncBlockerCondition() {
    @Override
    public boolean met(String relativePath) {
      return relativePath.endsWith("_flex_config.xml");
    }
  };

  @NotNull
  @Override
  public SyncFileOperation[] getOperations() {
    return new SyncFileOperation[] { SyncFileOperation.DELETE };
  }

  @NotNull
  @Override
  public ISyncBlockerCondition getCondition() {
    return FLEX_CONFIG_CONDITION;
  }
}
