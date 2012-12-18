package codeOrchestra.actionScript.compiler.report;

import codeOrchestra.actionscript.modulemaker.messages.CompilerMessage;
import jetbrains.mps.smodel.SNode;

/**
 * @author Alexander Eliseyev
 */
public interface CompilerMessageListener {

  void onCompilerMessageAdd(CompilerMessage compilerMessage, SNode node);
  void onCompilerMessageInvalidate(SNode node);

}
