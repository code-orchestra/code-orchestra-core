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
package jetbrains.mps.util;

import jetbrains.mps.library.ModulesMiner;
import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.samples.SamplesManager;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.vfs.IFileUtils;

public class MacrosFactory {
  public static final String SOLUTION_DESCRIPTOR = "${solution_descriptor}";
  public static final String LIBRARY_DESCRIPTOR = "${library_descriptor}";
  public static final String DEVKIT_DESCRIPTOR = "${devkit_descriptor}";
  public static final String LANGUAGE_DESCRIPTOR = "${language_descriptor}";
  public static final String PROJECT = "${project}";

  public static boolean containsNonMPSMacros(String path) {
    return path.contains("${") && !MacrosFactory.containsMPSMacros(path);
  }

  public static boolean containsMPSMacros(String path){
    return path.contains(SOLUTION_DESCRIPTOR)||
      path.contains(LIBRARY_DESCRIPTOR)||
      path.contains(DEVKIT_DESCRIPTOR)||
      path.contains(LANGUAGE_DESCRIPTOR)||
      path.contains(PROJECT)||
      path.contains(Macros.MPS_HOME);
  }

  public static Macros languageDescriptor() {
    return new DescriptorMacros(LANGUAGE_DESCRIPTOR);
  }

  public static Macros solutionDescriptor() {
    return new DescriptorMacros(SOLUTION_DESCRIPTOR);
  }

  public static Macros libraryDescriptor() {
    return new DescriptorMacros(LIBRARY_DESCRIPTOR);
  }

  public static Macros devkitMacros() {
    return new DescriptorMacros(DEVKIT_DESCRIPTOR);
  }

  public static Macros projectDescriptor() {
    return new ProjectDescriptorMacros();
  }

  public static Macros mpsHomeMacros() {
    return new Macros() { };
  }

  public static Macros moduleDescriptor(IModule module) {
    if (module instanceof Language) {
      return languageDescriptor();
    } else if (module instanceof Solution) {
      return solutionDescriptor();
    } else if (module instanceof DevKit) {
      return devkitMacros();
    }
    return mpsHomeMacros();
  }

  public static String getMacroString(IModule module) {
    if (module instanceof Language) {
      return LANGUAGE_DESCRIPTOR;
    } else if (module instanceof Solution) {
      return SOLUTION_DESCRIPTOR;
    } else if (module instanceof DevKit) {
      return DEVKIT_DESCRIPTOR;
    }
    return Macros.MPS_HOME;
  }

  private static class DescriptorMacros extends Macros {
    private final String myMacroString;

    private DescriptorMacros(String macroString) {
      myMacroString = macroString;
    }

    protected String expandPath_internal(String path, IFile anchorFile) {
      if (path.startsWith(myMacroString)) {
        IFile anchorFolder = anchorFile.getParent();
        if(anchorFile.getPath().endsWith(ModulesMiner.META_INF_MODULE_XML)) {
          anchorFolder = anchorFolder.getParent();
        }
        String modelRelativePath = removePrefix(path, myMacroString);
        return IFileUtils.getCanonicalPath(anchorFolder.getDescendant(modelRelativePath));
      }
      return super.expandPath_internal(path, anchorFile);
    }

    protected String shrinkPath_internal(String absolutePath, IFile anchorFile) {
      IFile anchorFolder = anchorFile.getParent();
      if(anchorFile.getPath().endsWith(ModulesMiner.META_INF_MODULE_XML)) {
        anchorFolder = anchorFolder.getParent();
      }

      String prefix = IFileUtils.getCanonicalPath(anchorFolder);
      if (pathStartsWith(absolutePath, prefix)) {
        String relationalPath = shrink(absolutePath, prefix);
        return myMacroString + relationalPath;
      }
      return super.shrinkPath_internal(absolutePath, anchorFile);
    }
  }

  private static class ProjectDescriptorMacros extends DescriptorMacros {
    private ProjectDescriptorMacros() {
      super(MacrosFactory.PROJECT);
    }

    protected String shrinkPath_internal(String absolutePath, IFile projectDescriptor) {
      String prefix;

      if (!projectDescriptor.isDirectory()) {
        prefix = IFileUtils.getCanonicalPath(projectDescriptor.getParent());
      } else {
        prefix = IFileUtils.getCanonicalPath(projectDescriptor);
      }

      for (String samplesPath : SamplesManager.getInstance().getSamplesPaths()) {
        if (samplesPath != null && pathStartsWith(absolutePath, samplesPath) && pathStartsWith(prefix, samplesPath)) {
          String relationalPath = shrink(absolutePath, prefix);
          return MacrosFactory.PROJECT + relationalPath;
        }
      }

      return super.shrinkPath_internal(absolutePath, projectDescriptor);
    }
  }
}
