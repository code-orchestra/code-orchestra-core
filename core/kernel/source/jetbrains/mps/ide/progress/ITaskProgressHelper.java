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

/**
 * Evgeny Gryaznov, Jan 22, 2010
 */
public interface ITaskProgressHelper {

  public static final ITaskProgressHelper EMPTY = new NullTaskProgressHelper();

  void startLeafTask(String taskName);

  void finishTask();

  void setText2(String text);

  boolean isCancelled();

  /**
   * Empty helper.
   */
  public static class NullTaskProgressHelper implements ITaskProgressHelper {

    public void startLeafTask(String taskName) {
    }

    public void finishTask() {
    }

    public void setText2(String text) {
    }

    public boolean isCancelled() {
      return false;
    }
  }
}
