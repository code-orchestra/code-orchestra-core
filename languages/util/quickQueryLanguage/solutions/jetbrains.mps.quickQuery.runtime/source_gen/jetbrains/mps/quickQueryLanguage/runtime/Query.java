package jetbrains.mps.quickQueryLanguage.runtime;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;

public interface Query {
  public String getConcept();
  public void doReplace(SNode node);
  public boolean isSatisfies(SNode node);
}
