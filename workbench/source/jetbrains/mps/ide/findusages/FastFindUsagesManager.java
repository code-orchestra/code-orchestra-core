/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.ide.findusages;

import com.intellij.openapi.module.Module;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.psi.impl.cache.impl.id.FileTypeIdIndexer;
import com.intellij.psi.impl.cache.impl.id.IdIndex;
import com.intellij.psi.impl.cache.impl.id.IdIndexEntry;
import com.intellij.psi.impl.cache.impl.id.IdTableBuilding;
import com.intellij.psi.search.GlobalSearchScope;
import com.intellij.util.indexing.FileBasedIndex;
import com.intellij.util.indexing.FileContent;
import com.intellij.util.text.CharArrayUtil;
import jetbrains.mps.fileTypes.MPSFileTypeFactory;
import jetbrains.mps.findUsages.FindUsagesManager;
import jetbrains.mps.findUsages.ProxyFindUsagesManager;
import jetbrains.mps.ide.progress.IAdaptiveProgressMonitor;
import jetbrains.mps.ide.progress.util.ModelsProgressUtil;
import jetbrains.mps.ide.vfs.VirtualFileUtils;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.vfs.IFile;
import org.apache.commons.lang.StringEscapeUtils;
import org.jetbrains.annotations.NotNull;

import java.util.*;

public class FastFindUsagesManager extends FindUsagesManager {
  private static final String TARGET_NODE_ID_PREFIX = "targetNodeId=\"";
  private static final String TYPE_PREFIX = "type=\"";
  private final ProxyFindUsagesManager myProxyManager;

  public FastFindUsagesManager(ProxyFindUsagesManager proxyManager) {
    myProxyManager = proxyManager;
  }

  @NotNull
  public String getComponentName() {
    return "MPS Fast Find Usages Manager";
  }

  public void initComponent() {
    IdTableBuilding.registerIdIndexer(MPSFileTypeFactory.MODEL_FILE_TYPE, new MyFileTypeIdIndexer());
    myProxyManager.setFastManager(this);
  }

  public void disposeComponent() {
    myProxyManager.setFastManager(null);
  }

  @Override
  public Set<SNode> findInstances(SNode concept, IScope scope, IAdaptiveProgressMonitor progress, boolean manageTasks) {
    Set<SNode> result = new HashSet<SNode>();
    if (progress == null) progress = IAdaptiveProgressMonitor.NULL_PROGRESS_MONITOR;
    progressTasks(manageTasks, ModelsProgressUtil.TASK_KIND_FIND_INSTANCES, "Finding instances...", progress, scope);

    result.addAll(findInstancesOfNodeInCache(concept, scope, false));

    for (SModelDescriptor model : scope.getModelDescriptors()) {
      String taskName = ModelsProgressUtil.findInstancesModelTaskName(model);
      if (manageTasks) progress.startLeafTask(taskName, ModelsProgressUtil.TASK_KIND_FIND_INSTANCES);
      if ((model instanceof EditableSModelDescriptor) && ((EditableSModelDescriptor) model).isChanged()) {
        result.addAll(new ModelFindOperations(model).findInstances(concept, scope));
      }
      if (progress.isCanceled()) {
        if (manageTasks) progress.finishAnyway();
        return result;
      } else {
        if (manageTasks) progress.finishTask(taskName);
      }
    }
    return result;
  }

  @Override
  public Set<SNode> findExactInstances(SNode concept, IScope scope, IAdaptiveProgressMonitor progress, boolean manageTasks) {
    Set<SNode> result = new HashSet<SNode>();
    if (progress == null) progress = IAdaptiveProgressMonitor.NULL_PROGRESS_MONITOR;
    progressTasks(manageTasks, ModelsProgressUtil.TASK_KIND_FIND_EXACT_INSTANCES, "Finding exact instances...", progress, scope);

    result.addAll(findInstancesOfNodeInCache(concept, scope, true));

    for (SModelDescriptor model : scope.getModelDescriptors()) {
      String taskName = ModelsProgressUtil.findExactInstancesModelTaskName(model);
      if (manageTasks) progress.startLeafTask(taskName, ModelsProgressUtil.TASK_KIND_FIND_EXACT_INSTANCES);
      if ((model instanceof EditableSModelDescriptor) && ((EditableSModelDescriptor) model).isChanged()) {
        result.addAll(new ModelFindOperations(model).findExactInstances(concept, scope));
      }
      if (progress.isCanceled()) {
        if (manageTasks) progress.finishAnyway();
        return result;
      } else {
        if (manageTasks) progress.finishTask(taskName);
      }
    }
    return result;
  }

  public Set<SNode> findDescendants(SNode node, IScope scope) {
    Set<String> fqNames = LanguageHierarchyCache.getInstance().getDescendantsOfConcept(NameUtil.nodeFQName(node));
    Set<SNode> result = new HashSet<SNode>();
    for (String fqName : fqNames) {
      SNode foundNode = SModelUtil.findNodeByFQName(fqName, node, scope);
      if (foundNode == null) continue;
      result.add(foundNode);
    }
    return result;
  }

  public Set<SReference> findUsages(SNode node, IScope scope) {
    return findUsages(node, scope, (IAdaptiveProgressMonitor) null);
  }

  public Set<SReference> findUsages(SNode node, IScope scope, IAdaptiveProgressMonitor progress) {
    return findUsages(CollectionUtil.set(node), scope, progress, true);
  }

  public Set<SReference> findUsages(Set<SNode> nodes, final IScope scope, IAdaptiveProgressMonitor progress, boolean manageTasks) {
    Set<SReference> result = new HashSet<SReference>();
    if (progress == null) progress = IAdaptiveProgressMonitor.NULL_PROGRESS_MONITOR;
    progressTasks(manageTasks, ModelsProgressUtil.TASK_KIND_FIND_NODE_USAGES, "Finding usages...", progress, scope);

    for (SNode node : nodes) {
      result.addAll(findUsagesOfNodeInCache(node, scope));
    }
    for (SModelDescriptor sm : scope.getModelDescriptors()) {
      if (!(sm instanceof EditableSModelDescriptor)) continue;
      EditableSModelDescriptor esm = (EditableSModelDescriptor) sm;
      if (esm.isChanged()) {
        sm.getSModel();
        result.addAll(new ModelFindOperations(sm).findUsages(nodes));
      }
    }
    return result;
  }

  public List<SNode> findInstances(SNode conceptDeclaration, IScope scope) {
    Set<SNode> set = findInstances(conceptDeclaration, scope, null, true);
    return new ArrayList<SNode>(set);
  }

  public List<SNode> findInstances(SNode conceptDeclaration, IScope scope, IAdaptiveProgressMonitor monitor) {
    Set<SNode> set = findInstances(conceptDeclaration, scope, monitor, true);
    return new ArrayList<SNode>(set);
  }

  private void progressTasks(boolean manageTasks, String task, String text, IAdaptiveProgressMonitor progress, IScope scope) {
    if (manageTasks) {
      long estimatedTime = ModelsProgressUtil.estimateFindNodeUsagesTimeMillis(scope.getModelDescriptors());
      progress.startTaskAnyway(task, null, estimatedTime);
      progress.addText(text);
    }
  }

  private Set<VirtualFile> getScopeFiles(IScope scope) {
    final Set<VirtualFile> scopeFiles = new HashSet<VirtualFile>();
    for (SModelDescriptor sm : scope.getModelDescriptors()) {
      if (!(sm instanceof EditableSModelDescriptor)) continue;
      IFile modelFile = ((EditableSModelDescriptor) sm).getModelFile();
      if (modelFile == null) continue;
      scopeFiles.add(VirtualFileUtils.getVirtualFile(modelFile));
    }
    return scopeFiles;
  }

  private Set<VirtualFile> getCandidates(final Set<VirtualFile> scopeFiles, final String nodeId) {

    final Set<VirtualFile> candidates = new HashSet<VirtualFile>();
    FileBasedIndex.getInstance().processValues(IdIndex.NAME, new IdIndexEntry(nodeId, true), null,
      new FileBasedIndex.ValueProcessor<Integer>() {
        public boolean process(final VirtualFile file, final Integer value) {
          candidates.add(file);
          return true;
        }
      }, new GlobalSearchScope(null) {
        public boolean contains(VirtualFile file) {
          return scopeFiles.contains(file);
        }

        public int compare(VirtualFile file1, VirtualFile file2) {
          return file1.getPath().compareTo(file2.getPath());
        }

        public boolean isSearchInModuleContent(@NotNull Module aModule) {
          return true;
        }

        public boolean isSearchInLibraries() {
          return false;
        }
      }
    );
    return candidates;
  }

  private Set<SNode> findInstancesOfNodeInCache(SNode concept, final IScope scope, boolean isExact) {
    Set<VirtualFile> candidates = new HashSet<VirtualFile>();
    final Set<VirtualFile> scopeFiles = getScopeFiles(scope);
    // quick fix for new persistence, todo: should be persistence dependent
    //candidates.addAll(getCandidates(scopeFiles, NameUtil.nodeFQName(concept)));
    if (concept != null) candidates.addAll(getCandidates(scopeFiles, concept.getName()));
    if (!isExact) {
      Set<String> fqNames = LanguageHierarchyCache.getInstance().getAllDescendantsOfConcept(NameUtil.nodeFQName(concept));
      for (String fqName : fqNames) {
//        candidates.addAll(getCandidates(scopeFiles, fqName));
        candidates.addAll(getCandidates(scopeFiles, fqName.substring(fqName.lastIndexOf('.')+1)));
      }
    }
    Set<SNode> result = new HashSet<SNode>();
    for (VirtualFile file : candidates) {
      SModelDescriptor sm = SModelRepository.getInstance().findModel(VirtualFileUtils.toIFile(file));
      if (sm == null) continue;
      sm.getSModel();
      if (isExact) {
        result.addAll(new ModelFindOperations(sm).findExactInstances(concept, scope));
      } else {
        result.addAll(new ModelFindOperations(sm).findInstances(concept, scope));
      }
    }
    return result;
  }

  private Set<SReference> findUsagesOfNodeInCache(SNode node, final IScope scope) {
    final Set<VirtualFile> scopeFiles = getScopeFiles(scope);
    String nodeId = node.getId();
    final Set<VirtualFile> candidates = getCandidates(scopeFiles, nodeId);
    Set<SReference> result = new HashSet<SReference>();
    for (VirtualFile file : candidates) {
      SModelDescriptor sm = SModelRepository.getInstance().findModel(VirtualFileUtils.toIFile(file));
      if (sm == null) continue;
      sm.getSModel();
      result.addAll(new ModelFindOperations(sm).findUsages(node));
    }
    return result;
  }

  private static class MyFileTypeIdIndexer extends FileTypeIdIndexer {
    @NotNull
    public Map<IdIndexEntry, Integer> map(FileContent inputData) {
      CharSequence data = inputData.getContentAsText();
      char[] charsArray = CharArrayUtil.fromSequenceWithoutCopying(data);
      int len = data.length();
      if (charsArray == null) {
        charsArray = CharArrayUtil.fromSequence(data);
      }

      Map<IdIndexEntry, Integer> result = new HashMap<IdIndexEntry, Integer>();
      int wordStart = -1;
      for (int i = 0; i < len; i++) {
        char c = charsArray[i];
        if (c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z') {
          if (wordStart == -1) {
            wordStart = i;
          }
        } else if (wordStart >= 0) {
          processWord(result, charsArray, len, wordStart, i - wordStart);
          wordStart = -1;
        }
      }
      return result;
    }

    private void processWord(Map<IdIndexEntry, Integer> result, char[] chars, int charsLength, int offset, int len) {
      if (chars[offset + len] != '=' || chars[offset] != 't') {
        return; // optimization: ignore
      }

      if (contains(chars, charsLength, offset, TARGET_NODE_ID_PREFIX)) {
        // check pattern "targetNodeId=\"(?:[0-9]+v?\\.)?(.+?)\""
        offset += TARGET_NODE_ID_PREFIX.length();
        int end = indexOfQuoteAndVersionColon(chars, charsLength, offset)[0];
        if (end > offset) {
          int e = offset;
          // quick temporary fix for new persistences, todo: should be persistence dependent
//          while (e < end && chars[e] >= '0' && chars[e] <= '9') {
//            e++;
//          }
//          if (e > offset) {
//            if (e < end && chars[e] == 'v') {
//              e++;
//            }
//            if (e + 1 < end && chars[e] == '.') {
//              offset = e + 1;
//            }
//          }
//          result.put(new IdIndexEntry(unescape(new String(chars, offset, end - offset)), true), offset);
          while (e < end && chars[e] != '.')  ++e;
          if (e > offset && e + 1 < end && chars[e] == '.')
            offset = e + 1;
          String test = unescape(new String(chars, offset, end - offset)).replace("%d", ".").replace("%c", ":");
          result.put(new IdIndexEntry(test, true), offset);

        }
      } else if (contains(chars, charsLength, offset, TYPE_PREFIX)) {
        // check pattern "type=\"(.+?)\" id=\".+?\""
        offset += TYPE_PREFIX.length();
        int[] indices = indexOfQuoteAndVersionColon(chars, charsLength, offset);
        int end = indices[0];
        // quick temporary fix for new persistences, todo: should be persistence dependent
//        int qend = indices[1];
//        if (end > offset && contains(chars, charsLength, qend + 1, " id=\"")) {
          // report
//          result.put(new IdIndexEntry(unescape(new String(chars, offset, end - offset)), true), offset);
        // use only the name part of type="abcd.name" or type="model.structure.name:0"
          int start = end;
          while (start >= offset && chars[start] != '.')  --start;
          offset = start + 1;
        if (end > offset) {
          result.put(new IdIndexEntry(unescape(new String(chars, offset, end - offset)), true), offset);
        }
  //      }
      }
    }

    // result[0] - first index; result[1] - index of quote
    private int[] indexOfQuoteAndVersionColon(char[] chars, int charsLength, int start) {
      int[] result = {-1, -1};
      for (int i = start; i < charsLength; i++) {
        if (chars[i] == '"') {
          if (result[0] == -1) result[0] = i;
          result[1] = i;
          return result;
        }
        if (chars[i] == ':' && (i + 1 < charsLength) && chars[i + 1] >= '0' && chars[i + 1] <= '9') {
          result[0] = i;
        }
        if (chars[i] == '\n') {
          return new int[]{-1, -1};
        }
      }
      return new int[]{-1, -1};
    }

    private boolean contains(char[] chars, int charsLength, int offset, String s) {
      if (offset + s.length() >= charsLength) {
        return false;
      }
      for (int i = 0; i < s.length(); i++) {
        if (chars[offset + i] != s.charAt(i)) {
          return false;
        }
      }
      return true;
    }

    private String unescape(String s) {
      return StringEscapeUtils.unescapeXml(s);
    }
  }
}
