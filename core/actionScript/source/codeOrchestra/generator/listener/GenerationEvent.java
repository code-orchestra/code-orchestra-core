package codeOrchestra.generator.listener;

import jetbrains.mps.smodel.SModel;

/**
 * @author Alexander Eliseyev
 */
public class GenerationEvent {

  private SModel model;
  private GenerateEventType eventType;

  public GenerationEvent(SModel model, GenerateEventType eventType) {
    this.model = model;
    this.eventType = eventType;
  }

  public SModel getModel() {
    return model;
  }

  public GenerateEventType getEventType() {
    return eventType;
  }
}
