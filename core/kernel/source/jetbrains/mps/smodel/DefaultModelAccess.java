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
package jetbrains.mps.smodel;

import com.intellij.openapi.command.UndoConfirmationPolicy;
import com.intellij.openapi.progress.Progressive;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.InternalFlag;
import org.jetbrains.annotations.NotNull;

/**
 * Evgeny Gryaznov, Sep 3, 2010
 */
public class DefaultModelAccess extends ModelAccess {

  DefaultModelAccess() {
  }

  @Override
  public void runReadAction(final Runnable r) {
    if (canRead()) {
      r.run();
      return;
    }
    getReadLock().lock();
    try {
      r.run();
    } finally {
      getReadLock().unlock();
    }
  }

  @Override
  public void runWriteAction(final Runnable r) {
    if (canWrite()) {
      r.run();
      return;
    }
    assertNotWriteFromRead();
    getWriteLock().lock();
    try {
      r.run();
    } finally {
      getWriteLock().unlock();
    }
  }

  private void assertNotWriteFromRead() {
    if (InternalFlag.isInternalMode()) {
      assert !canRead() : "Deadlock: Write action should not be executed from within read.";
    }
  }

  @Override
  public <T> T runReadAction(final Computable<T> c) {
    if (canRead()) {
      return c.compute();
    }
    getReadLock().lock();
    try {
      return c.compute();
    } finally {
      getReadLock().unlock();
    }
  }

  @Override
  public <T> T runWriteAction(final Computable<T> c) {
    if (canWrite()) {
      return c.compute();
    }
    getWriteLock().lock();
    try {
      return c.compute();
    } finally {
      getWriteLock().unlock();
    }
  }

  @Override
  public void flushEventQueue() {
  }

  @Override
  public void runReadInEDT(Runnable r) {
    throw new UnsupportedOperationException();
  }

  @Override
  public void runWriteInEDT(Runnable r) {
    throw new UnsupportedOperationException();
  }

  @Override
  public void runCommandInEDT(@NotNull Runnable r, @NotNull Project p) {
    throw new UnsupportedOperationException();
  }

  @Override
  public boolean isInEDT() {
    return canWrite();
  }

  @Override
  public <T> T tryRead(final Computable<T> c) {
    if (getReadLock().tryLock()) {
      try {
        return c.compute();
      } finally {
        getReadLock().unlock();
      }
    } else {
      return null;
    }
  }

  @Override
  public boolean tryRead(Runnable r) {
    if (getReadLock().tryLock()) {
      try {
        r.run();
      } finally {
        getReadLock().unlock();
      }
      return true;
    } else {
      return false;
    }
  }

  @Override
  public void requireRead(Runnable r) {
    int i;
    int MAX_TRIES = 4;
    for (i = 0; i < MAX_TRIES && !tryRead(r); ++i) {
      try {
        Thread.sleep((1<<i)*100);
      } catch (InterruptedException ignore) {}
    }
    if (i >= MAX_TRIES) {
      throw new RuntimeException("Failed to acquire read lock");
    }
  }

  @Override
  public <T> T requireRead(Computable<T> c) {
    T result = null;
    int i;
    int MAX_TRIES = 4;
    for (i = 0; i < MAX_TRIES && (result = tryRead(c)) == null; ++i) {
      try {
        Thread.sleep((1<<i)*100);
      } catch (InterruptedException ignore) {}
    }
    if (i >= MAX_TRIES) {
      throw new RuntimeException("Failed to acquire read lock");
    }
    return result;
  }

  @Override
  public boolean tryWrite(Runnable r) {
    if (getWriteLock().tryLock()) {
      try {
        r.run();
      } finally {
        getWriteLock().unlock();
      }
      return true;
    } else {
      return false;
    }
  }

  @Override
  public <T> T tryWrite(final Computable<T> c) {
    if (getWriteLock().tryLock()) {
      try {
        return c.compute();
      } finally {
        getWriteLock().unlock();
      }
    } else {
      return null;
    }
  }

  @Override
  public void requireWrite(Runnable r) {
    int i;
    int MAX_TRIES = 4;
    for (i = 0; i < MAX_TRIES && !tryWrite(r); ++i) {
      try {
        Thread.sleep((1<<i)*100);
      } catch (InterruptedException ignore) {}
    }
    if (i >= MAX_TRIES) {
      throw new RuntimeException("Failed to acquire write lock");
    }
  }

  @Override
  public <T> T requireWrite(Computable<T> c) {
    T result = null;
    int i;
    int MAX_TRIES = 4;
    for (i = 0; i < MAX_TRIES && (result = tryWrite(c)) == null; ++i) {
      try {
        Thread.sleep((1<<i)*100);
      } catch (InterruptedException ignore) {}
    }
    if (i >= MAX_TRIES) {
      throw new RuntimeException("Failed to acquire write lock");
    }
    return result;
  }


  @Override
  public boolean tryWriteInCommand(Runnable r, Project p) {
    return tryWrite(r);
  }

  @Override
  public <T> T tryWriteInCommand(Computable<T> r, Project p) {
    return tryWrite(r);
  }

  @Override
  public void runPlainInEDT(Runnable r) {
    throw new UnsupportedOperationException();
  }

  @Override
  public void executeCommand(Runnable r, Project project) {
    runWriteAction(r);
  }

  @Override
  @Deprecated
  public <T> T runWriteActionInCommand(Computable<T> c) {
    return runWriteAction(c);
  }

  @Override
  public <T> T runWriteActionInCommand(Computable<T> c, Project project) {
    return runWriteAction(c);
  }

  @Override
  public <T> T runWriteActionInCommand(Computable<T> c, String name, Object groupId, UndoConfirmationPolicy policy, Project project) {
    return runWriteAction(c);
  }

  @Override
  @Deprecated
  public void runWriteActionInCommand(Runnable r) {
    runWriteAction(r);
  }

  @Override
  public void runWriteActionInCommand(Runnable r, Project project) {
    runWriteAction(r);
  }

  @Override
  public void runWriteActionInCommand(Runnable r, String name, Object groupId, UndoConfirmationPolicy policy, Project project) {
    runWriteAction(r);
  }

  @Override
  public void runWriteActionInCommandAsync(final Runnable r, final Project project) {
    throw new UnsupportedOperationException();
  }

  @Override
  public void runUndoTransparentCommand(Runnable r, Project project) {
    r.run();
  }

  @Override
  public boolean isInsideCommand() {
    return canWrite();
  }

  @Override
  public void runIndexing(Runnable r) {
    throw new UnsupportedOperationException();
  }

  @Override
  public void addCommandListener(ModelAccessListener l) {
  }

  @Override
  public void removeCommandListener(ModelAccessListener l) {
  }

  @Override
  public void writeFilesInEDT(@NotNull Runnable action) {
    throw new UnsupportedOperationException("cannot invoke write files in EDT");
  }

  @Override
  public void runWriteActionWithProgressSynchronously(@NotNull Progressive process, String progressTitle, boolean canBeCanceled,
                                                      Project project) {
    throw new UnsupportedOperationException("cannot run with progress");
  }
}
