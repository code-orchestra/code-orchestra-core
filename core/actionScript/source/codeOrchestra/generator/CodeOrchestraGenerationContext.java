package codeOrchestra.generator;

import codeOrchestra.actionscript.modulemaker.CompilationResult;
import codeOrchestra.actionscript.modulemaker.config.FlexFileExtensions;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.generator.optimize.UsedRoots;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.CollectionUtil;
import org.jetbrains.annotations.NotNull;

import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public class CodeOrchestraGenerationContext {

  @NotNull
  private ModuleReference rootModule;
  private Set<ModuleReference> dependencies = new HashSet<ModuleReference>();

  private String overridingMainClassFqName;
  private String overridingMainClassFileExtension = FlexFileExtensions.DOT_AS;
  private Map<String, FileOverrideWrapper> customFileFqNameMapping = new HashMap<String, FileOverrideWrapper>();

  private Set<SModelReference> accessoriesReferences = new HashSet<SModelReference>();

  private UsedRoots usedRoots = new UsedRoots();
  private List<String> relativeAssetsPaths = new ArrayList<String>();
  private long writtenFilesSize;
  private BuildProvider buildProvider;
  private CompilationResult compilationResult;
  private Set<ModuleReference> excludedModules = new HashSet<ModuleReference>();

  CodeOrchestraGenerationContext(@NotNull ModuleReference rootModule) {
    this.rootModule = rootModule;
  }

  // Used roots API BEGIN

  public void addUsedRoot(SNodePointer nodePointer) {
    usedRoots.addUsedRoot(nodePointer);
  }

  public boolean isRootUsed(SNodePointer nodePointer) {
    return usedRoots.isRootUsed(nodePointer);
  }

  public boolean isModelUsed(SModelReference modelReference) {
    return usedRoots.isModelUsed(modelReference);
  }

  public Set<SModelReference> getUsedModels() {
    return usedRoots.getUsedModels();
  }

  public UsedRoots getUsedRootsRegistry() {
    return usedRoots;
  }

  // Used roots API END

  public void addAccessoryModel(SModelReference accessoryReference) {
    this.accessoriesReferences.add(accessoryReference);
  }

  public String getOverridingMainClassFileExtension() {
    return overridingMainClassFileExtension;
  }

  public void overrideMainClassExtension(String overridingMainClassFileExtension) {
    this.overridingMainClassFileExtension = overridingMainClassFileExtension;
  }

  public void overrideMainClass(String mainClassFqName) {
    this.overridingMainClassFqName = mainClassFqName;
  }

  public String getOverridingMainClassFqName() {
    return overridingMainClassFqName;
  }

  public void addFqNameMapping(String sourceFqName, String targetFqName, String extension) {
    this.customFileFqNameMapping.put(sourceFqName, new FileOverrideWrapper(sourceFqName, targetFqName, extension));
  }

  public FileOverrideWrapper getCustomFileFqNameMapping(String sourceFqName) {
    return customFileFqNameMapping.get(sourceFqName);
  }

  public OutputType getRootOutputType() {
    return CodeOrchestraGenerateManager.getOwnOutputType(rootModule);
  }

  public boolean isSingleOutputContext() {
    return EnumSet.of(
      OutputType.FLEX_APPLICATION,
      OutputType.FLEX_LIBRARY,
      OutputType.HTML5_APPLICATION,
      OutputType.HTML5_LIBRARY)
      .contains(CodeOrchestraGenerateManager.getOwnOutputType(rootModule));
  }

  public ModuleReference getRootModule() {
    return rootModule;
  }

  void addDependency(ModuleReference moduleReference) {
    dependencies.add(moduleReference);
  }

  public boolean isDependency(ModuleReference moduleReference) {
    return dependencies.contains(moduleReference);
  }

  public boolean hasModel(SModel model) {
    // 0 - check accessories models
    if (accessoriesReferences.contains(model.getSModelReference())) {
      return true;
    }

    // 1 - collect model owning modules references
    Set<ModuleReference> owningModulesReferences = new HashSet<ModuleReference>();
    for (IModule owningModule : SModelRepository.getInstance().getModules(model.getModelDescriptor())) {
      owningModulesReferences.add(owningModule.getModuleReference());
    }

    // 2 - collect context modules references
    Set<ModuleReference> contextModulesReferences = new HashSet<ModuleReference>(dependencies) {{ add(rootModule); }};

    // 3 - check for intersections
    return CollectionUtil.intersects(owningModulesReferences, contextModulesReferences);
  }

  public void addAssetRelativePath(String relativePath) {
    this.relativeAssetsPaths.add(relativePath);
  }

  public List<String> getRelativeAssetsPaths() {
    return Collections.unmodifiableList(relativeAssetsPaths);
  }

  public void addGeneratedFileSize(long writtenFilesSize) {
    this.writtenFilesSize += writtenFilesSize;
  }

  public long getWrittenFilesSize() {
    if (writtenFilesSize == 0) {
      return 1;
    }
    return writtenFilesSize;
  }

  public void setBuildProvider(BuildProvider buildProvider) {
    this.buildProvider = buildProvider;
  }

  public BuildProvider getBuildProvider() {
    return buildProvider;
  }

  public void setCompilationResult(CompilationResult result) {
    this.compilationResult = result;
  }

  public CompilationResult getCompilationResult() {
    return compilationResult;
  }

  public void addExcludedSolution(Solution excludedSolutions) {
    this.excludedModules.add(excludedSolutions.getModuleReference());
  }

  public boolean isExcluded(ModuleReference moduleReference) {
    return excludedModules.contains(moduleReference);
  }
  
}
