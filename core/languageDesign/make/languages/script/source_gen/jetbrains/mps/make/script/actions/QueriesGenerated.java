package jetbrains.mps.make.script.actions;

/*Generated by MPS */

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.action.NodeSubstitutePreconditionContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.smodel.action.SideTransformPreconditionContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import java.util.List;
import jetbrains.mps.smodel.action.INodeSubstituteAction;
import jetbrains.mps.smodel.action.NodeSubstituteActionsFactoryContext;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.Calculable;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SEnumOperations;
import jetbrains.mps.smodel.action.DefaultChildNodeSubstituteAction;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.action.SNodeFactoryOperations;
import jetbrains.mps.smodel.action.ChildSubstituteActionsHelper;
import jetbrains.mps.smodel.action.DefaultSimpleSubstituteAction;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptPropertyOperations;
import jetbrains.mps.smodel.action.SideTransformActionsBuilderContext;
import jetbrains.mps.smodel.action.AbstractSideTransformHintSubstituteAction;
import java.util.Set;
import java.util.HashSet;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class QueriesGenerated {
  public static boolean nodeSubstituteActionsBuilder_Precondition_Statement_2360002718792651973(final IOperationContext operationContext, final NodeSubstitutePreconditionContext _context) {
    SNode anc = SNodeOperations.getAncestorWhereConceptInList(_context.getParentNode(), new String[]{"jetbrains.mps.make.script.structure.JobDefinition", "jetbrains.mps.make.script.structure.ConfigDefinition", "jetbrains.mps.baseLanguage.structure.IStatementListContainer"}, false, false);
    return SNodeOperations.isInstanceOf(anc, "jetbrains.mps.make.script.structure.JobDefinition") || SNodeOperations.isInstanceOf(anc, "jetbrains.mps.make.script.structure.ConfigDefinition");
  }

  public static boolean nodeSubstituteActionsBuilder_Precondition_OutputResources_2360002718792652029(final IOperationContext operationContext, final NodeSubstitutePreconditionContext _context) {
    return SNodeOperations.isInstanceOf(SNodeOperations.getAncestorWhereConceptInList(_context.getParentNode(), new String[]{"jetbrains.mps.make.script.structure.JobDefinition", "jetbrains.mps.baseLanguage.structure.IStatementListContainer"}, false, false), "jetbrains.mps.make.script.structure.JobDefinition");
  }

  public static boolean nodeSubstituteActionsBuilder_Precondition_Expression_1977954644795375338(final IOperationContext operationContext, final NodeSubstitutePreconditionContext _context) {
    return (SNodeOperations.getAncestorWhereConceptInList(_context.getParentNode(), new String[]{"jetbrains.mps.baseLanguage.structure.IStatementListContainer", "jetbrains.mps.make.script.structure.ConfigDefinition"}, false, false) == null);
  }

  public static boolean nodeSubstituteActionsBuilder_Precondition_Statement_3668957831723381945(final IOperationContext operationContext, final NodeSubstitutePreconditionContext _context) {
    return (SNodeOperations.getAncestor(_context.getParentNode(), "jetbrains.mps.make.script.structure.JobDefinition", false, false) != null);
  }

  public static boolean nodeSubstituteActionsBuilder_Precondition_Statement_187226666892820055(final IOperationContext operationContext, final NodeSubstitutePreconditionContext _context) {
    return (SNodeOperations.getAncestor(_context.getParentNode(), "jetbrains.mps.make.script.structure.JobDefinition", false, false) != null);
  }

  public static boolean nodeSubstituteActionsBuilder_Precondition_Expression_3297237684108627751(final IOperationContext operationContext, final NodeSubstitutePreconditionContext _context) {
    return SNodeOperations.isInstanceOf(_context.getParentNode(), "jetbrains.mps.make.script.structure.BeginWorkStatement") && SLinkOperations.findLinkDeclaration("jetbrains.mps.make.script.structure.BeginWorkStatement", "ofTotal") == _context.getLink();
  }

  public static boolean sideTransformHintSubstituteActionsBuilder_Precondition_Option_3681941909241126023(final IOperationContext operationContext, final SideTransformPreconditionContext _context) {
    return SNodeOperations.getIndexInParent(_context.getSourceNode()) != SPropertyOperations.getInteger(SNodeOperations.as(SNodeOperations.getParent(_context.getSourceNode()), "jetbrains.mps.make.script.structure.ExpectedOption"), "defaultOption");
  }

  public static List<INodeSubstituteAction> nodeSubstituteActionsBuilder_ActionsFactory_Statement_7077360340906499515(final IOperationContext operationContext, final NodeSubstituteActionsFactoryContext _context) {
    List<INodeSubstituteAction> result = ListSequence.fromList(new ArrayList<INodeSubstituteAction>());
    {
      SNode outputConcept = SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.ResultStatement");
      SNode childConcept = (SNode) _context.getChildConcept();
      if (SConceptOperations.isSuperConceptOf(childConcept, NameUtil.nodeFQName(outputConcept))) {
        Calculable calc = new Calculable() {
          public Object calculate() {
            return SEnumOperations.getEnumMembers(SEnumOperations.getEnum("r:308041c6-80bc-4e26-b4b1-473fd45c9339(jetbrains.mps.make.script.structure)", "Result"));
          }
        };
        Iterable<SNode> queryResult = (Iterable) calc.calculate();
        if (queryResult != null) {
          for (final SNode item : queryResult) {
            ListSequence.fromList(result).addElement(new DefaultChildNodeSubstituteAction(outputConcept, item, _context.getParentNode(), _context.getCurrentTargetNode(), _context.getChildSetter(), operationContext.getScope()) {
              public SNode createChildNode(Object parameterObject, SModel model, String pattern) {
                SNode rs = SNodeFactoryOperations.createNewNode(model, "jetbrains.mps.make.script.structure.ResultStatement", null);
                SPropertyOperations.set(rs, "result", SEnumOperations.getEnumMemberValue((item)));
                return rs;
              }

              public String getMatchingText(String pattern) {
                return SEnumOperations.getEnumMemberName((item));
              }

              public String getVisibleMatchingText(String pattern) {
                return this.getMatchingText(pattern);
              }
            });
          }
        }
      }
    }
    return result;
  }

  public static List<INodeSubstituteAction> nodeSubstituteActionsBuilder_ActionsFactory_OutputResources_2360002718792652028(final IOperationContext operationContext, final NodeSubstituteActionsFactoryContext _context) {
    List<INodeSubstituteAction> result = ListSequence.fromList(new ArrayList<INodeSubstituteAction>());
    {
      SNode conceptToAdd = SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.OutputResources");
      List<INodeSubstituteAction> defaultActions = ChildSubstituteActionsHelper.createDefaultActions(conceptToAdd, _context.getParentNode(), _context.getCurrentTargetNode(), _context.getChildSetter(), operationContext);
      ListSequence.fromList(result).addSequence(ListSequence.fromList(defaultActions));
    }
    return result;
  }

  public static List<INodeSubstituteAction> nodeSubstituteActionsBuilder_ActionsFactory_Expression_1977954644795375337(final IOperationContext operationContext, final NodeSubstituteActionsFactoryContext _context) {
    List<INodeSubstituteAction> result = ListSequence.fromList(new ArrayList<INodeSubstituteAction>());
    {
      SNode conceptToAdd = SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.RelayQueryExpression");
      List<INodeSubstituteAction> defaultActions = ChildSubstituteActionsHelper.createDefaultActions(conceptToAdd, _context.getParentNode(), _context.getCurrentTargetNode(), _context.getChildSetter(), operationContext);
      ListSequence.fromList(result).addSequence(ListSequence.fromList(defaultActions));
    }
    return result;
  }

  public static List<INodeSubstituteAction> nodeSubstituteActionsBuilder_ActionsFactory_Statement_3668957831723381944(final IOperationContext operationContext, final NodeSubstituteActionsFactoryContext _context) {
    List<INodeSubstituteAction> result = ListSequence.fromList(new ArrayList<INodeSubstituteAction>());
    {
      SNode outputConcept = SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.ReportFeedbackStatement");
      SNode childConcept = (SNode) _context.getChildConcept();
      if (SConceptOperations.isSuperConceptOf(childConcept, NameUtil.nodeFQName(outputConcept))) {
        Calculable calc = new Calculable() {
          public Object calculate() {
            return SEnumOperations.getEnumMembers(SEnumOperations.getEnum("r:308041c6-80bc-4e26-b4b1-473fd45c9339(jetbrains.mps.make.script.structure)", "Feedback"));
          }
        };
        Iterable<SNode> queryResult = (Iterable) calc.calculate();
        if (queryResult != null) {
          for (final SNode item : queryResult) {
            ListSequence.fromList(result).addElement(new DefaultChildNodeSubstituteAction(outputConcept, item, _context.getParentNode(), _context.getCurrentTargetNode(), _context.getChildSetter(), operationContext.getScope()) {
              public SNode createChildNode(Object parameterObject, SModel model, String pattern) {
                return new QueriesGenerated.QuotationClass_x583g4_a0a0a0a0a0a0a0c0c0a0b0k().createNode(SEnumOperations.getEnumMemberValue((item)));
              }

              public String getMatchingText(String pattern) {
                return "report " + (item);
              }

              public String getVisibleMatchingText(String pattern) {
                return this.getMatchingText(pattern);
              }
            });
          }
        }
      }
    }
    return result;
  }

  public static List<INodeSubstituteAction> nodeSubstituteActionsBuilder_ActionsFactory_Statement_187226666892820054(final IOperationContext operationContext, final NodeSubstituteActionsFactoryContext _context) {
    List<INodeSubstituteAction> result = ListSequence.fromList(new ArrayList<INodeSubstituteAction>());
    {
      SNode outputConcept = SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.BeginWorkStatement");
      SNode childConcept = (SNode) _context.getChildConcept();
      if (outputConcept == null || SConceptOperations.isSuperConceptOf(childConcept, NameUtil.nodeFQName(outputConcept))) {
        ListSequence.fromList(result).addElement(new DefaultSimpleSubstituteAction(outputConcept, _context.getParentNode(), _context.getCurrentTargetNode(), _context.getChildSetter(), operationContext.getScope()) {
          public SNode createChildNode(Object parameterObject, SModel model, String pattern) {
            return new QueriesGenerated.QuotationClass_x583g4_a0a0a0a0a0a0c0a0b0l().createNode();
          }

          public String getMatchingText(String pattern) {
            return SConceptPropertyOperations.getString(SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.BeginWorkStatement"), "alias");
          }

          public String getVisibleMatchingText(String pattern) {
            return this.getMatchingText(pattern);
          }
        });
      }
    }
    {
      SNode conceptToAdd = SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.AdvanceWorkStatement");
      List<INodeSubstituteAction> defaultActions = ChildSubstituteActionsHelper.createDefaultActions(conceptToAdd, _context.getParentNode(), _context.getCurrentTargetNode(), _context.getChildSetter(), operationContext);
      ListSequence.fromList(result).addSequence(ListSequence.fromList(defaultActions));
    }
    {
      SNode conceptToAdd = SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.FinishWorkStatement");
      List<INodeSubstituteAction> defaultActions = ChildSubstituteActionsHelper.createDefaultActions(conceptToAdd, _context.getParentNode(), _context.getCurrentTargetNode(), _context.getChildSetter(), operationContext);
      ListSequence.fromList(result).addSequence(ListSequence.fromList(defaultActions));
    }
    {
      SNode outputConcept = SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.AdvanceWorkStatement");
      SNode childConcept = (SNode) _context.getChildConcept();
      if (SConceptOperations.isSuperConceptOf(childConcept, NameUtil.nodeFQName(outputConcept))) {
        Calculable calc = new Calculable() {
          public Object calculate() {
            return SNodeOperations.getDescendants(SLinkOperations.getTarget(SNodeOperations.getAncestor(_context.getParentNode(), "jetbrains.mps.make.script.structure.JobDefinition", false, false), "body", true), "jetbrains.mps.make.script.structure.BeginWorkStatement", false, new String[]{});
          }
        };
        Iterable<SNode> queryResult = (Iterable) calc.calculate();
        if (queryResult != null) {
          for (final SNode item : queryResult) {
            ListSequence.fromList(result).addElement(new DefaultChildNodeSubstituteAction(outputConcept, item, _context.getParentNode(), _context.getCurrentTargetNode(), _context.getChildSetter(), operationContext.getScope()) {
              public SNode createChildNode(Object parameterObject, SModel model, String pattern) {
                return new QueriesGenerated.QuotationClass_x583g4_a0a0a0a0a0a0a0c0c0a0e0l().createNode((item));
              }

              public String getMatchingText(String pattern) {
                return SConceptPropertyOperations.getString(SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.AdvanceWorkStatement"), "alias") + " <amount> of " + SPropertyOperations.getString((item), "workName");
              }

              public String getVisibleMatchingText(String pattern) {
                return this.getMatchingText(pattern);
              }
            });
          }
        }
      }
    }
    {
      SNode outputConcept = SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.FinishWorkStatement");
      SNode childConcept = (SNode) _context.getChildConcept();
      if (SConceptOperations.isSuperConceptOf(childConcept, NameUtil.nodeFQName(outputConcept))) {
        Calculable calc = new Calculable() {
          public Object calculate() {
            return SNodeOperations.getDescendants(SLinkOperations.getTarget(SNodeOperations.getAncestor(_context.getParentNode(), "jetbrains.mps.make.script.structure.JobDefinition", false, false), "body", true), "jetbrains.mps.make.script.structure.BeginWorkStatement", false, new String[]{});
          }
        };
        Iterable<SNode> queryResult = (Iterable) calc.calculate();
        if (queryResult != null) {
          for (final SNode item : queryResult) {
            ListSequence.fromList(result).addElement(new DefaultChildNodeSubstituteAction(outputConcept, item, _context.getParentNode(), _context.getCurrentTargetNode(), _context.getChildSetter(), operationContext.getScope()) {
              public SNode createChildNode(Object parameterObject, SModel model, String pattern) {
                return new QueriesGenerated.QuotationClass_x583g4_a0a0a0a0a0a0a0c0c0a0f0l().createNode((item));
              }

              public String getMatchingText(String pattern) {
                return SConceptPropertyOperations.getString(SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.FinishWorkStatement"), "alias") + " " + SPropertyOperations.getString((item), "workName");
              }

              public String getVisibleMatchingText(String pattern) {
                return this.getMatchingText(pattern);
              }
            });
          }
        }
      }
    }
    return result;
  }

  public static List<INodeSubstituteAction> nodeSubstituteActionsBuilder_ActionsFactory_Expression_3297237684108627750(final IOperationContext operationContext, final NodeSubstituteActionsFactoryContext _context) {
    List<INodeSubstituteAction> result = ListSequence.fromList(new ArrayList<INodeSubstituteAction>());
    {
      SNode conceptToAdd = SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.AllWorkLeftExpression");
      List<INodeSubstituteAction> defaultActions = ChildSubstituteActionsHelper.createDefaultActions(conceptToAdd, _context.getParentNode(), _context.getCurrentTargetNode(), _context.getChildSetter(), operationContext);
      ListSequence.fromList(result).addSequence(ListSequence.fromList(defaultActions));
    }
    return result;
  }

  public static List<INodeSubstituteAction> sideTransform_ActionsFactory_Option_3681941909241126021(final IOperationContext operationContext, final SideTransformActionsBuilderContext _context) {
    List<INodeSubstituteAction> result = ListSequence.fromList(new ArrayList<INodeSubstituteAction>());
    {
      SNode concept = SConceptOperations.findConceptDeclaration("jetbrains.mps.make.script.structure.Option");
      ListSequence.fromList(result).addElement(new AbstractSideTransformHintSubstituteAction(concept, _context.getSourceNode()) {
        public SNode doSubstitute(String pattern) {
          SPropertyOperations.set(SNodeOperations.as(SNodeOperations.getParent(_context.getSourceNode()), "jetbrains.mps.make.script.structure.ExpectedOption"), "defaultOption", "" + SNodeOperations.getIndexInParent(_context.getSourceNode()));
          return _context.getSourceNode();
        }

        public String getMatchingText(String pattern) {
          return "default";
        }

        public String getVisibleMatchingText(String pattern) {
          return this.getMatchingText(pattern);
        }

        public String getDescriptionText(String pattern) {
          return "make default";
        }
      });
    }
    return result;
  }

  public static class QuotationClass_x583g4_a0a0a0a0a0a0a0c0c0a0b0k {
    public QuotationClass_x583g4_a0a0a0a0a0a0a0c0c0a0b0k() {
    }

    public SNode createNode(Object parameter_5) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      SNode quotedNode_2 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.make.script.structure.ReportFeedbackStatement", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_3 = quotedNode_1;
        quotedNode1_3.setProperty("feedback", (String) parameter_5);
        {
          quotedNode_2 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.Expression", null, GlobalScope.getInstance(), false);
          SNode quotedNode1_4 = quotedNode_2;
          quotedNode_1.addChild("message", quotedNode1_4);
        }
        result = quotedNode1_3;
      }
      return result;
    }
  }

  public static class QuotationClass_x583g4_a0a0a0a0a0a0c0a0b0l {
    public QuotationClass_x583g4_a0a0a0a0a0a0c0a0b0l() {
    }

    public SNode createNode() {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      SNode quotedNode_2 = null;
      SNode quotedNode_3 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.make.script.structure.BeginWorkStatement", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_4 = quotedNode_1;
        {
          quotedNode_2 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.Expression", null, GlobalScope.getInstance(), false);
          SNode quotedNode1_5 = quotedNode_2;
          quotedNode_1.addChild("expected", quotedNode1_5);
        }
        {
          quotedNode_3 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.make.script.structure.AllWorkLeftExpression", null, GlobalScope.getInstance(), false);
          SNode quotedNode1_6 = quotedNode_3;
          quotedNode_1.addChild("ofTotal", quotedNode1_6);
        }
        result = quotedNode1_4;
      }
      return result;
    }
  }

  public static class QuotationClass_x583g4_a0a0a0a0a0a0a0c0c0a0e0l {
    public QuotationClass_x583g4_a0a0a0a0a0a0a0c0c0a0e0l() {
    }

    public SNode createNode(Object parameter_5) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      SNode quotedNode_2 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.make.script.structure.AdvanceWorkStatement", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_3 = quotedNode_1;
        quotedNode1_3.setReferent("workStatement", (SNode) parameter_5);
        {
          quotedNode_2 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.Expression", null, GlobalScope.getInstance(), false);
          SNode quotedNode1_4 = quotedNode_2;
          quotedNode_1.addChild("amount", quotedNode1_4);
        }
        result = quotedNode1_3;
      }
      return result;
    }
  }

  public static class QuotationClass_x583g4_a0a0a0a0a0a0a0c0c0a0f0l {
    public QuotationClass_x583g4_a0a0a0a0a0a0a0c0c0a0f0l() {
    }

    public SNode createNode(Object parameter_3) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.make.script.structure.FinishWorkStatement", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_2 = quotedNode_1;
        quotedNode1_2.setReferent("workStatement", (SNode) parameter_3);
        result = quotedNode1_2;
      }
      return result;
    }
  }
}
