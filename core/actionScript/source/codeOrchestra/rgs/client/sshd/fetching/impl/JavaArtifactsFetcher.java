package codeOrchestra.rgs.client.sshd.fetching.impl;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.rgs.IFetchCallback;
import codeOrchestra.rgs.state.model.AbstractRemoteModuleReference;
import org.apache.commons.vfs2.FileObject;

/**
 * @author Alexander Eliseyev
 */
public class JavaArtifactsFetcher extends AbstractGeneratedArtifactsFetcher {

  public static final OutputType[] OUTPUT_TYPES = new OutputType[]{ null, OutputType.UNKNOWN };
  private static final String[] FETCHABLE_DIRS = new String[]{ "classes_gen"};

  public JavaArtifactsFetcher(FileObject remoteProjectDir, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback) {
    super(remoteProjectDir, moduleReference, fetchCallback);
  }

  @Override
  protected String[] getFetchableDirs() {
    return FETCHABLE_DIRS;
  }

  @Override
  public OutputType[] getOutputTypes() {
    return OUTPUT_TYPES;
  }

}
