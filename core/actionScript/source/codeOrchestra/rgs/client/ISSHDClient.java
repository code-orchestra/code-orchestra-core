package codeOrchestra.rgs.client;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.rgs.IFetchCallback;
import codeOrchestra.rgs.RGSConnectionException;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.state.model.AbstractRemoteModuleReference;
import org.jetbrains.annotations.Nullable;

/**
 * @author Alexander Eliseyev
 */
public interface ISSHDClient {

  void init() throws RGSConnectionException;

  void dispose();

  void syncProject(ISyncCallback syncCallback) throws RGSException;

  void fetchArtifacts(@Nullable OutputType outputType, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback) throws RGSException;

}
