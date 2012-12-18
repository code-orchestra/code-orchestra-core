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

import jetbrains.mps.generator.TransientSModel;
import jetbrains.mps.generator.impl.AbstractTemplateGenerator.RoleValidationStatus;
import jetbrains.mps.generator.impl.TemplateGenerator;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.DynamicReference.DynamicReferenceOrigin;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/**
 * Igor Alshannikov
 * Nov 28, 2007
 * <p/>
 * These references are created in transient models.
 * They are always internal.
 */
public class PostponedReference extends SReference {

  private final TemplateGenerator myGenerator;
  private ReferenceInfo myReferenceInfo;
  private SReference myReplacementReference;


  public PostponedReference(ReferenceInfo referenceInfo, TemplateGenerator generator) {
    super(referenceInfo.getReferenceRole(), referenceInfo.getOutputSourceNode());
    myReferenceInfo = referenceInfo;
    myGenerator = generator;
  }

  public boolean isExternal() {
    return false;
  }

  @Nullable
  public synchronized SModelReference getTargetSModelReference() {
    if (myReferenceInfo != null) {
      return myReferenceInfo.getTargetModelReference(myGenerator);
    } else if (myReplacementReference != null) {
      return myReplacementReference.getTargetSModelReference();
    }

    // ok, reference is unresolved and not required
    return null;
  }

  public void setTargetSModelReference(@NotNull SModelReference modelReference) {
    throw new RuntimeException("not supported");
  }

  protected SNode getTargetNode_internal(boolean silently) {
    SReference ref = getReplacementReference();
    if (ref == null) return null;
    return ref.getTargetNode();
  }

  /**
   * @return null is not resolved and not required.
   */
  private synchronized SReference getReplacementReference() {
    if (myReplacementReference != null) {
      return myReplacementReference;
    }

    if (myReferenceInfo == null) {
      return null; // allready processed
    }

    String role = myReferenceInfo.getReferenceRole();
    SNode outputSourceNode = myReferenceInfo.getOutputSourceNode();
    SModelReference targetModelReference = myReferenceInfo.getTargetModelReference(myGenerator);

    SNode outputTargetNode = myReferenceInfo.doResolve_Straightforward(myGenerator);
    if (outputTargetNode != null) {
//      if (checkResolvedTarget(outputSourceNode, role, outputTargetNode)) {
//        // ok
      myReplacementReference = new StaticReference(role, outputSourceNode, outputTargetNode);
//      } else {
//        myReplacementReference = new StaticReference(role, outputSourceNode, targetModelReference, null, myReferenceInfo.getResolveInfoForNothing());
//      }
    } else if (SReferenceUtil.isDynamicResolve(role, outputSourceNode) && myReferenceInfo.getResolveInfoForDynamicResolve() != null) {
      DynamicReference dynamicReference = new DynamicReference(
        role,
        outputSourceNode,
        targetModelReference,
        myReferenceInfo.getResolveInfoForDynamicResolve());

      SNode templateNode = myReferenceInfo instanceof ReferenceInfo_Macro ? ((ReferenceInfo_Macro) myReferenceInfo).getMacroNode() : null;
      SNode inputNode = myReferenceInfo.getInputNode();
      if (inputNode != null || templateNode != null) {
        dynamicReference.setOrigin(new DynamicReferenceOrigin(templateNode != null ? new SNodePointer(templateNode) : null, inputNode != null ? new SNodePointer(inputNode) : null));
      }
      myReplacementReference = dynamicReference;

    } else {
      outputTargetNode = myReferenceInfo.doResolve_Tricky(myGenerator);
      if (outputTargetNode != null) {
        if (checkResolvedTarget(outputSourceNode, role, outputTargetNode)) {
          // ok
          myReplacementReference = new StaticReference(role, outputSourceNode, outputTargetNode);
        } else {
          myReplacementReference = new StaticReference(
            role,
            outputSourceNode,
            targetModelReference == null ? myGenerator.getOutputModel().getSModelReference() : targetModelReference,
            null,
            myReferenceInfo.getResolveInfoForNothing());
        }
      } else if (myReferenceInfo.isRequired()) {
        myGenerator.getLogger().error(myReferenceInfo.getOutputSourceNode(),
          "cannot resolve required reference; role: '" + myReferenceInfo.getReferenceRole() + "' in output node " + myReferenceInfo.getOutputSourceNode().getDebugText(),
          myReferenceInfo.getErrorDescriptions());

        myReplacementReference = new StaticReference(
          role,
          outputSourceNode,
          targetModelReference == null ? myGenerator.getOutputModel().getSModelReference() : targetModelReference,
          null,
          myReferenceInfo.getResolveInfoForNothing());
      } else {
        // not resolved and not required
      }
    }

    // release resources
    myReferenceInfo = null;
    return myReplacementReference;
  }

  /**
   * replaces this instance with ether StaticReference or with DynamicReference. (only static so far)
   * removes reference in case of error.
   */
  public void validateAndReplace() {
    SReference replacement = getReplacementReference();
    if (replacement != null) {
      getSourceNode().replaceReference(this, replacement);
    } else {
      getSourceNode().removeReference(this);
    }
  }

  private boolean checkResolvedTarget(SNode outputNode, String role, SNode outputTargetNode) {
    RoleValidationStatus status = myGenerator.validateReferent(outputNode, role, outputTargetNode);
    if (status != null) {
      status.reportProblem(true, "bad reference: ", myReferenceInfo.getErrorDescriptions());
      return false;
    }

    SModel referentNodeModel = outputTargetNode.getModel();
    if (referentNodeModel != outputNode.getModel()) {
      if (SModelStereotype.isGeneratorModel(referentNodeModel)) {
        // references on template nodes are not acceptable
        myGenerator.getLogger().error(outputNode, "bad reference, cannot refer to a generator model: " + outputTargetNode.getDebugText() + " for role '" + role + "' in " + outputNode.getDebugText(),
          myReferenceInfo.getErrorDescriptions());
        return false;
      }
      if (referentNodeModel instanceof TransientSModel) {
        // references on transient nodes are not acceptable
        myGenerator.getLogger().error(outputNode, "bad reference, cannot refer to a transient model: " + outputTargetNode.getDebugText() + " for role '" + role + "' in " + outputNode.getDebugText(),
          myReferenceInfo.getErrorDescriptions());
        return false;
      }
    }
    return true;
  }
}
