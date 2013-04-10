/*
 * Copyright Oleg Chirukhin.
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
package codeOrchestra.TDD.base;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

/**
 * @author olegchir
 */
public class TestSettings {

  public static final String CODE_ORCHESTRA_DEV_DIR = ".codeOrchestraDev";
  public static final String GLOBAL_TEST_PROPERTIES_FILE_NAME = "globalTestProperties.properties";
  public static final String PROJECT_ROOT_PROPERTY = "project.root";
  public static final String FLEX_SDK_ROOT_PROPERTY = "flex.sdk.root";
  public static final String FLEX_SDK_PLAYER_VERSIONS = "flex.sdk.player.versions";

  public static String getProjectRoot() {
    return getProperty(PROJECT_ROOT_PROPERTY);
  }

  public static String getFlexSDKRoot() {
    return getProperty(FLEX_SDK_ROOT_PROPERTY);
  }

  public static List<String> getFlexSDKPlayerVersions() {
    String propertyValue = getProperty(FLEX_SDK_PLAYER_VERSIONS);
    List<String> strings = Arrays.asList(propertyValue.split(","));
    return strings;
  }

  public static String getProperty(String propertyName) {
    String userHome = System.getProperty( "user.home" );
    String propertyValue = null;
    // Try build.properties
    File buildPropertiesFile = new File(userHome + File.separator + CODE_ORCHESTRA_DEV_DIR + File.separator + GLOBAL_TEST_PROPERTIES_FILE_NAME);
    if (buildPropertiesFile.exists()) {
      Properties buildProperties = new Properties();
      try {
        buildProperties.load(new FileInputStream(buildPropertiesFile));
        Object versionProperty = buildProperties.get(propertyName);
        if (versionProperty != null) {
          propertyValue = (String) versionProperty;
        }
      } catch (IOException e) {
        // ignore
      }
    }
    return propertyValue;
  }
}
