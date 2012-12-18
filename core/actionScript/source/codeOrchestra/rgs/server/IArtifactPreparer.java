package codeOrchestra.rgs.server;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.generator.listener.BuildEvent;
import codeOrchestra.rgs.RGSException;

/**
 * @author Alexander Eliseyev
 */
public interface IArtifactPreparer {

  void prepare(BuildEvent buildEvent) throws RGSException;

  OutputType[] getOutputTypes();

}
