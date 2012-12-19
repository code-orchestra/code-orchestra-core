package codeOrchestra.flex.processors.languageIdentifier;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public abstract class LanguageIdentifierProcessor extends SNodeProcessor {

  public LanguageIdentifierProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

}
