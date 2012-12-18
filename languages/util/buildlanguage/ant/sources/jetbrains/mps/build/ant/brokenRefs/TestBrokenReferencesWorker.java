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
package jetbrains.mps.build.ant.brokenRefs;

import com.intellij.openapi.project.ProjectManager;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.build.ant.IBuildServerMessageFormat;
import jetbrains.mps.build.ant.MpsWorker;
import jetbrains.mps.build.ant.TeamCityMessageFormat;
import jetbrains.mps.build.ant.WhatToDo;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.structure.project.ProjectDescriptor;
import jetbrains.mps.project.validation.ModelValidator;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.FileUtil;

import java.io.File;
import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.util.List;

public class TestBrokenReferencesWorker extends MpsWorker {
  private final IBuildServerMessageFormat myBuildServerMessageFormat = TestBrokenReferencesWorker.getBuildServerMessageFormat();
  private long myUsedHeap;
  private long myUsedNonHeap;

  public TestBrokenReferencesWorker(WhatToDo whatToDo, LogLogger systemOutLogger) {
    super(whatToDo, systemOutLogger);
    MemoryMXBean mmbean = ManagementFactory.getMemoryMXBean();
    this.myUsedHeap = mmbean.getHeapMemoryUsage().getUsed();
    this.myUsedNonHeap = mmbean.getNonHeapMemoryUsage().getUsed();
  }

  public static void main(String[] args) {
    MpsWorker generator = new TestBrokenReferencesWorker(WhatToDo.fromDumpInFile(new File(args[0])), new LogLogger());
    generator.workFromMain();
  }

  public static IBuildServerMessageFormat getBuildServerMessageFormat() {
    return new TeamCityMessageFormat();
  }

  public void work() {
    setupEnvironment();

    com.intellij.openapi.project.Project ideaProject = ProjectManager.getInstance().getDefaultProject();
    File projectFile = FileUtil.createTmpFile();
    final MPSProject project = new MPSProject(ideaProject);
    project.init(projectFile, new ProjectDescriptor());

    ObjectsToProcess go = new ObjectsToProcess();
    collectModelsToGenerate(go);

    if (go.hasAnythingToGenerate()) {
      reload();
      executeTask(project, go);
    } else {
//      error("Could not find anything to test.");
    }

    dispose();
  }

  protected void executeTask(MPSProject project, final ObjectsToProcess go) {
    for (MPSProject p : go.getProjects()) {
      extractModels(go.getModels(), p);
    }
    for (IModule m : go.getModules()) {
      extractModels(go.getModels(), m);
    }
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        for (SModelDescriptor sm : go.getModels()) {
          if (!SModelStereotype.isUserModel(sm)) continue;
          String testName = "test references for " + sm.getLongName();
          output(myBuildServerMessageFormat.formatTestStart(testName));

          StringBuffer errorMessages = checkModel(sm);

          if (errorMessages.length() > 0) {
            output(myBuildServerMessageFormat.formatTestFailure(testName, "Broken References", errorMessages.toString()));
          }
          output(myBuildServerMessageFormat.formatTestFinish(testName));
        }
      }
    });
  }

  protected void output(CharSequence s) {
    System.out.println(s);
  }

  private StringBuffer checkModel(final SModelDescriptor sm) {
    final IScope scope = sm.getModule().getScope();
    StringBuffer errorMessages = new StringBuffer();
    List<String> validationResult = ModelAccess.instance().runReadAction(new Computable<List<String>>() {
      public List<String> compute() {
        return new ModelValidator(sm.getSModel()).validate(scope);
      }
    });
    for (String item : validationResult) {
      errorMessages.append(item);
      errorMessages.append("\n");
    }

    for (SNode node : sm.getSModel().nodes()) {
      debug("Checking node " + node);
      if (SModelUtil.findConceptDeclaration(node.getConceptFqName(), GlobalScope.getInstance()) == null) {
        errorMessages.append("Unknown concept ");
        errorMessages.append(node.getConceptFqName());
        errorMessages.append("\n");
      }
    }

    for (SNode node : sm.getSModel().nodes()) {
      for (SReference ref : node.getReferences()) {
        if (SNodeUtil.hasReferenceMacro(node, ref.getRole())) {
          continue;
        }

        if (ref.getTargetNode() == null) {
          errorMessages.append("Broken reference in node ");
          errorMessages.append(node.getId());
          errorMessages.append("(");
          errorMessages.append(node);
          errorMessages.append(")\n");
        }
      }
    }
    return myBuildServerMessageFormat.escapeBuildMessage(errorMessages);
  }

  protected void showStatistic() {
    MemoryMXBean mmbean = ManagementFactory.getMemoryMXBean();
    output("Used heap: " + (mmbean.getHeapMemoryUsage().getUsed() - myUsedHeap));
    output("Used non-heap: " + (mmbean.getNonHeapMemoryUsage().getUsed() - myUsedNonHeap));
    failBuild("broken reference testing");
  }
}
