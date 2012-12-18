package codeOrchestra.actionscript.statistics;

import jetbrains.mps.lang.typesystem.runtime.Rule_Runtime;

/**
 * @author Alexander Eliseyev
 */
public abstract class SimpleTypeSystemStatistics extends AbstractTimeStatistics<String> {

  private static final int TRACE_COUNT = 10;

  protected abstract String getRuleType();

  protected String getActionName() {
    return "check";
  }

  protected int getTraceCount() {
    return TRACE_COUNT;
  }

  public void addStat(Rule_Runtime rule, long time) {
    if (time < 1l) {
      return;
    }

    String className = rule.getClass().getCanonicalName();
    if (!className.startsWith("com.codeOrchestra")) {
      return;
    }

    addStatObject(className, time);
  }

  protected String getStatisticObjectName() {
    return getRuleType() + " rule";
  }
}

