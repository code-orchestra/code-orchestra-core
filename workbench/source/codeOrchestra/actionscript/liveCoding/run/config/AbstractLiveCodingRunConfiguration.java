package codeOrchestra.actionscript.liveCoding.run.config;

import java.io.Serializable;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractLiveCodingRunConfiguration implements ILiveCodingRunConfiguration, Serializable {

  private String moduleName;

  private int maxLoopIterations = 10000;
  private int maxRecursionDepth = 100;
  private LiveCodingMode mode = LiveCodingMode.ALL_METHODS;
  private boolean gettersAndSettersLive = false;
  private boolean startPaused = false;

  protected AbstractLiveCodingRunConfiguration(String moduleName) {
    this.moduleName = moduleName;
  }

  public String getModuleName() {
    return moduleName;
  }

  public void setModuleName(String moduleName) {
    this.moduleName = moduleName;
  }

  public int getMaxLoopIterations() {
    return maxLoopIterations;
  }

  public void setMaxLoopIterations(int maxLoopIterations) {
    this.maxLoopIterations = maxLoopIterations;
  }

  public int getMaxRecursionDepth() {
    return maxRecursionDepth;
  }

  public void setMaxRecursionDepth(int maxRecursionDepth) {
    this.maxRecursionDepth = maxRecursionDepth;
  }

  public LiveCodingMode getMode() {
    return mode;
  }

  public void setMode(LiveCodingMode mode) {
    this.mode = mode;
  }

  public boolean isGettersAndSettersLive() {
    return gettersAndSettersLive;
  }

  public void setGettersAndSettersLive(boolean gettersAndSettersLive) {
    this.gettersAndSettersLive = gettersAndSettersLive;
  }

  @Override
  public boolean startPaused() {
    return this.startPaused;
  }

  public void setStartPaused(boolean startPaused) {
    this.startPaused = startPaused;
  }
}
