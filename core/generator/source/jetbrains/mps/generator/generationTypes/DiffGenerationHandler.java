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
package jetbrains.mps.generator.generationTypes;

import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.ide.progress.ITaskProgressHelper;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.*;
import jetbrains.mps.textGen.TextGenManager;
import jetbrains.mps.util.*;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.Nullable;

import java.io.File;
import java.util.*;

/**
 * In-memory generation. Compares generated sources with on-disk state.
 */
public class DiffGenerationHandler extends InMemoryJavaGenerationHandler {
  private File myLastOutputDir;
  private Map<SModel, String> myOutputModelToPath = new HashMap<SModel, String>();
  private Map<SModelReference, String> myOutputModelRefToPath = new HashMap<SModelReference, String>();
  private Map<SModelReference, List<String>> myOutputModelRefToRoots = new HashMap<SModelReference, List<String>>();

  public DiffGenerationHandler(boolean reloadClasses) {
    super(reloadClasses);
  }

  public DiffGenerationHandler(boolean reloadClasses, boolean keepSources) {
    super(reloadClasses, keepSources);
  }

  @Override
  public boolean compile(IOperationContext operationContext, List<Pair<IModule, List<SModelDescriptor>>> input, boolean generationOK, ITaskProgressHelper progressHelper) {
    return true;
  }

  @Override
  public long estimateCompilationMillis(List<Pair<IModule, List<SModelDescriptor>>> input) {
    return 0;
  }

  @Override
  public boolean collectSources(IModule module, SModelDescriptor inputModel, IOperationContext context, SModel outputModel) {
    String outputDir = module.getOutputFor(inputModel);
    myLastOutputDir = new File(context.getModule().getGeneratorOutputPath());
    myOutputModelToPath.put(outputModel, outputDir);
    myOutputModelRefToPath.put(outputModel.getSModelReference(), outputDir);
    List<String> roots = new ArrayList<String>();
    myOutputModelRefToRoots.put(outputModel.getSModelReference(), roots);

    Condition<SNode> cond = new Condition<SNode>() {
      public boolean met(SNode node) {
        return node.getName() != null;
      }
    };
    Iterable<SNode> iterable = new ConditionalIterable<SNode>(outputModel.roots(), cond);
    for (SNode outputRoot : iterable) {
      roots.add(getKey(outputModel.getSModelReference(), outputRoot));
    }
    return super.collectSources(module, inputModel, context, outputModel);
  }

  public Collection<SModel> getOutputModels() {
    return myOutputModelToPath.keySet();
  }

  public Iterable<SModelReference> getOutputModelRefs() {
    return myOutputModelRefToPath.keySet();
  }

  public Iterable<String> getRoots(SModelReference ref) {
    return myOutputModelRefToRoots != null ? myOutputModelRefToRoots.get(ref) : Collections.<String>emptyList();
  }

  @Nullable
  public String getExtension(SNode outputNode) {
    return TextGenManager.instance().getExtension(outputNode);
  }

  public String getName(String outputNode, SModelReference outputModel) {
    return outputNode.substring(outputModel.getLongName().length() + 1);
  }

  public File getOutputDir(SModelReference outputModelRef) {
    if (myOutputModelRefToPath.isEmpty()) {
      return null;
    }
    IFile outputRootDir = FileSystem.getInstance().getFileByPath(myOutputModelRefToPath.get(outputModelRef));
    IFile outputDir = FileGenerationUtil.getDefaultOutputDir(outputModelRef, outputRootDir);
    return new File(outputDir.getPath());
  }

  @Override
  protected String getJavaNameFromKey(String key) {
    return key.substring(0, key.lastIndexOf("."));
  }

  @Override
  protected String getKey(SModelReference model, SNode root) {
    String extension = getExtension(root);
    String key = super.getKey(model, root);
    return extension == null ? key : key + "." + extension;
  }

  protected String getKey(SModelReference modelReference, String root) {
    return JavaNameUtil.packageNameForModelUID(modelReference) + "." + root.substring(modelReference.getLongName().length() + 1);
  }

  public String getSourceByNode(SNode outputRoot, SModel outputModel) {
    if (getSources().isEmpty()) {
      return null;
    }
    return getSources().get(getKey(outputModel.getSModelReference(), outputRoot));
  }


  public String getSourceByNode(String outputRoot, SModelReference outputModel) {
    if (getSources().isEmpty()) {
      return null;
    }
    return getSources().get(getKey(outputModel, outputRoot));
  }

  @Override
  public void clean() {
    super.clean();
    myOutputModelRefToPath.clear();
    myOutputModelRefToRoots.clear();
    myOutputModelToPath.clear();
    myLastOutputDir = null;
  }

  public File getLastOutputDir() {
    return myLastOutputDir;
  }

  public void saveGeneratedFilesOnDisk() {
    for (SModelReference outputModel : getOutputModelRefs()) {
      List<String> files = new ArrayList<String>();
      File dir = getOutputDir(outputModel);
      if (dir == null || !dir.exists() || !dir.canRead()) {
        continue;
      }
      files.addAll(Arrays.asList(dir.list()));
      for (String outputRoot : getRoots(outputModel)) {
        String filename = getName(outputRoot, outputModel);
        if (filename == null) {
          continue;
        }
        final String filePath = getOutputDir(outputModel) + File.separator + filename;
        final File testFile = new File(filePath);

        String content = getSourceByNode(outputRoot, outputModel);
        if (content != null) {
          FileUtil.write(testFile, content);
        } else {
          testFile.delete();
        }
        files.remove(filePath);
      }
      for (String f : files) {
        new File(f).delete();
      }
    }
  }

  @CodeOrchestraPatch
  public List<String> createDiffReports(Set<File> excludedFromDiffFiles) {
    List<String> result = new ArrayList<String>();
    for (SModelReference outputModel : this.getOutputModelRefs()) {
      List<String> files = new ArrayList<String>();
      File dir = this.getOutputDir(outputModel);
      if (dir == null || !dir.exists() || !dir.canRead()) {
        continue;
      }
      files.addAll(Arrays.asList(dir.list()));

      // RE-3635
      Iterator<String> filesIterator = files.iterator();
      while (filesIterator.hasNext()) {
        String fileName = filesIterator.next();
        if (fileName.endsWith(TraceInfoCache.TRACE_FILE_NAME)) {
          filesIterator.remove();
        }
      }

      for (String outputRoot : this.getRoots(outputModel)) {
        String filename = this.getName(outputRoot, outputModel);
        if (filename == null) {
          continue;
        }

        final String filePath = this.getOutputDir(outputModel) + File.separator + filename;
        if(excludedFromDiffFiles != null) {
          final File expectedFile = new File(filePath);
          if(excludedFromDiffFiles.contains(expectedFile)) {
            files.remove(filename);
            continue;
          }
        }
        final File testFile = new File(filePath);
        String oldContent = null;
        String newContent = this.getSourceByNode(outputRoot, outputModel);
// Uncomment to store regenerated content on disk:
//        try {
//          FileUtil.writeFile(testFile, newContent);
//        } catch (IOException e) {
//        }
        if (testFile.exists() && testFile.canRead()) {
          oldContent = FileUtil.read(testFile);
          files.remove(filename);
        }
        final boolean created = oldContent == null && newContent != null;
        final String title = getDiffReportTitle(outputRoot, filePath, created, false);
        String[] oldTest = getContentAsArray(oldContent, "\n");
        String[] newTest = getContentAsArray(newContent, System.getProperty("line.separator"));
        addDiffReport(oldTest, newTest, result, title);
      }
      for (String fileName : files) {
        int dotPosition = fileName.indexOf(".");
        if (dotPosition == 0 || dotPosition == -1) {
          continue;
        }
        String title = getDiffReportTitle((SNode) null, fileName, false, true);
        File file = new File(this.getOutputDir(outputModel) + File.separator + fileName);
        if (!file.exists() || !file.canRead() || !file.isFile()) {
          continue;
        }
        String[] test = FileUtil.read(file).split("\n");
        addDiffReport(test, new String[0], result, title);
      }
    }
    return result;
  }

  private static String getDiffReportTitle(SNode node, String fileName, boolean added, boolean deleted) {
    String nodeFQName = NameUtil.nodeFQName(node);
    return getDiffReportTitle(nodeFQName, fileName, added, deleted);
  }

  private static String getDiffReportTitle(String nodeFQName, String fileName,
                                           boolean added, boolean deleted) {
    return nodeFQName + ((added) ? " (created)" : ((deleted) ? " (deleted)" : "")) + "\n"
      + "  (file: " + fileName + ")";
  }

  private static String[] getContentAsArray(String content, String separator) {
    return (content != null) ? content.split(separator) : new String[0];
  }

  private static void addDiffReport(String[] old, String[] new_, List<String> reports, String title) {
    String[] diff = DifflibFacade.getSimpleDiff(old, new_);
    if (diff.length != 0) {
      reports.add(title);
      reports.addAll(Arrays.asList(diff));
      reports.add("");
    }
  }
}
