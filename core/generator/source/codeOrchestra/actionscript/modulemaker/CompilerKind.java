package codeOrchestra.actionscript.modulemaker;

/**
 * @author Alexander Eliseyev
 */
public enum CompilerKind {

  MXMCL_COMPC,
  FCSH,
  FALCON;

  public static CompilerKind byOrdinal(int ordinal) {
    for (CompilerKind compilerKind : values()) {
      if (ordinal == compilerKind.ordinal()) {
        return compilerKind;
      }
    }
    return null;
  }

}
