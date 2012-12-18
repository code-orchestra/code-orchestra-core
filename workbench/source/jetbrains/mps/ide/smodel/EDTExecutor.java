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
package jetbrains.mps.ide.smodel;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.logging.Logger;

import javax.swing.SwingUtilities;
import java.util.concurrent.ConcurrentLinkedQueue;

class EDTExecutor {

  private static final int MAX_EXECUTION_TIME = 100;

  private static final Logger LOG = Logger.getLogger(EDTExecutor.class);

  /* Notified when:
   *    myTasks queue becomes non-empty
   *    workerStarted becomes false
   */
  private final Object myLock = new Object();

  private final Thread myExecutor;
  private final WorkbenchModelAccess myModelAccess;

  /* remove elements in EDT only */
  private ConcurrentLinkedQueue<Task> myTasks = new ConcurrentLinkedQueue<Task>();

  public EDTExecutor(WorkbenchModelAccess modelAccess) {
    myModelAccess = modelAccess;
    myExecutor = new Executor();
    myExecutor.setDaemon(true);
    myExecutor.start();
  }

  public void scheduleRead(final Runnable r) {
    synchronized (myLock) {
      if (myTasks.isEmpty()) {
        myLock.notifyAll();
      }
      myTasks.offer(new Task() {
        @Override
        public boolean tryRun() throws TaskIsOutdated {
          return myModelAccess.tryRead(r);
        }

        @Override
        public boolean needsWrite() {
          return false;
        }
      });
    }
  }

  public void scheduleWrite(final Runnable r) {
    synchronized (myLock) {
      if (myTasks.isEmpty()) {
        myLock.notifyAll();
      }
      myTasks.offer(new Task() {
        @Override
        public boolean tryRun() throws TaskIsOutdated {
          return myModelAccess.tryWrite(r);
        }

        @Override
        public boolean needsWrite() {
          return true;
        }
      });
    }
  }

  public void scheduleCommand(final Runnable r, final Project p) {
    if (p == null || r == null) {
      throw new IllegalArgumentException();
    }
    synchronized (myLock) {
      if (myTasks.isEmpty()) {
        myLock.notifyAll();
      }
      myTasks.offer(new Task() {
        @Override
        public boolean tryRun() throws TaskIsOutdated {
          boolean ok = myModelAccess.tryWriteInCommand(r, p);
          if (p.isDisposed()) {
            throw new TaskIsOutdated();
          }
          return ok;
        }

        @Override
        public boolean needsWrite() {
          return true;
        }
      });
    }
  }

  public void flushEventQueue() {
    if (ThreadUtils.isEventDispatchThread()) {
      throw new IllegalStateException("possible deadlock");
    }
    synchronized (myLock) {
      while (!myTasks.isEmpty()) {
        try {
          myLock.wait();
        } catch (InterruptedException e) {
          /* ignore */
        }
      }
    }
  }

  public void schedulePlain(final Runnable r) {
    synchronized (myLock) {
      if (myTasks.isEmpty()) {
        myLock.notifyAll();
      }
      myTasks.offer(new Task() {
        @Override
        public boolean tryRun() throws TaskIsOutdated {
          r.run();
          return true;
        }

        @Override
        public boolean needsWrite() {
          return false;
        }
      });
    }
  }

  private class Executor extends Thread {

    private volatile boolean workerStarted = false;
    private Runnable myWorker = new Runnable() {
      @Override
      public void run() {
        worker();
      }
    };

    private Executor() {
      super("Executor");
    }

    public void run() {
      try {
        while (true) {
          boolean schedule, needsWrite;
          synchronized (myLock) {
            if (workerStarted || myTasks.isEmpty()) {
              try {
                myLock.wait();
              } catch (InterruptedException e) {
                /* ignore */
              }
            }
            if (workerStarted) {
              continue;
            }
            Task first = myTasks.peek();
            schedule = first != null;
            needsWrite = schedule && first.needsWrite();
          }

          if (schedule) {
            /* wait until required lock is available */
            myModelAccess.waitLock(needsWrite);

            /* start worker */
            workerStarted = true;
            SwingUtilities.invokeLater(myWorker);
          }
        }
      } catch (Exception e) {
        LOG.error(e);
      }
    }

    // invoked in EDT
    private void worker() {
      if (!workerStarted) {
        return;
      }
      try {
        long deadline = System.currentTimeMillis() + MAX_EXECUTION_TIME;

        do {
          Task t = myTasks.peek();
          if (t == null) {
            return;
          }
          boolean remove = true;
          try {
            if (!t.tryRun()) {
              // stop processing, reschedule
              remove = false;
              return;
            }
          } catch (TaskIsOutdated e) {
            /* ignore, remove task */
          } catch (Exception e) {
            /* report */
            LOG.error("run in EDT failure", e);
          } finally {
            if (remove) {
              synchronized (myLock) {
                myTasks.remove();
              }
            }
          }
        } while (deadline > System.currentTimeMillis());

      } finally {
        synchronized (myLock) {
          workerStarted = false;
          myLock.notifyAll();
        }
      }
    }
  }

  private static interface Task {
    boolean tryRun() throws TaskIsOutdated;

    boolean needsWrite();
  }

  private static class TaskIsOutdated extends Exception {
  }
}
