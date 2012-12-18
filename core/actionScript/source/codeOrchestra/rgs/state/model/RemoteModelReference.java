package codeOrchestra.rgs.state.model;

import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;

import java.io.Serializable;

/**
 * @author Alexander Eliseyev
 */
public class RemoteModelReference implements Serializable {

  public static RemoteModelReference fromDescriptor(SModelDescriptor sModelDescriptor) {
    return fromRegularReference(sModelDescriptor.getSModelReference());
  }

  public static RemoteModelReference fromRegularReference(SModelReference sModelReference) {
    return new RemoteModelReference(sModelReference.toString());
  }

  private String modelRefString;

  public RemoteModelReference(String modelRefString) {
    this.modelRefString = modelRefString;
  }

  public SModelReference toRegularReference() {
    return SModelReference.fromString(modelRefString);
  }

}
