package codeOrchestra.utils.process;

import com.intellij.execution.ExecutionException;
import com.intellij.openapi.util.SystemInfo;
import com.intellij.util.SystemProperties;
import jetbrains.mps.execution.api.commands.ProcessHandlerBuilder;
import jetbrains.mps.internal.collections.runtime.ISelector;
import jetbrains.mps.internal.collections.runtime.IterableUtils;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.internal.collections.runtime.backports.LinkedList;
import jetbrains.mps.util.PathManager;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.Nullable;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class JavaLauncher {

  private File myWorkingDirectory = new File(SystemProperties.getUserHome());

  private List<String> myClassPath;

  private String myVirtualMachineParameter;
  private String myProgramParameter;

  private String myJrePath = JavaLauncher.getJdkHome();

  public JavaLauncher(List<String> classPath) {
    myClassPath = classPath;
  }

  public void setWorkingDirectory(File workingDirectory) {
    myWorkingDirectory = workingDirectory;
  }

  public void setVirtualMachineParameter(String virtualMachineParameter) {
    myVirtualMachineParameter = virtualMachineParameter;
  }

  public void setProgramParameter(String programParameter) {
    myProgramParameter = programParameter;
  }

  public JavaLauncher(String programParameter, String virtualMachineParameter, List<String> classPath) {
    if (programParameter == null) {
      myProgramParameter = "";
    } else {
      myProgramParameter = programParameter;
    }

    if (virtualMachineParameter == null) {
      myVirtualMachineParameter = "";
    } else {
      myVirtualMachineParameter = virtualMachineParameter;
    }

    if (classPath == null) {
      myClassPath = new ArrayList<String>();
    } else {
      myClassPath = classPath;
    }
  }

  public String getCommandString() {
    return StringUtils.join(getCommand(), " ");
  }

  public ProcessBuilder createProcessBuilder() {
    List<String> commandLine = getCommand();

    ProcessBuilder builder = new ProcessBuilder(ListSequence.fromList(commandLine).toGenericArray(String.class));
    builder.directory(myWorkingDirectory);

    return builder;
  }

  private List<String> getCommand() {
    String java = null;
    try {
      java = JavaLauncher.getJavaCommand(myJrePath);
    } catch (ExecutionException e) {
      throw new RuntimeException("Can't locate a Java executable");
    }
    String classPathString = IterableUtils.join(ListSequence.fromList(myClassPath).select(new ISelector<String, String>() {
      public String select(String it) {
        return JavaLauncher.protect(it);
      }
    }), File.pathSeparator);

    ProcessHandlerBuilder processHandlerBuilder = new ProcessHandlerBuilder().append(java).append(myVirtualMachineParameter).appendKey("classpath", classPathString).append(myProgramParameter);
    return processHandlerBuilder.getCommandLine();
  }

  public static List<String> getJavaHomes() {
    // Return the bundled JRE we provide with Windows build
    if (SystemInfo.isWindows) {
      return Collections.singletonList(PathManager.getHomePath() + File.separator + "jre");
    }

    String systemJavaHome = SystemProperties.getJavaHome();
    List<String> homes = ListSequence.fromList(new LinkedList<String>());
    String systemJdkHome = systemJavaHome.substring(0, systemJavaHome.length() - "/jre".length());
    if (systemJavaHome.endsWith("jre") && new File(systemJdkHome + File.separator + "bin").exists()) {
      ListSequence.fromList(homes).addElement(systemJdkHome);
    }
    if (StringUtils.isNotEmpty(System.getenv("JAVA_HOME"))) {
      ListSequence.fromList(homes).addElement(System.getenv("JAVA_HOME"));
    }
    ListSequence.fromList(homes).addElement(systemJavaHome);
    return homes;
  }

  public static String getJavaCommand(@Nullable String javaHome) throws ExecutionException {
    if (StringUtils.isEmpty(javaHome) || !(new File(javaHome).exists())) {
      javaHome = JavaLauncher.getJdkHome();
    }
    if (StringUtils.isEmpty(javaHome)) {
      throw new ExecutionException("Could not find valid java home.");
    }
    return JavaLauncher.protect(JavaLauncher.getJavaCommandUnprotected(javaHome));
  }

  public static String getJdkHome() {
    List<String> homes = JavaLauncher.getJavaHomes();
    for (String javaHome : ListSequence.fromList(homes)) {
      if (new File(JavaLauncher.getJavaCommandUnprotected(javaHome)).exists()) {
        return javaHome;
      }
    }
    return null;
  }

  public static String getJavaCommandUnprotected(String javaHome) {
    String result = javaHome + File.separator + "bin" + File.separator;
    String java = "java";
    if (SystemInfo.isMac) {
      result += java;
    } else
    if (SystemInfo.isWindows) {
      result += java + ".exe";
    } else {
      result += java;
    }
    return result;
  }

  public static String protect(String result) {
    if (result.contains(" ")) {
      return "\"" + result + "\"";
    }
    return result;
  }

}
