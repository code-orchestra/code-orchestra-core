package codeOrchestra.mps.test;

import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.event.SModelEvent;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Ivan
 * Date: Sep 15, 2010
 * Time: 5:00:11 PM
 * To change this template use File | Settings | File Templates.
 */
@CodeOrchestraPatch
public class FakeEditorComponent extends EditorComponent {


  public FakeEditorComponent(IOperationContext context) {
    super(context);
  }

  @Override
  public EditorCell createRootCell() {
    return null;
  }

  @Override
  protected EditorCell createRootCell(List<SModelEvent> events) {
    return null;
  }
}