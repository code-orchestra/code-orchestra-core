package codeOrchestra.rgs.state.model;

import codeOrchestra.actionscript.modulemaker.CompilerKind;

import java.io.Serializable;

/**
 * @author: Alexander Eliseyev
 */
public class RemoteGenerationSettings implements Serializable {

  private CompilerKind compilerKind;

  public CompilerKind getCompilerKind() {
    return compilerKind;
  }

  public void setCompilerKind(CompilerKind compilerKind) {
    this.compilerKind = compilerKind;
  }
}
