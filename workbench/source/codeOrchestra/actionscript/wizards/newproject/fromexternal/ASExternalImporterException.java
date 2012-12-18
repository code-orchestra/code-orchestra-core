package codeOrchestra.actionscript.wizards.newproject.fromexternal;

/**
 * @author Anton.I.Neverov
 */
public class ASExternalImporterException extends Exception {

  private String message;

  public ASExternalImporterException(String message) {
    this.message = message;
  }

  public String getMessage() {
    return message;
  }
}
