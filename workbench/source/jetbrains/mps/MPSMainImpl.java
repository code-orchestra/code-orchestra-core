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
package jetbrains.mps;

import com.intellij.idea.MainImpl;
import com.intellij.openapi.application.PathManager;
import com.intellij.openapi.util.BuildNumber;
import com.intellij.openapi.util.io.FileUtil;
import com.intellij.openapi.vfs.newvfs.persistent.FSRecords;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;

public class MPSMainImpl {
  public static void start(final String[] args) {

    ensureCachesInvalidatedIfRunningNewerBuild();

    try {
      Class mainImplCls = MainImpl.class;
      Method method = mainImplCls.getDeclaredMethod("start", String[].class);
      method.setAccessible(true);
      method.invoke(null, new Object[]{args});
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  private static void ensureCachesInvalidatedIfRunningNewerBuild () {
    try {
      File buildNumberFile = new File(PathManager.getHomePath(), "build.number");
      if (!buildNumberFile.exists()) {
        // no way, we don't even know our own build number. bail.
        return;
      }

      Properties buildNumber = new Properties();
      buildNumber.load(new BufferedInputStream (new FileInputStream(buildNumberFile)));
      BuildNumber runningBuild = BuildNumber.fromString(buildNumber.getProperty("build.number"));

      File lastBuildFile = new File(PathManager.getSystemPath(), "lastbuild.txt");
      if (lastBuildFile.exists()) {
        BuildNumber lastBuild = BuildNumber.fromString(new String(FileUtil.loadFileText(lastBuildFile)).trim());
        if (lastBuild.compareTo(runningBuild) >= 0) {
          // alrighty
          return;
        }
      }

      // either the lastbuild.txt doesn't exist or we're indeed running a newer build
      FSRecords.invalidateCaches();
      FileUtil.writeToFile(lastBuildFile, runningBuild.asString().getBytes());
    } catch (IOException e) {
      // aww crap, screw it all!
    }
  }
}
