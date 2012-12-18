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
package jetbrains.mps.vfs;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.FileUtil;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

public class IFileUtils {
  private static final Logger LOG = Logger.getLogger(IFileUtils.class);

  public static boolean copyFileContent(IFile oldFile, IFile newFile) {
    BufferedInputStream in = null;
    OutputStream out = null;
    try {
      in = new BufferedInputStream(oldFile.openInputStream());
      out = newFile.openOutputStream();
      byte[] buf = new byte[1024 * 1024];
      int len;
      while ((len = in.read(buf)) > 0){
        out.write(buf, 0, len);
      }
      return true;
    } catch (IOException e) {
      LOG.error(e);
    } finally {
      try {
        if (in != null) {
          in.close();
        }
        if (out != null) {
          out.close();
        }
      } catch (IOException e) {
        LOG.error(e);
      }
    }
    return false;
  }

  public static IFile createTmpDir() {
    IFile tmpHome = FileSystem.getInstance().getFileByPath(System.getProperty("java.io.tmpdir"));
    int i = 1;
    String prefix = "mps-" + new SimpleDateFormat("yyyy-MM-dd-").format(new Date());
    while (tmpHome.getDescendant(prefix + i).exists()) {
      i++;
    }

    IFile result = tmpHome.getDescendant(prefix + i);
    result.mkdirs();
    return result;
  }

  public static String getCanonicalPath(IFile file) {
    if (file == null) return null;
    final String absolutePath = file.getPath();
    final int index = absolutePath.indexOf('!');
    if (index == -1) {
      return FileUtil.getCanonicalPath(absolutePath);
    } else {
      return FileUtil.getCanonicalPath(absolutePath.substring(0, index))
        + "!" + absolutePath.substring(index + 1);
    }
  }
}
