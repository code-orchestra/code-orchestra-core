package codeOrchestra.environment;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.view.ASMessageMarker;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.environment.view.EnvironmentLibraryManager;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.smodel.*;
import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public final class EnvironmentBasedRedirect {

  private static final Logger LOG = Logger.getLogger(EnvironmentBasedRedirect.class);

  private Project project;

  private Map<LibraryNodeWrapper, SNodePointer> libraryToImplCache = new HashMap<LibraryNodeWrapper, SNodePointer>();

  public EnvironmentBasedRedirect(Project project) {
    this.project = project;

    ClassLoaderManager.getInstance().addReloadHandler(new ReloadAdapter() {
      @Override
      public void unload() {
        clearCache();
      }
    });
  }

  private SNode getChildSubstitute(SNode originalNode, IModule targetModule) {
    assert !originalNode.isRoot();

    // Find the target node's root. No redirect if it can't be found or is the same as the
    // original root (which is the same, basically)
    SNode originalRootNode = originalNode.getTopmostAncestor();
    SNode targetRootNode = getSubstitute(originalRootNode, targetModule);
    if (targetRootNode == null || originalRootNode == targetRootNode) {
      return originalNode;
    }

    // Find the target root node children of the same role
    List<SNode> targetRootNodeChildrenByRole = targetRootNode.getChildren(originalNode.getRole_());
    if (targetRootNodeChildrenByRole.isEmpty()) {
      return originalNode;
    }

    // Locate the target root node child of the same role by the name
    String originalNodeName = originalNode.getName();
    for (SNode targetRootNodeChildByRole : targetRootNodeChildrenByRole) {
      if (targetRootNodeChildByRole.getName().equals(originalNodeName)) {
        return targetRootNodeChildByRole;
      }
    }

    return originalNode;
  }

  private SNode getSubstitute(SNode originalNode, IModule targetModule) {
    SModelDescriptor targetModelDescriptor = null;

    // Figure out the target model
    String packageName = originalNode.getModel().getLongName();
    for (SModelDescriptor modelDescriptor : targetModule.getOwnModelDescriptors()) {
      if (packageName.equals(modelDescriptor.getLongName())) {
        targetModelDescriptor = modelDescriptor;
        break;
      }
    }
    if (targetModelDescriptor == null) {
      return originalNode;
    }

    // Search for the target node
    if (originalNode.isRoot()) {
      for (SNode targetNode : targetModelDescriptor.getSModel().roots()) {
        if (targetNode.getName().equals(originalNode.getName())) {
          return targetNode;
        }
      }
    } else {
      return getChildSubstitute(originalNode, targetModule);
    }

    return originalNode;
  }

  public void redirectReference(SReference reference, Environment environment) {
    if (!(reference instanceof StaticReference)) {
      return;
    }

    StaticReference staticReference = (StaticReference) reference;
    SModelReference targetSModelReference = reference.getTargetSModelReference();
    if (StringUtils.isEmpty(targetSModelReference.getStereotype())) {
      return;
    }

    SNode targetNode = reference.getTargetNode();
    if (targetNode == null) {
      return;
    }

    IModule originalTargetModule = targetNode.getSourceModule();
    EnvironmentLibraryManager environmentLibraryManager = project.getComponent(EnvironmentLibraryManager.class);
    List<EnvironmentLibrary> environmentLibraries = environmentLibraryManager.getEnvironmentLibraries(originalTargetModule, environment);
    if (environmentLibraries.isEmpty()) {
      return;
    }

    SNode redirectedNode = redirectInternal(targetNode, originalTargetModule, environment, environmentLibraries);
    if (redirectedNode == targetNode) {
      return;
    }

    staticReference.setTargetNodeId(redirectedNode.getSNodeId());
    staticReference.setTargetSModelReference(redirectedNode.getModel().getSModelReference());
  }

  public List<SNode> getAllEnvironmentsImplementations(final SNode originalTargetNode) {
    List<SNode> implementations = new ArrayList<SNode>() {{ add(originalTargetNode); }};

    // Skip regular nodes, accept foreign ones only
    if (StringUtils.isEmpty(originalTargetNode.getModel().getStereotype())) {
      return implementations;
    }

    // No original module to navigate to - no redirect. Original module is not a stub solution - no redirect
    IModule navigatedModule = originalTargetNode.getSourceModule();
    if (navigatedModule == null || !(navigatedModule instanceof Solution) || !SolutionUtils.isStubSolution((Solution) navigatedModule)) {
      return implementations;
    }

    // Get the env libs
    EnvironmentLibraryManager environmentConfiguration = project.getComponent(EnvironmentLibraryManager.class);
    List<EnvironmentLibrary> environmentLibraries = environmentConfiguration.getAllEnvironmentsLibraries(navigatedModule);
    if (environmentLibraries.isEmpty()) {
      return implementations;
    }

    // Fetch the implementation nodes
    for (EnvironmentLibrary environmentLibrary : environmentLibraries) {
      IModule implModuleRef = MPSModuleRepository.getInstance().getModule(environmentLibrary.getImplementationReference());
      SNode implNode = getSubstitute(originalTargetNode, implModuleRef);
      if (implNode != originalTargetNode) {
        implementations.add(implNode);
      }
    }

    return implementations;
  }

  public SNode redirect(Project project, SNode originalTargetNode, IModule contextModule) {
    // No context - no redirect
    if (contextModule == null) {
      return originalTargetNode;
    }

    // Get the environment
    OutputType contextModuleOutputType = CodeOrchestraGenerateManager.getOwnOutputType(contextModule.getModuleReference());
    Environment environment = Environment.byOutputType(contextModuleOutputType);
    if (environment == null) {
      return originalTargetNode;
    }
    return redirect(project, originalTargetNode, environment);
  }

  public SNode redirect(Project project, final SNode originalTargetNode, Environment environment) {
    if (originalTargetNode == null) {
      return null;
    }

    // Skip regular nodes, accept foreign ones only
    if (StringUtils.isEmpty(originalTargetNode.getModel().getStereotype())) {
      return originalTargetNode;
    }

    // No original module to navigate to - no redirect. Original module is not a stub solution - no redirect
    SNode topMostAncestor = ModelAccess.instance().runReadAction(new Computable<SNode>() {
      @Override
      public SNode compute() {
        return originalTargetNode.getTopmostAncestor();
      }
    });
    IModule navigatedModule = topMostAncestor.getSourceModule();
    if (navigatedModule == null || !(navigatedModule instanceof Solution) || !SolutionUtils.isStubSolution((Solution) navigatedModule)) {
      return originalTargetNode;
    }

    return redirect(project, originalTargetNode, navigatedModule, environment);
  }

  public SNode redirect(Project project, SNode originalTargetNode, IModule navigatedModule, Environment environment) {
    // Try retrieving the redirect node
    SNode redirectNodeFromCache = getRedirectNodeFromCache(originalTargetNode, environment);
    if (redirectNodeFromCache != null) {
      return redirectNodeFromCache;
    }

    // Get the environment-specific implementation
    EnvironmentLibraryManager environmentConfiguration = project.getComponent(EnvironmentLibraryManager.class);
    List<EnvironmentLibrary> environmentLibraries = environmentConfiguration.getEnvironmentLibraries(navigatedModule, environment);
    if (environmentLibraries.isEmpty()) {
      return originalTargetNode;
    }

    return redirectInternal(originalTargetNode, navigatedModule, environment, environmentLibraries);
  }

  private SNode redirectInternal(SNode originalTargetNode, IModule libraryModule, Environment environment, List<EnvironmentLibrary> environmentLibraries) {
    for (EnvironmentLibrary environmentLibrary : environmentLibraries) {
      ModuleReference implementationReference = environmentLibrary.getImplementationReference();
      IModule implementationModule = MPSModuleRepository.getInstance().getModule(implementationReference);
      if (implementationModule == null) {
        LOG.warningWithMarker(
          "Can't locate an Environment-Specific implementation of " + libraryModule.getModuleFqName() + ": " + implementationReference,
          null, ASMessageMarker.MARKER);
        return originalTargetNode;
      }

      // Get the redirect node and put it into the cache if it's for real
      SNode redirectNode = getSubstitute(originalTargetNode, implementationModule);
      if (redirectNode != originalTargetNode) {
        addToCache(originalTargetNode, environment, redirectNode);
        return redirectNode;
      }
    }
    return originalTargetNode;
  }

  private synchronized SNode getRedirectNodeFromCache(SNode originalTargetNode, Environment environment) {
    LibraryNodeWrapper libraryNodeWrapper = new LibraryNodeWrapper(new SNodePointer(originalTargetNode), environment);
    SNodePointer redirectNodePointer = libraryToImplCache.get(libraryNodeWrapper);
    if (redirectNodePointer != null) {
      return redirectNodePointer.getNode();
    }
    return null;
  }

  private synchronized void addToCache(SNode originalTargetNode, Environment environment, SNode redirectNode) {
    this.libraryToImplCache.put(new LibraryNodeWrapper(new SNodePointer(originalTargetNode), environment), new SNodePointer(redirectNode));
  }

  private synchronized void clearCache() {
    libraryToImplCache.clear();
  }

  private static class LibraryNodeWrapper {
    private SNodePointer libraryNode;
    private Environment environment;

    private LibraryNodeWrapper(SNodePointer libraryNode, Environment environment) {
      this.libraryNode = libraryNode;
      this.environment = environment;
    }

    @Override
    public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      LibraryNodeWrapper that = (LibraryNodeWrapper) o;

      if (environment != that.environment) return false;
      if (libraryNode != null ? !libraryNode.equals(that.libraryNode) : that.libraryNode != null) return false;

      return true;
    }

    @Override
    public int hashCode() {
      int result = libraryNode != null ? libraryNode.hashCode() : 0;
      result = 31 * result + (environment != null ? environment.hashCode() : 0);
      return result;
    }
  }

}
