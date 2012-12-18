package codeOrchestra.rgs.client.sshd.fetching;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.rgs.RGSException;
import org.apache.commons.vfs2.FileObject;

/**
 * @author Alexander Eliseyev
 */
public interface IArtifactsFetcher {

  OutputType[] getOutputTypes();

  void fetch() throws RGSException;

}
