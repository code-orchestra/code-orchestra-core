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

public class NullAdaptiveProgressMonitor implements IAdaptiveProgressMonitor {
  public void addText(String text) {

  }

  public boolean isCanceled() {
    return false;
  }

  public void start(String jobName, long jobAmount) {

  }

  public void finish() {

  }

  public void finishAnyway() {

  }

  public void startTask(String taskName, String taskKind, long estimatedTime) {

  }

  public Long getEstimatedTime(String taskName) {
    return (long) 0;
  }

  public void startTask(String taskName, long estimatedTime) {

  }

  public void startTask(String taskName, String taskKind) {

  }

  public void startTask(String taskName) {

  }

  public void finishTask(String taskName) {

  }

  public void finishTask() {

  }

  public void startLeafTask(String taskName) {

  }

  public void startLeafTask(String taskName, String taskKind) {

  }

  public void startLeafTask(String taskName, long userEstimatedTime) {

  }

  public void startLeafTask(String taskName, String taskKind, long userEstimatedTime) {

  }

  public void startTaskAnyway(String taskName, String taskKind, long estimatedTime) {

  }

  public void finishSomehow() {
  }
}
