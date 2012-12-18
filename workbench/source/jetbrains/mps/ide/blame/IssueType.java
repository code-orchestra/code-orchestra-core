package jetbrains.mps.ide.blame;

/**
 * @author Alexander Eliseyev
 */
public enum IssueType {

  EXCEPTION("Exception"),
  BUG("Bug");

  private String youtrackIssueType;

  private IssueType(String youtrackIssueType) {
    this.youtrackIssueType = youtrackIssueType;
  }

  public String getYoutrackIssueType() {
    return youtrackIssueType;
  }
}
