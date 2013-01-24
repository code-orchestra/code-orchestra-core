package codeOrchestra.rgs.client.sshd;

import com.jcraft.jsch.JSchException;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.rgs.IFetchCallback;
import codeOrchestra.rgs.RGSConnectionException;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.RGSFileSyncException;
import codeOrchestra.rgs.client.ISSHDClient;
import codeOrchestra.rgs.client.ISyncCallback;
import codeOrchestra.rgs.client.ProjectInfoHolder;
import codeOrchestra.rgs.client.settings.RGSClientSettings;
import codeOrchestra.rgs.client.sshd.fetching.ArtifactsFetcherFactory;
import codeOrchestra.rgs.client.sshd.fetching.IArtifactsFetcher;
import codeOrchestra.rgs.client.sshd.flitering.SyncBlockerRegistry;
import codeOrchestra.rgs.state.model.AbstractRemoteModuleReference;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import org.apache.commons.vfs2.*;
import org.apache.commons.vfs2.impl.DefaultFileSystemManager;
import org.apache.commons.vfs2.provider.sftp.SftpFileSystemConfigBuilder;
import org.jetbrains.annotations.Nullable;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class SSHDClientImpl implements ISSHDClient {

  private FileSystemOptions fsOptions;
  private DefaultFileSystemManager fsManager;

  private ProjectInfoHolder myProjectInfoHolder;

  private transient ISyncCallback syncCallback;
  private FileObject remoteProjectDir;

  public SSHDClientImpl(ProjectInfoHolder projectInfoHolder) {
    myProjectInfoHolder = projectInfoHolder;
  }

  @Override
  public void syncProject(ISyncCallback syncCallback) throws RGSException {
    File localProjectDir = new File(myProjectInfoHolder.getProjectPath());
    assert localProjectDir.exists() && localProjectDir.isDirectory();

    // Do the sync
    try {
      this.syncCallback = syncCallback;

      // 1 - Sync the project dir
      remoteProjectDir = getOrCreateRemoteProjectDir();
      uploadNewAndChangedFiles(remoteProjectDir, localProjectDir);
      deleteServerFilesNotPresentOnClient(remoteProjectDir, localProjectDir, localProjectDir);

      // 2 - Sync the out of project dirs
      for (IModule outOfProjectModule : getOutOfProjectDirModules()) {
        FileObject remoteModuleDir = getOrCreateRemoteModuleDir(remoteProjectDir, outOfProjectModule);
        File localModuleDir = new File(outOfProjectModule.getBundleHome().getPath());
        uploadNewAndChangedFiles(remoteModuleDir, localModuleDir);
        deleteServerFilesNotPresentOnClient(remoteModuleDir, localModuleDir, localModuleDir);
      }

      syncCallback.done();

      remoteProjectDir.close();
    } catch (FileSystemException e) {
      throw new RGSFileSyncException("Can't sync the remote project " + myProjectInfoHolder.getProjectName() + " dir", e, isConnectionError(e));
    } finally {
      this.syncCallback = null;
    }
  }

  private boolean isConnectionError(FileSystemException e) {
    String message = e.getMessage();
    if (message != null && (message.contains("Could not connect") || message.contains("Could not write"))) {
      return true;
    }

    Throwable cause = e.getCause();
    if (cause == null) {
      return false;
    }

    if (cause instanceof FileSystemException) {
      return isConnectionError((FileSystemException) cause);
    }

    return false;
  }

  private List<IModule> getOutOfProjectDirModules() {
    List<IModule> result = new ArrayList<IModule>();
    for (IModule projectModule : ProjectHolder.getProject().getComponent(MPSProject.class).getModules()) {
      String modulePath = new File(projectModule.getBundleHome().getPath()).getPath();
      String projectPath = myProjectInfoHolder.getProjectPath();

      if (!modulePath.startsWith(projectPath)) {
        result.add(projectModule);
      }
    }
    return result;
  }

  @Override
  public void fetchArtifacts(@Nullable OutputType outputType, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback) throws RGSException {
    try {
      for (IArtifactsFetcher fetcher : ArtifactsFetcherFactory.getInstance().getFetchers(
        outputType,
        getOrCreateRemoteProjectDir(),
        moduleReference,
        fetchCallback
      ))
      {
        fetcher.fetch();
      }
    } catch (FileSystemException e) {
      throw new RGSException("Can't reach the remote project dir to fetch the build artifacts from");
    }
  }

  private void uploadNewAndChangedFiles(FileObject remoteDir, File localDir) throws FileSystemException {
    for (File localFile : listFilesRecursively(localDir, SyncFileOperation.UPLOAD, SyncFileOperation.MODIFY)) {
      String relativePath = localFile.getPath().substring(localDir.getPath().length() + 1);

      // Filter-out the operations
      if (SyncBlockerRegistry.getInstance().transferShouldBeBlocked(relativePath)) {
        continue;
      }

      FileObject localFileVFS = getFSManager().resolveFile(localFile.toURI().toString());
      FileObject remoteFileVFS = remoteDir.getChild(relativePath);

      if (remoteFileVFS == null) {
        remoteFileVFS = getFSManager().resolveFile(remoteDir.getURL().toString() + '/' + relativePath, fsOptions);
      }

      if (!remoteFileVFS.exists() || remoteFileVFS.getContent().getLastModifiedTime() < localFileVFS.getContent().getLastModifiedTime()) {
        SyncFileOperation operation = !remoteFileVFS.exists() ? SyncFileOperation.UPLOAD : SyncFileOperation.MODIFY;
        syncCallback.syncingFile(operation, remoteFileVFS.getURL().toString(), localFile.getPath());

        remoteFileVFS.copyFrom(localFileVFS, Selectors.SELECT_SELF);
      }
    }
  }

  private static Collection<File> listFilesRecursively(File baseDir, SyncFileOperation... filteringByOperations) {
    List<File> result = new ArrayList<File>();
    collectFilesRecursivelyInternal(baseDir, baseDir, result, filteringByOperations);
    return result;
  }

  private static void collectFilesRecursivelyInternal(File baseDir, File currentDir, List<File> result, SyncFileOperation... filteringByOperations) {
    File[] subFiles = currentDir.listFiles();
    if (subFiles == null) {
      return;
    }

    for (File subFile : subFiles) {
      String relativePath = getRelativePath(subFile, baseDir);

      if (subFile.isDirectory()) {
        boolean blocked = false;
        for (SyncFileOperation filteringByOperation : filteringByOperations) {
          if (SyncBlockerRegistry.getInstance().shouldBeBlocked(filteringByOperation, relativePath)) {
            blocked = true;
            continue;
          }
        }
        if (blocked) {
          continue;
        }

        collectFilesRecursivelyInternal(baseDir, subFile, result, filteringByOperations);
      } else {
        result.add(subFile);
      }
    }
  }

  private void deleteServerFilesNotPresentOnClient(FileObject fo, File localDir, File baseLocalDir) throws FileSystemException {
    // Filter out delete operation
    if (SyncBlockerRegistry.getInstance().shouldBeBlocked(SyncFileOperation.DELETE, getRelativePath(localDir, baseLocalDir))) {
      return;
    }

    if (!localDir.exists() || !localDir.isDirectory()) {
      deleteFile(fo);
      return;
    }

    for (FileObject remoteFile : fo.getChildren()) {
      if (remoteFile.getType() == FileType.FOLDER) {
        deleteServerFilesNotPresentOnClient(remoteFile, new File(localDir, remoteFile.getName().getBaseName()), baseLocalDir);
      }

      File localFile = new File(localDir, remoteFile.getName().getBaseName());
      if (!localFile.exists()) {
        if (!SyncBlockerRegistry.getInstance().shouldBeBlocked(SyncFileOperation.DELETE, getRelativePath(localFile, baseLocalDir))) {
          // Filter out delete operation
          deleteFile(remoteFile);
        }
      }
    }
  }

  private void deleteFile(FileObject fileObject) throws FileSystemException {
    if (!fileObject.exists()) {
      return;
    }

    if (fileObject.getType() == FileType.FOLDER) {
      for (FileObject child : fileObject.getChildren()) {
        deleteFile(child);
      }
    }

    syncCallback.syncingFile(SyncFileOperation.DELETE, fileObject.getURL().toString(), null);
    fileObject.delete();
  }

  private static String getRelativePath(File localFile, File baseDir) {
    String localPath = localFile.getPath();
    String basePath = baseDir.getPath();

    if (localPath.equals(basePath)) {
      return "";
    }

    try {
      return localPath.substring(basePath.length() + 1);
    } catch (Throwable t) {
      throw new RuntimeException("Can't calc the relative path for " + localFile, t);
    }
  }

  @Override
  public void init() throws RGSConnectionException {
    try {
      this.fsOptions = new FileSystemOptions();
      SftpFileSystemConfigBuilder.getInstance().setStrictHostKeyChecking(fsOptions, "no");
      this.fsManager = (DefaultFileSystemManager) VFS.getManager();
    } catch (Throwable t) {
      throw new RGSConnectionException("Can't init the SSHD client", t);
    }
  }

  @Override
  public void dispose() {
    if (fsManager != null) {
      try {
        if (remoteProjectDir != null) {
          FileSystem fileSystem = remoteProjectDir.getFileSystem();
          fsManager.closeFileSystem(fileSystem);
        }

        // this.fsManager.close();
        this.fsManager = null;
      } catch (Throwable t) {
        // do nothing
      }
    }
  }

  private FileObject getOrCreateRemoteProjectDir() throws FileSystemException {
    String uri = getRemoteProjectDirURI();

    FileObject fileObject = getFSManager().resolveFile(uri, fsOptions);
    if (!fileObject.exists()) {
      fileObject.createFolder();
    }

    return fileObject;
  }

  private FileObject getOrCreateRemoteModuleDir(FileObject remoteProjectDir, IModule outOfProjectModule) throws FileSystemException {
    FileObject modulesRemoteDir = remoteProjectDir.getChild("modules");
    if (modulesRemoteDir == null) {
      modulesRemoteDir = getFSManager().resolveFile(remoteProjectDir.getURL().toString() + "/modules", fsOptions);
      modulesRemoteDir.createFolder();
    }

    String moduleFqName = outOfProjectModule.getModuleFqName();
    FileObject moduleRemoteDir = modulesRemoteDir.getChild(moduleFqName);
    if (moduleRemoteDir == null) {
      moduleRemoteDir = getFSManager().resolveFile(modulesRemoteDir.getURL().toString() + '/' + moduleFqName, fsOptions);
      moduleRemoteDir.createFolder();
    }

    return moduleRemoteDir;
  }

  private String getRemoteProjectDirURI() {
    RGSClientSettings rgsClientSettings = RGSClientSettings.getInstance();

    return String.format("sftp://%s:%s@%s:%d/%s",
      rgsClientSettings.getUsername(),
      rgsClientSettings.getPassword(),
      rgsClientSettings.getHost(),
      rgsClientSettings.getSSHDPort(),
      myProjectInfoHolder.getProjectName());
  }

  public DefaultFileSystemManager getFSManager() throws FileSystemException {
    if (fsManager == null) {
      throw new FileSystemException("FileSystem not initialized yet");
    }
    return fsManager;
  }

}
