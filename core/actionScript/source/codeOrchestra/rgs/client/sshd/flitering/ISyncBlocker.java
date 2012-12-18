package codeOrchestra.rgs.client.sshd.flitering;

import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public interface ISyncBlocker {

  @NotNull
  SyncFileOperation[] getOperations();

  @NotNull
  ISyncBlockerCondition getCondition();

  public static final ISyncBlockerCondition FALSE_CONDITION = new ISyncBlockerCondition() {
    @Override
    public boolean met(String relativePath) {
      return false;
    }
  };

}
