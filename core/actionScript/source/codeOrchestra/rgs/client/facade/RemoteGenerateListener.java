package codeOrchestra.rgs.client.facade;

import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.state.model.GenerateInput;

/**
 * @author Alexander Eliseyev
 */
public interface RemoteGenerateListener {

  void onSuccess(GenerateInput generateInput);

  void onFail(GenerateInput generateInput, String message, RGSException e);

}
