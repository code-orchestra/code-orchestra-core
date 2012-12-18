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
package jetbrains.mps.ide.vcs;

import com.intellij.openapi.application.PathManager;
import com.intellij.openapi.diff.ActionButtonPresentation;
import com.intellij.openapi.diff.DiffRequestFactory;
import com.intellij.openapi.diff.MergeRequest;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.vcs.VcsException;
import com.intellij.openapi.vcs.merge.MergeData;
import com.intellij.openapi.vcs.merge.MergeProvider;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.util.io.ZipUtil;
import jetbrains.mps.fileTypes.MPSFileTypeFactory;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.vcs.VcsHelperUtil;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;

class MergeProviderDecorator implements MergeProvider {
  private static final Logger LOG = Logger.getLogger(MergeProviderDecorator.class);

  private File myBackup;
  private final MergeProvider myProvider;
  private Project myProject;

  public MergeProviderDecorator(Project project, MergeProvider provider) {
    myProject = project;
    myProvider = provider;
    myBackup = null;
  }

  @NotNull
  public MergeData loadRevisions(VirtualFile file) throws VcsException {
    MergeData mergeData = myProvider.loadRevisions(file);
    if (file.getFileType().equals(MPSFileTypeFactory.MODEL_FILE_TYPE)) {
      String leftText = VcsHelperUtil.decodeContent(file, mergeData.CURRENT);
      String rightText = VcsHelperUtil.decodeContent(file, mergeData.LAST);
      String originalText = VcsHelperUtil.decodeContent(file, mergeData.ORIGINAL);
      DiffRequestFactory diffRequestFactory = DiffRequestFactory.getInstance();
      MergeRequest request = diffRequestFactory.createMergeRequest(leftText, rightText, originalText, file, myProject, ActionButtonPresentation.APPLY, ActionButtonPresentation.CANCEL_WITH_PROMPT);
      try {
        myBackup = VcsHelperUtil.zipModel(mergeData, request.getContents(), file);
      } catch (IOException e) {
        LOG.error(e);
      }
    }
    return mergeData;
  }

  public void conflictResolvedForFile(VirtualFile file) {
    myProvider.conflictResolvedForFile(file);
    if (myBackup != null && myBackup.exists()) {
      try {
        File tmp = FileUtil.createTmpDir();
        ZipUtil.extract(myBackup, tmp, null);

        // copy merge result
        FileUtil.copyFile(new File(file.getPath()), new File(tmp + File.separator + file.getName() + ".result"));

        // copy logfiles
        File logsDir = new File(PathManager.getLogPath());
        File[] logfiles = logsDir.listFiles(new FilenameFilter() {
          public boolean accept(File dir, String name) {
            return name.matches("mpsvcs\\.log(\\.1)*") || name.matches("idea\\.log(\\.1)*");
          }
        });
        File tmpLogDir = new File(tmp + File.separator + "logs");
        tmpLogDir.mkdir();
        for (File logfile : logfiles) {
          FileUtil.copyFile(logfile, new File(tmpLogDir + File.separator + logfile.getName()));
        }

        FileUtil.zip(tmp, myBackup);
        FileUtil.delete(tmp);
      } catch (IOException e) {
        LOG.error(e);
      }
    }
  }

  public boolean isBinary(VirtualFile file) {
    return myProvider.isBinary(file);
  }
}
