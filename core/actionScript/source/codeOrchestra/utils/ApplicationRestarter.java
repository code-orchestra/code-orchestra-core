package codeOrchestra.utils;

import java.io.File;
import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ApplicationRestarter {

  public static final String SUN_JAVA_COMMAND = "sun.java.command";

  public static void restart() throws IOException {
    final List<String> cmd = new ArrayList<String>();

    // Java command
    cmd.add(protect(System.getProperty("java.home") + "/bin/java"));

    // VM arguments
    List<String> vmArguments = fixInputParameters(ManagementFactory.getRuntimeMXBean().getInputArguments());
    for (String arg : vmArguments) {
      // if it's the agent argument : we ignore it otherwise the
      // address of the old application and the new one will be in conflict
      if (!arg.contains("-agentlib")) {
        cmd.add(arg);
      }
    }

    // Main class/jar
    String[] mainCommand = System.getProperty(SUN_JAVA_COMMAND).split(" ");
    // program main is a jar
    if (mainCommand[0].endsWith(".jar")) {
      // if it's a jar, add -jar mainJar
      cmd.add("-jar");
      cmd.add(protect(new File(mainCommand[0]).getPath()));
    } else {
      // else it's a .class, add the classpath and mainClass
      cmd.add("-classpath");
      cmd.add(System.getProperty("java.class.path"));
      cmd.add(mainCommand[0]);
    }

    // Program args
    for (int i = 1; i < mainCommand.length; i++) {
      cmd.add(mainCommand[i]);
    }

    // Hook
    Runtime.getRuntime().addShutdownHook(new Thread() {
      @Override
      public void run() {
        try {
          String[] commandArray = new String[cmd.size()];
          int i = 0;
          for (String commandBit : cmd) {
            commandArray[i++] = commandBit;
          }

          Runtime.getRuntime().exec(commandArray);
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
    });

    // EXIT ->
    // ApplicationManagerEx.getApplicationEx().exit();
    System.exit(0);
  }

  private static List<String> fixInputParameters(List<String> inputArguments) {
    List<String> fixedArguments = new ArrayList<String>();

    StringBuilder stringBuilder = null;
    for (String inputArgument : inputArguments) {
      // New argument -> finish the previous one
      if (inputArgument.startsWith("-")) {
        if (stringBuilder != null) {
          fixedArguments.add(stringBuilder.toString());
        }

        stringBuilder = new StringBuilder(inputArgument);
      } else {
        if (stringBuilder != null) {
          stringBuilder.append(" ").append(inputArgument);
        }
      }
    }

    if (stringBuilder != null && stringBuilder.length() > 0) {
      fixedArguments.add(stringBuilder.toString());
    }

    return fixedArguments;
  }

  public static String protect(String result) {
    if (result.contains(" ")) {
      return "\"" + result + "\"";
    }
    return result;
  }

}
