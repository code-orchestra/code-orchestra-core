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

import jetbrains.mps.generator.template.TemplateQueryContext;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;

/**
 * Created by: Sergey Dmitriev
 * Date: Apr 2, 2007
 */
public class CloneUtil {
  private static final Logger LOG = Logger.getLogger(CloneUtil.class);

  /**
   * Creates cloned model, each node in target model has the same nodeId that corresponding node in source model
   * it allows to resolve internal references much faster
   */
  public static void cloneModel(SModel inputModel, SModel outputModel, boolean originalInput) {
    for (SNode node : inputModel.roots()) {
      SNode outputNode = clone(node, outputModel, originalInput);
      outputModel.addRoot(outputNode);
    }
  }

  public static SNode clone(SNode inputNode, SModel outputModel, boolean originalInput) {
    // new SNode() uses intern. It's a very expensive operation and we know that when we copy node, concept fq name
    // is already interned. So we don't intern anything. DO NOT replace this stuff with instantiateStuff
    SNode outputNode = new SNode(outputModel, inputNode.getConceptFqName(), false);

    outputNode.setId(inputNode.getSNodeId());
    outputNode.putProperties(inputNode);
    outputNode.putUserObjects(inputNode);
    // keep track of 'original input node'
    if (originalInput) {
      outputNode.putUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE, inputNode);
    }
    for (SReference reference : inputNode.getReferencesIterable()) {
      SModelReference targetModelReference = reference.isExternal() ? reference.getTargetSModelReference() : outputModel.getSModelReference();
      if (reference instanceof StaticReference) {
        if (targetModelReference == null) {
          LOG.warning("broken reference '" + reference.getRole() + "' in " + inputNode.getDebugText(), inputNode);
        } else {
          StaticReference outputReference = new StaticReference(
            reference.getRole(),
            outputNode,
            targetModelReference,
            ((StaticReference) reference).getTargetNodeId(),
            reference.getResolveInfo());
          outputNode.addReference(outputReference);
        }
      } else if (reference instanceof DynamicReference) {
        DynamicReference outputReference = new DynamicReference(
          reference.getRole(),
          outputNode,
          targetModelReference,
          reference.getResolveInfo());
        outputReference.setOrigin(((DynamicReference) reference).getOrigin());
        outputNode.addReference(outputReference);
      } else {
        LOG.error("internal error: can't clone reference '" + reference.getRole() + "' in " + inputNode.getDebugText(), inputNode);
        LOG.error(" -- was reference class : " + reference.getClass().getName());
      }
    }

    for (SNode child : inputNode.getChildrenIterable()) {
      String role = child.getRole_();
      assert role != null;
      outputNode.addChild(role, clone(child, outputModel, originalInput));
    }
    return outputNode;
  }

}
