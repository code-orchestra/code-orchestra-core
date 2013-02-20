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
package jetbrains.mps.util;

import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class CachesUtil {
  private static final String PROPERTY_SYSTEM_PATH = "idea.system.path";
  private static final String PROPERTY_CONFIG_PATH = "idea.config.path";
  private static final List<File> TO_REMOVE = new ArrayList<File>();


  /**
   * @return whether the tmp paths were set
   */
  @CodeOrchestraPatch
  public static boolean setupCaches() {
    // we need to check that caches dirs are writable
    // idea does not have the necessary api, so, alas, doing checks by ourselves
    // see PathManager class
    return useTemporalFolderIfNotSet(PROPERTY_CONFIG_PATH) || useTemporalFolderIfNotSet(PROPERTY_SYSTEM_PATH);
  }

  @CodeOrchestraPatch
  private static boolean useTemporalFolderIfNotSet(String propertyName) {
    String path = System.getProperty(propertyName);
    if (path != null) {
      if (path.length() >= 3 && path.startsWith("\"") && path.endsWith("\"")) {
        path = path.substring(1, path.length() - 1);
      }
      if (path.startsWith("~/") || path.startsWith("~\\")) {
        path = System.getProperty("user.home") + path.substring(1);
      }
      path = new File(path).getAbsolutePath();

      if (FileUtil.canWrite(new File(path))) {
        return false;
      }
    }

    setTmpCacheFolder(propertyName);
    return true;
  }

  @CodeOrchestraPatch
  public static void setTmpCacheFolder(String propertyName) {
    File tmpDir = FileUtil.createTmpDir();
    TO_REMOVE.add(tmpDir);
    System.setProperty(propertyName, tmpDir.getAbsolutePath());
  }

  public static void cleanupCaches() {
    for (File it : TO_REMOVE) {
      try {
        FileUtil.delete(it);
      } catch (Throwable t) {
        t.printStackTrace();
      }
    }
    TO_REMOVE.clear();
  }
}