package codeOrchestra.debugger.breakpoint;

import com.intellij.ide.util.EditorHelper;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.fileEditor.FileEditorManager;
import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpoint;
import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpointsProvider;
import jetbrains.mps.debug.api.BreakpointManagerComponent;
import jetbrains.mps.debug.api.breakpoints.IBreakpoint;
import jetbrains.mps.generator.GenerationAdapter;
import jetbrains.mps.generator.GenerationListener;
import jetbrains.mps.generator.GeneratorManager;
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.workbench.highlighter.EditorsHelper;
import org.jetbrains.annotations.NotNull;

import javax.swing.SwingUtilities;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class BreakpointCacheManager implements ProjectComponent {

  private GeneratorManager generatorManager;
  private BreakpointManagerComponent breakpointManagerComponent;
  private FileEditorManager fileEditorManager;
  private GenerationListener generationListener;

  public BreakpointCacheManager(@NotNull GeneratorManager generatorManager,
                                @NotNull BreakpointManagerComponent breakpointManagerComponent,
                                @NotNull FileEditorManager manager) {
    this.generatorManager = generatorManager;
    this.breakpointManagerComponent = breakpointManagerComponent;
    this.fileEditorManager = manager;
    this.generationListener = new BreakPointCacheUpdateGenerationListener();
  }

  private class BreakPointCacheUpdateGenerationListener extends GenerationAdapter {
    public void modelsGenerated(List<SModelDescriptor> models, boolean success) {
      if (success) {
        boolean needUpdate = false;
        for (IBreakpoint breakpoint : breakpointManagerComponent.getAllIBreakpoints()) {
          if (breakpoint instanceof ASBreakpoint) {
            ASBreakpoint asBreakpoint = (ASBreakpoint) breakpoint;
            SModelDescriptor modelDescriptor = asBreakpoint.getModelDescriptor();
            if (modelDescriptor != null && models.contains(modelDescriptor)) {
              ASBreakpointsProvider.getInstance().removeFromCache(asBreakpoint);
              needUpdate = true;
            }
          }
        }
        
        if (needUpdate) {
          for (IEditor editor : EditorsHelper.getSelectedEditors(fileEditorManager)) {
            final EditorComponent currentEditorComponent = editor.getCurrentEditorComponent();
            if (currentEditorComponent != null) {
              SwingUtilities.invokeLater(new Runnable() {
                @Override
                public void run() {
                  currentEditorComponent.getLeftEditorHighlighter().relayout(false);
                  currentEditorComponent.getLeftEditorHighlighter().repaint();
                }
              });
            }
          }
        }
      }
    }
  }

  @Override
  public void initComponent() {
    generatorManager.addGenerationListener(generationListener);
  }

  @Override
  public void disposeComponent() {
    generatorManager.removeGenerationListener(generationListener);
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "CodeOrchestra Breakpoint Cache Manager";
  }
}
