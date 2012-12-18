/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.generator.impl;

import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.generator.IGeneratorLogger.ProblemDescription;
import jetbrains.mps.generator.impl.AbstractTemplateGenerator.RoleValidationStatus;
import jetbrains.mps.generator.impl.reference.PostponedReference;
import jetbrains.mps.generator.impl.reference.ReferenceInfo_CopiedInputNode;
import jetbrains.mps.generator.runtime.NodeMapper;
import jetbrains.mps.generator.runtime.PostProcessor;
import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.smodel.*;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by: Sergey Dmitriev
 * Date: Jan 25, 2007
 */
public class DelayedChanges {

  public static final String MAP_SRC_TEMP_NODE = "mapSrcTempNode";

  private List<Change> myExecuteMapSrcNodeMacroChanges = new ArrayList<Change>();
  private List<Change> myExecuteMapSrcNodeMacroPostProcChanges = new ArrayList<Change>();

  private SNode attrsHolder = new SNode(null, SNodeUtil.concept_BaseConcept);

  private IGeneratorLogger myLogger;
  private TemplateGenerator myGenerator;

  public DelayedChanges(TemplateGenerator generator) {
    myGenerator = generator;
    myLogger = generator.getLogger();
    attrsHolder.putUserObject(MAP_SRC_TEMP_NODE, MAP_SRC_TEMP_NODE);
  }

  public boolean isEmpty() {
    return myExecuteMapSrcNodeMacroChanges.isEmpty() && myExecuteMapSrcNodeMacroPostProcChanges.isEmpty();
  }

  public void addExecuteMapSrcNodeMacroChange(SNode mapSrcMacro, SNode childToReplace, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext) {
    childToReplace.putUserObjects(attrsHolder);
    synchronized (this) {
      myExecuteMapSrcNodeMacroChanges.add(new ExecuteMapSrcNodeMacroChange(mapSrcMacro, childToReplace, context, reductionContext));
    }
  }

  public void addExecuteNodeMapper(@NotNull NodeMapper mapper, PostProcessor processor, SNode childToReplace, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext) {
    childToReplace.putUserObjects(attrsHolder);
    myExecuteMapSrcNodeMacroChanges.add(new MapNodeChange(mapper, processor, childToReplace, context, reductionContext));
  }

  public void addExecuteMapSrcNodeMacroPostProcChange(SNode mapSrcMacro, SNode outputNode, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext) {
    SNode postMapperFunction = RuleUtil.getMapSrc_PostMapperFunction(mapSrcMacro);
    if (postMapperFunction == null) return;
    synchronized (this) {
      myExecuteMapSrcNodeMacroPostProcChanges.add(new ExecuteMapSrcNodeMacroPostProcChange(mapSrcMacro, outputNode, context, reductionContext));
    }
  }

  public void addExecutePostProcessor(@NotNull PostProcessor processor, SNode outputNode, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext) {
    synchronized (this) {
      myExecuteMapSrcNodeMacroPostProcChanges.add(new PostProcessorChange(processor, outputNode, context, reductionContext));
    }
  }

  public void doAllChanges() {
    for (Change executeMapSrcNodeMacroChange : myExecuteMapSrcNodeMacroChanges) {
      executeMapSrcNodeMacroChange.doChange();
    }
    myExecuteMapSrcNodeMacroChanges = null;
    for (Change executeMapSrcNodeMacroPostProcChange : myExecuteMapSrcNodeMacroPostProcChanges) {
      executeMapSrcNodeMacroPostProcChange.doChange();
    }
  }

  private interface Change {
    void doChange();
  }

  private abstract class BaseMapNodeChange implements Change {

    protected final SNode myChildToReplace;
    protected final TemplateContext myContext;
    protected final ReductionContext myReductionContext;

    private BaseMapNodeChange(SNode childToReplace, TemplateContext context, ReductionContext reductionContext) {
      myChildToReplace = childToReplace;
      myContext = context;
      myReductionContext = reductionContext;
    }

    public void doChange() {
      try {
        SNode child = mapNode();
        if (child != null) {
          // check node languages : prevent 'mapping func' query from returnning node, which language was not counted when
          // planning the generation steps.
          Language childLang = child.getNodeLanguage();
          if (!myGenerator.getGeneratorSessionContext().getGenerationPlan().isCountedLanguage(childLang)) {
            if (!childLang.getGenerators().isEmpty()) {
              myLogger.error(child, "language of output node is '" + childLang.getModuleFqName() + "' - this language did not show up when computing generation steps!",
                GeneratorUtil.describe(myContext.getInput(), "input"),
                GeneratorUtil.describe(getMapSrcMacro(), "template"),
                new ProblemDescription(null, "workaround: add the language '" + childLang.getModuleFqName() + "' to list of 'Languages Engaged On Generation' in model '" + myGenerator.getGeneratorSessionContext().getOriginalInputModel().getSModelFqName() + "'"));
            }
          }

          if (child.isRegistered()) {
            // must be "in air"
            child = CopyUtil.copy(child);
          }
          // replace references back to input model
          validateReferences(child);

          // check new child
          SNode parent = myChildToReplace.getParent();
          if (parent == null) {
            // root?
            if (myChildToReplace.isRoot()) {
              myChildToReplace.getModel().addRoot(child);
              myChildToReplace.getModel().removeRoot(myChildToReplace);
              myGenerator.rootReplaced(myChildToReplace, child);
            }
          } else {
            String childRole = parent.getRoleOf(myChildToReplace);
            RoleValidationStatus status = myGenerator.validateChild(parent, childRole, child);
            if (status != null) {
              status.reportProblem(false, "",
                GeneratorUtil.describe(myContext.getInput(), "input"),
                GeneratorUtil.describe(getMapSrcMacro(), "template"));
            }
            parent.replaceChild(myChildToReplace, child);
          }
          myGenerator.getGeneratorSessionContext().getGenerationTracer().replaceOutputNode(myChildToReplace, child);

          // post-processing
          postProcess(child);
        }
      } catch (Throwable t) {
        myGenerator.showErrorMessage(myContext.getInput(), getMapSrcMacro(), "mapping failed: '" + t.getMessage() + "'");
        myLogger.handleException(t);
      }
    }

    private void validateReferences(SNode node) {
      for (SReference reference : node.getReferencesArray()) {
        validateReference(reference);
      }
      for (SNode child : node.getChildren()) {
        validateReferences(child);
      }
    }

    private void validateReference(SReference reference) {
      // reference to input model - illegal
      if (myGenerator.getInputModel().getSModelReference().equals(reference.getTargetSModelReference())) {
        // replace
        ReferenceInfo_CopiedInputNode refInfo = new ReferenceInfo_CopiedInputNode(
          reference.getRole(),
          reference.getSourceNode(),
          myContext.getInput(),
          reference.getTargetNode());
        PostponedReference postponedReference = new PostponedReference(
          refInfo,
          myGenerator);
        reference.getSourceNode().replaceReference(reference, postponedReference);
      }
    }

    protected abstract SNode getMapSrcMacro();

    protected abstract SNode mapNode() throws GenerationFailureException;

    protected abstract void postProcess(SNode child) throws GenerationFailureException;
  }

  private class ExecuteMapSrcNodeMacroChange extends BaseMapNodeChange {
    private final SNode myMapSrcMacro;

    public ExecuteMapSrcNodeMacroChange(SNode mapSrcMacro, SNode childToReplace, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext) {
      super(childToReplace, context, reductionContext);
      myMapSrcMacro = mapSrcMacro;
    }

    protected SNode getMapSrcMacro() {
      return myMapSrcMacro;
    }

    protected SNode mapNode() throws GenerationFailureException {
      return myReductionContext.getQueryExecutor().executeMapSrcNodeMacro(myContext.getInput(), getMapSrcMacro(), myChildToReplace.getParent(), myContext);
    }

    @Override
    protected void postProcess(SNode child) throws GenerationFailureException {
      addExecuteMapSrcNodeMacroPostProcChange(myMapSrcMacro, child, myContext, myReductionContext);
    }
  }

  private class MapNodeChange extends BaseMapNodeChange {
    private final NodeMapper myMapper;
    private final PostProcessor myProcessor;

    public MapNodeChange(@NotNull NodeMapper mapper, PostProcessor processor, SNode childToReplace, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext) {
      super(childToReplace, context, reductionContext);
      myMapper = mapper;
      myProcessor = processor;
    }

    protected SNode getMapSrcMacro() {
      SNodePointer templateNode = myMapper.getTemplateNode();
      if(templateNode != null) {
        return templateNode.getNode();
      }
      return null;
    }

    protected SNode mapNode() throws GenerationFailureException {
      return myReductionContext.getQueryExecutor().executeInContext(myChildToReplace, myContext, myMapper);
    }

    @Override
    protected void postProcess(SNode child) throws GenerationFailureException {
      if (myProcessor != null) {
        addExecutePostProcessor(myProcessor, child, myContext, myReductionContext);
      }
    }
  }

  private class ExecuteMapSrcNodeMacroPostProcChange implements Change {
    private final SNode myMapSrcMacro;
    private final SNode myOutputChild;
    private final TemplateContext myContext;
    private ReductionContext myReductionContext;

    public ExecuteMapSrcNodeMacroPostProcChange(SNode mapSrcMacro, SNode outputChild, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext) {
      myMapSrcMacro = mapSrcMacro;
      myOutputChild = outputChild;
      myContext = context;
      myReductionContext = reductionContext;
    }

    public void doChange() {
      try {
        myReductionContext.getQueryExecutor().executeMapSrcNodeMacro_PostProc(myContext.getInput(), myMapSrcMacro, myOutputChild, myContext);
      } catch (Throwable t) {
        myGenerator.showErrorMessage(myContext.getInput(), myMapSrcMacro, "mapping failed: '" + t.getMessage() + "'");
        myLogger.handleException(t);
      }
    }
  }

  private class PostProcessorChange implements Change {
    private final PostProcessor myProcessor;
    private final SNode myOutputChild;
    private final TemplateContext myContext;
    private ReductionContext myReductionContext;

    public PostProcessorChange(PostProcessor processor, SNode outputChild, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext) {
      myProcessor = processor;
      myOutputChild = outputChild;
      myContext = context;
      myReductionContext = reductionContext;
    }

    public void doChange() {
      try {
        myReductionContext.getQueryExecutor().executeInContext(myOutputChild, myContext, myProcessor);
      } catch (Throwable t) {
        myGenerator.showErrorMessage(myContext.getInput(), null, "mapping failed: '" + t.getMessage() + "'");
        myLogger.handleException(t);
      }
    }
  }
}
