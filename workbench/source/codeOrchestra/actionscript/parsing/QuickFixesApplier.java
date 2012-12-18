package codeOrchestra.actionscript.parsing;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionScript.cache.CacheStateManager;
import jetbrains.mps.nodeEditor.Highlighter;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.typesystem.checking.TypesEditorChecker;
import org.jetbrains.annotations.NotNull;

import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public final class QuickFixesApplier {

  private QuickFixesApplier() {
  }

  public static void apply(final Project project, final Set<SModelReference> parsedModelReferences, final IModule module) {
    // Apply quick-fixes
    ModelAccess.instance().runPlainInEDT(new Runnable() {
      public void run() {
        try {
          ASParsingStatusManager.getInstance().waitForState(ASParsingState.STOPPED);
        } catch (InterruptedException e) {
          ;
        }

        // Run quick-fixes
        synchronized (Highlighter.UPDATE_EDITOR_LOCK) {
          ProgressManager.getInstance().run(new Task.Modal(project, "Post-Parsing", false) {
            public void run(final @NotNull ProgressIndicator indicator) {
              indicator.pushState();
              indicator.setIndeterminate(true);
              indicator.setText("Fixing the parsed packages");

              try { Thread.sleep(800); } catch (InterruptedException e) { ; }

              final TypesEditorChecker checker = new TypesEditorChecker();
              final IOperationContext operationContext = new FakeOperationContext(project, module);

              int i = 1;
              int modelsCount = parsedModelReferences.size();
              for (SModelReference sModelReference : parsedModelReferences) {
                indicator.setText("Fixing the parsed packages (" + i++ + "/" + modelsCount + ")");
                try { Thread.sleep(80); } catch (InterruptedException e) { ; }

                final SModel modelToFix = SModelRepository.getInstance().getModelDescriptor(sModelReference).getSModel();

                try {
                  modelToFix.setLoading(true);

                  for (final SNode rootNode : modelToFix.roots()) {
                    ModelAccess.instance().runReadAction(new Runnable() {
                      public void run() {
                        indicator.setText2("Applying quickfixes to " + rootNode.getName());
                        try { Thread.sleep(80); } catch (InterruptedException e) { ; }
                        checker.runQuickfixes(rootNode, operationContext);
                      }
                    });
                  }
                } finally {
                  modelToFix.setLoading(false);
                }
              }
            }
          });
        }
      }
    });

    // Save the models after quickfixes applying
    ModelAccess.instance().runPlainInEDT(new Runnable() {
      public void run() {
        for (SModelReference sModelReference : parsedModelReferences) {
          final SModelDescriptor sModelDescriptor = SModelRepository.getInstance().getModelDescriptor(sModelReference);
          if (sModelDescriptor instanceof EditableSModelDescriptor) {
            final EditableSModelDescriptor esm = (EditableSModelDescriptor) sModelDescriptor;
            ModelAccess.instance().runWriteActionInCommand(new Runnable() {
              @Override
              public void run() {
                esm.save();
                esm.reloadFromDisk();
              }
            });
          }
        }
      }
    });
  }


}
