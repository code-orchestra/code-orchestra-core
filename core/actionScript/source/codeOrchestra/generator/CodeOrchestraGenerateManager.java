package codeOrchestra.generator;

import com.intellij.openapi.components.ProjectComponent;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.generator.listener.BuildProvider;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.MPSModuleRepository;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class CodeOrchestraGenerateManager implements ProjectComponent {

  private static Logger LOG = Logger.getLogger(CodeOrchestraGenerateManager.class);

  // Application-context (static)

  /* OK, this is bullshit, but there's no other way */
  private static List<CodeOrchestraGenerationContext> sharedGenerationContexts = new ArrayList<CodeOrchestraGenerationContext>();
  public static synchronized void addSharedContext(CodeOrchestraGenerationContext context) {
    sharedGenerationContexts.add(context);
  }
  public static synchronized void removeSharedContext(CodeOrchestraGenerationContext context) {
    sharedGenerationContexts.remove(context);
  }
  public static synchronized CodeOrchestraGenerationContext getSharedContext() {
    if (sharedGenerationContexts.isEmpty()) {
      return null;
    }
    return sharedGenerationContexts.get(sharedGenerationContexts.size() - 1);
  }

  // Project-context (instance)

  private CodeOrchestraGenerationContext currentContext;

  public synchronized void pushContext(@NotNull ModuleReference rootModule, BuildProvider buildProvider, ModuleReference... dependencies) {
    this.currentContext = new CodeOrchestraGenerationContext(rootModule);
    this.currentContext.setBuildProvider(buildProvider);

    addSharedContext(this.currentContext);

    if (dependencies.length > 0) {
      //OutputType rootOutputType = getOwnOutputType(rootModule);
      for (ModuleReference dependency : dependencies) {
        assert dependency != null;
        this.currentContext.addDependency(dependency);

        // Mark a dependency module for regeneration if it's output type doesn't match the root module output type
        /*
        IModule dependencyModule = MPSModuleRepository.getInstance().getModule(dependency);
        if (dependencyModule != null && rootOutputType != getOwnOutputType(dependency) && !dependencyModule.isPackaged()) {
          dependencyModule.markForRegeneration();
        }
        */
      }
    }
  }

  public synchronized OutputType getContextAwareOutputType(@NotNull IModule module) {
    return getContextAwareOutputType(module.getModuleReference());
  }

  public synchronized OutputType getContextAwareOutputType(@NotNull ModuleReference moduleReference) {
    if (currentContext == null) {
      return getOwnOutputType(moduleReference);
    }
    if (!currentContext.isDependency(moduleReference)) {
      return getOwnOutputType(moduleReference);
    }
    OutputType outputType = getOwnOutputType(currentContext.getRootModule());
    return outputType;
  }

  @Nullable
  public synchronized CodeOrchestraGenerationContext getCurrentContext() {
    return currentContext;
  }

  public synchronized CodeOrchestraGenerationContext popContext() {
    CodeOrchestraGenerationContext contextToReturn = currentContext;
    this.currentContext = null;

    if (contextToReturn != null) {
      CodeOrchestraGenerateManager.removeSharedContext(contextToReturn);
    }

    return contextToReturn;
  }

  private static OutputType getOwnOutputType(IModule module) {
    if (module instanceof Solution) {
      Solution solution = (Solution) module;

      SolutionDescriptor moduleDescriptor = solution.getModuleDescriptor();
      if (moduleDescriptor == null) {
        return OutputType.UNKNOWN;
      }

      return moduleDescriptor.getCompilerSettings().getOutputType();
    }
    return OutputType.UNKNOWN;
  }

  public static OutputType getOwnOutputType(ModuleReference moduleReference) {
    return getOwnOutputType(MPSModuleRepository.getInstance().getModule(moduleReference));
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }

  @Override
  public void initComponent() {
  }

  @Override
  public void disposeComponent() {
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "CodeOrchestra Generation Manager";
  }
}
