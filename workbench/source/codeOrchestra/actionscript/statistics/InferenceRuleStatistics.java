package codeOrchestra.actionscript.statistics;

/**
 * @author Alexander Eliseyev
 */
public class InferenceRuleStatistics extends SimpleTypeSystemStatistics {

  private static final InferenceRuleStatistics INSTANCE = new InferenceRuleStatistics();

  public static InferenceRuleStatistics instance() {
    return INSTANCE;
  }

  protected String getRuleType() {
    return "inference";
  }
}
