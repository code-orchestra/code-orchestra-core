package codeOrchestra.actionScript.index.stubs;

/**
 * @author Alexander Eliseyev
 */
public class ASStubsDescriptor {

  private static final String EMPTY_STRING = "";

  private String rootFqName;
  private String conceptFqName;

  public ASStubsDescriptor(String rootFqName, String conceptFqName) {
    if (rootFqName == null) {
      this.rootFqName = EMPTY_STRING;
    } else {
      this.rootFqName = rootFqName;
    }

    if (conceptFqName == null) {
      this.conceptFqName = EMPTY_STRING;
    } else {
      this.conceptFqName = conceptFqName;
    }
  }

  public String getRootFqName() {
    return rootFqName;
  }

  public String getConceptFqName() {
    return conceptFqName;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    ASStubsDescriptor that = (ASStubsDescriptor) o;

    if (conceptFqName != null ? !conceptFqName.equals(that.conceptFqName) : that.conceptFqName != null) return false;
    if (rootFqName != null ? !rootFqName.equals(that.rootFqName) : that.rootFqName != null) return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result = rootFqName != null ? rootFqName.hashCode() : 0;
    result = 31 * result + (conceptFqName != null ? conceptFqName.hashCode() : 0);
    return result;
  }
}
