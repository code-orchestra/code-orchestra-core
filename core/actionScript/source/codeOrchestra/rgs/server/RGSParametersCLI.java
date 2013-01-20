package codeOrchestra.rgs.server;

import java.io.File;

/**
 * Command-line parameters
 *
 * @author Alexander Eliseyev
 */
public final class RGSParametersCLI {

  public static final String RGS_SERVER_KEY = "rgs.server.port";
  public static final String RGS_HOME_PATH = "rgs.home.path";
  public static final String RGS_USER_KEY = "rgs.server.sshd.user";
  public static final String RGS_PASSWORD_KEY = "rgs.server.sshd.password";

  public static final String RGS_GENERATOR_THREADS_COUNT = "rgs.generator.threads.count";
  public static final String RGS_GENERATOR_STRICT_MODE = "rgs.generator.strict.mode";
  public static final String RGS_GENERATOR_PARALLEL_MODE = "rgs.generator.parallel";

  public static final String RGS_FLEX_SDK_PATH = "rgs.flexsdk.path";

  private static final String SSHD_SERVER_KEY = "rgs.server.sshd.port";

  public static final String RGS_HEADLESS = "rgs.headless";

  public static final String DEFAULT_USERNAME = "codeOrchestra";
  public static final String DEFAULT_PASSWORD = "codeOrchestra2012";
  public static final String DEFAULT_HOST = "localhost";

  public static final int DEFAULT_RGS_PORT = 18000;
  public static final int DEFAULT_SSHD_PORT = 12000;

  public static final int DEFAULT_THREADS_COUNT = 2;
  public static final boolean DEFAULT_STRICT_MODE = true;
  public static final boolean DEFAULT_GENERATE_PARALLEL = false;

  private RGSParametersCLI() {
  }

  public static String getOverridingFlexSDKPath() {
    return System.getProperty(RGS_FLEX_SDK_PATH);
  }

  public static boolean isHeadless() {
    return System.getProperty(RGS_HEADLESS) != null;
  }

  public static boolean isInServerMode() {
    return System.getProperty(RGS_SERVER_KEY) != null;
  }

  public static int getRGSServerPort() {
    String rgsServerPort = System.getProperty(RGS_SERVER_KEY);
    if (rgsServerPort == null) {
      return DEFAULT_RGS_PORT;
    }
    return Integer.valueOf(rgsServerPort);
  }

  public static int getSSHDServerPort() {
    String sshdPortStr = System.getProperty(SSHD_SERVER_KEY);
    if (sshdPortStr == null) {
      return DEFAULT_SSHD_PORT;
    }
    return Integer.valueOf(sshdPortStr);
  }

  public static String getWorkspacePath() {
    return new File(getHomePath(), "workspace").getPath();
  }

  public static String getUsername() {
    String username = System.getProperty(RGS_USER_KEY);
    if (username == null) {
      username = DEFAULT_USERNAME;
    }
    return username;
  }

  public static String getPassword() {
    String password = System.getProperty(RGS_PASSWORD_KEY);
    if (password == null) {
      password = DEFAULT_PASSWORD;
    }
    return password;
  }

  public static String getHomePath() {
    return System.getProperty(RGS_HOME_PATH);
  }

  public static int getNumberOfGenerationThreads() {
    String threadsCountStr = System.getProperty(RGS_GENERATOR_THREADS_COUNT);
    if (threadsCountStr == null) {
      return DEFAULT_THREADS_COUNT;
    }
    return Integer.valueOf(threadsCountStr);
  }

  public static boolean isInStrictMode() {
    String strictModeStr = System.getProperty(RGS_GENERATOR_STRICT_MODE);
    if (strictModeStr == null) {
      return DEFAULT_STRICT_MODE;
    }
    return Boolean.valueOf(strictModeStr);
  }

  public static boolean generateInParallel() {
    String generateInParallel = System.getProperty(RGS_GENERATOR_PARALLEL_MODE);
    if (generateInParallel == null) {
      return DEFAULT_GENERATE_PARALLEL;
    }
    return Boolean.valueOf(generateInParallel);
  }

}
