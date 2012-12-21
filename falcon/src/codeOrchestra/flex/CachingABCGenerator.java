package codeOrchestra.flex;

import org.apache.flex.abc.ABCConstants;
import org.apache.flex.abc.ABCEmitter;
import org.apache.flex.abc.semantics.MethodBodyInfo;
import org.apache.flex.abc.semantics.MethodInfo;
import org.apache.flex.abc.visitors.IMethodBodyVisitor;
import org.apache.flex.abc.visitors.IMethodVisitor;
import org.apache.flex.abc.visitors.IScriptVisitor;
import org.apache.flex.compiler.exceptions.CodegenInterruptedException;
import org.apache.flex.compiler.exceptions.MissingBuiltinException;
import org.apache.flex.compiler.internal.as.codegen.*;
import org.apache.flex.compiler.internal.units.requests.ABCBytesRequestResult;
import org.apache.flex.compiler.problems.MissingBuiltinProblem;
import org.apache.flex.compiler.projects.ICompilerProject;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.Map;
import java.util.concurrent.ExecutorService;

/**
 * @author Anton.I.Neverov
 */
public class CachingABCGenerator extends ABCGenerator {

  private ABCCache myCache;

  public CachingABCGenerator(ABCCache cache) {
    myCache = cache;
  }

  @Override
  public ABCBytesRequestResult generate(ExecutorService executorService, boolean useParallelCodegen,
                                        String synthetic_name_prefix, IASNode root_node,
                                        ICompilerProject project, boolean inInvisibleCompilationUnit,
                                        Map<String, String> encodedDebugFiles)
    throws InterruptedException
  {
    ABCBytesRequestResult result = myCache.get(root_node);
    if (result == null) {
      result = super.generate(executorService, useParallelCodegen, synthetic_name_prefix, root_node, project, inInvisibleCompilationUnit, encodedDebugFiles);
      myCache.put(root_node, result);
    } else {
      // Dependencies are collected in generator in the top_level_processor.traverse(root_node) call,
      // so if we skip generator and take ABC from cache we must manually call this method.
      collectDependencies(executorService, useParallelCodegen, new GlobalLexicalScope(
        project, this, synthetic_name_prefix, inInvisibleCompilationUnit, useParallelCodegen, encodedDebugFiles), root_node);
    }
    return result;
  }

  private void collectDependencies(ExecutorService executorService, boolean useParallelCodegen, GlobalLexicalScope globalLexicalScope, IASNode root_node) throws InterruptedException {
    //  Set up the global lexical scope.
    final GlobalLexicalScope global_scope = globalLexicalScope;

    final ABCEmitter emitter = (ABCEmitter)global_scope.getEmitter();

    // CG targets the latest version - these ABCs can be postprocessed to downgrade to previous versions
    emitter.visit(ABCConstants.VERSION_ABC_MAJOR_FP10, ABCConstants.VERSION_ABC_MINOR_FP10);

    IScriptVisitor sv = emitter.visitScript();
    sv.visit();
    MethodInfo init_method = new MethodInfo();
    sv.visitInit(init_method);

    MethodBodyInfo init_body = new MethodBodyInfo();
    init_body.setMethodInfo(init_method);

    IMethodVisitor mv = emitter.visitMethod(init_method);
    mv.visit();
    IMethodBodyVisitor mbv = mv.visitBody(init_body);
    mbv.visit();

    global_scope.traitsVisitor = sv.visitTraits();
    global_scope.setMethodInfo(init_method);
    global_scope.methodBodyVisitor = mbv;
    global_scope.setInitialControlFlowRegionNode(root_node);

    //  Process global directives.
    GlobalDirectiveProcessor top_level_processor = new GlobalDirectiveProcessor(executorService, useParallelCodegen, global_scope, emitter);
    boolean fatal_error_encountered = false;
    try
    {
      top_level_processor.traverse(root_node);
    }
    catch (MissingBuiltinException e)
    {
      global_scope.addProblem(new MissingBuiltinProblem(root_node, e.getBuiltinName()));
      fatal_error_encountered = true;
    }
    catch (CodegenInterruptedException e)
    {
      //  Unwrap the InterruptedException and rethrow it.
      throw e.getException();
    }

    top_level_processor.finish();
  }

  public static ICodeGeneratorFactory getABCGeneratorFactory()
  {
    return new ICodeGeneratorFactory()
    {
      public ICodeGenerator get ()
      {
        return new CachingABCGenerator(FalconProjectBuilder.getInstance().getAbcCache());
      }
    };
  }

}
