package jetbrains.mps.typesystem.checking;

import codeOrchestra.actionscript.parsing.FakeEditorComponent;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;

/**
 * @author Alexander Eliseyev
 */
public class FakeEditorContext extends EditorContext {

  private static final SNode FAKE_NODE = new SNode(null, "null", false);

  public FakeEditorContext(SModel model, IOperationContext operationContext) {
    super(new FakeEditorComponent(operationContext), model, operationContext);
  }

  @Override
  public SNode getSelectedNode() {
    return FAKE_NODE;
  }
}
