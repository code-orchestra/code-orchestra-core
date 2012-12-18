package codeOrchestra.actionscript.view.dialogs.library.util;

import com.intellij.openapi.application.ApplicationManager;

import java.lang.reflect.Method;


/**
  * author: Daniil
*/
public class GitHelper {
  public static String getGitPath() {
    Object mySetting = ApplicationManager.getApplication().getPicoContainer().getComponentInstance("git4idea.config.GitVcsApplicationSettings");
    Class<?> aClass = mySetting.getClass();
    try {
      for (Method method : aClass.getMethods()) {
        if ("getPathToGit".equals(method.getName())) {
          return (String) method.invoke(mySetting);
        }
      }
    } catch (Throwable e) {
      throw new RuntimeException(e);
    }
    return null;
  }
}
