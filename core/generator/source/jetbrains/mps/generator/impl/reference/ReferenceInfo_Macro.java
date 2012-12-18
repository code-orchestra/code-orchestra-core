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
package jetbrains.mps.generator.impl.reference;

import jetbrains.mps.generator.IGeneratorLogger.ProblemDescription;
import jetbrains.mps.generator.impl.GeneratorUtil;
import jetbrains.mps.generator.impl.ReductionContext;
import jetbrains.mps.generator.impl.TemplateGenerator;
import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.generator.template.ITemplateGenerator;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.*;

/**
 * Created by: Sergey Dmitriev
 * Date: Jan 25, 2007
 */
public abstract class ReferenceInfo_Macro extends ReferenceInfo {
  protected final TemplateContext myContext;
  protected final ReductionContext myReductionContext;

  // results of 'expandReferenceMacro'
  private boolean myMacroProcessed;
  private String myResolveInfoForDynamicResolve;
  private SNode myOutputTargetNode;
  private SModelReference myExternalTargetModelReference;

  public ReferenceInfo_Macro(SNode outputSourceNode, String role, TemplateContext context, ReductionContext reductionContext) {
    super(outputSourceNode, role, context.getInput());
    myContext = context;
    myReductionContext = reductionContext;
  }

  public SModelReference getTargetModelReference(TemplateGenerator generator) {
    ensureMacroProcessed(generator);
    return myExternalTargetModelReference;
  }

  public SNode doResolve_Straightforward(TemplateGenerator generator) {
    ensureMacroProcessed(generator);
    return myOutputTargetNode;
  }

  private void ensureMacroProcessed(TemplateGenerator generator) {
    if (myMacroProcessed) return;
    myMacroProcessed = true;
    expandReferenceMacro(generator);
  }

  public SNode doResolve_Tricky(TemplateGenerator generator) {
    // nothing
    return null;
  }

  public String getResolveInfoForDynamicResolve() {
    return myResolveInfoForDynamicResolve;
  }

  public String getResolveInfoForNothing() {
    SNode templateTargetNode = getInputTargetNode();
    if (templateTargetNode != null) {
      return templateTargetNode.getName();
    }
    return null;
  }

  public boolean isRequired() {
    return getOutputSourceNode().isReferentRequired(getReferenceRole());
  }

  private void expandReferenceMacro(ITemplateGenerator generator) {
    String linkRole = getReferenceRole();

    Object result = resolveReference();
    if (result instanceof SNode) {
      myOutputTargetNode = (SNode) result;
    } else if (result != null) {
      String resolveInfo = (String) result;
      // we are expecting:
      // - just resolve-info
      // - [models name]resolve-info
      // - []resolve-info
      if (resolveInfo.startsWith("[")) {
        String[] modelNameAndTheRest = resolveInfo.split("]");
        if (modelNameAndTheRest.length > 1 || (modelNameAndTheRest.length == 1 && resolveInfo.endsWith("]"))) {
          resolveInfo = resolveInfo.substring(resolveInfo.indexOf("]") + 1).trim();
          String modelName = modelNameAndTheRest[0].substring(1).trim();
          if (modelName.length() > 0) {
            // model: either current output or java_stub
            if (!modelName.equals(generator.getOutputModel().getLongName())) {
              // external java_stub
              String stereo = SModelStereotype.getStubStereotypeForId(LanguageID.JAVA);
              IModule module = generator.getGeneratorSessionContext().getOriginalInputModel().getModelDescriptor().getModule();
              Iterable<SModelDescriptor> models = module == null ? generator.getScope().getModelDescriptors() : module.getScope().getModelDescriptors();
              SModelId id = StubMigrationHelper.convertModelUIDInScope(stereo + "#" + modelName, models);
              myExternalTargetModelReference = new SModelReference(new SModelFqName(modelName, stereo), id);
            }
          }
        }
        if(myExternalTargetModelReference == null) {
          myExternalTargetModelReference = generator.getOutputModel().getSModelReference();
        }
      }

      myResolveInfoForDynamicResolve = resolveInfo;
    }

    if (myOutputTargetNode == null) {
      return;
    }

    // check referent because it's manual and thus error prone mapping
    if (myOutputTargetNode.getModel() == generator.getInputModel()) {
      // try to find copy in output model and replace target
      SNode outputTargetNode_output = generator.findCopiedOutputNodeForInputNode(myOutputTargetNode);
      if (outputTargetNode_output != null) {
        myOutputTargetNode = outputTargetNode_output;
      } else {
        // FIXME showErrorIfStrict
        generator.getLogger().warning(getOutputSourceNode(), "reference macro returned node from input model; role: " + linkRole + " in " + getOutputSourceNode().getDebugText(),
          GeneratorUtil.describeIfExists(myOutputTargetNode, "target node in input model"),
          GeneratorUtil.describeIfExists(getMacroNode(), "reference macro"));
        generator.getGeneratorSessionContext().keepTransientModel(generator.getInputModel(), true);
      }
    }
  }

  protected abstract Object resolveReference();

  protected abstract SNode getMacroNode();

  @Override
  public ProblemDescription[] getErrorDescriptions() {
    SNode inputNode = getInputNode();
    return new ProblemDescription[]{
      GeneratorUtil.describe(inputNode, "input node"),
      GeneratorUtil.describe(getMacroNode(), "reference macro")
    };
  }
}
