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
package codeOrchestra.generator;

import codeOrchestra.actionscript.make.ASDebugGenFile;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.view.ASMessageMarker;
import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.generator.generationTypes.StreamHandler;
import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.ide.vfs.IdeaFile;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jdom.Element;

import java.util.*;

/**
 * @author Alexander Eliseyev, Feb 13, 2012
 * @author Evgeny Gryaznov, Sep 16, 2010
*/
public class CodeOrchestraStreamHandler implements StreamHandler {
  private final SModelDescriptor myModelDescriptor;
  private final IFile myOriginalOutputDir;
  private final IFile myOutputDir;
  private final IFile myCachesOutputDir;
  private final Set<IFile> mySavedFiles = new HashSet<IFile>();
  private CodeOrchestraGenerationFileProcessor myProcessor;

  CodeOrchestraStreamHandler(SModelDescriptor modelDescriptor, IFile outputDir, CodeOrchestraGenerationFileProcessor processor) {
    myOriginalOutputDir = outputDir;

    CodeOrchestraGenerateManager codeOrchestraGenerateManager = processor.getProject().getComponent(CodeOrchestraGenerateManager.class);
    CodeOrchestraGenerationContext currentContext = codeOrchestraGenerateManager.getCurrentContext();
    if (currentContext == null) {
      myOutputDir = outputDir;
      myCachesOutputDir = FileGenerationUtil.getCachesDir(outputDir);
    } else {
      ModuleReference rootModuleReference = currentContext.getRootModule();

      // We override the output path for the AS & JS modules
      if (currentContext.isSingleOutputContext()) {
        IModule rootModule = MPSModuleRepository.getInstance().getModule(rootModuleReference);
        myOutputDir = FileSystem.getInstance().getFileByPath(rootModule.getOutputFor(modelDescriptor));
        myCachesOutputDir = FileGenerationUtil.getCachesDir(myOutputDir);
      } else {
        myOutputDir = outputDir;
        myCachesOutputDir = FileGenerationUtil.getCachesDir(outputDir);
      }
    }

    myModelDescriptor = modelDescriptor;
    myProcessor = processor;
  }

  private IFile fileForContent(String name, boolean isCache) {
    // RE-3090
    // RE-3635
    if (name.endsWith(TraceInfoCache.TRACE_FILE_NAME)) {
      // RE-3103
      if (myOriginalOutputDir instanceof IdeaFile) {
        IdeaFile originalOutputDirIdeaFile = (IdeaFile) myOriginalOutputDir;
        if (!originalOutputDirIdeaFile.isPackaged(  )) {
          return FileGenerationUtil.getDefaultOutputDir(myModelDescriptor, myOriginalOutputDir).getDescendant(name);
        }
      }
    }

    IFile outputRootDir = isCache ? myCachesOutputDir : myOutputDir;

    CodeOrchestraGenerateManager codeOrchestraGenerateManager = myProcessor.getProject().getComponent(CodeOrchestraGenerateManager.class);
    CodeOrchestraGenerationContext currentContext = codeOrchestraGenerateManager.getCurrentContext();
    if (currentContext != null) {
      String fqName = NameUtil.longNameFromNamespaceAndShortName(myModelDescriptor.getLongName(), getRootNameFromFileName(name));
      if (fqName != null) {
        FileOverrideWrapper customMapping = currentContext.getCustomFileFqNameMapping(fqName);
        if (customMapping != null) {
          return FileGenerationUtil
            .getDefaultOutputDir(NameUtil.namespaceFromLongName(customMapping.getTargetFqName()), outputRootDir)
            .getDescendant(NameUtil.shortNameFromLongName(customMapping.getTargetFqName()) + customMapping.getExtension());
        }
      }
    }

    return FileGenerationUtil.getDefaultOutputDir(myModelDescriptor, outputRootDir).getDescendant(name);
  }

  private static String getRootNameFromFileName(String fileName) {
    return NameUtil.namespaceFromLongName(fileName);
  }

  public static void main(String[] args) {
    String fileName = "SomeAwesome.as";
    System.out.println(getRootNameFromFileName(fileName));
  }

  @Override
  public void saveStream(String name, String content, boolean isCache) {
    IFile file = fileForContent(name, isCache);
    myProcessor.saveContent(file, content);
    mySavedFiles.add(file);
  }

  @Override
  public void saveStream(String name, Element content, boolean isCache) {
    IFile file = fileForContent(name, isCache);
    myProcessor.saveContent(file, content);
    mySavedFiles.add(file);
  }

  @Override
  public void saveStream(String name, byte[] content, boolean isCache) {
    IFile file = fileForContent(name, isCache);
    myProcessor.saveContent(file, content);
    mySavedFiles.add(file);
  }

  @Override
  public boolean touch(String name, boolean isCache) {
    IFile file = fileForContent(name, isCache);
    mySavedFiles.add(file);
    return file.exists();
  }

  @Override
  public void dispose() {
    CodeOrchestraGenerateManager codeOrchestraGenerateManager = myProcessor.getProject().getComponent(CodeOrchestraGenerateManager.class);
    CodeOrchestraGenerationContext currentContext = codeOrchestraGenerateManager.getCurrentContext();

    List<String> relativeAssetsPaths;
    if (currentContext == null) {
      relativeAssetsPaths = Collections.emptyList();
    } else {
      relativeAssetsPaths = currentContext.getRelativeAssetsPaths();
    }

    Set<IFile> directories = new HashSet<IFile>();

    // RF-826
    // directories.add(myOutputDir);

    directories.add(myCachesOutputDir);
    for (IFile f : mySavedFiles) {
      // RE-3231
      if (f instanceof IdeaFile) {
        IdeaFile ideaFile = (IdeaFile) f;
        // RE-3635
        if (ideaFile.getName().endsWith(TraceInfoCache.TRACE_FILE_NAME)) {
          continue;
        }
      }
      directories.add(f.getParent());
    }

    // clear garbage
    final List<IFile> filesToDelete = new ArrayList<IFile>();
    for (IFile dir : directories) {
      for (IFile outputDirectoryFile : dir.getChildren()) {
        if (outputDirectoryFile.isDirectory()) continue;
        if (mySavedFiles.contains(outputDirectoryFile)) continue;

        if (outputDirectoryFile instanceof IdeaFile) {
          IdeaFile ideaFile = (IdeaFile) outputDirectoryFile;

          // Ignore assets
          for (String relativeAssetsPath : relativeAssetsPaths) {
            if (ideaFile.getPath().endsWith(relativeAssetsPath)) {
              continue;
            }
          }

          // Ignore debug file
          if (ASDebugGenFile.FILE_NAME.equals(ideaFile.getName())) {
            continue;
          }

          // Ignore generated model digest file
          if (ideaFile.getName().endsWith(".generated")) {
            continue;
          }
        }

        filesToDelete.add(outputDirectoryFile);
      }
    }

    myProcessor.filesToDelete(filesToDelete);
    myProcessor.invalidateModel(myModelDescriptor);
  }
}
