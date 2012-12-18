package codeOrchestra.actionscript.logging.scope;

import jetbrains.mps.messages.IMessage;
import jetbrains.mps.messages.Message;

import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class FilterByScopeComponent extends MessagesComponentHolder {

  private String filterByScopeId;

  public FilterByScopeComponent(String filterByScopeId) {
    assert filterByScopeId != null;
    this.filterByScopeId = filterByScopeId;
  }

  public String getFilterByScopeId() {
    return filterByScopeId;
  }

  public boolean showMessage(IMessage message) {
    if (message.getScopeIds() != null) {
      List<String> scopeIds = message.getScopeIds();
      for (String scopeId : scopeIds) {
        if (filterByScopeId.equalsIgnoreCase(scopeId)) {
          return true;
        }
      }
    }
    return false;
  }

}
