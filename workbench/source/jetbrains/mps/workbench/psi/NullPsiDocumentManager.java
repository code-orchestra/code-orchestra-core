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

import com.intellij.openapi.editor.Document;
import com.intellij.openapi.editor.impl.DocumentImpl;
import com.intellij.openapi.util.Computable;
import com.intellij.psi.PsiDocumentManager;
import com.intellij.psi.PsiFile;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class NullPsiDocumentManager extends PsiDocumentManager {
  @Nullable
  public PsiFile getPsiFile(@NotNull Document document) {
    return null;
  }

  @Nullable
  public PsiFile getCachedPsiFile(@NotNull Document document) {
    return null;
  }

  @Nullable
  public Document getDocument(@NotNull PsiFile file) {
    return new DocumentImpl("");
  }

  @Nullable
  public Document getCachedDocument(@NotNull PsiFile file) {
    return null;
  }

  public void commitAllDocuments() {

  }

  public void performForCommittedDocument(@NotNull Document document, @NotNull Runnable action) {

  }

  public void commitDocument(Document document) {

  }

  public Document[] getUncommittedDocuments() {
    return new Document[0];
  }

  public boolean isUncommited(Document document) {
    return false;
  }

  public boolean hasUncommitedDocuments() {
    return false;
  }

  public void commitAndRunReadAction(@NotNull Runnable runnable) {

  }

  public <T> T commitAndRunReadAction(@NotNull Computable<T> computation) {
    return null;
  }

  public void addListener(@NotNull Listener listener) {

  }

  public void removeListener(@NotNull Listener listener) {

  }

  public boolean isDocumentBlockedByPsi(@NotNull Document doc) {
    return false;
  }

  public void doPostponedOperationsAndUnblockDocument(@NotNull Document doc) {

  }
}
