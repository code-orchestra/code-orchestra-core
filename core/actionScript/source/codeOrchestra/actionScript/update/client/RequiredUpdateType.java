package codeOrchestra.actionScript.update.client;

import codeOrchestra.actionScript.update.client.impl.FlexSDKUpdater;
import codeOrchestra.actionScript.update.client.impl.FullUpdater;
import codeOrchestra.actionScript.update.client.impl.PatchUpdater;

/**
 * @author Alexander Eliseyev
 */
public enum RequiredUpdateType {

  FULL(new CodeOrchestraUpdaterCreator() {
    public CodeOrchestraUpdater create() {
      return new FullUpdater();
    }
  }),

  PATCH(new CodeOrchestraUpdaterCreator() {
    public CodeOrchestraUpdater create() {
      return new PatchUpdater();
    }
  }),

  FLEX_SDK(new CodeOrchestraUpdaterCreator() {
    public CodeOrchestraUpdater create() {
      return new FlexSDKUpdater();
    }
  }),

  NONE(null);

  private CodeOrchestraUpdaterCreator updaterCreator;

  private RequiredUpdateType(CodeOrchestraUpdaterCreator updaterCreator) {
    this.updaterCreator = updaterCreator;
  }

  public CodeOrchestraUpdater createUpdater() {
    if (updaterCreator == null) {
      return null;
    }
    return updaterCreator.create();
  }

  private static interface CodeOrchestraUpdaterCreator {
    CodeOrchestraUpdater create();
  }

}
