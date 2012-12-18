package codeOrchestra.rgs.client.sshd.fetching.impl;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.rgs.IFetchCallback;
import codeOrchestra.rgs.state.model.AbstractRemoteModuleReference;
import org.apache.commons.vfs2.FileObject;

/**
 * @author Alexander Eliseyev
 */
public class FlexArtifactsFetcher extends AbstractGeneratedArtifactsFetcher {

  public static final OutputType[] OUTPUT_TYPES = new OutputType[] { OutputType.FLEX_APPLICATION, OutputType.FLEX_LIBRARY };

  public static final String[] OUTPUT_SWF_DIR = new String[] { "output_swf" };

  public FlexArtifactsFetcher(FileObject remoteProjectDir, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback) {
    super(remoteProjectDir, moduleReference, fetchCallback);
  }

  @Override
  public OutputType[] getOutputTypes() {
    return OUTPUT_TYPES;
  }

  @Override
  protected String[] getFetchableDirs() {
    return OUTPUT_SWF_DIR;
  }

}
