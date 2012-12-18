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
package jetbrains.mps.classpath;

import com.intellij.ide.IdeEventQueue;
import com.intellij.idea.LoggerFactory;
import com.intellij.util.containers.MultiMap;
import jetbrains.mps.BaseMPSTest;
import jetbrains.mps.TestMain;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.persistence.ProjectDescriptorPersistence;
import jetbrains.mps.project.persistence.SolutionDescriptorPersistence;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.model.ModelRootUtil;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.project.structure.project.Path;
import jetbrains.mps.project.structure.project.ProjectDescriptor;
import jetbrains.mps.reloading.ClassPathFactory;
import jetbrains.mps.reloading.IClassPathItem;
import jetbrains.mps.reloading.JarFileClassPathItem;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.util.IterableUtil;
import jetbrains.mps.util.PathManager;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

public class ClassPathTest extends BaseMPSTest {
  private static final Logger LOG = Logger.getLogger(ClassPathTest.class);

  private static final String MPS_CORE_PROJECT = PathManager.getBootstrapPath() + File.separator + "mps.mpr";

  protected void setUp() throws Exception {
    super.setUp();

    com.intellij.openapi.diagnostic.Logger.setFactory(LoggerFactory.getInstance());
    IdeMain.setTestMode(TestMode.CORE_TEST);
    TestMain.configureMPS();
  }

  /*
    Tests that all solutions form mps.mpr have "don't load classes" enabled.

    If a solution containing MPS core code loads its classes, these classes
    will be loaded by two different classloaders - solution classloader and
    application classloader, which will lead to different exceptions like
    ClassCastException and LinkageError in future.
  */
  public void testMPSSolutionsAreNotLoadingClasses() {
    ProjectDescriptor projectDescriptor = new ProjectDescriptor();
    ProjectDescriptorPersistence.loadProjectDescriptor(projectDescriptor, new File(MPS_CORE_PROJECT));
    for (Path path : projectDescriptor.getModules()) {
      if (!path.getPath().endsWith(MPSExtentions.DOT_SOLUTION)) continue;
      IFile solutionFile = FileSystem.getInstance().getFileByPath(path.getPath());
      SolutionDescriptor solutionDescriptor = SolutionDescriptorPersistence.loadSolutionDescriptor(solutionFile);
      assertTrue("Solution " + solutionDescriptor.getNamespace() + " is contained by core project, but has \"Don't load classes\" disabled", solutionDescriptor.isDontLoadClasses());
    }
  }

  /*
    Tests that no classes are loaded by two different modules.

    Except: solutions having "don't load classes" enabled, *.jar

    todo:explanation
  */
  public void testMPSModulesAreNotLoadingSameClasses() throws InvocationTargetException, InterruptedException {
    final MPSProject project = loadProject(MPS_CORE_PROJECT);
    assertNotNull("Can't open project " + MPS_CORE_PROJECT, project);
    waitForEDTTasksToComplete();

    final MultiMap<String, LoadEnvironment> loadedClasses = new MultiMap<String, LoadEnvironment>();

    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        List<IModule> modulesToCheck = new ArrayList<IModule>();
        modulesToCheck.addAll(MPSModuleRepository.getInstance().getAllLanguages());
        modulesToCheck.addAll(MPSModuleRepository.getInstance().getAllSolutions());
        modulesToCheck.removeAll(project.getProjectModules(Solution.class));

        //collect class2module info
        for (IModule m : modulesToCheck) {
          List<ModelRoot> stubs = ModelRootUtil.filterJava(m.getModuleDescriptor().getStubModelEntries());

          for (ModelRoot entry : stubs) {
            String path = entry.getPath();
            IClassPathItem pathItem = null;
            try {
              pathItem = ClassPathFactory.getInstance().createFromPath(path, "Tests");
            } catch (IOException e) {
              LOG.error(e);
            }
            if (pathItem == null) continue;

            // do not check libs
            if (pathItem instanceof JarFileClassPathItem) continue;

            for (String className : getAllClasses(pathItem)) {
              String namespace = m.getModuleFqName();
              if (!loadedClasses.containsKey(className)) {
                loadedClasses.put(className, new HashSet<LoadEnvironment>(1));
              }

              loadedClasses.get(className).add(new LoadEnvironment(namespace, pathItem.toString()));
            }
          }
        }
      }
    });

    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      public void run() {
        project.dispose();

        IdeEventQueue.getInstance().flushQueue();
        System.gc();
      }
    });
    waitForEDTTasksToComplete();

    Set<Conflict> conflicts = new HashSet<Conflict>();
    for (String className : loadedClasses.keySet()) {
      Collection<LoadEnvironment> environments = loadedClasses.get(className);
      if (environments.size() > 1) {
        Conflict conflict = new Conflict(className);
        conflict.addLoadEnvironments(environments);
        conflicts.add(conflict);
      }
    }
    assertTrue(getConflictsDescription(conflicts), conflicts.isEmpty());
  }

  private List<String> getAllClasses(IClassPathItem pathItem) {
    Set<String> packages = new HashSet<String>();
    packages.add("");

    List<String> classNames = new ArrayList<String>();

    while (!packages.isEmpty()) {
      String some = packages.iterator().next();
      packages.remove(some);
      packages.addAll(IterableUtil.asCollection(pathItem.getSubpackages(some)));

      for (String shortClassName : pathItem.getAvailableClasses(some)) {
        classNames.add(some + "." + shortClassName);
      }
    }

    return classNames;
  }

  private MPSProject loadProject(final String projectFilePath) {
    final MPSProject[] projectArray = new MPSProject[]{null};
    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      public void run() {
        try {
          ModelAccess.instance().runWriteAction(new Runnable() {
            public void run() {
              File projectFile = new File(projectFilePath);
              projectArray[0] = TestMain.loadProject(projectFile);
            }
          });
        } catch (Throwable t) {
          t.printStackTrace();
        }
      }
    });
    final MPSProject project = projectArray[0];
    return project;
  }

  private String getConflictsDescription(Collection<Conflict> conflicts) {
    StringBuilder result = new StringBuilder();
    for (Conflict c : conflicts) {
      result.append(c.toString());
    }
    return result.toString();
  }

  private static class LoadEnvironment {
    private String myModule;
    private String myClassPath;

    public LoadEnvironment(String module, String classPath) {
      myModule = module;
      myClassPath = classPath;
    }

    public String getModule() {
      return myModule;
    }

    public String getClassPath() {
      return myClassPath;
    }

    @Override
    public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      LoadEnvironment that = (LoadEnvironment) o;

      if (myModule != null ? !myModule.equals(that.myModule) : that.myModule != null) return false;

      return true;
    }

    @Override
    public int hashCode() {
      return myModule != null ? myModule.hashCode() : 0;
    }
  }

  private static class Conflict {
    private List<LoadEnvironment> myLoadEnvironments = new ArrayList<LoadEnvironment>(2);
    private String myClassName;

    private Conflict(String className) {
      myClassName = className;
    }

    public void addLoadEnvironments(Collection<LoadEnvironment> loadEnvironments) {
      myLoadEnvironments.addAll(loadEnvironments);
    }

    public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      Conflict conflict = (Conflict) o;

      if (myLoadEnvironments != null ? !myLoadEnvironments.equals(conflict.myLoadEnvironments) : conflict.myLoadEnvironments != null)
        return false;

      return true;
    }

    public int hashCode() {
      return myLoadEnvironments != null ? myLoadEnvironments.hashCode() : 0;
    }

    public String toString() {
      StringBuilder result = new StringBuilder("Conflict: ");
      result.append(myClassName).append(" was loaded by:\n");

      for (LoadEnvironment le : myLoadEnvironments) {
        result.append("  module: ").append(le.getModule()).append("; classpath item: ").append(le.getClassPath()).append("\n");
      }

      return result.toString();
    }
  }
}
