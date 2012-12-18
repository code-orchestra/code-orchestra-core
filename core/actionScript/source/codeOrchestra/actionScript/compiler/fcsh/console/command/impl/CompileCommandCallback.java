package codeOrchestra.actionScript.compiler.fcsh.console.command.impl;

import codeOrchestra.actionScript.compiler.fcsh.FCSHException;
import codeOrchestra.actionScript.compiler.fcsh.console.command.CommandCallback;
import codeOrchestra.actionscript.modulemaker.CompilationResult;

/**
 * @author Alexander Eliseyev
 */
public interface CompileCommandCallback extends CommandCallback {

  CompilationResult getCompileResult() throws FCSHException;

}
