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
package codeOrchestra.actionscript.modulemaker.view;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.List;

/**
 * @author olegchir
 */
public class FlexSDKPlayerVersionAnalyzer {
  public static List<String> getAvailablePlayerVersions(String flexSDKPath) {
    List<String> availableVersions = new ArrayList<String>();

    File playerDir = new File(flexSDKPath, "frameworks" + File.separator + "libs" + File.separator + "player");
    if (playerDir.exists()) {
      File[] versions = playerDir.listFiles();

      for (File versionFile : versions) {
        String version = versionFile.getName()+".0";
        if (version != null) {
          availableVersions.add(version);
        }
      }
    }

    return availableVersions;
  }

  public static boolean playerVersionAvailable(String playerVersion, String flexSDKPath) {
    List<String> versions = getAvailablePlayerVersions(flexSDKPath);
    return versions.contains(playerVersion);
  }

  public static boolean playerVersionAvailable(String playerVersion) {
    String flexSDKPath = FlexSDKSettings.getInstance().getFlexSDKPath();
    List<String> versions = getAvailablePlayerVersions(flexSDKPath);
    return versions.contains(playerVersion);
  }
}
