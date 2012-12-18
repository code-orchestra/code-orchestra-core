package codeOrchestra.rgs.client;

import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/**
 * @author Alexander Eliseyev
 */
public class FileSyncOperationWrapper {

  private SyncFileOperation operation;
  private String remoteFilePath;

  private String localFilePath;

  public FileSyncOperationWrapper(SyncFileOperation operation, @NotNull String remoteFilePath, @Nullable String localFilePath) {
    this.operation = operation;
    this.remoteFilePath = remoteFilePath;
    this.localFilePath = localFilePath;
  }

  public SyncFileOperation getOperation() {
    return operation;
  }

  @Nullable
  public String getLocalFilePath() {
    return localFilePath;
  }

  @NotNull
  public String getRemoteFilePath() {
    return remoteFilePath;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    FileSyncOperationWrapper that = (FileSyncOperationWrapper) o;

    if (localFilePath != null ? !localFilePath.equals(that.localFilePath) : that.localFilePath != null) return false;
    if (operation != that.operation) return false;
    if (remoteFilePath != null ? !remoteFilePath.equals(that.remoteFilePath) : that.remoteFilePath != null)
      return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result = operation != null ? operation.hashCode() : 0;
    result = 31 * result + (remoteFilePath != null ? remoteFilePath.hashCode() : 0);
    result = 31 * result + (localFilePath != null ? localFilePath.hashCode() : 0);
    return result;
  }
}
