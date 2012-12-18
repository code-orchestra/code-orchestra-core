package jetbrains.mps.nodeEditor;

import jetbrains.mps.util.annotation.CodeOrchestraPatch;

/**
 * @author Alexander Eliseyev
 */
@CodeOrchestraPatch
public final class DefaultEditorSettingsHelper {

  public static int getDefaultFontSize() {
    if (com.intellij.openapi.util.SystemInfo.isMac) {
      return 12;
    }
    return 13;
  }

  public static String getDefaultFontFamily() {
    if (com.intellij.openapi.util.SystemInfo.isMac) {
      return "Monaco";
    }
    return "Monospaced";
  }

}
