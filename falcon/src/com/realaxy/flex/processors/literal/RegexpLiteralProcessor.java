package codeOrchestra.flex.processors.literal;

import codeOrchestra.flex.processors.FakeProblemReporter;
import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.parsing.as.ASToken;
import org.apache.flex.compiler.internal.parsing.as.ASTokenTypes;
import org.apache.flex.compiler.internal.tree.as.RegExpLiteralNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class RegexpLiteralProcessor extends SNodeProcessor {

  private String regexp;
  private String modifiers;

  public RegexpLiteralProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("regexp")) {
      regexp = value;
    } else if (name.equals("modifiers")) {
      modifiers = value;
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (regexp == null) {
      throw new SNodeProcessorException();
    }

    String regexpString = "/" + regexp + "/";
    if (modifiers != null) {
      regexpString += modifiers;
    }

    FakeProblemReporter fakeProblemReporter = new FakeProblemReporter();
    RegExpLiteralNode node = new RegExpLiteralNode(new ASToken(ASTokenTypes.TOKEN_LITERAL_REGEXP, -1, -1, -1, -1, regexpString), fakeProblemReporter);
    fakeProblemReporter.handleProblems();

    return node;
  }

}
