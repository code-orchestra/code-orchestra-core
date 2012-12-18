package jetbrains.mps.testbench.suite.intentions;

/*Generated by MPS */

import jetbrains.mps.intentions.BaseIntention;
import jetbrains.mps.intentions.Intention;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;

public class editoMute_Intention extends BaseIntention implements Intention {
  public editoMute_Intention() {
  }

  public String getConcept() {
    return "jetbrains.mps.testbench.suite.structure.ITestRef";
  }

  public boolean isParameterized() {
    return false;
  }

  public boolean isErrorIntention() {
    return false;
  }

  public boolean isAvailableInChildNodes() {
    return true;
  }

  public String getDescription(final SNode node, final EditorContext editorContext) {
    return (SPropertyOperations.getBoolean(node, "muted") ?
      "Unmute TestCase" :
      "Mute TestCase"
    );
  }

  public void execute(final SNode node, final EditorContext editorContext) {
    SPropertyOperations.set(node, "muted", "" + !(SPropertyOperations.getBoolean(node, "muted")));
    editorContext.getNodeEditorComponent().rebuildEditorContent();
  }

  public String getLocationString() {
    return "jetbrains.mps.testbench.suite.intentions";
  }
}
