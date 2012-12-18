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

import com.intellij.openapi.progress.ProgressIndicator;
import jetbrains.mps.generator.GenerationCanceledException;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.typesystem.inference.TypeChecker;

import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Evgeny Gryaznov, Feb 23, 2010
 */
public class GenerationTaskPool implements IGenerationTaskPool {

  private static class ModelReadThreadFactory implements ThreadFactory {
    final ThreadGroup group;
    final AtomicInteger threadNumber = new AtomicInteger(1);
    final String namePrefix;

    ModelReadThreadFactory() {
      SecurityManager s = System.getSecurityManager();
      group = (s != null) ? s.getThreadGroup() :
        Thread.currentThread().getThreadGroup();
      namePrefix = "generation-thread-";
    }

    public Thread newThread(final Runnable original) {
      Thread t = new Thread(group, original, namePrefix + threadNumber.getAndIncrement());
      if (t.isDaemon())
        t.setDaemon(false);
      if (t.getPriority() != Thread.NORM_PRIORITY)
        t.setPriority(Thread.NORM_PRIORITY);
      return t;
    }
  }

  final static AtomicLong seq = new AtomicLong();

  private class GenerationTaskAdapter implements Runnable/*, Comparable<GenerationTaskAdapter>*/ {
    private GenerationTask myTask;
//    final long seqNum;

    private GenerationTaskAdapter(GenerationTask task) {
      myTask = task;
//      seqNum = seq.getAndIncrement();
    }

    private void runInternal() {
      try {
        TypeChecker.getInstance().generationWorkerStarted();
        myTask.run();
      } catch (GenerationCanceledException e) {
        reportException(e);
      } catch (GenerationFailureException e) {
        reportException(e);
      } catch (Throwable th) {
        reportException(th);
      } finally {
        TypeChecker.getInstance().generationWorkerFinished();
      }
    }

    @Override
    public void run() {
      if (myTask.requiresReadAccess()) {
        boolean oldFlag = ModelAccess.instance().setReadEnabledFlag(true);
        try {
          runInternal();
        }
        finally {
          ModelAccess.instance().setReadEnabledFlag(oldFlag);
        }
      } else {
        runInternal();
      }
    }

//    @Override
//    public int compareTo(GenerationTaskAdapter oth) {
//      return (seqNum < oth.seqNum ? -1 : 1);
//    }
  }

  private final ProgressIndicator progressMonitor;
  private volatile boolean isCancelled = false;

  public GenerationTaskPool(ProgressIndicator progressMonitor, int numberOfThreads) {
    this.progressMonitor = progressMonitor;
    myExecutor = new ThreadPoolExecutor(numberOfThreads, numberOfThreads, 10, TimeUnit.SECONDS, queue, new ModelReadThreadFactory()) {
      @Override
      protected void afterExecute(Runnable r, Throwable t) {
        long tasksLeft = tasksInQueue.decrementAndGet();
        if (tasksLeft == 0) {
          synchronized (objectLock) {
            objectLock.notifyAll();
          }
        }
      }
    };
  }

  final BlockingQueue<Runnable> queue = new LinkedBlockingQueue<Runnable>();
  ThreadPoolExecutor myExecutor;

  final AtomicLong tasksInQueue = new AtomicLong();
  final Object objectLock = new Object();

  @Override
  public void addTask(GenerationTask r) {
    if (isCancelled) return;
    tasksInQueue.incrementAndGet();
    myExecutor.execute(new GenerationTaskAdapter(r));
  }

  @Override
  public void waitForCompletion() throws GenerationCanceledException, GenerationFailureException {
    Throwable th = null;
    synchronized (objectLock) {
      while (exceptions.size() == 0 && tasksInQueue.get() != 0 && !progressMonitor.isCanceled()) {
        try {
          objectLock.wait(1000);
        } catch (InterruptedException e) {
          /* ignore */
        }
      }
      if (exceptions.size() != 0) {
        th = exceptions.get(0);
      } else if (progressMonitor.isCanceled()) {
        th = new GenerationCanceledException();
      }

      if (th != null) {
        isCancelled = true;
        while (tasksInQueue.get() != 0) {
          try {
            objectLock.wait(1000);
          } catch (InterruptedException e) {
            /* ignore */
          }
        }
        isCancelled = false;
      }
    }

    // rethrow
    if (th != null) {
      if (th instanceof GenerationCanceledException) {
        throw (GenerationCanceledException) th;
      } else if (th instanceof GenerationFailureException) {
        throw (GenerationFailureException) th;
      } else if (th instanceof RuntimeException) {
        throw (RuntimeException) th;
      }
    }
  }

  private List<Throwable> exceptions = new LinkedList<Throwable>();

  private void reportException(Throwable thr) {
    synchronized (objectLock) {
      exceptions.add(thr);
      objectLock.notifyAll();
    }
  }

  @Override
  public boolean isCancelled() {
    return isCancelled;
  }

  @Override
  public void dispose() {
    myExecutor.shutdownNow();
  }
}
