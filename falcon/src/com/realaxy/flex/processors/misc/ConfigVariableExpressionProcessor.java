package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.ConfigVariableNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class ConfigVariableExpressionProcessor extends SNodeProcessor {

  private String namespace;
  private String variable;

  public ConfigVariableExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("namespace")) {
      namespace = value;
    } else if (name.equals("variable")) {
      variable = value;
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
    if (namespace == null || variable == null) {
      throw new SNodeProcessorException();
    }

    return new ConfigVariableNode(true); // TODO: Somehow get flag from compiler settings
  }

}
