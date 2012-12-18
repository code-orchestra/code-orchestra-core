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
package jetbrains.mps.ide.progress;

import com.intellij.openapi.progress.ProgressIndicator;
import jetbrains.mps.util.TimePresentationUtil;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Evgeny Gryaznov, Jan 20, 2010
 */
public class TaskProgressHelper implements ITaskProgressHelper {

  private static final int TIMER_DELAY = 100; //milliseconds

  private final ProgressIndicator myProgress;
  private final long myStartJobTime;
  private long myTotalJob;

  private javax.swing.Timer myTimer;
  private String myTaskName;
  private long myStartTime;
  private String myText2;

  private final Object myDisposeSync = new Object();
  private boolean myIsDisposed = false;
  private long myEstimatedTime;

  public TaskProgressHelper(ProgressIndicator progressIndicator, long totalJob, long startJobTime) {
    myProgress = progressIndicator;
    myStartJobTime = startJobTime;
    myTotalJob = totalJob;

    myProgress.setIndeterminate(false);
    myProgress.setFraction(0);
  }

  private void clear() {
    synchronized (myDisposeSync) {
      myIsDisposed = true;
      myTimer = null;
      myTaskName = null;
      myStartTime = 0;
    }
  }

  public void startLeafTask(String taskName) {
    myTaskName = taskName;
    myIsDisposed = false;

    myEstimatedTime = TaskProgressSettings.getInstance().getEstimatedTimeMillis(taskName);
    myStartTime = System.currentTimeMillis();

    javax.swing.Timer timer = new javax.swing.Timer(TIMER_DELAY, new ActionListener() {
      long myMillis = 0;

      public void actionPerformed(ActionEvent e) {
        synchronized (myDisposeSync) {
          if (myIsDisposed) return;

          myMillis += TIMER_DELAY;
          if (myMillis > myEstimatedTime) {
            advance(myTotalJob + myMillis - myEstimatedTime, (myStartTime - myStartJobTime) + myMillis);
          } else {
            advance(myTotalJob, (myStartTime - myStartJobTime) + myMillis);
          }
        }
      }
    });
    myTimer = timer;
    timer.start();
  }

  public void finishTask() {
    if (myStartTime == 0) {
      return;
    }
    long elapsedTaskTime = System.currentTimeMillis() - myStartTime;
    long elapsedJob = System.currentTimeMillis() - myStartJobTime;
    myTotalJob += elapsedTaskTime - myEstimatedTime;
    if (myTotalJob < 1) {
      myTotalJob = 1;
    }
    TaskProgressSettings.getInstance().addEstimatedTimeMillis(myTaskName, elapsedTaskTime);
    advance(myTotalJob, elapsedJob);
    myTimer.stop();
    clear();
  }

  private void advance(long totalJob, long elapsedJob) {
    double fraction = ((double) elapsedJob) / ((double) totalJob);
    if (fraction > 1) {
      fraction = 1;
    }
    myProgress.setFraction(fraction);
    setText2(myText2);
  }

  public void setText2(String text) {
    myText2 = text;
    long elapsedTime = System.currentTimeMillis() - myStartJobTime;
    String elapsedTimeString = TimePresentationUtil.timeIntervalStringPresentation(elapsedTime);
    String estimatedTimeString = TimePresentationUtil.timeIntervalStringPresentation(myTotalJob);
    myProgress.setText(myText2);
    myProgress.setText2("Estimated time: " + estimatedTimeString + ", elapsed time: " + elapsedTimeString);
  }

  public boolean isCancelled() {
    return myProgress.isCanceled();
  }
}
