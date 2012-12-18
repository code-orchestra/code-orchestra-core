package codeOrchestra.actionscript.parsing;

import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import java.util.List;
import jetbrains.mps.smodel.event.SModelEvent;

public class FakeEditorComponent extends EditorComponent {
  public FakeEditorComponent(IOperationContext operationContext) {
    super(operationContext);
  }

  protected EditorCell createRootCell(List<SModelEvent> list) {
    return null;
  }

  public EditorCell createRootCell() {
    return null;
  }
}
