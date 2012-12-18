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

import jetbrains.mps.BaseMPSTest;
import jetbrains.mps.TestMain;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class MacrosTest extends BaseMPSTest {

  @Override
  protected void setUp() throws Exception {
    IdeMain.setTestMode(TestMode.CORE_TEST);
    TestMain.configureMPS();
  }

  public void testExpand() {
    List<String> tests = generateExpandTests();
    for (String test : tests) {
      String result = MacrosFactory.mpsHomeMacros().expandPath(test, new File(PathManager.getHomePath()));
      if (!checkExpandSeperatorsCorrectness(result)) {
        fail(getFailMessgae("Expand separators:", test, result));
      }
      if (checkMacroPresence(result)) {
        fail(getFailMessgae("Macro presence:", test, result));
      }
    }
  }

  public void testShrink() {
    List<String> tests = generateShrinkTests();
    for (String test : tests) {
      String result = MacrosFactory.mpsHomeMacros().shrinkPath(test, new File(PathManager.getHomePath()));
      if (!checkShrinkSeperatorsCorrectness(result)) {
        fail(getFailMessgae("Shrink separators:", test, result));
      }
      if (!checkMacroPresence(result)) {
        fail(getFailMessgae("Macro presence:", test, result));
      }
    }
  }

  private List<String> generateExpandTests() {
    List<String> tests = new ArrayList<String>();
    tests.add("${mps_home}/1/2/3/4");
    return tests;
  }

  private List<String> generateShrinkTests() {
    List<String> tests = new ArrayList<String>();
    tests.add(pathByComponents(PathManager.getHomePath(), "1", "2", "3", "4"));
    return tests;
  }

  private String pathByComponents(String... components) {
    StringBuilder result = new StringBuilder();
    for (int i = 0; i < components.length - 1; i++) {
      result.append(components[i]);
      result.append(File.separatorChar);
    }
    result.append(components[components.length - 1]);

    return result.toString();
  }

  private String getFailMessgae(String pre, String input, String output) {
    return pre + " \n" +
      "  Input: " + input + "\n" +
      "  Output: " + output + "\n";
  }

  private boolean checkShrinkSeperatorsCorrectness(String s) {
    return s.indexOf(negateSeparator(Macros.SEPARATOR_CHAR)) == -1;
  }

  private boolean checkExpandSeperatorsCorrectness(String s) {
    return s.indexOf(negateSeparator(File.separatorChar)) == -1;
  }

  private boolean checkMacroPresence(String s) {
    return s.indexOf("${") != -1;
  }

  private char negateSeparator(char c) {
    return c == '/' ? '\\' : '/';
  }
}
