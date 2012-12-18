package flash.css;

/**
 * @author Alexander Eliseyev
 */
public class CompilerError extends Throwable {
  public int line;
  public String path;
}
