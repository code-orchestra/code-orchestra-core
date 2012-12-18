package codeOrchestra.actionscript.statistics;

/**
 * @author Alexander Eliseyev
 */
public class TypeSystemStatRecord {

  private String rule;
  private String conceptFQName;

  public TypeSystemStatRecord(String rule, String conceptFQName) {
    this.rule = rule;
    this.conceptFQName = conceptFQName;
  }

  public String getRule() {
    return rule;
  }

  public String getConceptFQName() {
    return conceptFQName;
  }

  @Override
  public String toString() {
    return rule + " against " + conceptFQName;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    TypeSystemStatRecord that = (TypeSystemStatRecord) o;

    if (conceptFQName != null ? !conceptFQName.equals(that.conceptFQName) : that.conceptFQName != null) return false;
    if (rule != null ? !rule.equals(that.rule) : that.rule != null) return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result = rule != null ? rule.hashCode() : 0;
    result = 31 * result + (conceptFQName != null ? conceptFQName.hashCode() : 0);
    return result;
  }
}
