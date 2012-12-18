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
package jetbrains.mps.ide;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.PathManager;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

/**
 * @author Kostik
 */
public class VersionUtil {
  private static final Logger LOG = Logger.getLogger(VersionUtil.class);

  public static String getVersionString() {
    Properties props = new Properties();
    try {
      props.load(new FileInputStream(new File(PathManager.getHomePath() + File.separator + "build.number")));
    } catch (Exception e) {
      LOG.error(e);
    }
    return "" + props.get("build.number");
  }
}
