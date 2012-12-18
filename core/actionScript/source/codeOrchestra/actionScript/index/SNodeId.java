package codeOrchestra.actionScript.index;

import jetbrains.mps.smodel.*;

/**
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 */
public class SNodeId {
  private String myModelReference;
  private String myNodeId;

  public static SNodeId createSNodeId(SReference reference) {
    if (reference == null || reference.getTargetSModelReference() == null || reference.getTargetNodeId() == null) {
      return null;
    }
    //noinspection ConstantConditions
    return new SNodeId(reference.getTargetSModelReference().toString(), reference.getTargetNodeId().toString());
  }

  public SNodeId(SNode node) {
    this(node.getModel().getSModelReference().toString(), node.getSNodeId().toString());
  }

  public SNodeId(String modelReference, String nodeId) {
    assert modelReference != null;
    assert nodeId != null;
    myModelReference = modelReference;
    myNodeId = nodeId;
  }

  public SNode getNode() {
    SModelReference sModelReference = SModelReference.fromString(getModelReference());
    SModelDescriptor sModelDescriptor = SModelRepository.getInstance().getModelDescriptor(sModelReference);
    return sModelDescriptor == null ? null : sModelDescriptor.getSModel().getNodeById(getNodeId());
  }

  @Override
  public int hashCode() {
    return getNodeId().hashCode();
  }

  @Override
  public boolean equals(Object other) {
    if (other instanceof SNodeId) {
      SNodeId otherNodeId = (SNodeId) other;
      return getModelReference().equals(otherNodeId.getModelReference()) && getNodeId().equals(otherNodeId.getNodeId());
    }
    return false;
  }

  public String getModelReference() {
    return myModelReference;
  }

  public String getNodeId() {
    return myNodeId;
  }
}
