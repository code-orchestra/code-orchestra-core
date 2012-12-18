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
package jetbrains.mps.workbench.psi;

import com.intellij.openapi.Disposable;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.psi.*;
import com.intellij.psi.codeStyle.CodeStyleManager;
import com.intellij.psi.impl.PsiManagerEx;
import com.intellij.psi.impl.PsiTreeChangeEventImpl;
import com.intellij.psi.impl.cache.CacheManager;
import com.intellij.psi.impl.file.impl.FileManager;
import com.intellij.psi.impl.source.resolve.ResolveCache;
import com.intellij.psi.search.PsiSearchHelper;
import com.intellij.psi.util.CachedValuesManager;
import com.intellij.psi.util.PsiModificationTracker;
import com.intellij.util.IncorrectOperationException;
import com.intellij.util.ThrowableRunnable;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.List;

class NullPsiManager extends PsiManagerEx {
  private Project myProject;

  NullPsiManager(Project project) {
    myProject = project;
  }

  public boolean isBatchFilesProcessingMode() {
    return false;
  }

  public boolean isAssertOnFileLoading(VirtualFile file) {
    return false;
  }

  public void nonPhysicalChange() {

  }

  public void physicalChange() {

  }

  public ResolveCache getResolveCache() {
    return null;
  }

  public void registerRunnableToRunOnChange(Runnable runnable) {

  }

  public void registerWeakRunnableToRunOnChange(Runnable runnable) {

  }

  public void registerRunnableToRunOnAnyChange(Runnable runnable) {

  }

  public void registerRunnableToRunAfterAnyChange(Runnable runnable) {

  }

  public FileManager getFileManager() {
    return null;
  }

  public void invalidateFile(PsiFile file) {

  }

  public void beforeChildRemoval(PsiTreeChangeEventImpl event) {

  }

  public void beforeChildReplacement(@NotNull PsiTreeChangeEventImpl psiTreeChangeEvent) {
    
  }

  public CacheManager getCacheManager() {
    return null;
  }

  @NotNull
  public List<? extends LanguageInjector> getLanguageInjectors() {
    return new ArrayList<LanguageInjector>();
  }

  @NotNull
  public Project getProject() {
    return myProject;
  }

  @Nullable
  public PsiFile findFile(@NotNull VirtualFile file) {
    return null;
  }

  @Nullable
  public FileViewProvider findViewProvider(@NotNull VirtualFile file) {
    return null;
  }

  @Nullable
  public PsiDirectory findDirectory(@NotNull VirtualFile file) {
    return null;
  }

  public boolean areElementsEquivalent(@Nullable PsiElement element1, @Nullable PsiElement element2) {
    return false;
  }

  public void reloadFromDisk(@NotNull PsiFile file) {
  }

  public void addPsiTreeChangeListener(@NotNull PsiTreeChangeListener listener) {

  }

  public void addPsiTreeChangeListener(@NotNull PsiTreeChangeListener listener, Disposable parentDisposable) {

  }

  public void removePsiTreeChangeListener(@NotNull PsiTreeChangeListener listener) {

  }

  @NotNull
  public CodeStyleManager getCodeStyleManager() {
    throw new UnsupportedOperationException();
  }

  @NotNull
  public PsiSearchHelper getSearchHelper() {
    throw new UnsupportedOperationException();
  }

  @NotNull
  public PsiModificationTracker getModificationTracker() {
    return new PsiModificationTracker() {
      @Override
      public long getModificationCount() {
        return 0;
      }

      @Override
      public long getOutOfCodeBlockModificationCount() {
        return 0;
      }

      @Override
      public long getJavaStructureModificationCount() {
        return 0;
      }

      @Override
      public long getAnnotationModificationCount() {
        return 0;
      }
    };
    //throw new UnsupportedOperationException();
  }

  @NotNull
  public CachedValuesManager getCachedValuesManager() {
    throw new UnsupportedOperationException();
  }

  public void moveFile(@NotNull PsiFile file, @NotNull PsiDirectory newParentDir) throws IncorrectOperationException {

  }

  public void moveDirectory(@NotNull PsiDirectory dir, @NotNull PsiDirectory newParentDir) throws IncorrectOperationException {

  }

  public void checkMove(@NotNull PsiElement element, @NotNull PsiElement newContainer) throws IncorrectOperationException {

  }

  public void startBatchFilesProcessingMode() {

  }

  public void finishBatchFilesProcessingMode() {

  }

  public boolean isDisposed() {
    return false;
  }

  public void dropResolveCaches() {

  }

  public boolean isInProject(@NotNull PsiElement element) {
    return false;
  }

  public void performActionWithFormatterDisabled(Runnable r) {

  }

  public <T extends Throwable> void performActionWithFormatterDisabled(ThrowableRunnable<T> r) throws T {

  }

  public <T> T performActionWithFormatterDisabled(Computable<T> r) {
    return null;
  }

  public void postponeAutoFormattingInside(Runnable runnable) {

  }

  public void registerLanguageInjector(@NotNull LanguageInjector injector) {

  }

  public void registerLanguageInjector(@NotNull LanguageInjector injector, Disposable parentDisposable) {

  }

  public void unregisterLanguageInjector(@NotNull LanguageInjector injector) {

  }
}
