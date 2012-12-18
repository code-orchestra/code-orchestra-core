package codeOrchestra.rgs.client;

import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import org.jetbrains.annotations.Nullable;

/**
 * @author Alexander Eliseyev
 */
public interface ISyncCallback {

  void syncingFile(SyncFileOperation operation, String remoteFilePath, @Nullable String localFilePath);

  void done();

}
