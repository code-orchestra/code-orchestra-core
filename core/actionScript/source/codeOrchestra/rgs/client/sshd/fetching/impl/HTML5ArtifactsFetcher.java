package codeOrchestra.rgs.client.sshd.fetching.impl;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.rgs.IFetchCallback;
import codeOrchestra.rgs.state.model.AbstractRemoteModuleReference;
import org.apache.commons.vfs2.FileObject;

/**
 * @author Alexander Eliseyev
 */
public class HTML5ArtifactsFetcher extends AbstractGeneratedArtifactsFetcher {

  public static final OutputType[] OUTPUT_TYPES = new OutputType[]{ OutputType.HTML5_APPLICATION, OutputType.HTML5_LIBRARY };

  public HTML5ArtifactsFetcher(FileObject remoteProjectDir, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback) {
    super(remoteProjectDir, moduleReference, fetchCallback);
  }

  @Override
  protected String[] getFetchableDirs() {
    return new String[0];
  }

  @Override
  public OutputType[] getOutputTypes() {
    return OUTPUT_TYPES;
  }
}
