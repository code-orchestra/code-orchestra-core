package codeOrchestra.actionscript.yourkit;

import com.intellij.openapi.application.ApplicationInfo;
import com.intellij.openapi.application.PathManager;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task;
import codeOrchestra.actionScript.errorHandling.EditorErrorHandlingSettings;
import com.yourkit.api.Controller;
import com.yourkit.api.ProfilingModes;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.util.FileUtil;
import org.jetbrains.annotations.NotNull;

import java.io.*;
import java.lang.management.ManagementFactory;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * @author Anton.I.Neverov
 */
public class YourKitControllerManager {
  private static YourKitControllerManager INSTANCE;
  final private static String PROFILING_DIRECTORY = PathManager.getSystemPath() + File.separator + "profiling";

  private Controller controller;
  private boolean inProgress;

  private YourKitControllerManager() throws Exception {
    this.controller = new Controller();
  }

  public static String getProfilingDirectory() {
    File profilingDirectory = new File(PROFILING_DIRECTORY);
    if (!profilingDirectory.exists()) {
      profilingDirectory.mkdir();
    }
    return PROFILING_DIRECTORY;
  }

  public String captureMemorySnapshot() throws Exception {
    final String[] result = new String[1];

    ProgressManager.getInstance().run(new Task.Modal(null, "Processing...", false) {
      public void run(@NotNull ProgressIndicator p0) {
        try {

          p0.setIndeterminate(true);
          p0.setText("Performing garbage collection");
          controller.forceGC();
          controller.forceGC();
          controller.forceGC();

          p0.setText("Taking memory dump");
          String path = controller.captureSnapshot(ProfilingModes.SNAPSHOT_HPROF);

          p0.setText("Compressing");
          result[0] = copyIt(zipIt(renameIt(path)));

        } catch (Exception e) {
          result[0] = null;
        }
      }
    });

    if (result[0] == null) {
      throw new Exception();
    }
    return result[0];
  }

  public void startCPUProfiling() throws Exception {
    if (inProgress) {
      return;
    }
    long profilingMode = EditorErrorHandlingSettings.getInstance().useCPUTracing() ? ProfilingModes.CPU_TRACING : ProfilingModes.CPU_SAMPLING;
    controller.startCPUProfiling(profilingMode, Controller.DEFAULT_FILTERS, Controller.DEFAULT_WALLTIME_SPEC);
    inProgress = true;
  }

  public String stopCPUProfilingAndSaveSnapshot() throws Exception {
    if (!(inProgress)) {
      return null;
    }
    controller.stopCPUProfiling();
    inProgress = false;
    final String[] result = new String[1];

    ProgressManager.getInstance().run(new Task.Modal(null, "Processing...", false) {
      public void run(@NotNull ProgressIndicator p0) {
        try {

          p0.setIndeterminate(true);
          p0.setText("Saving CPU snapshot");
          String path = controller.captureSnapshot(ProfilingModes.SNAPSHOT_WITHOUT_HEAP);

          p0.setText("Compressing");
          result[0] = copyIt(zipIt(renameIt(path)));

        } catch (Exception ignored) {
        }
      }
    });

    if (result[0] == null) {
      throw new Exception();
    }
    return result[0];
  }

  public boolean isInProgress() {
    return inProgress;
  }

  private String renameIt(String path) {
    try {

      String date = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss").format(new Date(System.currentTimeMillis()));
      File file = new File(path);
      String dir = file.getParentFile().getCanonicalPath();
      String name = file.getName();
      name = name.substring(name.lastIndexOf("."));
      String dumpOrSnapshot;
      if (name.equals(".hprof")) {
        dumpOrSnapshot = "dump";
      } else if (name.equals(".snapshot")) {
        dumpOrSnapshot = "snapshot";
      } else {
        return path;
      }
      name = "CodeOrchestra_" + dumpOrSnapshot + "_" + ApplicationInfo.getInstance().getBuild().asString() + "_" + date + name;
      File newFile = new File(dir, name);
      boolean b = file.renameTo(newFile);
      return (b ?
        newFile.getAbsolutePath() :
        path
      );

    } catch (Throwable t) {
      return path;
    }
  }

  private String zipIt(final String path) {
    try {

      String zipFilePath = path.substring(0, path.lastIndexOf(".")) + ".zip";

      ZipOutputStream zipOutputStream = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(zipFilePath)));
      BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(path));

      File file = new File(path);
      ZipEntry zipEntry = new ZipEntry(file.getName());
      zipOutputStream.putNextEntry(zipEntry);

      int bufferSize = 4096;
      byte[] buffer = new byte[bufferSize];
      int count;
      while ((count = bufferedInputStream.read(buffer, 0, bufferSize)) != -1) {
        zipOutputStream.write(buffer, 0, count);
      }

      bufferedInputStream.close();
      zipOutputStream.close();

      file.delete();
      return zipFilePath;

    } catch (Throwable t) {
      return path;
    }
  }

  private String copyIt(String path) {
    File oldFile = new File(path);
    FileUtil.copyFile(oldFile, new File(getProfilingDirectory()));

    String newPath = getProfilingDirectory() + File.separator + oldFile.getName();

    oldFile.delete();

    return newPath;
  }

  public static YourKitControllerManager getInstance() throws Exception {
    if (INSTANCE == null) {
      INSTANCE = new YourKitControllerManager();
    }
    return INSTANCE;
  }

  public static boolean isJVMLaunchedWithAgent() {
    try {
      List<String> args = ManagementFactory.getRuntimeMXBean().getInputArguments();
      for (String arg : ListSequence.fromList(args)) {
        if (arg.startsWith("-agentpath:") && arg.contains("yjpagent.")) {
          return true;
        }
      }
      return false;
    } catch (Throwable t) {
      return false;
    }
  }
}
