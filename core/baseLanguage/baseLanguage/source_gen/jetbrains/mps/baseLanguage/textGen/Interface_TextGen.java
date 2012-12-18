package jetbrains.mps.baseLanguage.textGen;

/*Generated by MPS */

import jetbrains.mps.textGen.SNodeTextGen;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.textGen.TraceInfoGenerationUtil;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.IAttributeDescriptor;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;
import jetbrains.mps.textGen.TextGenManager;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SModelOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.util.JavaNameUtil;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.lang.traceable.behavior.UnitConcept_Behavior;

public class Interface_TextGen extends SNodeTextGen {
  public void doGenerateText(SNode node) {
    if (getBuffer().hasPositionsSupport()) {
      TraceInfoGenerationUtil.createUnitInfo(this, node);
    }
    BaseLanguageTextGen.fileHeader(node, this);
    BaseLanguageTextGen.annotations(node, this);
    BaseLanguageTextGen.visibilityWithIndent(SLinkOperations.getTarget(node, "visibility", true), this);
    if ((AttributeOperations.getAttribute(node, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.baseLanguage.javadoc.structure.ClassifierDocComment"))) != null)) {
      TextGenManager.instance().appendNodeText(this.getContext(), this.getBuffer(), AttributeOperations.getAttribute(node, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.baseLanguage.javadoc.structure.ClassifierDocComment"))), this.getSNode());
    }
    if (!(ListSequence.fromList(SModelOperations.getRoots(SNodeOperations.getModel(node), "jetbrains.mps.baseLanguage.structure.Interface")).contains(node))) {
      this.append("static ");
    }
    this.append("interface ");
    this.append(JavaNameUtil.shortName(SPropertyOperations.getString(node, "name")));
    GenericDeclarationTextGen2.typeDeclarations(node, this);
    if (ListSequence.fromList(SLinkOperations.getTargets(node, "extendedInterface", true)).isNotEmpty()) {
      this.append(" extends ");
      if (ListSequence.fromList(SLinkOperations.getTargets(node, "extendedInterface", true)).isNotEmpty()) {
        for (SNode item : SLinkOperations.getTargets(node, "extendedInterface", true)) {
          TextGenManager.instance().appendNodeText(this.getContext(), this.getBuffer(), item, this.getSNode());
          if (item != ListSequence.fromList(SLinkOperations.getTargets(node, "extendedInterface", true)).last()) {
            this.append(", ");
          }
        }
      }
    }
    this.append(" {");
    this.increaseDepth();
    if (ListSequence.fromList(SLinkOperations.getTargets(node, "staticField", true)).isNotEmpty()) {
      for (SNode item : SLinkOperations.getTargets(node, "staticField", true)) {
        TextGenManager.instance().appendNodeText(this.getContext(), this.getBuffer(), item, this.getSNode());
      }
    }
    if (ListSequence.fromList(SLinkOperations.getTargets(node, "method", true)).isNotEmpty()) {
      BaseLanguageTextGen.newLine(ListSequence.fromList(SLinkOperations.getTargets(node, "staticField", true)).isNotEmpty(), this);
      if (ListSequence.fromList(SLinkOperations.getTargets(node, "method", true)).isNotEmpty()) {
        for (SNode item : SLinkOperations.getTargets(node, "method", true)) {
          TextGenManager.instance().appendNodeText(this.getContext(), this.getBuffer(), item, this.getSNode());
        }
      }
    }
    if (ListSequence.fromList(SLinkOperations.getTargets(node, "staticInnerClassifiers", true)).isNotEmpty()) {
      this.appendNewLine();
      BaseClassConceptTextGen.innerClassifiers(node, this);
    }
    this.decreaseDepth();
    this.appendNewLine();
    if (node.isRoot()) {
      this.append("}");
    } else {
      this.appendWithIndent("}");
    }
    this.appendNewLine();
    if (getBuffer().hasPositionsSupport()) {
      TraceInfoGenerationUtil.fillUnitInfo(this, node, UnitConcept_Behavior.call_getUnitName_5067982036267369911(SNodeOperations.cast(node, "jetbrains.mps.lang.traceable.structure.UnitConcept")));
    }
  }

  public String getExtension(SNode node) {
    return "java";
  }
}
