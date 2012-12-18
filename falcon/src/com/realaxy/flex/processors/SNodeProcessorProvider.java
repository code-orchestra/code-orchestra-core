package codeOrchestra.flex.processors;

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.misc.hash.HashMap;

import java.util.Map;

/**
 * @author Anton.I.Neverov
 */
public class SNodeProcessorProvider {

  private static final SNodeProcessorProvider myInstance = new SNodeProcessorProvider();
  private final Map<String, Concept> myConcepts = new HashMap<String, Concept>();

  private SNodeProcessorProvider() {
    for (Concept c : Concept.values()) {
      myConcepts.put(c.getName(), c);
    }
  }

  public static SNodeProcessorProvider getInstance() {
    return myInstance;
  }

  public SNodeProcessor getProcessor(SNode node) throws SNodeProcessorException {
    Concept concept = myConcepts.get(node.getConceptFqName());
    if (concept == null) {
      throw new SNodeProcessorException("Unhandled concept " + node.getConceptFqName());
    }
    return concept.createProcessor(node);
  }

}
