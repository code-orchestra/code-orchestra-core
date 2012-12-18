package codeOrchestra.actionscript.stubs;

import com.intellij.openapi.project.DumbService;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.psi.search.GlobalSearchScope;
import com.intellij.util.indexing.FileBasedIndex;
import com.intellij.util.indexing.ID;
import codeOrchestra.actionScript.Concepts;
import codeOrchestra.actionScript.index.stubs.ASStubsDescriptor;
import codeOrchestra.actionScript.index.stubs.ASStubsDescriptorIndexer;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.ide.vfs.VirtualFileUtils;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.smodel.*;
import jetbrains.mps.stubs.IStubRootNodeDescriptor;
import jetbrains.mps.stubs.StubReloadManager;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.BaseSNodeDescriptor;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.SNodeDescriptor;

import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public final class SWCStubsRegistry {

  private static final ASStubsDescriptor RELIABLE_STUB_DESCRIPTOR = new ASStubsDescriptor("Object", Concepts.CLASS_CONCEPT);

  private static boolean avoidIndexing;

  public static void setAvoidIndexing(boolean avoidIndexing) {
    SWCStubsRegistry.avoidIndexing = avoidIndexing;
  }

  public static final String SWC_STEREOTYPE = SModelStereotype.getStubStereotypeForId("swc");

  private static final Logger LOG = Logger.getLogger(SWCStubsRegistry.class);

  private static final SWCStubsRegistry INSTANCE = new SWCStubsRegistry();
  public static SWCStubsRegistry getInstance() {
    return INSTANCE;
  }

  private Map<ModuleReference, Set<IStubRootNodeDescriptor>> cache = new HashMap<ModuleReference, Set<IStubRootNodeDescriptor>>();

  private SWCStubsRegistry() {
    ClassLoaderManager.getInstance().addReloadHandler(new ReloadAdapter() {
      public void unload() {
        invalidateCache();
      }
    });
  }

  public synchronized void invalidateCache() {
    this.cache.clear();
  }

  public Set<BaseSNodeDescriptor> getAllBaseStubDescriptors(List<Solution> solutions) {
    Set<BaseSNodeDescriptor> result = new HashSet<BaseSNodeDescriptor>();

    for (ASStubsDescriptor stubDescriptor : getAllStubDescriptors(solutions)) {
      String rootFqName = stubDescriptor.getRootFqName();
      String conceptFqName = stubDescriptor.getConceptFqName();
      if (conceptFqName == null || conceptFqName.isEmpty()) {
        continue;
      }

      final String packageName = NameUtil.namespaceFromLongName(rootFqName);
      SModelFqName sModelFqName = new SModelFqName(packageName, SWC_STEREOTYPE);
      SModelId sModelId = SModelId.foreign(SWC_STEREOTYPE, packageName);
      SModelReference modelReference = new SModelReference(sModelFqName, sModelId);

      SNodeId nodeId = null;
      if (conceptFqName.equals(Concepts.CLASS_CONCEPT) || conceptFqName.equals(Concepts.INTERFACE_CONCEPT)) {
        nodeId = getClassNodeId(rootFqName);
      } else if (conceptFqName.equals(Concepts.GLOBAL_FUNCTION)) {
        nodeId = getGlobalFunctionNodeId(rootFqName);
      } else if (conceptFqName.equals(Concepts.TOP_LEVEL_NAMESPACE)) {
        nodeId = getGlobalNSNodeId(rootFqName);
      } else if (conceptFqName.equals(Concepts.TOP_LEVEL_CONSTANT)) {
        nodeId = getGlobalConstantNodeId(rootFqName);
      } else if (conceptFqName.equals(Concepts.METADATA)) {
        nodeId = getAnnotationNodeId(rootFqName);
      } else {
        continue;
      }

      result.add(SNodeDescriptor.fromModelReference(rootFqName, conceptFqName, modelReference, nodeId));
    }

    return result;
  }

  public static SNodeId getAnnotationNodeId(String fqName) {
    return new SNodeId.Foreign(SNodeId.Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqName));
  }

  public static SNodeId getGlobalConstantNodeId(String fqName) {
    return new SNodeId.Foreign(SNodeId.Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqName));
  }

  public static SNodeId getClassNodeId(String fqName) {
    return new SNodeId.Foreign(SNodeId.Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqName));
  }

  public static SNodeId getGlobalFunctionNodeId(String fqName) {
    return new SNodeId.Foreign(SNodeId.Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqName));
  }

  public static SNodeId getGlobalNSNodeId(String fqName) {
    return new SNodeId.Foreign(SNodeId.Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqName + "_gns"));
  }

  public Set<ASStubsDescriptor> getAllStubDescriptors() {
    return getAllStubDescriptors(GlobalScope.getInstance().getVisibleSolutions());
  }

  public Set<ASStubsDescriptor> getAllStubDescriptors(List<Solution> solutionsToFetchStubs) {
    Set<ASStubsDescriptor> result = new HashSet<ASStubsDescriptor>();

    // Check if the indexing is going on
    Project project = ProjectHolder.getProject();
    if (project == null) {
      LOG.error("No project is open");
      return result;
    }
    if (DumbService.getInstance(project).isDumb()) {
      fetchDescriptorsDirectly(result, solutionsToFetchStubs);
      return result;
    }

    // Try to fetch the fq names from index
    fetchStubsFromIndex(result, solutionsToFetchStubs);

    if (!validateStubDescriptors(result)) {
      fetchDescriptorsDirectly(result, solutionsToFetchStubs);
    }

    return result;
  }

  private boolean validateStubDescriptors(Set<ASStubsDescriptor> result) {
    if (result.isEmpty()) {
      return false;
    }

    if (!result.contains(RELIABLE_STUB_DESCRIPTOR)) {
      return false;
    }

    return true;
  }

  private void fetchStubsFromIndex(Set<ASStubsDescriptor> result, List<Solution> solutionsToFetchStubs) {
    final ID<Integer, List<ASStubsDescriptor>> indexName = new ASStubsDescriptorIndexer().getName();
    final FileBasedIndex fileBasedIndex = FileBasedIndex.getInstance();

    Project project = ProjectHolder.getProject();
    if (project == null) {
      LOG.error("No project is open");
      return;
    }

    for (Solution solution : solutionsToFetchStubs) {
      if (SolutionUtils.isStubSolution(solution)) {
        IFile descriptorFile = solution.getDescriptorFile();
        if (descriptorFile == null) {
          continue;
        }

        VirtualFile vf = VirtualFileUtils.getVirtualFile(descriptorFile);
        if (vf == null) continue; // e.g. module was deleted

        int fileId = FileBasedIndex.getFileId(vf);
        List<List<ASStubsDescriptor>> stubDescriptorsForModule = fileBasedIndex.getValues(indexName, fileId, GlobalSearchScope.fileScope(project, vf));
        if (stubDescriptorsForModule.isEmpty()) {
          fetchDescriptorsDirectly(result, Collections.singletonList(solution));
          continue;
        }


        List<ASStubsDescriptor> stubDescriptorsFromModule = stubDescriptorsForModule.get(0);
        if (stubDescriptorsFromModule.isEmpty()) {
          // Fetch the descriptors in a greedy manner
          fetchDescriptorsDirectly(result, Collections.singletonList(solution));
          continue;
        }

        result.addAll(stubDescriptorsFromModule);
      }
    }
  }

  public Set<String> getAllStubsFqNames() {
    Set<String> allStubsFqNames = new HashSet<String>();

    if (avoidIndexing) {
      fetchDirectly(allStubsFqNames);
      return allStubsFqNames;
    }

    // Check if the indexing is going on
    Project project = ProjectHolder.getProject();
    if (project == null) {
      LOG.error("No project is open");
      return allStubsFqNames;
    }
    if (DumbService.getInstance(project).isDumb()) {
      fetchDirectly(allStubsFqNames);
      return allStubsFqNames;
    }

    // Try to fetch the fq names from index
    final ID<Integer, List<ASStubsDescriptor>> indexName = new ASStubsDescriptorIndexer().getName();
    final FileBasedIndex fileBasedIndex = FileBasedIndex.getInstance();
    for (Solution solution : GlobalScope.getInstance().getVisibleSolutions()) {
      if (SolutionUtils.isStubSolution(solution)) {
        IFile descriptorFile = solution.getDescriptorFile();
        if (descriptorFile == null) {
          continue;
        }

        VirtualFile vf = VirtualFileUtils.getVirtualFile(descriptorFile);
        if (vf == null) continue; // e.g. module was deleted

        int fileId = FileBasedIndex.getFileId(vf);
        List<List<ASStubsDescriptor>> stubDescriptorsForModule = fileBasedIndex.getValues(indexName, fileId, GlobalSearchScope.fileScope(project, vf));
        if (stubDescriptorsForModule.isEmpty()) {
          fetchDirectly(allStubsFqNames, Collections.singletonList(solution));
          continue;
        }

        List<ASStubsDescriptor> asStubsDescriptorsFromIndex = stubDescriptorsForModule.get(0);
        if (asStubsDescriptorsFromIndex.isEmpty()) {
          fetchDirectly(allStubsFqNames, Collections.singletonList(solution));
        } else {
          for (ASStubsDescriptor stubsDescriptor : asStubsDescriptorsFromIndex) {
            allStubsFqNames.add(stubsDescriptor.getRootFqName());
          }
        }
      }
    }

    if (!validateFqNames(allStubsFqNames)) {
      fetchDirectly(allStubsFqNames);
    }

    return allStubsFqNames;
  }

  private boolean validateFqNames(Set<String> allStubsFqNames) {
    if (allStubsFqNames.isEmpty()) {
      return false;
    }
    if (!allStubsFqNames.contains("Object")) {
      return false;
    }
    return true;
  }

  @SuppressWarnings("deprecation")
  private void fetchDirectly(Set<String> allStubsFqNames) {
    for (IStubRootNodeDescriptor iStubRootNodeDescriptor : getStubDescriptors()) {
      allStubsFqNames.add(iStubRootNodeDescriptor.getName());
    }
  }

  @SuppressWarnings("deprecation")
  private void fetchDirectly(Set<String> allStubsFqNames, List<Solution> solutions) {
    Set<IStubRootNodeDescriptor> solutionsStubDescriptors = getStubDescriptors(solutions);
    for (IStubRootNodeDescriptor iStubRootNodeDescriptor : solutionsStubDescriptors) {
      allStubsFqNames.add(iStubRootNodeDescriptor.getName());
    }
  }

  @SuppressWarnings("deprecation")
  private void fetchDescriptorsDirectly(Set<ASStubsDescriptor> allStubsFqNames, List<Solution> solutionsToFetchStubs) {
    for (IStubRootNodeDescriptor iStubRootNodeDescriptor : getStubDescriptors(solutionsToFetchStubs)) {
      allStubsFqNames.add(new ASStubsDescriptor(iStubRootNodeDescriptor.getName(), NameUtil.nodeFQName(iStubRootNodeDescriptor.getConcept())));
    }
  }

  @SuppressWarnings("deprecation")
  @Deprecated
  public Set<IStubRootNodeDescriptor> getStubDescriptors() {
    return getStubDescriptors(GlobalScope.getInstance().getVisibleSolutions());
  }

  @Deprecated
  public synchronized Set<IStubRootNodeDescriptor> getStubDescriptors(List<Solution> solutions) {
    Set<IStubRootNodeDescriptor> stubDescriptors = new HashSet<IStubRootNodeDescriptor>();

    for (Solution solution : solutions) {
      if (!SolutionUtils.isStubSolution(solution)) {
        continue;
      }

      ModuleReference solutionReference = solution.getModuleReference();
      Set<IStubRootNodeDescriptor> cachedDescriptors = cache.get(solutionReference);

      if (cachedDescriptors == null) {
        cachedDescriptors = new HashSet<IStubRootNodeDescriptor>();
        cachedDescriptors.addAll(StubReloadManager.getInstance().getRootNodeDescriptors(solution));
        cache.put(solutionReference, cachedDescriptors);
      }

      stubDescriptors.addAll(cachedDescriptors);
    }

    return stubDescriptors;
  }

}
