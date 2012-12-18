package jetbrains.mps.baseLanguage.javastub.asm;

/*Generated by MPS */


public class ASMPrimitiveType extends ASMType {
  public static final ASMPrimitiveType VOID = new ASMPrimitiveType("void");
  public static final ASMPrimitiveType BOOLEAN = new ASMPrimitiveType("boolean");
  public static final ASMPrimitiveType CHAR = new ASMPrimitiveType("char");
  public static final ASMPrimitiveType BYTE = new ASMPrimitiveType("byte");
  public static final ASMPrimitiveType SHORT = new ASMPrimitiveType("short");
  public static final ASMPrimitiveType INT = new ASMPrimitiveType("int");
  public static final ASMPrimitiveType FLOAT = new ASMPrimitiveType("float");
  public static final ASMPrimitiveType LONG = new ASMPrimitiveType("long");
  public static final ASMPrimitiveType DOUBLE = new ASMPrimitiveType("double");

  private String myName;

  private ASMPrimitiveType(String name) {
    myName = name;
  }

  public String getName() {
    return myName;
  }

  public String toString() {
    return myName;
  }
}
