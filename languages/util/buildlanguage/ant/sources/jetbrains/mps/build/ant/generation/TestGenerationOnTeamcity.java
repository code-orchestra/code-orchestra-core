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
package jetbrains.mps.build.ant.generation;

import jetbrains.mps.build.ant.*;
import jetbrains.mps.build.ant.generation.workers.TestGenerationWorker;
import org.apache.tools.ant.types.resources.FileResource;

import java.util.Iterator;

public class TestGenerationOnTeamcity extends GenerateTask {
  public static final String INVOKE_TESTS = "INVOKE_TESTS";
  public static final String SAVE_ON_DISK = "SAVE_ON_DISK";
  public static final String SHOW_DIFF = "SHOW_DIFF";
  public static final String WHOLE_PROJECT = "WHOLE_PROJECT";
  public static final String GENERATE_PERFORMANCE_REPORT = "GENERATE_PERFORMANCE_REPORT";

  {
    myWhatToDo.putProperty(INVOKE_TESTS, Boolean.toString(false));
    myWhatToDo.putProperty(SHOW_DIFF, Boolean.toString(false));
    myWhatToDo.putProperty(GENERATE_PERFORMANCE_REPORT , "");
  }

  public boolean getShowDiff() {
    return Boolean.parseBoolean(myWhatToDo.getProperty(SHOW_DIFF));
  }

  public void setShowDiff(boolean isDifferenceCalculated) {
    myWhatToDo.putProperty(SHOW_DIFF, Boolean.toString(isDifferenceCalculated));
  }

  public boolean getInvokeTests() {
    return Boolean.parseBoolean(myWhatToDo.getProperty(INVOKE_TESTS));
  }

  public void setInvokeTests(boolean invokeTests) {
    myWhatToDo.putProperty(INVOKE_TESTS, Boolean.toString(invokeTests));
  }

  public boolean getSaveOnDisk() {
    return Boolean.parseBoolean(myWhatToDo.getProperty(SAVE_ON_DISK));
  }

  public void setSaveOnDisk(boolean saveOnDisk) {
    myWhatToDo.putProperty(SAVE_ON_DISK, Boolean.toString(saveOnDisk));
  }

  public void addConfiguredPerfomanceReport(PerfomanceReport report) {
    myWhatToDo.addPerfomanceReport(report.toString());
  }

  @Override
  protected Class<? extends MpsWorker> getWorkerClass() {
    return TestGenerationWorker.class;
  }

  @Override
  protected MyExecuteStreamHandler getExecuteStreamHandler() {
    return new MyTeamcityAwareExecuteStreamHandler(this, new TeamCityMessageFormat());
  }

  public void addConfiguredProject(ProjectNested projectInner) {
    if (projectInner.getWholeProject()) {
      Iterator it = projectInner.iterator();
      while (it.hasNext()) {
        FileResource next = (FileResource) it.next();
        myWhatToDo.addProjectFile(next.getFile(), WHOLE_PROJECT);
      }
    } else {
      super.addConfiguredProject(projectInner);
    }
  }
}
