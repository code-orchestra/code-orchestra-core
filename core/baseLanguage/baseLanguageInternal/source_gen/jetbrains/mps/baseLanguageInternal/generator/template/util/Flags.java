package jetbrains.mps.baseLanguageInternal.generator.template.util;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;

public enum Flags {
  EXTRACT_STATEMENTS("extract_statements");

  private String name;

  Flags(String name) {
    this.name = PREFIX(name);
  }

  public void flag(SNode node) {
    node.putUserObject(this, Boolean.TRUE);
  }

  public void clear(SNode node) {
    node.putUserObject(this, null);
  }

  public boolean isFlagged(SNode node) {
    return node.getUserObject(this) != null;
  }

  public String toString() {
    return this.name;
  }

  private static String PREFIX(String str) {
    return "jetbrains.mps.baseLanguageInternal.generator." + str;
  }
}
