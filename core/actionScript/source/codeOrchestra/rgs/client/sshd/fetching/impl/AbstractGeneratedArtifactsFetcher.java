package codeOrchestra.rgs.client.sshd.fetching.impl;

import codeOrchestra.rgs.IFetchCallback;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.client.sshd.fetching.IArtifactsFetcher;
import codeOrchestra.rgs.server.artifact.AbstractArtifactPreparer;
import codeOrchestra.rgs.state.model.AbstractRemoteModuleReference;
import codeOrchestra.rgs.state.model.RemoteLanguageReference;
import codeOrchestra.rgs.state.model.RemoteSolutionReference;
import codeOrchestra.utils.CompressUtils;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.util.FileUtil;
import org.apache.commons.vfs2.FileObject;
import org.apache.commons.vfs2.FileSystemException;
import org.apache.commons.vfs2.FileType;

import java.io.*;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractGeneratedArtifactsFetcher implements IArtifactsFetcher {

  private static final String[] GENERIC_FETCHABLE_DIRS = new String[] { "source_gen", "source_gen.caches" };

  private static final String PROJECT_SOLUTIONS_DIR_NAME = "modules";
  private static final String PROJECT_LANGUAGES_DIR_NAME = "languages";

  private FileObject remoteProjectDir;
  private String localModuleDirPath;
  private AbstractRemoteModuleReference moduleReference;
  private IFetchCallback fetchCallback;

  protected AbstractGeneratedArtifactsFetcher(FileObject remoteProjectDir, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback) {
    this.remoteProjectDir = remoteProjectDir;
    this.moduleReference = moduleReference;
    this.fetchCallback = fetchCallback;
    this.localModuleDirPath = new File(MPSModuleRepository.getInstance().getModule(moduleReference.toLocalModuleReference()).getBundleHome().getPath()).getPath();
  }

  private String getModulesDirName() {
    if (moduleReference instanceof RemoteLanguageReference) {
      return PROJECT_LANGUAGES_DIR_NAME;
    } else if (moduleReference instanceof RemoteSolutionReference) {
      return PROJECT_SOLUTIONS_DIR_NAME;
    } else {
      throw new IllegalStateException("Illegal module reference type: " + moduleReference);
    }
  }

  @Override
  public final void fetch() throws RGSException {
    FileObject remoteModuleDir = null;
    try {
      remoteModuleDir = getRemoteModuleDir();
    } catch (FileSystemException e) {
      throw new RGSException("Can't access the remote dir for the module: " + moduleReference.getModuleName(), e);
    }

    FileObject zippedArtifact;
    try {
      zippedArtifact = remoteModuleDir.getChild(AbstractArtifactPreparer.RGSOUTPUT_ZIP);
    } catch (FileSystemException e) {
      throw new RGSException("Can't reach the remote artifact for the module: " + moduleReference.getModuleName(), e);
    }
    if (zippedArtifact == null) {
      throw new RGSException("Remote build artifact doesn't exist for module: " + moduleReference.getModuleName());
    }

    File localZippedArtifact;
    try {
      localZippedArtifact = fetchFile(zippedArtifact);
    } catch (IOException e) {
      throw new RGSException("Can't fetch the remote artifact for the module: " + moduleReference.getModuleName(), e);
    }

    // Finally, unzip the fetched artifact
    try {
      CompressUtils.unzip(localZippedArtifact, new File(localModuleDirPath));
    } catch (IOException e) {
      throw new RGSException("Can't unzip the fetched artifact for the module: " + moduleReference.getModuleName(), e);
    }
  }

  private FileObject getRemoteModuleDir() throws FileSystemException {
    return remoteProjectDir.getChild(getModulesDirName()).getChild(moduleReference.getModuleName());
  }

  private void fetchDirRecursively(FileObject remoteDir) throws IOException {
    assert remoteDir.getType() == FileType.FOLDER;

    // 1 - create or clear local dir if needed
    String relativeDirPath = getPathRelativeToModuleDir(remoteDir);
    File localDir = new File(localModuleDirPath, relativeDirPath);
    if (!localDir.exists()) {
      localDir.mkdir();
    } else {
      FileUtil.clear(localDir);
    }

    // 2 - Fetch contents
    for (FileObject fileObject : remoteDir.getChildren()) {
      switch (fileObject.getType()) {
        case FILE:
          fetchFile(fileObject);
          break;
        case FOLDER:
          fetchDirRecursively(fileObject);
        break;
      }
    }
  }

  private File fetchFile(FileObject remoteFile) throws IOException {
    assert remoteFile.getType() == FileType.FILE;

    fetchCallback.onFetch(remoteFile.getURL().toString());

    String relativeFilePath = getPathRelativeToModuleDir(remoteFile);
    File localFile = new File(localModuleDirPath, relativeFilePath);

    // write the inputStream to a FileOutputStream
    OutputStream out = new FileOutputStream(localFile);

    int read;
    byte[] bytes = new byte[1024];

    InputStream inputStream = remoteFile.getContent().getInputStream();
    while ((read = inputStream.read(bytes)) != -1) {
      out.write(bytes, 0, read);
    }

    inputStream.close();
    out.flush();
    out.close();

    return localFile;
  }

  private String getPathRelativeToModuleDir(FileObject fileObject) throws FileSystemException {
    return fileObject.getURL().toString().substring(getRemoteModuleDir().getURL().toString().length() + 1);
  }

  protected abstract String[] getFetchableDirs();

  private String[] getGenericFetchableDirs() {
    return GENERIC_FETCHABLE_DIRS;
  }

}
