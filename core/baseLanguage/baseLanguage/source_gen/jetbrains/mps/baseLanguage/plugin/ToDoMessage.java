package jetbrains.mps.baseLanguage.plugin;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.DefaultEditorMessage;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.EditorMessageOwner;
import java.awt.Color;
import java.awt.Graphics;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.cells.EditorCell;

public class ToDoMessage extends DefaultEditorMessage {
  public ToDoMessage(SNode node, String message, EditorMessageOwner owner) {
    super(node, Color.BLUE, message, owner);
  }

  public void paint(Graphics graphics, EditorComponent component, EditorCell cell) {
  }
}
