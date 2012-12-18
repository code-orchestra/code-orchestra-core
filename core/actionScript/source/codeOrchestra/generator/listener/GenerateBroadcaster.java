package codeOrchestra.generator.listener;

import jetbrains.mps.smodel.SModel;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public final class GenerateBroadcaster {

  private static GenerateBroadcaster instance;
  public synchronized static GenerateBroadcaster getInstance() {
    if (instance == null) {
      instance = new GenerateBroadcaster();
    }
    return instance;
  }

  private List<GenerateListener> listeners = new ArrayList<GenerateListener>();

  private GenerateBroadcaster() {
  }

  public synchronized void addListener(GenerateListener listener) {
    listeners.add(listener);
  }

  public synchronized void removeListener(GenerateListener listener) {
    listeners.remove(listener);
  }

  public synchronized void fireGenerateEvent(@NotNull SModel model, @NotNull GenerateEventType eventType) {
    fireGenerateEvent(model, eventType, null);
  }

  public synchronized void fireGenerateEvent(@NotNull SModel model, @NotNull GenerateEventType eventType, @Nullable Object additionalInfo) {
    for (GenerateListener listener : listeners) {
      switch (eventType) {
        case PRE_GEN_SCRIPT_STARTED:
          listener.preGenerationScriptStarted(model, (String) additionalInfo);
          break;
        case PRE_GEN_SCRIPT_ENDED:
          listener.preGenerationScriptEnded(model, (String) additionalInfo);
          break;
        case GENERATION_STARTED:
          listener.generationStarted(model);
          break;
        case GENERATION_ENDED:
          listener.generationEnded(model);
          break;
        case PRIMARY_MAPPING_GENERATION_STARTED:
          listener.primaryMappingGenerationStarted(model, (Integer) additionalInfo);
          break;
        case PRIMARY_MAPPING_GENERATION_ENDED:
          listener.primaryMappingGenerationEnded(model, (Integer) additionalInfo);
          break;
        case SECONDARY_MAPPING_GENERATION_STARTED:
          listener.secondaryMappingGenerationStarted(model, (Integer) additionalInfo);
          break;
        case SECONDARY_MAPPING_GENERATION_ENDED:
          listener.secondaryMappingGenerationEnded(model, (Integer) additionalInfo);
          break;
        case POST_GEN_SCRIPT_STARTED:
          listener.postGenerationScriptStarted(model, (String) additionalInfo);
          break;
        case POST_GEN_SCRIPT_ENDED:
          listener.postGenerationScriptEnded(model, (String) additionalInfo);
          break;
        default:
          throw new IllegalArgumentException("Unknown event type: " + eventType.name());
      }
    }
  }

}
