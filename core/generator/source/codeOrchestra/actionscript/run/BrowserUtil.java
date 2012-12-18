package codeOrchestra.actionscript.run;

import com.intellij.CommonBundle;
import com.intellij.ide.GeneralSettings;
import com.intellij.ide.IdeBundle;
import com.intellij.openapi.application.*;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.ui.Messages;
import com.intellij.openapi.util.SystemInfo;
import com.intellij.openapi.util.io.FileUtil;
import com.intellij.openapi.vfs.VfsUtil;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.io.*;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BrowserUtil {
  private static final Logger LOG = Logger.getInstance("#" + BrowserUtil.class.getName());

  // The pattern for 'scheme' mainly according to RFC1738.
  // We have to violate the RFC since we need to distinguish
  // real schemes from local Windows paths; The only difference
  // with RFC is that we do not allow schemes with length=1 (in other case
  // local paths like "C:/temp/index.html" whould be erroneously interpreted as
  // external URLs.)
  @NonNls private static final Pattern ourExternalPrefix = Pattern.compile("^[\\w\\+\\.\\-]{2,}:");
  private static final Pattern ourAnchorsuffix = Pattern.compile("#(.*)$");

  private BrowserUtil() {
  }

  public static boolean isAbsoluteURL(String url) {
    return ourExternalPrefix.matcher(url.toLowerCase()).find();
  }

  public static String getDocURL(String url) {
    Matcher anchorMatcher = ourAnchorsuffix.matcher(url);

    if (anchorMatcher.find()) {
      return anchorMatcher.reset().replaceAll("");
    }

    return url;
  }

  public static URL getURL(String url) throws java.net.MalformedURLException {
    if (!isAbsoluteURL(url)) {
      return new URL("file", "", url);
    }

    return VfsUtil.convertToURL(url);
  }

  private static ProcessBuilder launchBrowser(final String url, String[] command) {
    try {
      URL curl = BrowserUtil.getURL(url);

      if (curl != null) {
        final String urlString = curl.toString();
        String[] commandLine;
        if (SystemInfo.isWindows && isUseDefaultBrowser()) {
          commandLine = new String[command.length + 2];
          System.arraycopy(command, 0, commandLine, 0, command.length);
          commandLine[commandLine.length - 2] = "\"\"";
          commandLine[commandLine.length - 1] = "\"" + redirectUrl(url, urlString) + "\"";
        }
        else {
          commandLine = new String[command.length + 1];
          System.arraycopy(command, 0, commandLine, 0, command.length);
          commandLine[commandLine.length - 1] = escapeUrl(urlString);
        }
        return new ProcessBuilder(commandLine);
      }
      else {
        showErrorMessage(IdeBundle.message("error.malformed.url", url), CommonBundle.getErrorTitle());
      }
    }
    catch (final IOException e) {
      showErrorMessage(IdeBundle.message("error.cannot.start.browser", e.getMessage()),
                       CommonBundle.getErrorTitle());
    }
    return null;
  }

  /**
   * This method works around Windows 'start' command behaivor of dropping anchors from the url for local urls.
   */
  private static String redirectUrl(String url, @NonNls String urlString) throws IOException {
    if (url.indexOf('&') == -1 && (!urlString.startsWith("file:") || urlString.indexOf("#") == -1)) return urlString;

    File redirect = File.createTempFile("redirect", ".html");
    redirect.deleteOnExit();
    FileWriter writer = new FileWriter(redirect);
    writer.write("<html><head></head><body><script type=\"text/javascript\">window.location=\"" + url + "\";</script></body></html>");
    writer.close();
    return VfsUtil.pathToUrl(redirect.getAbsolutePath());
  }

  private static boolean isUseDefaultBrowser() {
    Application application = ApplicationManager.getApplication();
    if (application == null) {
      return true;
    }
    else {
      return getGeneralSettingsInstance().isUseDefaultBrowser();
    }
  }

  private static void showErrorMessage(final String message, final String title) {
    final Application app = ApplicationManager.getApplication();
    if (app == null) {
      return; // Not started yet. Not able to show message up. (Could happen in License panel under Linux).
    }

    Runnable runnable = new Runnable() {
      public void run() {
        Messages.showMessageDialog(message,
                                   title,
                                   Messages.getErrorIcon());
      }
    };

    if (app.isDispatchThread()) {
      runnable.run();
    }
    else {
      app.invokeLater(runnable, ModalityState.NON_MODAL);
    }
  }

  private static ProcessBuilder launchBrowserUsingStandardWay(final String url) {
    String[] command;
    try {
      String browserPath = getGeneralSettingsInstance().getBrowserPath();
      if (browserPath == null || browserPath.trim().length() == 0) {
        showErrorMessage(IdeBundle.message("error.please.specify.path.to.web.browser"),
                         IdeBundle.message("title.browser.not.found"));
        return null;
      }

      command = new String[]{browserPath};
    }
    catch (NullPointerException e) {
      // todo: fix the possible problem on startup, see SCR #35066
      command = getDefaultBrowserCommand();
      if (command == null) {
        showErrorMessage(IdeBundle.message("error.please.open.url.manually", url, ApplicationNamesInfo.getInstance().getProductName()),
                         IdeBundle.message("title.browser.path.not.found"));
        return null;
      }
    }
    // We do not need to check browserPath under Win32

    return launchBrowser(url, command);
  }

  private static GeneralSettings getGeneralSettingsInstance() {
    final GeneralSettings settings = GeneralSettings.getInstance();
    if (settings != null) return settings;
    return new GeneralSettings();
  }

  public static ProcessBuilder launchBrowser(String url, String name) {
    ProcessBuilder processBuilder = null;
    if (canStartDefaultBrowser() && isUseDefaultBrowser()) {
      return launchBrowser(url, getDefaultBrowserCommand());
    }
    else {
      return launchBrowserUsingStandardWay(url);
    }
  }

  @NotNull
  public static String escapeUrl(@NotNull @NonNls String url) {
    if (SystemInfo.isWindows) {
      return "\"" + url + "\"";
    }
    else {
      return url.replaceAll(" ", "%20");
    }
  }

  public static void clearExtractedFiles() {
    FileUtil.delete(getExtractedFilesDir());
  }

  private static File getExtractedFilesDir() {
    return new File(PathManager.getSystemPath(), "ExtractedFiles");
  }

  public static ProcessBuilder launchBrowser(@NonNls final String url) {
    return launchBrowser(url, (String)null);
  }

  @NonNls
  private static String[] getDefaultBrowserCommand() {
    if (SystemInfo.isWindows9x) {
      return new String[]{"command.com", "/c", "start"};
    }
    else if (SystemInfo.isWindows) {
      return new String[]{"cmd.exe", "/c", "start"};
    }
    else if (SystemInfo.isMac) {
      return new String[]{"open"};
    }
    else if (SystemInfo.isUnix) {
      return new String[]{"mozilla"};
    }
    else {
      return null;
    }
  }

  public static boolean canStartDefaultBrowser() {
    if (SystemInfo.isMac) {
      return true;
    }

    if (SystemInfo.isWindows) {
      return true;
    }

    return false;
  }

}

