package org.apache.flex.compiler.internal.as.codegen;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.apache.flex.compiler.tree.ASTNodeID;
import static org.apache.flex.compiler.tree.ASTNodeID.*;
import org.apache.flex.compiler.internal.as.codegen.CmcEmitter;

public class UnknownTreeHandlerPatterns
{

    //  Patterns generated Tue Oct 02 17:55:23 NOVT 2012 from C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/as/codegen/UnknownTreeHandlerPatterns.xml
    public static Map<ASTNodeID, ArrayList<UnknownTreeFinding.Template> > allTemplates = new HashMap<ASTNodeID, ArrayList<UnknownTreeFinding.Template>>();
    static
    {
        ArrayList<UnknownTreeFinding.Template> templates_for_Op_PostDecrID = allTemplates.get(Op_PostDecrID);
        if ( templates_for_Op_PostDecrID == null ) {
            templates_for_Op_PostDecrID = new ArrayList<UnknownTreeFinding.Template>();
            allTemplates.put(Op_PostDecrID, templates_for_Op_PostDecrID);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = Op_PostDecrID;
            current_template.problemClass = org.apache.flex.compiler.problems.DecrementMustBeReferenceProblem.class;
            current_template.cantHaveState = CmcEmitter.__expression_NT;
            current_template.provisional = false;
            templates_for_Op_PostDecrID.add(current_template);
        }
        ArrayList<UnknownTreeFinding.Template> templates_for_ForEachLoopID = allTemplates.get(ForEachLoopID);
        if ( templates_for_ForEachLoopID == null ) {
            templates_for_ForEachLoopID = new ArrayList<UnknownTreeFinding.Template>();
            allTemplates.put(ForEachLoopID, templates_for_ForEachLoopID);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = ForEachLoopID;
            current_template.problemClass = org.apache.flex.compiler.problems.BURMDiagnosticForEachExpectedInProblem.class;
            current_template.cantHaveState = CmcEmitter.__statement_NT;
            current_template.provisional = false;
            UnknownTreeFinding.Template current_template_subtempl = new UnknownTreeFinding.Template();
            current_template_subtempl.id = ContainerID;
            current_template_subtempl.provisional = false;
            UnknownTreeFinding.Template current_template_subtempl_subtempl = new UnknownTreeFinding.Template();
            current_template_subtempl_subtempl.id = UnknownID;
            current_template_subtempl_subtempl.nodeClass = org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase.class;
            current_template_subtempl_subtempl.provisional = false;
            current_template_subtempl.requiredSubtree = current_template_subtempl_subtempl;
            current_template.requiredSubtree = current_template_subtempl;
            templates_for_ForEachLoopID.add(current_template);
        }
        ArrayList<UnknownTreeFinding.Template> templates_for_SetterID = allTemplates.get(SetterID);
        if ( templates_for_SetterID == null ) {
            templates_for_SetterID = new ArrayList<UnknownTreeFinding.Template>();
            allTemplates.put(SetterID, templates_for_SetterID);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = SetterID;
            current_template.problemClass = org.apache.flex.compiler.problems.NestedGetterSetterProblem.class;
            current_template.cantHaveState = CmcEmitter.__statement_NT;
            current_template.provisional = false;
            templates_for_SetterID.add(current_template);
        }
        ArrayList<UnknownTreeFinding.Template> templates_for_Op_DescendantsID = allTemplates.get(Op_DescendantsID);
        if ( templates_for_Op_DescendantsID == null ) {
            templates_for_Op_DescendantsID = new ArrayList<UnknownTreeFinding.Template>();
            allTemplates.put(Op_DescendantsID, templates_for_Op_DescendantsID);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = Op_DescendantsID;
            current_template.problemClass = org.apache.flex.compiler.problems.CannotDeleteSuperDescendantsProblem.class;
            current_template.cantHaveState = CmcEmitter.__expression_NT;
            current_template.provisional = false;
            UnknownTreeFinding.Template current_template_subtempl = new UnknownTreeFinding.Template();
            current_template_subtempl.id = SuperID;
            current_template_subtempl.provisional = false;
            current_template.requiredSubtree = current_template_subtempl;
            templates_for_Op_DescendantsID.add(current_template);
        }
        ArrayList<UnknownTreeFinding.Template> templates_for_BlockID = allTemplates.get(BlockID);
        if ( templates_for_BlockID == null ) {
            templates_for_BlockID = new ArrayList<UnknownTreeFinding.Template>();
            allTemplates.put(BlockID, templates_for_BlockID);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = BlockID;
            current_template.problemClass = org.apache.flex.compiler.problems.BURMPatternMatchFailureProblem.class;
            current_template.cantHaveState = CmcEmitter.__statement_NT;
            current_template.provisional = true;
            UnknownTreeFinding.Template current_template_subtempl = new UnknownTreeFinding.Template();
            current_template_subtempl.id = UnknownID;
            current_template_subtempl.cantHaveState = CmcEmitter.__statement_NT;
            current_template_subtempl.provisional = false;
            current_template.requiredSubtree = current_template_subtempl;
            templates_for_BlockID.add(current_template);
        }
        ArrayList<UnknownTreeFinding.Template> templates_for_NamespaceID = allTemplates.get(NamespaceID);
        if ( templates_for_NamespaceID == null ) {
            templates_for_NamespaceID = new ArrayList<UnknownTreeFinding.Template>();
            allTemplates.put(NamespaceID, templates_for_NamespaceID);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = NamespaceID;
            current_template.problemClass = org.apache.flex.compiler.problems.InvalidNamespaceInitializerProblem.class;
            current_template.provisional = true;
            templates_for_NamespaceID.add(current_template);
        }
        ArrayList<UnknownTreeFinding.Template> templates_for_Op_PreDecrID = allTemplates.get(Op_PreDecrID);
        if ( templates_for_Op_PreDecrID == null ) {
            templates_for_Op_PreDecrID = new ArrayList<UnknownTreeFinding.Template>();
            allTemplates.put(Op_PreDecrID, templates_for_Op_PreDecrID);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = Op_PreDecrID;
            current_template.problemClass = org.apache.flex.compiler.problems.DecrementMustBeReferenceProblem.class;
            current_template.cantHaveState = CmcEmitter.__expression_NT;
            current_template.provisional = false;
            templates_for_Op_PreDecrID.add(current_template);
        }
        ArrayList<UnknownTreeFinding.Template> templates_for_Op_PostIncrID = allTemplates.get(Op_PostIncrID);
        if ( templates_for_Op_PostIncrID == null ) {
            templates_for_Op_PostIncrID = new ArrayList<UnknownTreeFinding.Template>();
            allTemplates.put(Op_PostIncrID, templates_for_Op_PostIncrID);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = Op_PostIncrID;
            current_template.problemClass = org.apache.flex.compiler.problems.IncrementMustBeReferenceProblem.class;
            current_template.cantHaveState = CmcEmitter.__expression_NT;
            current_template.provisional = false;
            templates_for_Op_PostIncrID.add(current_template);
        }
        ArrayList<UnknownTreeFinding.Template> templates_for_Op_PreIncrID = allTemplates.get(Op_PreIncrID);
        if ( templates_for_Op_PreIncrID == null ) {
            templates_for_Op_PreIncrID = new ArrayList<UnknownTreeFinding.Template>();
            allTemplates.put(Op_PreIncrID, templates_for_Op_PreIncrID);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = Op_PreIncrID;
            current_template.problemClass = org.apache.flex.compiler.problems.IncrementMustBeReferenceProblem.class;
            current_template.cantHaveState = CmcEmitter.__expression_NT;
            current_template.provisional = false;
            templates_for_Op_PreIncrID.add(current_template);
        }
        ArrayList<UnknownTreeFinding.Template> templates_for_ArgumentID = allTemplates.get(ArgumentID);
        if ( templates_for_ArgumentID == null ) {
            templates_for_ArgumentID = new ArrayList<UnknownTreeFinding.Template>();
            allTemplates.put(ArgumentID, templates_for_ArgumentID);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = ArgumentID;
            current_template.problemClass = org.apache.flex.compiler.problems.BURMDiagnosticNotAllowedHereProblem.class;
            current_template.provisional = false;
            UnknownTreeFinding.Template current_template_subtempl = new UnknownTreeFinding.Template();
            current_template_subtempl.id = KeywordConstID;
            current_template_subtempl.provisional = false;
            current_template.requiredSubtree = current_template_subtempl;
            templates_for_ArgumentID.add(current_template);
        }
        ArrayList<UnknownTreeFinding.Template> templates_for_UnknownID = allTemplates.get(UnknownID);
        if ( templates_for_UnknownID == null ) {
            templates_for_UnknownID = new ArrayList<UnknownTreeFinding.Template>();
            allTemplates.put(UnknownID, templates_for_UnknownID);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = UnknownID;
            current_template.problemClass = org.apache.flex.compiler.problems.BURMDiagnosticNotAllowedHereProblem.class;
            current_template.nodeClass = org.apache.flex.compiler.internal.tree.as.BinaryOperatorNodeBase.class;
            current_template.provisional = true;
            UnknownTreeFinding.Template current_template_subtempl = new UnknownTreeFinding.Template();
            current_template_subtempl.id = UnknownID;
            current_template_subtempl.nodeClass = org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase.class;
            current_template_subtempl.cantHaveState = CmcEmitter.__expression_NT;
            current_template_subtempl.provisional = false;
            current_template.requiredSubtree = current_template_subtempl;
            templates_for_UnknownID.add(current_template);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = UnknownID;
            current_template.problemClass = org.apache.flex.compiler.problems.BURMDiagnosticNotAllowedHereProblem.class;
            current_template.nodeClass = org.apache.flex.compiler.internal.tree.as.UnaryOperatorNodeBase.class;
            current_template.provisional = true;
            UnknownTreeFinding.Template current_template_subtempl = new UnknownTreeFinding.Template();
            current_template_subtempl.id = UnknownID;
            current_template_subtempl.nodeClass = org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase.class;
            current_template_subtempl.cantHaveState = CmcEmitter.__expression_NT;
            current_template_subtempl.provisional = false;
            current_template.requiredSubtree = current_template_subtempl;
            templates_for_UnknownID.add(current_template);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = UnknownID;
            current_template.problemClass = org.apache.flex.compiler.problems.BURMDiagnosticNotAllowedHereProblem.class;
            current_template.nodeClass = org.apache.flex.compiler.internal.tree.as.OperatorNodeBase.class;
            current_template.cantHaveState = CmcEmitter.__expression_NT;
            current_template.provisional = true;
            templates_for_UnknownID.add(current_template);
        }
        ArrayList<UnknownTreeFinding.Template> templates_for_GetterID = allTemplates.get(GetterID);
        if ( templates_for_GetterID == null ) {
            templates_for_GetterID = new ArrayList<UnknownTreeFinding.Template>();
            allTemplates.put(GetterID, templates_for_GetterID);
        }
        {
            UnknownTreeFinding.Template current_template = new UnknownTreeFinding.Template();
            current_template.id = GetterID;
            current_template.problemClass = org.apache.flex.compiler.problems.NestedGetterSetterProblem.class;
            current_template.cantHaveState = CmcEmitter.__statement_NT;
            current_template.provisional = false;
            templates_for_GetterID.add(current_template);
        }
    }
}
