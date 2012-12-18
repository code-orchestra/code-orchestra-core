/*
 * Copyright 2003-2010 JetBrains s.r.o.
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
package jetbrains.mps.ide.blame.command;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.blame.perform.Executor;
import jetbrains.mps.ide.blame.perform.Performable;
import jetbrains.mps.ide.blame.perform.Query;
import jetbrains.mps.ide.blame.perform.Response;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.params.HttpClientParams;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class Poster {
  private static final int TIMEOUT = 60000;

  private Executor myExecutor;

  public Poster(@Nullable Project project) {
    myExecutor = new Executor(project);
  }

  @NotNull
  @CodeOrchestraPatch
  public Response send(final Query query) {
    Performable send = new Performable() {
      @NotNull
      public Response perform() throws Exception {
        HttpClient client = new HttpClient();
        setTimeouts(client);
        Response r = Command.login(client, query);
        if (r.isSuccess()) {
          r = Command.postIssue(client, query.getIssue(), query.getDescription(), query.getIssueType().getYoutrackIssueType()); // RE-3125
        }
        return r;
      }
    };
    return myExecutor.execute(send);
  }

  public Response test(final Query query) {
    Performable test = new Performable() {
      @NotNull
      public Response perform() throws Exception {
        HttpClient client = new HttpClient();
        setTimeouts(client);
        return Command.login(client, query);
      }
    };
    return myExecutor.execute(test);
  }

  public static void setTimeouts(HttpClient c) {
    HttpClientParams params = c.getParams();
    params.setConnectionManagerTimeout(TIMEOUT);
    params.setSoTimeout(TIMEOUT);
    c.setParams(params);
  }
}
