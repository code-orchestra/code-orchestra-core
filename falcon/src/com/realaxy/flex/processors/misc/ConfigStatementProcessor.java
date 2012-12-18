package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.ConfigVariableNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ConfigConditionBlockNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class ConfigStatementProcessor extends SNodeProcessor {

  private List<NodeBase> statements;
  private ConfigVariableNode configVariable;

  public ConfigStatementProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("body")) {
      if (statements != null) {
        throw new SNodeProcessorException();
      }
      statements = processStatementList(child);
    } else if (childRole.equals("configVariable")) {
      if (configVariable != null) {
        throw new SNodeProcessorException();
      }
      configVariable = processChild(child, ConfigVariableNode.class);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (statements == null || configVariable == null) {
      throw new SNodeProcessorException();
    }

    ConfigConditionBlockNode configConditionBlockNode = new ConfigConditionBlockNode(configVariable.isEnabled());
    fillStatementList(configConditionBlockNode, statements);
    return configConditionBlockNode;
  }

}
