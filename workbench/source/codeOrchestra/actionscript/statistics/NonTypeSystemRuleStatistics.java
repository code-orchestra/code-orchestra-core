package codeOrchestra.actionscript.statistics;

/**
 * @author Alexander Eliseyev
 */
public class NonTypeSystemRuleStatistics extends SimpleTypeSystemStatistics {

  private static final NonTypeSystemRuleStatistics INSTANCE = new NonTypeSystemRuleStatistics();

  public static NonTypeSystemRuleStatistics instance() {
    return INSTANCE;
  }

  protected String getRuleType() {
    return "non-typesystem";
  }
}
