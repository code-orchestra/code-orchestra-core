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
package codeOrchestra.actionscript.view.dialogs.library.util;

/**
 * author: Daniil
 *
 */

import org.eclipse.egit.github.core.Repository;
import org.eclipse.egit.github.core.service.RepositoryService;

import java.io.File;
import java.io.IOException;

public class GitHubUtil {


  public static void gitClone(String gitRepoUrl, String path, final String gitPath) throws IOException, InterruptedException {
    RepositoryService repositoryService = new RepositoryService();
    Repository repository = repositoryService.getRepository(GitHubUtil.getAuthor(gitRepoUrl),
      GitHubUtil.getReponame(gitRepoUrl));

    GitHubUtil.cloneStart(repository, gitPath, path);
  }

  public static void gitClone(String author, String repoName, String path, final String gitPath) throws IOException, ArrayIndexOutOfBoundsException, InterruptedException {
    RepositoryService repositoryService = new RepositoryService();
    Repository repository = repositoryService.getRepository(author,
      repoName);
    GitHubUtil.cloneStart(repository, gitPath, path);
  }

  public static void cloneStart(Repository repo, String gitpath, String path) throws IOException, InterruptedException {

    File folder = new File(path);
    folder.mkdirs();
    Process p = Runtime.getRuntime().exec(
      gitpath + " clone " + repo.getCloneUrl(), null,
      folder);
    p.waitFor();
    File repoFolder = new File(path + "\\" + repo.getName());
    repoFolder.mkdirs();
    Process p1 = Runtime.getRuntime().exec(
      gitpath + " submodule init", null,
      repoFolder);
    p1.waitFor();
    Process p2 = Runtime.getRuntime().exec(
      gitpath + " submodule update", null,
      repoFolder);
    p2.waitFor();
  }


  public static void update(String LocalUrl) {
    try {
      File folder = new File(LocalUrl);
      folder.mkdirs();
      Process p = Runtime.getRuntime().exec(
        GitHelper.getGitPath() + " pull", null,
        folder);
      p.waitFor();
    } catch (IOException io ) {
    //
    } catch (InterruptedException ie ) {
     //
    }
  }


  public static String getLastUpdateTime(String gitRepoUrl) throws IOException {
    RepositoryService repositoryService = new RepositoryService();
    Repository repository = repositoryService.getRepository(GitHubUtil.getAuthor(gitRepoUrl),
      GitHubUtil.getReponame(gitRepoUrl));

    return repository.getUpdatedAt().toString();
  }

  public static String getAuthor(String url) {
    return url.split("/")[3];
  }


  public static String getReponame(String url) {
    return url.split("/")[4].split("\\.")[0];
  }

}


