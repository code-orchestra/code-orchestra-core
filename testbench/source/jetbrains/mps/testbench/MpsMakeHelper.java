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
package jetbrains.mps.testbench;

import jetbrains.mps.build.ant.MpsWorker.LogLogger;
import jetbrains.mps.build.ant.WhatToDo;
import jetbrains.mps.build.ant.make.MakeWorker;
import jetbrains.mps.testbench.util.FilesCollector;
import jetbrains.mps.testbench.util.FilesCollector.FilePattern;
import jetbrains.mps.testbench.util.FilesCollector.FilePattern.Type;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.JavaEnvUtils;

import java.io.*;
import java.util.*;
import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;

/**
 * Created by IntelliJ IDEA.
 * User: fyodor
 * Date: Aug 24, 2010
 * Time: 10:43:42 AM
 * To change this template use File | Settings | File Templates.
 */
public class MpsMakeHelper {

  private static Object [][] PATTERNS = new Object [][] {
    {Type.EXCLUDE, "**/classes/**"},
    {Type.EXCLUDE, "**/classes_gen/**"},
    {Type.EXCLUDE, "**/lib/**"},
    {Type.EXCLUDE, "**/testRefactoring/**"},
    {Type.EXCLUDE, "**/**transformationTest**/**"},
    {Type.EXCLUDE, "**/**testLogger**/**"},
    {Type.EXCLUDE, "**/**sandbox**/**"},
    {Type.EXCLUDE, "**/**Sandbox**/**"},
    {Type.INCLUDE, "**/**.mpl"},
    {Type.INCLUDE, "**/**.msd"},
    {Type.EXCLUDE, "**/resolve.msd"},
  } ;

  private static String [] JVM_ARGS = {
    "-Xss1024k",
    "-Xmx1000m",
    "-XX:MaxPermSize=92m",
    "-XX:+HeapDumpOnOutOfMemoryError",
  };

  private static final boolean DIRECT_MAKE = true;

  public void make() {
    if (DIRECT_MAKE) {
      directMake();
    } else {
      makeWithAnt();
    }
  }

  private void makeWithAnt() {
    String antHome = System.getProperty("ant.home");
    if (antHome == null || !new File(antHome).exists()) {
      return;
    }
    
    String fileSeparator = System.getProperty("file.separator");
    ProcessBuilder pb = new ProcessBuilder(
      JavaEnvUtils.getJreExecutable("java"),
      "-Dant.home="+System.getProperty("ant.home"),
      "-cp",
      System.getProperty("ant.home")+fileSeparator+"lib"+fileSeparator+"ant-launcher.jar",
      "org.apache.tools.ant.launch.Launcher",
      "-buildfile",
      "AllTests/make_all_modules.xml"
    );
    pb.directory(new File(System.getProperty("user.dir")));

    executeProcess(pb);
  }

  private void executeProcess(ProcessBuilder pb) {
    final CyclicBarrier barrier = new CyclicBarrier(3);
    try {
      Process p = pb.start();
      copyStream(p.getErrorStream(), System.err, barrier);
      copyStream(p.getInputStream(), System.out, barrier);
      p.waitFor();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    try {
      barrier.await();
    }
    catch (InterruptedException e) {}
    catch (BrokenBarrierException e) {}
  }

  public void directMake () {
    WhatToDo toDo = new WhatToDo();
    List<File> path = Collections.singletonList(new File(System.getProperty("user.dir")));
    List<FilePattern> filePtns = new ArrayList<FilePattern>();
    for (Object[] ptns : PATTERNS) {
      filePtns.add (FilesCollector.FilePattern.fromTypeAndPattern(ptns));
    }
    for (File f: FilesCollector.fastCollectFiles(filePtns, path)) {
      toDo.addModuleFile(f);
    }
    toDo.updateLogLevel(2); // INFO
    toDo.putProperty("mps.home", System.getProperty("user.dir"));

    MakeWorker worker = new MakeWorker(toDo, new LogLogger()) {
      @Override
      protected void loadPlugins() {
      }
      @Override
      protected void disposePlugins() {
      }
    };
    worker.work();
//    spawnWorkerAndWait(toDo);
  }

  private void spawnWorkerAndWait(WhatToDo myWhatToDo) {
    String currentClassPathString = System.getProperty("java.class.path");
    Set<File> classPaths = calculateClassPath(new File (System.getProperty("user.dir")));

    List<String> commandLine = new ArrayList<String>();
    commandLine.add(JavaEnvUtils.getJreExecutable("java"));
    commandLine.addAll(Arrays.asList(JVM_ARGS));
    StringBuilder sb = new StringBuilder ();
    String pathSeparator = System.getProperty("path.separator");
    for (File cp : classPaths) {
      sb.append(pathSeparator);
      sb.append(cp.getAbsolutePath());
    }

    // copy ant libs
    for (String entry: currentClassPathString.split(pathSeparator)) {
      if (entry.indexOf("ant") >= 0) {
        sb.append(pathSeparator);
        sb.append(entry);
      }
    }

    commandLine.add("-classpath");
    commandLine.add(sb.toString());

    commandLine.add(MakeWorker.class.getCanonicalName());
    try {
      commandLine.add(myWhatToDo.dumpToTmpFile().getAbsolutePath());
    } catch (FileNotFoundException e) {
      throw new BuildException(e);
    }

    ProcessBuilder pb = new ProcessBuilder(
      JavaEnvUtils.getJreExecutable("java")
    );
    pb.command(commandLine);
    pb.directory(new File(System.getProperty("user.dir")));

    executeProcess(pb);
  }


  private Set<File> calculateClassPath(File mpsHome) {
    File[] pathsToLook;
    if (new File(mpsHome.getAbsolutePath() + File.separator + "classes").exists()) {
      pathsToLook = new File[]{
        new File(mpsHome.getAbsolutePath() + File.separator + "core"),
        new File(mpsHome.getAbsolutePath() + File.separator + "workbench" + File.separator + "classes"),
        new File(mpsHome.getAbsolutePath() + File.separator + "lib"),
        new File(mpsHome.getAbsolutePath() + File.separator + "platform" + File.separator + "buildlanguage" + File.separator + "ant"),
//        new File(myMpsHome.getAbsolutePath() + File.separator + "platform" + File.separator + "uiLanguage"),
        new File(mpsHome.getAbsolutePath() + File.separator + "core" + File.separator + "kernel" + File.separator + "xmlQuery" + File.separator + "runtime"),
//        new File(myMpsHome.getAbsolutePath() + File.separator + "platform" + File.separator + "gtext"),
//        new File(myMpsHome.getAbsolutePath() + File.separator + "platform" + File.separator + "builders"),
        new File(mpsHome.getAbsolutePath() + File.separator + "MPSPlugin" + File.separator + "apiclasses"),
        new File(mpsHome.getAbsolutePath() + File.separator + "testbench"),
      };
    } else {
      pathsToLook = new File[]{new File(mpsHome.getAbsolutePath() + File.separator + "lib"),
        new File(mpsHome.getAbsolutePath() + File.separator + "platform" + File.separator + "generate.ant.task.jar"),
        new File(mpsHome.getAbsolutePath() + File.separator + "plugin")};
    }

    Set<File> classPaths = new LinkedHashSet<File>();
    for (File path : pathsToLook) {
      if (!path.exists() || (!path.isDirectory() && !path.getAbsolutePath().endsWith(".jar"))) {
        throw new BuildException(mpsHome + " is invalid MPS home path: path " + path + " does not exist or is not a directory or a jar file.");
      } else if (!path.isDirectory()) {
        classPaths.add(path.getAbsoluteFile());
      } else {
        gatherAllClassesAndJarsUnder(path, classPaths);
      }
    }
    File mpsClasses = new File(mpsHome + File.separator + "classes");
    if (mpsClasses.exists()) {
      classPaths.add(mpsClasses);
    }
    return classPaths;
  }

  private void gatherAllClassesAndJarsUnder(File dir, Set<File> result) {
    if (dir.getName().equals("classes") || dir.getName().equals("classes_gen") || dir.getName().equals("apiclasses")) {
      result.add(dir);
      return;
    }

    File[] children = dir.listFiles();

    // we do not want trove different from ours in $mps.home$/lib
    String troveJar = "trove" + File.separator + "lib" + File.separator + "trove";
    // to provide right order of class loading,
    // files go first
    for (File f : children) {
      if (!f.isDirectory()) {
        if (f.getName().endsWith(".jar") && !f.getName().contains("ant.jar") && !f.getPath().contains(troveJar)) {
          result.add(f);
        }
      }
    }

    for (File f : children) {
      if (f.isDirectory()) {
        if (f.getName().equals("classes") || f.getName().equals("classes_gen")|| f.getName().equals("testclasses")) {
          result.add(f);
        } else {
          gatherAllClassesAndJarsUnder(f, result);
        }
      }
    }
  }

  private void copyStream(final InputStream from, final PrintStream to, final CyclicBarrier barrier) {
    new Thread() {
      @Override
      public void run() {
        try {
          for (int c; (c = from.read()) >= 0;) {
            to.write(c);
          }
        } catch (IOException e) {}
        try {
          barrier.await();
        } catch (InterruptedException e) {}
        catch (BrokenBarrierException e) {}
      }
    }.start();
  }

}
