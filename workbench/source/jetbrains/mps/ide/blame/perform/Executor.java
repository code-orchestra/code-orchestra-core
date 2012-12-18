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
package jetbrains.mps.ide.blame.perform;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task.Modal;
import com.intellij.openapi.project.Project;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class Executor {
  private Project myProject;

  public Executor(@Nullable Project project) {
    myProject = project;
  }

  @NotNull
  public Response execute(final Performable procedure) {
    final Response[] response = new Response[1];

    ProgressManager.getInstance().run(new Modal(myProject, "Connection in progress. Please wait.", false) {
      public void run(@NotNull ProgressIndicator indicator) {
        try {
          response[0] = procedure.perform();
        } catch (Throwable e) {
          response[0] = new Response(e.getMessage(), "", false, e);
        }
      }
    });

    return response[0];
  }
}
