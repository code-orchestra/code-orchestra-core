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
import com.intellij.ide.IdeEventQueue;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.TestMain;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.internal.collections.runtime.IterableUtils;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.*;
import jetbrains.mps.testbench.MpsMakeHelper;
import jetbrains.mps.testbench.ProjectTestHelper;
import jetbrains.mps.testbench.ProjectTestHelper.Token;
import jetbrains.mps.testbench.junit.Order;
import jetbrains.mps.testbench.junit.runners.WatchingParameterized;
import org.junit.*;
import org.junit.rules.TestName;
import org.junit.rules.TestWatchman;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized.Parameters;
import org.junit.runners.model.FrameworkMethod;
import org.junit.runners.model.TestClass;

import java.io.File;
import java.util.*;


/**
 * User: fyodor
 * Date: Aug 19, 2010
 */
@RunWith(WatchingParameterized.class)
public class ProjectTest {

  public static String PROJECT = "/MPS.mpr";

  private static ProjectTestHelper HELPER;
  private static List<FrameworkMethod> METHODS = new TestClass(ProjectTest.class).getAnnotatedMethods(Test.class);
  private static MPSProject mpsProject;

  public static class Fixture {
    String fixtureId;
    Token token;
    List<FrameworkMethod> methods = new ArrayList<FrameworkMethod>();

    Fixture(IModule module, Project project) {
      fixtureId = getFixtureId(module, project);
      this.token = HELPER.getToken(module, project);
      methods.addAll(METHODS);
    }

    private String getFixtureId(IModule module, Project project) {
      String suffix;
      if (module instanceof Language) {
        suffix = " [lang]";
      } else if (module instanceof Solution) {
        suffix = " [solution]";
      } else {
        suffix = " [" + module.getClass().getSimpleName() + "]";
      }

      return module.getModuleFqName() + suffix;
//      String modulePath = module.getDescriptorFile().getPath();
//      String projectBaseDir = project.getBaseDir().getPath();
//      if (modulePath.startsWith(projectBaseDir)) {
//        modulePath = modulePath.substring(projectBaseDir.length());
//      }
//      return  modulePath;
    }

    void after(FrameworkMethod mth) {
      methods.remove(mth);
      if (methods.size() == 0) {
        HELPER.cleanUp(token);
      }
    }

    @Override
    public String toString() {
      return fixtureId;
    }
  }

  @Parameters
  public static List<Object[]> FIXTURES() {
    HELPER = new ProjectTestHelper();
    HELPER.setMacro("samples_home", System.getProperty("user.dir") + "/samples");
    List<Object[]> fixtures = new ArrayList<Object[]>();
    mpsProject = TestMain.loadProject(new File(System.getProperty("user.dir") + PROJECT));
    List<IModule> allModules = ModelAccess.instance().runReadAction(new Computable<List<IModule>>() {
      @Override
      public List<IModule> compute() {
        return MPSModuleRepository.getInstance().getAllModules();
      }
    });
    Collections.sort(allModules, new Comparator<IModule>() {
      @Override
      public int compare(IModule m1, IModule m2) {
        String fqName1 = m1.getModuleFqName();
        String fqName2 = m2.getModuleFqName();
        return fqName1.compareTo(fqName2);
      }
    });
    for (IModule module : allModules) {
      if (needsGeneration(module) && !(module instanceof Generator)) {
        fixtures.add(new Object[]{new Fixture(module, mpsProject.getProject())});
      }
    }
    return fixtures;
  }

  private static boolean needsGeneration(IModule module) {
    for (SModelDescriptor descriptor : module.getOwnModelDescriptors()) {
      if (descriptor.isGeneratable()) {
        return true;
      }
    }
    return false;
  }

  private final Fixture fixture;

  @BeforeClass
  public static void make() throws Exception {
    new MpsMakeHelper().make();
    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      public void run() {
        IdeEventQueue.getInstance().flushQueue();
        System.gc();
      }
    });
  }

  @AfterClass
  public static void disposeProject() {
    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      public void run() {
        mpsProject.dispose(false);
        IdeEventQueue.getInstance().flushQueue();
        System.gc();
      }
    });
  }


  public ProjectTest(Fixture fix) {
    this.fixture = fix;
  }

  @Rule
  public TestName name = new TestName();

  @Rule
  public TestWatchman watchman = new TestWatchman() {
    @Override
    public void finished(FrameworkMethod method) {
      fixture.after(method);
    }
  };

  @Test
  @Order(1)
  public void buildModule() throws Exception {
    if (!HELPER.build(fixture.token)) {
      List<String> errors = HELPER.buildErrors(fixture.token);
      Assert.assertTrue("Build errors:\n" + IterableUtils.join(errors, "\n"), errors.isEmpty());
      List<String> warns = HELPER.buildWarns(fixture.token);
      Assert.assertTrue("Build warnings:\n" + IterableUtils.join(warns, "\n"), warns.isEmpty());
    }
  }

  @Test
  @Order(2)
  public void diffModule() throws Exception {
    List<String> diffReport = HELPER.getDiffReport(fixture.token);
    Assert.assertTrue("Difference:\n" + IterableUtils.join(diffReport, "\n"), diffReport.isEmpty());
  }


  //  @Test
  @Order(4)
  public void testProject() throws Exception {
    HELPER.test(fixture.token);
  }
}
