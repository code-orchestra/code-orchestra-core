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
package jetbrains.mps.build.ant;

import jetbrains.mps.build.ant.generation.TestGenerationOnTeamcity;
import jetbrains.mps.util.FileUtil;
import org.apache.tools.ant.BuildException;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;

public class WhatToDo {
  private final Set<File> myModels = new LinkedHashSet<File>();
  private final Set<File> myModules = new LinkedHashSet<File>();
  private final Set<File> myExcludedFromDiff = new LinkedHashSet<File>();
  private final Map<File, List<String>> myMPSProjects = new LinkedHashMap<File, List<String>>();
  private boolean myFailOnError = true;
  private final Map<String, File> myLibraries = new LinkedHashMap<String, File>();
  private final Set<String> myCompiledLibraries = new LinkedHashSet<String>();
  private final Map<String, String> myMacro = new LinkedHashMap<String, String>();
  private int myLogLevel = org.apache.tools.ant.Project.MSG_INFO;
  private static final String EXCLUDE_FROM_DIFF_FILE = "EXCLUDE_FROM_DIFF_FILE";
  private static final String MODEL_FILE = "MODEL_FILE";
  private static final String MODULE_FILE = "MODULE_FILE";
  private static final String MPS_PROJECT = "MPS_PROJECT";
  private static final String MPS_LIBRARY = "MPS_LIBRARY";
  private static final String MPS_MACRO = "MPS_MACRO";
  private static final String FAIL_ON_ERROR = "FAIL_ON_ERROR";
  private static final String LOG_LEVEL = "LOG_LEVEL";
  private static final String LIBRARY_COMPILE = "LIBRARY_COMPILE";
  private final Map<String, String> myProperties = new LinkedHashMap<String, String>();

  public void addModuleFile(File file) {
    assert file.exists() && !file.isDirectory() : "bad file: " + file.toString();
    myModules.add(file);
  }

  public void addModelFile(File file) {
    assert file.exists() && !file.isDirectory() : "bad file: " + file.toString();
    myModels.add(file);
  }

  public void excludeFileFromDiff(File file) {
    assert file.exists() && !file.isDirectory();
    myExcludedFromDiff.add(file);
  }

  public void addProjectFile(File projectFile) {
    assert projectFile.exists() && projectFile.isFile();
    if (!myMPSProjects.containsKey(projectFile)) {
      myMPSProjects.put(projectFile, new ArrayList<String>());
    }
  }

  public void addProjectFile(File projectFile, String... property) {
    assert projectFile.exists() && projectFile.isFile();
    List<String> projectProperties = myMPSProjects.get(projectFile);
    if (projectProperties == null) {
      projectProperties = new ArrayList<String>();
      myMPSProjects.put(projectFile, projectProperties);
    }
    projectProperties.addAll(Arrays.asList(property));
  }

  public Set<File> getModels() {
    return Collections.unmodifiableSet(myModels);
  }

  public void updateModels(Set<File> models) {
    myModels.addAll(models);
  }

  public Set<File> getExcludedFromDiffFiles() {
    return Collections.unmodifiableSet(myExcludedFromDiff);
  }

  public void updateExcludedFromDiffFiles(Set<File> excluded) {
    myExcludedFromDiff.addAll(excluded);
  }

  public Set<File> getModules() {
    return Collections.unmodifiableSet(myModules);
  }

  public void updateModules(Set<File> modules) {
    myModules.addAll(modules);
  }

  public Map<File, List<String>> getMPSProjectFiles() {
    return Collections.unmodifiableMap(myMPSProjects);
  }

  public void updateMPSProjectFiles(Map<File, List<String>> mpsProjects) {
    myMPSProjects.putAll(mpsProjects);
  }

  public boolean getFailOnError() {
    return myFailOnError;
  }

  public void updateFailOnError(boolean showError) {
    myFailOnError = showError;
  }

  public Map<String, String> getProperties() {
    return Collections.unmodifiableMap(myProperties);
  }

  public void updateProperties(Map<String, String> properties) {
    myProperties.putAll(properties);
  }

  public void addLibrary(String name, File dir, boolean compile) {
    myLibraries.put(name, dir);
    if (compile) {
      myCompiledLibraries.add(name);
    }
  }

  public Map<String, File> getLibraries() {
    return Collections.unmodifiableMap(myLibraries);
  }

  public void updateLibraries(Map<String, File> libraries) {
    myLibraries.putAll(libraries);
  }

  public Set<String> getCompiledLibraries() {
    return Collections.unmodifiableSet(myCompiledLibraries);
  }

  public void updateCompiledLibraries(Set<String> libraries) {
    myCompiledLibraries.addAll(libraries);
  }

  public void addMacro(String name, String value) {
    myMacro.put(name, value);
  }

  public Map<String, String> getMacro() {
    return Collections.unmodifiableMap(myMacro);
  }

  public void updateMacro(Map<String, String> macro) {
    myMacro.putAll(macro);
  }

  public void updateLogLevel(int level) {
    myLogLevel = level;
  }

  public int getLogLevel() {
    return myLogLevel;
  }

  public void cloneTo(Object dest) {
    Class<? extends WhatToDo> srcClass = this.getClass();
    Class<? extends Object> destClass = dest.getClass();

    Method[] srcMethods = srcClass.getMethods();
    for (Method srcMethod : srcMethods) {
      String srcMethodName = srcMethod.getName();
      if (srcMethodName.startsWith("get")) {
        String dstMethodName = srcMethodName.replace("get", "update");
        try {
          Method destMethod = destClass.getMethod(dstMethodName, srcMethod.getReturnType());
          destMethod.invoke(dest, srcMethod.invoke(this));
        } catch (NoSuchMethodException e) {
          // doing nothing
        } catch (InvocationTargetException e) {
          throw new BuildException(e);
        } catch (IllegalAccessException e) {
          throw new BuildException(e);
        }
      }
    }
  }

  @Override
  public String toString() {
    final StringBuffer sb = new StringBuffer();
    for (File f : myModels) {
      sb.append(MODEL_FILE);
      sb.append("=");
      sb.append(f.getAbsolutePath());
      sb.append(" ");
    }
    for (File f : myExcludedFromDiff) {
      sb.append(EXCLUDE_FROM_DIFF_FILE);
      sb.append("=");
      sb.append(f.getAbsolutePath());
      sb.append(" ");
    }
    for (File f : myModules) {
      sb.append(MODULE_FILE);
      sb.append("=");
      sb.append(f.getAbsolutePath());
      sb.append(" ");
    }
    for (File f : myMPSProjects.keySet()) {
      sb.append(MPS_PROJECT);
      sb.append("=");
      sb.append(f.getAbsolutePath());
      sb.append("[");
      for (String s : myMPSProjects.get(f)) {
        sb.append(s);
        sb.append(",");
      }
      sb.append("]");
      sb.append(" ");
    }
    for (String libraryName : myLibraries.keySet()) {
      sb.append(MPS_LIBRARY);
      sb.append("=");
      sb.append("[");
      sb.append(libraryName);
      if (myCompiledLibraries.contains(libraryName)) {
        sb.append("," + LIBRARY_COMPILE);
      }
      sb.append("]");
      sb.append(myLibraries.get(libraryName).getAbsolutePath());
      sb.append(" ");
    }
    for (String macroName : myMacro.keySet()) {
      sb.append(MPS_MACRO);
      sb.append("=");
      sb.append("[");
      sb.append(macroName);
      sb.append("]");
      sb.append(myMacro.get(macroName));
      sb.append(" ");
    }

    for (String name : myProperties.keySet()) {
      sb.append(name);
      sb.append("=");
      sb.append(myProperties.get(name));
      sb.append(" ");
    }

    sb.append(FAIL_ON_ERROR);
    sb.append("=");
    sb.append(myFailOnError);
    sb.append(" ");

    sb.append(LOG_LEVEL);
    sb.append("=");
    sb.append(myLogLevel);
    sb.append(" ");

    return sb.toString();
  }

  public File dumpToTmpFile() throws FileNotFoundException {
    File tmpFile = createTmpFile();
    PrintWriter writer = new PrintWriter(tmpFile);
    writer.append(toString());
    writer.flush();
    writer.close();
    return tmpFile;
  }

  public static File createTmpFile() {
    File tmp = new File(System.getProperty("java.io.tmpdir"));
    int i = 0;
    while (true) {

      if (!new File(tmp, "mpstemp" + i).exists()) {
        break;
      }
      i++;
    }

    File result = new File(tmp, "mpstemp" + i);
    try {
      result.createNewFile();
    } catch (IOException e) {
      e.printStackTrace();
    }
    return result;
  }

  public static WhatToDo fromDumpInFile(File file) {
    String dump = FileUtil.read(file);
    if (!file.delete()) throw new RuntimeException("File " + file + " was not deleted.");
    return fromCommandLine(dump);
  }

  public static WhatToDo fromCommandLine(String... args) {
    WhatToDo whatToDo = new WhatToDo();
    for (String arg : args) {
      String[] argsplit = arg.split("\\s+");
      for (String s : argsplit) {
        String[] propertyValuePair = s.split("=");
        if (propertyValuePair[0].equals(MODEL_FILE)) {
          whatToDo.addModelFile(new File(propertyValuePair[1]));
        } else if (propertyValuePair[0].equals(EXCLUDE_FROM_DIFF_FILE)) {
          whatToDo.excludeFileFromDiff(new File(propertyValuePair[1]));
        } else if (propertyValuePair[0].equals(MODULE_FILE)) {
          whatToDo.addModuleFile(new File(propertyValuePair[1]));
        } else if (propertyValuePair[0].equals(MPS_LIBRARY)) {
          String[] nameValuePair = propertyValuePair[1].split("\\[|\\]");
          String name = nameValuePair[1];
          String[] strings = name.split(",");
          if (strings.length == 1) {
            whatToDo.addLibrary(name, new File(nameValuePair[2]), false);
          } else if (strings[1].equals(LIBRARY_COMPILE)) {
            whatToDo.addLibrary(strings[0], new File(nameValuePair[2]), true);
          } else {
            System.err.println("Don't know what to do with input " + name);
          }
        } else if (propertyValuePair[0].equals(MPS_MACRO)) {
          String[] nameValuePair = propertyValuePair[1].split("\\[|\\]");
          whatToDo.addMacro(nameValuePair[1], nameValuePair[2]);
        } else if (propertyValuePair[0].equals(MPS_PROJECT)) {
          String[] nameValuePair = propertyValuePair[1].split("\\[|\\]");
          String projectName = nameValuePair[0];
          if (nameValuePair.length > 1) {
            String[] properties = nameValuePair[1].split(",");
            whatToDo.addProjectFile(new File(projectName), properties);
          } else {
            whatToDo.addProjectFile(new File(projectName));
          }
        } else if (propertyValuePair[0].equals(FAIL_ON_ERROR)) {
          whatToDo.myFailOnError = Boolean.parseBoolean(propertyValuePair[1]);
        } else if (propertyValuePair[0].equals(LOG_LEVEL)) {
          whatToDo.myLogLevel = Integer.parseInt(propertyValuePair[1]);
        } else if (propertyValuePair.length == 2) {
          whatToDo.putProperty(propertyValuePair[0], propertyValuePair[1]);
        } else {
//          System.err.println("ERROR: Don't know what to do: [" + s + "]");
        }
      }
    }
    return whatToDo;
  }

  public void putProperty(String name, String value) {
    myProperties.put(name, value);
  }

  public String getProperty(String name) {
    return myProperties.get(name);
  }

  public void addPerfomanceReport(String s) {
    String reports = myProperties.get(TestGenerationOnTeamcity.GENERATE_PERFORMANCE_REPORT);
    if (reports == null) reports = "";
    if (!reports.isEmpty()) {
      reports += ",";
    }
    reports += s;
    myProperties.put(TestGenerationOnTeamcity.GENERATE_PERFORMANCE_REPORT, reports);
  }
}
