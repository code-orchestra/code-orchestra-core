package codeOrchestra.actionscript.view.dialogs.parsing;

import com.intellij.openapi.progress.ProgressIndicator;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.SModelReference;

import java.io.File;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public interface ParsedModuleCreateCallback {

  Set<SModelReference> onModuleCreated(Solution solution, File sourcePath, ProgressIndicator progressIndicator);

}
