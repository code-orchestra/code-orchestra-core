package codeOrchestra.rgs.client.settings.view;

import codeOrchestra.rgs.client.RGSServiceClient;
import codeOrchestra.rgs.state.RGSState;

/**
 * @author Alexander Eliseyev
 */
public interface StateRefreshable {
  void refresh(RGSState state, RGSServiceClient client);
}
