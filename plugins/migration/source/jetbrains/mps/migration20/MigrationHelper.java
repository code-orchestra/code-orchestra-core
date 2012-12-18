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
package jetbrains.mps.migration20;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.Messages;
import com.intellij.openapi.wm.WindowManager;
import jetbrains.mps.migration20.stages.MigrationStage;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.util.NameUtil;

public class MigrationHelper {
  private Project myProject;

  public MigrationHelper(Project project) {
    myProject = project;
  }

  public void migrate() {
    final MigrationState msComponent = myProject.getComponent(MigrationState.class);
    final MPSProject mpsProject = myProject.getComponent(MPSProject.class);

    if (msComponent.getMigrationState() == MState.INITIAL) {
      if (!showInitialMessage(msComponent)) return;
    }

    for (MState state : MState.values()) {
      if (state == MState.DONE) break;
      if (msComponent.getMigrationState() == state) {
        final MState next = MState.values()[state.ordinal() + 1];
        final MigrationStage stage = next.getStage();

        if (stage == null) {
          msComponent.setMigrationState(next);
          continue;
        }

        if (!showMessageBefore(stage)) return;

        final Runnable stageRunnable = new StageExecutor(stage, mpsProject);
        if (stage.needsCommand()) {
          ModelAccess.instance().runWriteActionInCommand(stageRunnable);
        } else {
          stageRunnable.run();
        }

        if (!showMessageAfter(stage)) return;

        msComponent.setMigrationState(next);
      }
    }
  }

  private boolean showInitialMessage(MigrationState msComponent) {
    MState state = msComponent.getMigrationState();
    MState nextState = MState.values()[state.ordinal() + 1];
    MigrationStage nextStage = nextState.getStage();

    String title = "Migration from MPS 1.5 to MPS 2.0";

    StringBuilder sb = new StringBuilder();
    sb.append("Welcome to migration assistant.").append("\n");
    sb.append("This will help to migrate code written in MPS 1.5 to MPS 2.0.").append("\n");
    sb.append("The migration consists of ").append(MState.values().length - 2).append(" steps. ").append("On each step MPS will tell you what it intends to do, then perform a refactoring and, after some of the steps, ask you to change some code by hand. ").append("\n");
    sb.append("You can pause the migration on any step and continue performing it at any time just by executing MainMenu->Tools->Continue Migration to MPS 2.0").append("\n");
    sb.append("Read more about migration here: http://confluence.jetbrains.net/display/MPS/Migration20").append("\n\n");
    sb.append("WARNING: your files will be changed by the assistant. Please ensure all work is saved and you have a backup copy of your code.").append("\n\n");

    if (state != MState.INITIAL && state != MState.DONE) {
      sb.append("Last migration executed: ").append(state.getStage().title()).append("\n");
      sb.append("Next migration: ").append(nextStage != null ? nextStage.title() : "<no stage>").append("\n");
    }
    sb.append(NameUtil.capitalize(this.getContinuationWord(state))).append(" migration?");

    String[] values = new String[]{NameUtil.capitalize(this.getContinuationWord(state)), "Abort Migration", "Cancel"};

    int res = Messages.showDialog(WindowManager.getInstance().getFrame(myProject), sb.toString(), title, values, 0, Messages.getQuestionIcon());
    if (res == 0) {
      if (state == MState.DONE) {
        msComponent.setMigrationState(MState.INITIAL);
      }
      return true;
    } else if (res == 1) {
      msComponent.setMigrationState(MState.INITIAL);
      return false;
    }
    return false;
  }


  public static String getContinuationWord(MState state) {
    String act = "continue";
    if (state == MState.INITIAL) {
      act = "start";
    } else if (state == MState.DONE) {
      act = "restart";
    }
    return act;
  }

  private boolean showMessageAfter(MigrationStage stage) {
    String ma = stage.messageAfter();
    if (ma == null) return true;

    int res = Messages.showDialog(ma, stage.title() + " finished", new String[]{"Force next step", "Stop"}, 0, Messages.getInformationIcon());
    return res == 0;
  }

  private boolean showMessageBefore(MigrationStage stage) {
    String mb = stage.messageBefore();
    if (mb == null) return true;

    int res = Messages.showDialog(mb, stage.title(), new String[]{"Proceed", "Stop"}, 0, Messages.getInformationIcon());
    return res == 0;
  }

  private static class StageExecutor implements Runnable {
    private final MigrationStage myStage;
    private final MPSProject myMpsProject;

    public StageExecutor(MigrationStage stage, MPSProject mpsProject) {
      myStage = stage;
      myMpsProject = mpsProject;
    }

    public void run() {
      myStage.execute(myMpsProject);
    }
  }
}
