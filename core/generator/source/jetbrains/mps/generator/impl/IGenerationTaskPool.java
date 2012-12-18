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
package jetbrains.mps.generator.impl;

import jetbrains.mps.generator.GenerationCanceledException;

import java.util.Deque;
import java.util.LinkedList;

/**
 * Evgeny Gryaznov, Mar 4, 2010
 */
public interface IGenerationTaskPool {

  public interface GenerationTask {
    void run() throws GenerationCanceledException, GenerationFailureException;

    boolean requiresReadAccess();
  }

  void addTask(GenerationTask r);

  void waitForCompletion() throws GenerationCanceledException, GenerationFailureException;

  boolean isCancelled();

  void dispose();

  public static class SimpleGenerationTaskPool implements IGenerationTaskPool {
    private Deque<GenerationTask> queue = new LinkedList<GenerationTask>();

    public void addTask(GenerationTask r) {
      queue.addFirst(r);
    }

    public void waitForCompletion() throws GenerationCanceledException, GenerationFailureException {
      GenerationTask next;
      try {
        while ((next = queue.poll()) != null) {
          next.run();
        }
      } finally {
        queue.clear();
      }
    }

    @Override
    public boolean isCancelled() {
      return false;
    }

    @Override
    public void dispose() {
    }
  }

  public interface ITaskPoolProvider {

    IGenerationTaskPool getTaskPool();
  }
}
