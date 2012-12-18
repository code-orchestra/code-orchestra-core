package flash.css;

/**
 * @author Alexander Eliseyev
 */
public class NamespaceDeclaration {

  private String prefix;
  private String uri;

  public NamespaceDeclaration(String prefix, String uri) {
    this.prefix = prefix;
    this.uri = uri;
  }

  public String getPrefix() {
    return prefix;
  }

  public String getUri() {
    return uri;
  }

  @Override
  public String toString() {
    return "NamespaceDeclaration{" +
      "prefix='" + prefix + '\'' +
      ", uri='" + uri + '\'' +
      '}';
  }
}
