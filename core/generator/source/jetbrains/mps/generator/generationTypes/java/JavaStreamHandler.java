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
package jetbrains.mps.generator.generationTypes.java;

import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.generator.generationTypes.StreamHandler;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.vfs.IFile;
import org.jdom.Element;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
* Evgeny Gryaznov, Sep 16, 2010
*/
class JavaStreamHandler implements StreamHandler {
  private final SModelDescriptor myModelDescriptor;
  private final IFile myOutputDir;
  private final IFile myCachesOutputDir;
  private final Set<IFile> mySavedFiles = new HashSet<IFile>();
  private FileProcessor myProcessor;

  JavaStreamHandler(SModelDescriptor modelDescriptor, IFile outputDir, FileProcessor processor) {
    myModelDescriptor = modelDescriptor;
    myOutputDir = outputDir;
    myCachesOutputDir = FileGenerationUtil.getCachesDir(outputDir);
    myProcessor = processor;
  }

  @Override
  public void saveStream(String name, String content, boolean isCache) {
    IFile outputRootDir = isCache ? myCachesOutputDir : myOutputDir;
    IFile file = FileGenerationUtil.getDefaultOutputDir(myModelDescriptor, outputRootDir).getDescendant(name);
    myProcessor.saveContent(file, content);
    mySavedFiles.add(file);
  }

  @Override
  public void saveStream(String name, Element content, boolean isCache) {
    IFile outputRootDir = isCache ? myCachesOutputDir : myOutputDir;
    IFile file = FileGenerationUtil.getDefaultOutputDir(myModelDescriptor, outputRootDir).getDescendant(name);
    myProcessor.saveContent(file, content);
    mySavedFiles.add(file);
  }

  @Override
  public void saveStream(String name, byte[] content, boolean isCache) {
    IFile outputRootDir = isCache ? myCachesOutputDir : myOutputDir;
    IFile file = FileGenerationUtil.getDefaultOutputDir(myModelDescriptor, outputRootDir).getDescendant(name);
    myProcessor.saveContent(file, content);
    mySavedFiles.add(file);
  }

  @Override
  public boolean touch(String name, boolean isCache) {
    IFile outputRootDir = isCache ? myCachesOutputDir : myOutputDir;
    IFile file = FileGenerationUtil.getDefaultOutputDir(myModelDescriptor, outputRootDir).getDescendant(name);
    mySavedFiles.add(file);
    return file.exists();
  }

  @Override
  public void dispose() {
    Set<IFile> directories = new HashSet<IFile>();
    directories.add(myOutputDir);
    directories.add(myCachesOutputDir);
    for (IFile f : mySavedFiles) {
      directories.add(f.getParent());
    }

    // clear garbage
    final List<IFile> filesToDelete = new ArrayList<IFile>();
    for (IFile dir : directories) {
      for (IFile outputDirectoryFile : dir.getChildren()) {
        if (outputDirectoryFile.isDirectory()) continue;
        if (mySavedFiles.contains(outputDirectoryFile)) continue;
        filesToDelete.add(outputDirectoryFile);
      }
    }

    myProcessor.filesToDelete(filesToDelete);
    myProcessor.invalidateModel(myModelDescriptor);
  }
}
