package codeOrchestra.actionscript.liveCoding.run.config.ios;

import codeOrchestra.actionscript.liveCoding.LiveCodingTarget;
import codeOrchestra.actionscript.liveCoding.run.config.AbstractLiveCodingRunConfiguration;

/**
 * @author: Alexander Eliseyev
 */
public class iOSLiveCodingRunConfiguration extends AbstractLiveCodingRunConfiguration {

  private String bundleId;

  private String applicationName;

  public iOSLiveCodingRunConfiguration(String moduleName, String bundleId, String applicationName) {
    super(moduleName);
    this.bundleId = bundleId;
    this.applicationName = applicationName;
  }

  @Override
  public LiveCodingTarget getLiveCodingTarget() {
    return LiveCodingTarget.AIR_IOS;
  }

  public String getBundleId() {
    return bundleId;
  }

  public void setBundleId(String bundleId) {
    this.bundleId = bundleId;
  }

  public String getApplicationName() {
    return applicationName;
  }

  public void setApplicationName(String applicationName) {
    this.applicationName = applicationName;
  }
}
