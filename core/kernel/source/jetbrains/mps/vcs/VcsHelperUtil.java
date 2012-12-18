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
package jetbrains.mps.vcs;

import com.intellij.openapi.application.PathManager;
import com.intellij.openapi.diff.DiffContent;
import com.intellij.openapi.util.text.StringUtil;
import com.intellij.openapi.vcs.merge.MergeData;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.util.FileUtil;

import java.io.*;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class VcsHelperUtil {
  public static void writeMetaInformation(MergeData mergeData, VirtualFile file, File tmpDir) throws IOException {
    File baseFile = new File(tmpDir.getAbsolutePath() + File.separator + "info.txt");
    baseFile.createNewFile();
    PrintWriter stream = new PrintWriter(new FileOutputStream(baseFile));
    stream.print("File: ");
    stream.println(file.getPath());
    stream.print("Date: ");
    stream.println(Calendar.getInstance().getTime());
    stream.print("Last Revision: ");
    stream.println(mergeData.LAST_REVISION_NUMBER);
    stream.close();
  }

  public static void writeContentsToFile(DiffContent contents, VirtualFile file, File tmpDir, String suffix) throws IOException {
    writeContentsToFile(contents.getBytes(), file.getName(), tmpDir, suffix);
  }

  public static String decodeContent(final VirtualFile file, final byte[] content) {
    return StringUtil.convertLineSeparators(file.getCharset().decode(ByteBuffer.wrap(content)).toString());
  }

  public static File zipModel(MergeData request, DiffContent[] contents, VirtualFile file) throws IOException {
    File tmp = FileUtil.createTmpDir();
    writeContentsToFile(contents[ModelMergeRequestConstants.ORIGINAL], file, tmp, VcsMergeVersion.BASE.getSuffix());
    writeContentsToFile(contents[ModelMergeRequestConstants.CURRENT], file, tmp, VcsMergeVersion.MINE.getSuffix());
    writeContentsToFile(contents[ModelMergeRequestConstants.LAST_REVISION], file, tmp, VcsMergeVersion.REPOSITORY.getSuffix());
    writeMetaInformation(request, file, tmp);
    File zipfile = chooseZipFileForModelFile(file.getName());
    zipfile.getParentFile().mkdirs();
    FileUtil.zip(tmp, zipfile);

    FileUtil.delete(tmp);

    return zipfile;
  }

  public static void writeContentsToFile(byte[] contents, String name, File tmpDir, String suffix) throws IOException {
    File baseFile = new File(tmpDir.getAbsolutePath() + File.separator + name + "." + suffix);
    baseFile.createNewFile();
    OutputStream stream = new FileOutputStream(baseFile);
    stream.write(contents);
    stream.close();
  }

  public static File chooseZipFileForModelFile(String modelFileName) {
    String prefix = getMergeBackupDirPath() + File.separator + modelFileName;
    prefix = prefix + "." + new SimpleDateFormat("yyyy-MM-dd_HH-mm").format(new Date());
    File zipfile = new File(prefix + ".zip");
    int i = 0;
    while (zipfile.exists()) {
      zipfile = new File(prefix + "." + i + ".zip");
      i++;
    }
    return zipfile;
  }

  public static String getMergeBackupDirPath() {
    return PathManager.getSystemPath() + File.separator + "merge-backup";
  }
}
