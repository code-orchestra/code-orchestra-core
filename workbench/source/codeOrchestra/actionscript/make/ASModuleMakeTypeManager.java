package codeOrchestra.actionscript.make;

import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.vfs.FileSystem;
import org.apache.commons.lang.ObjectUtils;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class ASModuleMakeTypeManager implements ProjectComponent {

  private static final ASModuleMakeType DEFAULT_MAKE_TYPE = ASModuleMakeType.REGULAR;

  private Project project;

  public ASModuleMakeTypeManager(Project project) {
    this.project = project;
  }

  /**
   * @param moduleName the name of the module
   * @param makeType module make type (REGULAR, DEBUG, etc)
   * @param runConfiguration run configuration object that caused the make
   * @return whether the make type has changed (or wasn't known before)
   */
  public synchronized boolean pushNewMakeType(@NotNull String moduleName, @NotNull ASModuleMakeType makeType, @Nullable Object runConfiguration) {
    // Get/create a debug gen file
    ASDebugGenFile debugGenFile = getOrCreateDebugGenFile(moduleName);

    // Memorize the old make type
    ASModuleMakeType originalMakeType = debugGenFile.getModuleMakeType();
    String originalRunConfigurationClass = debugGenFile.getRunConfigurationClass();

    // Save the new one
    debugGenFile.setModuleMakeType(makeType);
    if (runConfiguration != null) {
      debugGenFile.setRunConfigurationClass(runConfiguration.getClass().getCanonicalName());
    }
    debugGenFile.save();

    return originalMakeType != makeType || !ObjectUtils.equals(originalRunConfigurationClass, debugGenFile.getRunConfigurationClass());
  }

  /**
   * @param moduleName the name of the module
   * @param makeType module make type (REGULAR, DEBUG, etc)
   * @return whether the make type has changed (or wasn't known before)
   */
  public synchronized boolean pushNewMakeType(@NotNull String moduleName, @NotNull ASModuleMakeType makeType) {
    return pushNewMakeType(moduleName, makeType, null);
  }

  private ASDebugGenFile getOrCreateDebugGenFile(String moduleName) {
    // Locate a module
    Solution module = MPSModuleRepository.getInstance().getSolution(moduleName);
    if (module == null) {
      throw new IllegalArgumentException("No module under the name " + moduleName + " found");
    }

    // Locate/create the caches dir
    File cachesDir = new File(FileGenerationUtil.getCachesDir(FileSystem.getInstance().getFileByPath(module.getGeneratorOutputPath())).getPath());
    if (!cachesDir.exists()) {
      if (!cachesDir.mkdirs()) {
        throw new RuntimeException("Can't create a caches dir: " + cachesDir.getPath());
      }
    }

    // Get the debug gen file
    String debugGenPath = new File(cachesDir.getPath(), ASDebugGenFile.FILE_NAME).getPath();
    return ASDebugGenFile.fromFile(debugGenPath);
  }

  public synchronized @NotNull ASModuleMakeType getModuleMakeType(@NotNull String moduleName) {
    // Get/create a debug gen file
    ASDebugGenFile debugGenFile = getOrCreateDebugGenFile(moduleName);

    // Memorize the old make type
    ASModuleMakeType makeType = debugGenFile.getModuleMakeType();
    if (makeType != null) {
      return makeType;
    }

    return DEFAULT_MAKE_TYPE;
  }

  public void initComponent() {
  }

  @Override
  public void disposeComponent() {
  }

  public void projectOpened() {
  }

  public void projectClosed() {
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Module Make Type Manager";
  }
}
