package codeOrchestra.javaScript.debugger.traceinfo;

import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelFqName;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.traceInfo.DebugInfo;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public final class JSTraceInfoUtils {

  public static final String JS_EXTENSION = ".js";

  private static final String DEFAULT_PACKAGE_GENERATED_NAME = "default";
  private static final String DEFAULT_PACKAGE_ACTUAL_NAME = "";

  public static DebugInfo getDebugInfoForScript(@NotNull String scriptName) {
    final SModelDescriptor descriptor = getModelDescriptorForScript(scriptName);
    if (descriptor == null) {
      return null;
    }

    return TraceInfoCache.getInstance().get(descriptor);
  }

  public static SModelDescriptor getModelDescriptorForScript(@NotNull String scriptName) {
    final String packageName = scriptNameToPackageName(scriptName);
    return SModelRepository.getInstance().getModelDescriptor(new SModelFqName(packageName, null));
  }

  private static String scriptNameToPackageName(String scriptName) {
    if (!scriptName.toLowerCase().endsWith(JS_EXTENSION)) {
      return scriptName;
    }
    scriptName = scriptName.substring(0, scriptName.length() - JS_EXTENSION.length()); // Get rid of .js
    scriptName = scriptName.substring(scriptName.indexOf(".") + 1, scriptName.length()); // Get rid of module name

    if (DEFAULT_PACKAGE_GENERATED_NAME.equals(scriptName)) {
      scriptName = DEFAULT_PACKAGE_ACTUAL_NAME;
    }

    return scriptName;
  }

}
