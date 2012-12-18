package codeOrchestra.actionscript.statistics;

/**
 * @author Alexander Eliseyev
 */
public class SubtypingRuleStatistics extends SimpleTypeSystemStatistics {

  private static final SubtypingRuleStatistics INSTANCE = new SubtypingRuleStatistics();

  public static SubtypingRuleStatistics instance() {
    return INSTANCE;
  }

  protected String getRuleType() {
    return "subtyping";
  }
}
