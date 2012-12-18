package jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main;

/*Generated by MPS */

import jetbrains.mps.generator.runtime.TemplateDeclarationWeavingAware;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;
import jetbrains.mps.generator.runtime.TemplateExecutionEnvironment;
import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.generator.runtime.GenerationException;
import jetbrains.mps.generator.runtime.TemplateUtil;
import jetbrains.mps.generator.template.PropertyMacroContext;
import java.util.Collection;
import jetbrains.mps.generator.template.TemplateFragmentContext;

public class Templateweave__Statement implements TemplateDeclarationWeavingAware {
  private static SNodePointer templateNode_1j9q6b_a0a0a1a1 = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009934888");
  private static SNodePointer propertyMacro_1j9q6b_c0b0b0a2a1a1 = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009934893");
  private static SNodePointer templateNode_1j9q6b_a0a0a1a4a1a1 = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009934889");
  private static SNodePointer templateNode_1j9q6b_a0a0a1a5a1a1 = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009934890");
  private static SNodePointer templateNode_1j9q6b_a0a0a1a6a1a1 = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009934891");
  private static SNodePointer templateNode_1j9q6b_a0a0a1a3a1a6a1a1 = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009937372");
  private static SNodePointer templateNode_1j9q6b_a0a0a1a3a1a3a1a6a1a1 = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009937375");
  private static SNodePointer propertyMacro_1j9q6b_c0b0b0a2a1a3a1a3a1a6a1a1 = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009937376");
  private static SNodePointer templateNode_1j9q6b_a0a0a1a2 = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009937422");
  private static SNodePointer templateNode_1j9q6b_a0a0a1a3a1a2 = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009937424");
  private static SNodePointer propertyMacro_1j9q6b_c0b0b0a2a1a3a1a2 = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009937426");
  private static SNodePointer weaveTfConst_1j9q6b_a0b0e = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009934892");
  private static SNodePointer weaveTfConst_1j9q6b_a0e0e = new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009937429");

  public Templateweave__Statement() {
  }

  public SNodePointer getTemplateNode() {
    return new SNodePointer("r:00000000-0000-4000-0000-011c89590606(jetbrains.mps.transformation.test.outputLang.generator.baseLanguage.template.main@generator)", "3571912445009934880");
  }

  protected SNode applyPart0(@NotNull final TemplateExecutionEnvironment environment, @NotNull final TemplateContext context) throws GenerationException {
    final SNode tnode1 = new SNode(environment.getOutputModel(), "jetbrains.mps.baseLanguage.structure.StaticMethodDeclaration", false);
    try {
      environment.getTracer().pushTemplateNode(templateNode_1j9q6b_a0a0a1a1);
      environment.nodeCopied(context, tnode1, "tpl/r:00000000-0000-4000-0000-011c89590606/3571912445009934888");
      tnode1.setProperty("name", TemplateUtil.asString(QueriesGenerated.propertyMacro_GetPropertyValue_3571912445009934894(environment.getOperationContext(), new PropertyMacroContext(context.getInput(), "statementX", propertyMacro_1j9q6b_c0b0b0a2a1a1, context, environment.getGenerator()))));

      {
        final SNode tnode2 = new SNode(environment.getOutputModel(), "jetbrains.mps.baseLanguage.structure.VoidType", false);
        try {
          environment.getTracer().pushTemplateNode(templateNode_1j9q6b_a0a0a1a4a1a1);
          environment.nodeCopied(context, tnode2, "tpl/r:00000000-0000-4000-0000-011c89590606/3571912445009934889");

        } finally {
          environment.getTracer().pushOutputNode(tnode2);
          environment.getTracer().closeTemplateNode(templateNode_1j9q6b_a0a0a1a4a1a1);
        }
        if (tnode2 != null) {
          tnode1.addChild("returnType", tnode2);
        }
        // TODO validate child 
      }
      {
        final SNode tnode3 = new SNode(environment.getOutputModel(), "jetbrains.mps.baseLanguage.structure.PublicVisibility", false);
        try {
          environment.getTracer().pushTemplateNode(templateNode_1j9q6b_a0a0a1a5a1a1);
          environment.nodeCopied(context, tnode3, "tpl/r:00000000-0000-4000-0000-011c89590606/3571912445009934890");

        } finally {
          environment.getTracer().pushOutputNode(tnode3);
          environment.getTracer().closeTemplateNode(templateNode_1j9q6b_a0a0a1a5a1a1);
        }
        if (tnode3 != null) {
          tnode1.addChild("visibility", tnode3);
        }
        // TODO validate child 
      }
      {
        final SNode tnode4 = new SNode(environment.getOutputModel(), "jetbrains.mps.baseLanguage.structure.StatementList", false);
        try {
          environment.getTracer().pushTemplateNode(templateNode_1j9q6b_a0a0a1a6a1a1);
          environment.nodeCopied(context, tnode4, "tpl/r:00000000-0000-4000-0000-011c89590606/3571912445009934891");

          {
            final SNode tnode5 = new SNode(environment.getOutputModel(), "jetbrains.mps.baseLanguage.structure.SingleLineComment", false);
            try {
              environment.getTracer().pushTemplateNode(templateNode_1j9q6b_a0a0a1a3a1a6a1a1);
              environment.nodeCopied(context, tnode5, "tpl/r:00000000-0000-4000-0000-011c89590606/3571912445009937372");

              {
                final SNode tnode6 = new SNode(environment.getOutputModel(), "jetbrains.mps.baseLanguage.structure.TextCommentPart", false);
                try {
                  environment.getTracer().pushTemplateNode(templateNode_1j9q6b_a0a0a1a3a1a3a1a6a1a1);
                  environment.nodeCopied(context, tnode6, "tpl/r:00000000-0000-4000-0000-011c89590606/3571912445009937375");
                  tnode6.setProperty("text", TemplateUtil.asString(QueriesGenerated.propertyMacro_GetPropertyValue_3571912445009937377(environment.getOperationContext(), new PropertyMacroContext(context.getInput(), "a", propertyMacro_1j9q6b_c0b0b0a2a1a3a1a3a1a6a1a1, context, environment.getGenerator()))));

                } finally {
                  environment.getTracer().pushOutputNode(tnode6);
                  environment.getTracer().closeTemplateNode(templateNode_1j9q6b_a0a0a1a3a1a3a1a6a1a1);
                }
                if (tnode6 != null) {
                  tnode5.addChild("commentPart", tnode6);
                }
                // TODO validate child 
              }
            } finally {
              environment.getTracer().pushOutputNode(tnode5);
              environment.getTracer().closeTemplateNode(templateNode_1j9q6b_a0a0a1a3a1a6a1a1);
            }
            if (tnode5 != null) {
              tnode4.addChild("statement", tnode5);
            }
            // TODO validate child 
          }
        } finally {
          environment.getTracer().pushOutputNode(tnode4);
          environment.getTracer().closeTemplateNode(templateNode_1j9q6b_a0a0a1a6a1a1);
        }
        if (tnode4 != null) {
          tnode1.addChild("body", tnode4);
        }
        // TODO validate child 
      }
    } finally {
      environment.getTracer().pushOutputNode(tnode1);
      environment.getTracer().closeTemplateNode(templateNode_1j9q6b_a0a0a1a1);
    }
    return tnode1;
  }

  protected SNode applyPart1(@NotNull final TemplateExecutionEnvironment environment, @NotNull final TemplateContext context) throws GenerationException {
    final SNode tnode7 = new SNode(environment.getOutputModel(), "jetbrains.mps.baseLanguage.structure.SingleLineComment", false);
    try {
      environment.getTracer().pushTemplateNode(templateNode_1j9q6b_a0a0a1a2);
      environment.nodeCopied(context, tnode7, "tpl/r:00000000-0000-4000-0000-011c89590606/3571912445009937422");

      {
        final SNode tnode8 = new SNode(environment.getOutputModel(), "jetbrains.mps.baseLanguage.structure.TextCommentPart", false);
        try {
          environment.getTracer().pushTemplateNode(templateNode_1j9q6b_a0a0a1a3a1a2);
          environment.nodeCopied(context, tnode8, "tpl/r:00000000-0000-4000-0000-011c89590606/3571912445009937424");
          tnode8.setProperty("text", TemplateUtil.asString(QueriesGenerated.propertyMacro_GetPropertyValue_3571912445009937427(environment.getOperationContext(), new PropertyMacroContext(context.getInput(), "to ctor ", propertyMacro_1j9q6b_c0b0b0a2a1a3a1a2, context, environment.getGenerator()))));

        } finally {
          environment.getTracer().pushOutputNode(tnode8);
          environment.getTracer().closeTemplateNode(templateNode_1j9q6b_a0a0a1a3a1a2);
        }
        if (tnode8 != null) {
          tnode7.addChild("commentPart", tnode8);
        }
        // TODO validate child 
      }
    } finally {
      environment.getTracer().pushOutputNode(tnode7);
      environment.getTracer().closeTemplateNode(templateNode_1j9q6b_a0a0a1a2);
    }
    return tnode7;
  }

  public Collection<SNode> apply(@NotNull TemplateExecutionEnvironment environment, @NotNull TemplateContext context) throws GenerationException {
    return TemplateUtil.asList(applyPart0(environment, context), applyPart1(environment, context));
  }

  public Collection<SNode> weave(@NotNull TemplateExecutionEnvironment environment, @NotNull TemplateContext context, @NotNull SNode outputContextNode) throws GenerationException {
    SNode tnodepart0 = applyPart0(environment, context);
    SNodePointer weaveTf0 = weaveTfConst_1j9q6b_a0b0e;
    environment.weaveNode(outputContextNode, "staticMethod", tnodepart0, weaveTf0, context.getInput());
    SNode tnodepart1 = applyPart1(environment, context);
    SNodePointer weaveTf1 = weaveTfConst_1j9q6b_a0e0e;
    SNode contextNode1 = QueriesGenerated.templateFragment_ContextNodeQuery_3571912445009937447(environment.getOperationContext(), new TemplateFragmentContext(outputContextNode, weaveTf1, context, environment.getGenerator()));
    environment.weaveNode(contextNode1, "statement", tnodepart1, weaveTf1, context.getInput());
    return TemplateUtil.asList(tnodepart0, tnodepart1);
  }
}
