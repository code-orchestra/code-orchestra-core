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

public interface IAdaptiveProgressMonitor {

  void start(String jobName, long jobAmount);

  void finish();

  void finishAnyway();

  void finishTask();

  void finishTask(String taskName);

  void startTask(String taskName);

  void startTask(String taskName, String taskKind);

  void startTask(String taskName, long estimatedTime);

  //  if you think that you already know the estimated time for this task
  //  better then the monitor could know it - then set a parameter
  //  estimatedTime according to your knowledge.
  void startTask(String taskName, String taskKind, long estimatedTime);

  public Long getEstimatedTime(String taskName);

  void addText(String text);

  boolean isCanceled();

  public static final IAdaptiveProgressMonitor NULL_PROGRESS_MONITOR = new NullAdaptiveProgressMonitor();

  void startLeafTask(String taskName);

  void startLeafTask(String taskName, String taskKind);

  void startLeafTask(String taskName, long userEstimatedTime);

  void startLeafTask(String taskName, String taskKind, long userEstimatedTime);

  void startTaskAnyway(String taskName, String taskKind, long estimatedTime);

  void finishSomehow();
}
