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
package jetbrains.mps.make;

import gnu.trove.TObjectLongHashMap;
import jetbrains.mps.make.java.BLDependenciesCache;
import jetbrains.mps.make.java.ModelDependencies;
import jetbrains.mps.make.java.RootDependencies;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelStereotype;
import jetbrains.mps.util.FlattenIterable;
import jetbrains.mps.util.NameUtil;

import java.io.File;
import java.util.*;

class Dependencies {

  private final Map<String, Set<String>> myDependencies = new HashMap<String, Set<String>>();
  private final Map<String, Set<String>> myExtendsDependencies = new HashMap<String, Set<String>>();
  private final Map<String, IModule> myModules = new HashMap<String, IModule>();
  private final TObjectLongHashMap<String> myLastModified = new TObjectLongHashMap<String>();

  public Dependencies(Collection<IModule> ms) {
    for (IModule m : ms) {
      collectDependencies(m);
    }
  }

  /*
   *  returns collection with duplicates
   */
  public Iterable<String> getAllDependencies(String fqName) {
    FlattenIterable<String> result = new FlattenIterable<String>();
    Set<String> deps = myDependencies.get(fqName);
    if (deps != null) {
      result.add(deps);
    }
    fillExtendsDependencies(fqName, result);
    return result;
  }

  private void fillExtendsDependencies(String fqName, FlattenIterable<String> result) {
    Set<String> extendDeps = myExtendsDependencies.get(fqName);
    if (extendDeps == null) return;

    result.add(extendDeps);
    for (String ext : extendDeps) {
      fillExtendsDependencies(ext, result);
    }
  }

  private File getJavaFile(String fqName) {
    IModule m = myModules.get(fqName);
    if (m == null) return null;

    String outputPath = m.getGeneratorOutputPath() + File.separator + NameUtil.pathFromNamespace(fqName) + MPSExtentions.DOT_JAVAFILE;
    return new File(outputPath);
  }

  private void collectDependencies(IModule m) {
    String outputPath = m.getGeneratorOutputPath();
    String testOutputPath = m.getTestsGeneratorOutputPath();
    if (outputPath == null && testOutputPath == null) return;

    List<SModelDescriptor> models = m.getOwnModelDescriptors();
    for (SModelDescriptor md : models) {
      if (!SModelStereotype.isUserModel(md)) continue;

      ModelDependencies dependRoot = BLDependenciesCache.getInstance().get(md);
      if (dependRoot == null) continue;
      add(m, dependRoot);
    }
  }

  private void add(IModule m, ModelDependencies root) {
    for (RootDependencies r : root.getDependencies()) {
      final String className = r.getClassName();

      myModules.put(className, m);
      myDependencies.put(className, r.getDependencies());
      myExtendsDependencies.put(className, r.getExtends());
    }
  }

  public long getJavaFileLastModified(String fqName) {
    long value = myLastModified.get(fqName);
    if (value == 0) {
      File iFile = getJavaFile(fqName);
      value = iFile.lastModified();
      myLastModified.put(fqName, value == 0 ? -1 : 0);
    }

    return value == -1 ? 0 : value;
  }

  public IModule getModule(String fqName) {
    return myModules.get(fqName);
  }
}
