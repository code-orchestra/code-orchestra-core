package codeOrchestra.debugger.breakpoint;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpointKind;
import jetbrains.mps.util.misc.hash.HashMap;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class BreakpointRequestProcessorProvider implements ApplicationComponent {

  public static BreakpointRequestProcessorProvider getInstance() {
    return ApplicationManager.getApplication().getComponent(BreakpointRequestProcessorProvider.class);
  }

  /**
   * Debugger Event Processor ID -> breakpoint request processor
   */
  private Map<String, List<BreakpointRequestProcessor>> processors = new HashMap<String, List<BreakpointRequestProcessor>>();
  
  public void registerProcessor(BreakpointRequestProcessor requestProcessor) {
    List<BreakpointRequestProcessor> breakpointRequestProcessors = processors.get(requestProcessor.getEventProcessorId());
    if (breakpointRequestProcessors == null) {
      breakpointRequestProcessors = new ArrayList<BreakpointRequestProcessor>();
      processors.put(requestProcessor.getEventProcessorId(), breakpointRequestProcessors);
    }

    breakpointRequestProcessors.add(requestProcessor);
  }

  public BreakpointRequestProcessor getProcessor(@NotNull String eventProcessorId, @NotNull ASBreakpointKind breakpointKind) {
    for (String availableEventProcessorId : processors.keySet()) {
      if (eventProcessorId.equals(availableEventProcessorId)) {
        List<BreakpointRequestProcessor> breakpointRequestProcessors = processors.get(availableEventProcessorId);
        
        for (BreakpointRequestProcessor processor : breakpointRequestProcessors) {
          if (breakpointKind == processor.getBreakpointKind()) {
            return processor;
          }
        }

        break;
      }
    }
    throw new IllegalArgumentException("No request processor found for " + eventProcessorId + " debugger of " + breakpointKind + " kind");
  }

  @Override
  public void initComponent() {
  }

  @Override
  public void disposeComponent() {
    processors.clear();
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "CodeOrchestra Breakpoint Request Processor Provider";
  }
}
