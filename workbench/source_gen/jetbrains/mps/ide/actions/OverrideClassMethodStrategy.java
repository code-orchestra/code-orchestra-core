package jetbrains.mps.ide.actions;

/*Generated by MPS */

import javax.swing.JCheckBox;
import com.intellij.openapi.project.Project;
import jetbrains.mps.plugins.projectplugins.ProjectPluginManager;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.internal.collections.runtime.ISelector;
import jetbrains.mps.internal.collections.runtime.Sequence;
import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.BoxLayout;
import java.util.Set;
import java.util.HashSet;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.SReference;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNodeId;
import java.util.List;
import jetbrains.mps.lang.typesystem.runtime.HUtil;

public class OverrideClassMethodStrategy extends BaseMethodUpdateStrategy {
  private JCheckBox myCheckBox;
  private PersistentOptions_PreferencesComponent myOptions;

  public OverrideClassMethodStrategy(Project project) {
    super(project);
    try {
      myOptions = project.getComponent(ProjectPluginManager.class).getPrefsComponent(PersistentOptions_PreferencesComponent.class);
    } catch (NullPointerException e) {
    }
    myCheckBox = new JCheckBox("Add @Override annotation");
    myCheckBox.setSelected(myOptions.getStateObject().addOverrideAnnotation);
  }

  public void updateMethod(SNode sourceMethod, SNode method) {
    super.updateMethod(sourceMethod, method);
    if (myOptions != null) {
      myOptions.getStateObject().addOverrideAnnotation = myCheckBox.isSelected();
    }
    if (myCheckBox.isSelected()) {
      boolean isNeedAddAnnotation = true;
      for (SNode annotation : SLinkOperations.getTargets(method, "annotation", true)) {
        if (SLinkOperations.getTarget(annotation, "annotation", false) == SNodeOperations.getNode("f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)", "~Override")) {
          isNeedAddAnnotation = false;
          break;
        }
      }
      if (isNeedAddAnnotation) {
        ListSequence.fromList(SLinkOperations.getTargets(method, "annotation", true)).addElement(new OverrideClassMethodStrategy.QuotationClass_px9rr4_a0a0a0c0c0a().createNode());
      }
    }

    Iterable<SNode> paramList = ListSequence.fromList(SLinkOperations.getTargets(method, "parameter", true)).select(new ISelector<SNode, SNode>() {
      public SNode select(SNode it) {
        return new OverrideClassMethodStrategy.QuotationClass_px9rr4_a0a0a0a0e0a().createNode(it);
      }
    });
    SNode superCallExpr = new OverrideClassMethodStrategy.QuotationClass_px9rr4_a0a5a0().createNode(sourceMethod, Sequence.fromIterable(paramList).toListSequence());

    if (SNodeOperations.isInstanceOf(SLinkOperations.getTarget(method, "returnType", true), "jetbrains.mps.baseLanguage.structure.VoidType")) {
      ListSequence.fromList(SLinkOperations.getTargets(SLinkOperations.getTarget(method, "body", true), "statement", true)).addElement(new OverrideClassMethodStrategy.QuotationClass_px9rr4_a0a0a0h0a().createNode(superCallExpr));
    } else {
      ListSequence.fromList(SLinkOperations.getTargets(SLinkOperations.getTarget(method, "body", true), "statement", true)).addElement(getReturnStatement(superCallExpr));
    }
  }

  public String getTitle() {
    return "Override Method";
  }

  public JComponent createAdditionalOptionsComponent() {
    JPanel optPanel = new JPanel();
    optPanel.setLayout(new BoxLayout(optPanel, BoxLayout.Y_AXIS));
    optPanel.add(getReturnCheckBox());
    optPanel.add(getRemoveAttributes());
    optPanel.add(myCheckBox);
    return optPanel;
  }

  public static class QuotationClass_px9rr4_a0a0a0c0c0a {
    public QuotationClass_px9rr4_a0a0a0c0c0a() {
    }

    public SNode createNode() {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.AnnotationInstance", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_2 = quotedNode_1;
        quotedNode1_2.addReference(SReference.create("annotation", quotedNode1_2, SModelReference.fromString("f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(java.lang@java_stub)"), SNodeId.fromString("~Override")));
        result = quotedNode1_2;
      }
      return result;
    }
  }

  public static class QuotationClass_px9rr4_a0a0a0a0e0a {
    public QuotationClass_px9rr4_a0a0a0a0e0a() {
    }

    public SNode createNode(Object parameter_3) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.ParameterReference", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_2 = quotedNode_1;
        quotedNode1_2.setReferent("variableDeclaration", (SNode) parameter_3);
        result = quotedNode1_2;
      }
      return result;
    }
  }

  public static class QuotationClass_px9rr4_a0a5a0 {
    public QuotationClass_px9rr4_a0a5a0() {
    }

    public SNode createNode(Object parameter_4, Object parameter_5) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      SNode quotedNode_2 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.SuperMethodCall", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_3 = quotedNode_1;
        quotedNode1_3.setReferent("baseMethodDeclaration", (SNode) parameter_4);
        {
          List<SNode> nodes = (List<SNode>) parameter_5;
          for (SNode child : nodes) {
            quotedNode_1.addChild("actualArgument", HUtil.copyIfNecessary(child));
          }
        }
        result = quotedNode1_3;
      }
      return result;
    }
  }

  public static class QuotationClass_px9rr4_a0a0a0h0a {
    public QuotationClass_px9rr4_a0a0a0h0a() {
    }

    public SNode createNode(Object parameter_5) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      SNode quotedNode_2 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.ExpressionStatement", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_3 = quotedNode_1;
        {
          quotedNode_2 = (SNode) parameter_5;
          SNode quotedNode1_4;
          if (_parameterValues_129834374.contains(quotedNode_2)) {
            quotedNode1_4 = HUtil.copyIfNecessary(quotedNode_2);
          } else {
            _parameterValues_129834374.add(quotedNode_2);
            quotedNode1_4 = quotedNode_2;
          }
          if (quotedNode1_4 != null) {
            quotedNode_1.addChild("expression", HUtil.copyIfNecessary(quotedNode1_4));
          }
        }
        result = quotedNode1_3;
      }
      return result;
    }
  }
}
