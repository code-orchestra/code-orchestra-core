package codeOrchestra.rgs.state.model;

import jetbrains.mps.smodel.*;

import java.io.Serializable;

/**
 * @author: Alexander Eliseyev
 */
public class RemoteNodeId implements Serializable {

  public static RemoteNodeId fromNode(SNode node) {
    return new RemoteNodeId(node.getModel().getSModelReference().toString(), node.getSNodeId().toString());
  }

  public static RemoteNodeId fromNodePointer(SNodePointer node) {
    return new RemoteNodeId(node.getModelReference().toString(), node.getNodeId().toString());
  }

  private String myModelReference;
  private String myNodeId;

  public RemoteNodeId() {
  }

  public SNode getNode() {
    SModelReference sModelReference = SModelReference.fromString(getModelReference());
    SModelDescriptor sModelDescriptor = SModelRepository.getInstance().getModelDescriptor(sModelReference);
    return sModelDescriptor == null ? null : sModelDescriptor.getSModel().getNodeById(getNodeId());
  }

  public RemoteNodeId(String modelReference, String nodeId) {
    myModelReference = modelReference;
    myNodeId = nodeId;
  }

  public String getModelReference() {
    return myModelReference;
  }

  public void setModelReference(String modelReference) {
    myModelReference = modelReference;
  }

  public String getNodeId() {
    return myNodeId;
  }

  public void setNodeId(String nodeId) {
    myNodeId = nodeId;
  }
}
