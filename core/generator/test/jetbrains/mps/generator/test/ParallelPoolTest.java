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
package jetbrains.mps.generator.test;

import com.intellij.openapi.progress.EmptyProgressIndicator;
import jetbrains.mps.generator.GenerationCanceledException;
import jetbrains.mps.generator.impl.GenerationFailureException;
import jetbrains.mps.generator.impl.GenerationTaskPool;
import jetbrains.mps.generator.impl.IGenerationTaskPool.GenerationTask;
import junit.framework.Assert;
import junit.framework.TestCase;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Evgeny Gryaznov, Apr 7, 2010
 */
public class ParallelPoolTest extends TestCase {

  private static Logger LOG = Logger.getLogger(ParallelPoolTest.class);

  private static class CustomTask implements GenerationTask {
    private AtomicBoolean isFinished = new AtomicBoolean(false);
    private AtomicBoolean isCancelled = new AtomicBoolean(false);

    private final long amountOfWork;
    private final GenerationTaskPool taskPool;

    private CustomTask(long amountOfWork, GenerationTaskPool taskPool) {
      this.amountOfWork = amountOfWork;
      this.taskPool = taskPool;
    }

    public boolean isFinished() {
      return isFinished.get();
    }
    
    public boolean isCancelled() {
      return isCancelled.get();
    }

    @Override
    public void run() throws GenerationCanceledException, GenerationFailureException {
      isCancelled.set(true);
      isFinished.set(false);
      long localCounter = amountOfWork;
      long fract = 1;
      while (fract < amountOfWork) {
        fract <<= 1;
      }
      fract = (fract >> 6);
      long fractCounter;
      long start = System.currentTimeMillis();
      while(localCounter > 0) {
        fractCounter = fract;
        while (fractCounter > 0) {
          fractCounter--;
        }
        localCounter -= fract;
        if (taskPool.isCancelled()) return;
      }
      long end = System.currentTimeMillis();
      LOG.info("Took " + (end-start)/1000. + " secs");
      isCancelled.set(false);
      isFinished.set(true);
    }

    @Override
    public boolean requiresReadAccess() {
      return false;
    }
  }

  private static long get2SecsOperation() {
    int measureTime = 500;

    long count2secs = 0;
    long startTime = System.currentTimeMillis();
    long endTime = startTime + measureTime;
    while(System.currentTimeMillis() < endTime) {
      long localCounter = 0;
      while(localCounter < 10000000l) {
        localCounter++;
      }
      count2secs += localCounter;
    }
    endTime = System.currentTimeMillis();
    long amountOfWork = count2secs * measureTime / (endTime - startTime);
    long localCounter = amountOfWork;
    startTime = System.currentTimeMillis();
    while(localCounter > 0) {
      localCounter--;
    }
    endTime = System.currentTimeMillis();
    amountOfWork = amountOfWork * 2000 / (endTime - startTime);
    return amountOfWork;
  }

  private CustomTask[] createTasks(long amountOfWork, int numberOfTasks, GenerationTaskPool taskPool) {
    List<GenerationTask> tasks = new ArrayList<GenerationTask>();
    for(int i = 0; i < numberOfTasks; i++) {
      tasks.add(new CustomTask(amountOfWork, taskPool));
    }
    return tasks.toArray(new CustomTask[numberOfTasks]);
  }

  public void testPoolSpeed() {
    int cores = Runtime.getRuntime().availableProcessors();
    if(cores < 3) {
      // cannot proceed
      return;
    }

    long amountFor2secs = get2SecsOperation();
    LOG.info("Work amount: " + amountFor2secs + " ticks");

    long start = System.currentTimeMillis();
    GenerationTaskPool pool = new GenerationTaskPool(new EmptyProgressIndicator(), 4);
    final CustomTask[] generationTasks = createTasks(amountFor2secs, 4, pool);
    for(GenerationTask t : generationTasks) {
      pool.addTask(t);
    }

    try {
      pool.waitForCompletion();
    } catch (GenerationCanceledException e) {
      Assert.fail();
    } catch (GenerationFailureException e) {
      Assert.fail();
    }

    long end = System.currentTimeMillis();

    for(CustomTask t : generationTasks) {
      Assert.assertTrue(t.isFinished());
    }

    LOG.info("Total " + (end-start)/1000. + " seconds to complete 4 x 2secs tasks");
    Assert.assertTrue("too slow: "+(end-start), (end-start) < 4500); // at least 2 core cpu
    pool.dispose();
  }

  public void testPoolCancelling() {
    int cores = Runtime.getRuntime().availableProcessors();
    if(cores < 3) {
      // cannot proceed
      return;
    }

    long amountFor2secs = get2SecsOperation();

    long start = System.currentTimeMillis();
    GenerationTaskPool pool = new GenerationTaskPool(new EmptyProgressIndicator() {
      @Override
      public boolean isCanceled() {
        return true;
      }
    }, 4);
    final CustomTask[] generationTasks = createTasks(amountFor2secs*4, 4, pool);
    for(GenerationTask t : generationTasks) {
      pool.addTask(t);
    }

    boolean canceledExc = false;
    try {
      Thread.sleep(1000);
      pool.waitForCompletion();
    } catch (GenerationCanceledException e) {
      canceledExc = true;
    } catch (GenerationFailureException e) {
    } catch (InterruptedException e) {
    }
    Assert.assertTrue(canceledExc);
    
    long end = System.currentTimeMillis();

    for(CustomTask t : generationTasks) {
      Assert.assertTrue("task should be cancelled", t.isCancelled());
      Assert.assertFalse("task should not be finished", t.isFinished());
    }

    LOG.info("Total " + (end-start)/1000. + " seconds, when cancelled after 1 sec.");
    Assert.assertTrue((end-start) < 1500 && (end-start) > 970);
    pool.dispose();
  }

  public void testPoolCancelling2() {
    int cores = Runtime.getRuntime().availableProcessors();
    if(cores < 3) {
      // cannot proceed
      return;
    }

    long amountFor2secs = get2SecsOperation();
    final long start = System.currentTimeMillis();
    GenerationTaskPool pool = new GenerationTaskPool(new EmptyProgressIndicator() {
      @Override
      public boolean isCanceled() {
        return (System.currentTimeMillis() - start > 1600);
      }
    }, 4);
    final CustomTask[] generationTasks = createTasks(amountFor2secs*4, 4, pool);
    for(GenerationTask t : generationTasks) {
      pool.addTask(t);
    }

    boolean canceledExc = false;
    try {
      pool.waitForCompletion();
    } catch (GenerationCanceledException e) {
      canceledExc = true;
    } catch (GenerationFailureException e) {
    }
    Assert.assertTrue(canceledExc);

    long end = System.currentTimeMillis();

    for(CustomTask t : generationTasks) {
      Assert.assertTrue("task should be cancelled", t.isCancelled());
      Assert.assertFalse("task should not be finished", t.isFinished());
    }

    LOG.info("Total " + (end-start)/1000. + " seconds (should be 2 secs), when cancelled after 1.6 secs");
    Assert.assertTrue((end-start) < 2300 && (end-start) > 1700);
    pool.dispose();
  }
}
