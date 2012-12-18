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
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/**
 * Evgeny Gryaznov, Sep 3, 2010
 */
public interface ModelCommandExecutor {

  /**
   * Enables canRead() without actually acquiring the read lock (screw you, ReadWriteLock!).
   * Requires read lock in the "parent" thread.
   * Thread local. Returns previous value, to which it must be reset after use (in finally{}).
   * @param flag
   * @return
   */
  boolean setReadEnabledFlag (boolean flag);

  boolean isInEDT();

  boolean canRead();

  void checkReadAccess();

  boolean canWrite();

  void checkWriteAccess();

  void runReadAction(Runnable r);

  <T> T runReadAction(Computable<T> c);

  void runWriteAction(Runnable r);

  void writeFilesInEDT(@NotNull final Runnable action);

  void runWriteActionWithProgressSynchronously(@NotNull Progressive process, String progressTitle, boolean canBeCanceled,
                                               Project project);

  <T> T runWriteAction(Computable<T> c);

  <T> T runReadInWriteAction(Computable<T> c);

  void runReadInEDT(Runnable r);

  void runWriteInEDT(Runnable r);

  void runCommandInEDT(@NotNull Runnable r, @NotNull Project p);

  void executeCommand(Runnable r, Project project);

  /**
   * use runWriteActionInCommand(final Computable<T> c, Project project)
   */
  @Deprecated
  <T> T runWriteActionInCommand(Computable<T> c);

  /**
   * use runWriteActionInCommand(Runnable r, Project project)
   */
  @Deprecated
  void runWriteActionInCommand(Runnable r);

  <T> T runWriteActionInCommand(Computable<T> c, Project project);

  <T> T runWriteActionInCommand(Computable<T> c, @Nullable String name, @Nullable Object groupId, UndoConfirmationPolicy policy, Project project);

  void runWriteActionInCommand(Runnable r, Project project);

  void runWriteActionInCommand(Runnable r, @Nullable String name, @Nullable Object groupId, UndoConfirmationPolicy policy, Project project);

  /**
   * use runCommandInEDT
   */
  @Deprecated
  void runWriteActionInCommandAsync(Runnable r, Project project);

  void runUndoTransparentCommand(Runnable r, Project project);

  boolean isInsideCommand();

  void runIndexing(Runnable r);

  void addCommandListener(ModelAccessListener l);

  void removeCommandListener(ModelAccessListener l);

  /**
   * Returns true iff the locking and the operation were successful.
   * @param r
   * @return
   */
  boolean tryRead(Runnable r);

  /**
   * Returns the result of the computation, null if locking was unsuccessful.
   * @param c
   * @param <T>
   * @return
   */
  <T> T tryRead(Computable<T> c);

  /**
   * Does everything to ensure the locking and the operation success, including asking for the user confirmation.
   * Throws a RuntimeException if nothing helped.
   * @param r
   * @return
   */
  void requireRead(Runnable r);

  /**
   * Does everything to ensure the locking and the operation success, including asking for the user confirmation.
   * Throws a RuntimeException if nothing helped.
   * Returns the result of the computation.
   * @param c
   * @return
   */
  <T> T requireRead(Computable<T> c);

  void flushEventQueue();

  /**
   * Returns true iff the locking and the operation were successful.
   * @param r
   * @return
   */
  boolean tryWrite(Runnable r);

  /**
   * Returns the result of the computation, null if locking was unsuccessful.
   * @param c
   * @param <T>
   * @return
   */
  <T> T tryWrite(Computable<T> c);

  /**
   * Does everything to ensure the locking and the operation success, including asking for the user confirmation.
   * Throws a RuntimeException if nothing helped.
   * @param r
   */
  void requireWrite(Runnable r);

  /**
   * Does everything to ensure the locking and the operation success, including asking for the user confirmation.
   * Throws a RuntimeException if nothing helped.
   * Returns the result of the computation.
   * @param c
   * @return
   */
  <T> T requireWrite(Computable<T> c);

  boolean tryWriteInCommand(Runnable r, Project p);

  <T> T tryWriteInCommand(Computable<T> r, Project p);

  @CodeOrchestraPatch
  void runPlainInEDT(Runnable r);

}
