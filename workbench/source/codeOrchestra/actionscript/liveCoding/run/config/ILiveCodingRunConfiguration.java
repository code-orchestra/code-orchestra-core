package codeOrchestra.actionscript.liveCoding.run.config;

import codeOrchestra.actionscript.liveCoding.LiveCodingTarget;
import codeOrchestra.run.CodeOrchestraRunConfiguration;

import java.io.Serializable;

/**
 * @author Alexander Eliseyev
 */
public interface ILiveCodingRunConfiguration extends CodeOrchestraRunConfiguration, Serializable {

  LiveCodingTarget getLiveCodingTarget();
  int getMaxLoopIterations();
  int getMaxRecursionDepth();
  LiveCodingMode getMode();
  boolean isGettersAndSettersLive();
  boolean isInAutoPauseMode();

}
