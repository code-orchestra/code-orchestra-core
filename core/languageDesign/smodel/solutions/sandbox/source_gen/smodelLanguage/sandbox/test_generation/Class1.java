package smodelLanguage.sandbox.test_generation;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import java.util.List;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.IAttributeDescriptor;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;

public class Class1 {
  public void method1(SNode node) {
    SNodeOperations.isAttribute(node);
    List<SNode> nodes = AttributeOperations.getAttributeList(node, new IAttributeDescriptor.AllAttributes());
    SNode firstNode = ListSequence.fromList(AttributeOperations.getAttributeList(node, new IAttributeDescriptor.AllAttributes())).first();
  }

  public void method2(SNode node) {
    List<SNode> macros = AttributeOperations.getAttributeList(node, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.NodeMacro")));
    SNode firstMacro = ListSequence.fromList(AttributeOperations.getAttributeList(node, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.NodeMacro")))).first();
    SNode propertyMacro = AttributeOperations.getAttribute(node, new IAttributeDescriptor.PropertyAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.PropertyMacro"), "name"));
    SNode concept = SNodeOperations.getConceptDeclaration(AttributeOperations.getAttribute(node, new IAttributeDescriptor.PropertyAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.PropertyMacro"), "name")));
  }

  public void method3(SNode node) {
    SNode macro = AttributeOperations.getAttribute(node, new IAttributeDescriptor.LinkAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.ReferenceMacro"), "localVariableDeclaration"));
    AttributeOperations.getAttribute(node, new IAttributeDescriptor.LinkAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.ReferenceMacro"), "xoxoxoxo"));
  }

  public void method4(SNode node) {
    SNode variableDeclaration = SLinkOperations.getTarget(node, "variableDeclaration", false);
    SLinkOperations.setTarget(node, "variableDeclaration", null, false);
    AttributeOperations.setAttribute(node, new IAttributeDescriptor.LinkAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.ReferenceMacro"), "localVariableDeclaration"), null);
    AttributeOperations.setAttribute(node, new IAttributeDescriptor.LinkAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.ReferenceMacro"), "localVariableDeclaration"), SConceptOperations.createNewNode("jetbrains.mps.lang.generator.structure.ReferenceMacro", null));
  }

  public void method5(SNode node) {
    // single attribute access 
    SNode expression = SLinkOperations.getTarget(node, "expression", true);
    SLinkOperations.setNewChild(node, "expression", "jetbrains.mps.baseLanguage.structure.BinaryOperation");
    SLinkOperations.setNewChild(node, "expression", "jetbrains.mps.baseLanguage.structure.Expression");
    SNode ex = SNodeOperations.detachNode(SLinkOperations.getTarget(node, "expression", true));
    AttributeOperations.createAndSetAttrbiute(node, new IAttributeDescriptor.PropertyAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.PropertyMacro"), "alias"), "jetbrains.mps.lang.generator.structure.PropertyMacro");
    AttributeOperations.createAndSetAttrbiute(node, new IAttributeDescriptor.PropertyAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.PropertyMacro"), "alias"), "jetbrains.mps.lang.generator.structure.PropertyMacro");
    SNode macro = SNodeOperations.detachNode(AttributeOperations.getAttribute(node, new IAttributeDescriptor.PropertyAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.PropertyMacro"), "alias")));
  }

  public void method6(SNode node) {
    // attribute list access 
    List<SNode> nodes = SLinkOperations.getTargets(node, "statement", true);
    SLinkOperations.addNewChild(node, "statement", "jetbrains.mps.baseLanguage.structure.Statement");
    SLinkOperations.addNewChild(node, "statement", "jetbrains.mps.baseLanguage.structure.Statement");
    ListSequence.fromList(SLinkOperations.getTargets(node, "statement", true)).addElement(null);
    ListSequence.fromList(SLinkOperations.getTargets(node, "statement", true)).addSequence(null);
    ListSequence.fromList(SLinkOperations.getTargets(node, "statement", true)).insertElement(0, SConceptOperations.createNewNode("jetbrains.mps.baseLanguage.structure.ReturnStatement", null));
    int c1 = ListSequence.fromList(SLinkOperations.getTargets(node, "statement", true)).count();
    List<SNode> macros = AttributeOperations.getAttributeList(SNodeOperations.cast(node, ""), new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.NodeMacro")));
    AttributeOperations.createAndAddAttribute(node, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.NodeMacro")), "jetbrains.mps.lang.generator.structure.NodeMacro");
    AttributeOperations.createAndAddAttribute(node, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.NodeMacro")), "jetbrains.mps.lang.generator.structure.NodeMacro");
    ListSequence.fromList(AttributeOperations.getAttributeList(node, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.NodeMacro")))).addElement(null);
    ListSequence.fromList(AttributeOperations.getAttributeList(node, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.NodeMacro")))).addSequence(null);
    ListSequence.fromList(AttributeOperations.getAttributeList(node, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.NodeMacro")))).insertElement(0, null);
    int c2 = ListSequence.fromList(AttributeOperations.getAttributeList(node, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.NodeMacro")))).count();
    int c3 = ListSequence.fromList(AttributeOperations.getAttributeList(node, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.NodeMacro")))).count();
    // not a link 
    int all = ListSequence.fromList(AttributeOperations.getAttributeList(node, new IAttributeDescriptor.AllAttributes())).count();
    SNodeOperations.copyNode(AttributeOperations.getAttribute(node, new IAttributeDescriptor.PropertyAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.PropertyMacro"), "alias")));
  }

  public void method7(SNode node) {
    Iterable<SNode> seq = ListSequence.fromList(SLinkOperations.getTargets(node, "statement", true)).where(new IWhereFilter<SNode>() {
      public boolean accept(SNode it) {
        return SNodeOperations.isInstanceOf(SLinkOperations.getTarget(SNodeOperations.cast(it, "jetbrains.mps.baseLanguage.structure.ExpressionStatement"), "expression", true), "jetbrains.mps.baseLanguage.structure.NullLiteral");
      }
    });
    for (SNode statement : ListSequence.fromList(SLinkOperations.getTargets(node, "statement", true))) {
      String string = SPropertyOperations.getString(statement, "alias");
    }
  }

  public void method8(SNode es, SNode imco) {
    SLinkOperations.setTarget(es, "expression", SConceptOperations.createNewNode("jetbrains.mps.baseLanguage.structure.Expression", null), true);
    SLinkOperations.setTarget(imco, "baseMethodDeclaration", SConceptOperations.createNewNode("jetbrains.mps.baseLanguage.structure.InstanceMethodDeclaration", null), false);
  }

  public static void main(String[] arg) {
  }
}
