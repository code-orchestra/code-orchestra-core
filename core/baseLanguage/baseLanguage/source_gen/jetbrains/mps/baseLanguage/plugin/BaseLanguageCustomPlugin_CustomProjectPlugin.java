package jetbrains.mps.baseLanguage.plugin;

/*Generated by MPS */

import jetbrains.mps.plugins.pluginparts.custom.BaseCustomProjectPlugin;
import jetbrains.mps.ide.resolve.MethodDeclarationsFixer;
import jetbrains.mps.nodeEditor.Highlighter;
import jetbrains.mps.project.MPSProject;

public class BaseLanguageCustomPlugin_CustomProjectPlugin extends BaseCustomProjectPlugin {
  private ToDoHighlighter myToDoHighlighter = new ToDoHighlighter();
  private MethodDeclarationsFixer myMethodDeclFixer = new MethodDeclarationsFixer();
  private OverrideMethodsChecker myOverrideMethodsChecker = new OverrideMethodsChecker();
  private Highlighter myHighlighter;

  public BaseLanguageCustomPlugin_CustomProjectPlugin() {
  }

  public void doInit(MPSProject project) {
    BaseLanguageCustomPlugin_CustomProjectPlugin.this.myHighlighter = project.getProject().getComponent(Highlighter.class);
    if (BaseLanguageCustomPlugin_CustomProjectPlugin.this.myHighlighter != null) {
      BaseLanguageCustomPlugin_CustomProjectPlugin.this.myHighlighter.addChecker(BaseLanguageCustomPlugin_CustomProjectPlugin.this.myToDoHighlighter);
      BaseLanguageCustomPlugin_CustomProjectPlugin.this.myHighlighter.addChecker(BaseLanguageCustomPlugin_CustomProjectPlugin.this.myMethodDeclFixer);
      BaseLanguageCustomPlugin_CustomProjectPlugin.this.myHighlighter.addChecker(BaseLanguageCustomPlugin_CustomProjectPlugin.this.myOverrideMethodsChecker);
      BaseLanguageCustomPlugin_CustomProjectPlugin.this.myMethodDeclFixer.init();
    }
  }

  public void doDispose(MPSProject project) {
    if (BaseLanguageCustomPlugin_CustomProjectPlugin.this.myHighlighter != null) {
      BaseLanguageCustomPlugin_CustomProjectPlugin.this.myHighlighter.removeChecker(BaseLanguageCustomPlugin_CustomProjectPlugin.this.myMethodDeclFixer);
      BaseLanguageCustomPlugin_CustomProjectPlugin.this.myHighlighter.removeChecker(BaseLanguageCustomPlugin_CustomProjectPlugin.this.myToDoHighlighter);
      BaseLanguageCustomPlugin_CustomProjectPlugin.this.myHighlighter.removeChecker(BaseLanguageCustomPlugin_CustomProjectPlugin.this.myOverrideMethodsChecker);

      BaseLanguageCustomPlugin_CustomProjectPlugin.this.myMethodDeclFixer.dispose();
      BaseLanguageCustomPlugin_CustomProjectPlugin.this.myToDoHighlighter.dispose();
      BaseLanguageCustomPlugin_CustomProjectPlugin.this.myOverrideMethodsChecker.dispose();
    }
  }
}
