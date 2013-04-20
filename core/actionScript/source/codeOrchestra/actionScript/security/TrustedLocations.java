package codeOrchestra.actionScript.security;

import com.intellij.openapi.util.SystemInfo;
import jetbrains.mps.util.FileUtil;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

/**
 * @author Alexander Eliseyev
 */
public class TrustedLocations {

  private static final TrustedLocations instance = new TrustedLocations();

  public static TrustedLocations getInstance() {
    return instance;
  }

  public void addTrustedLocation(String trustedLocation) {
    List<String> trustedLocations = getTrustedLocations();
    if (!trustedLocations.contains(trustedLocation)) {
      trustedLocations.add(trustedLocation);
    }

    saveTrustedLocations(trustedLocations);
  }

  private void saveTrustedLocations(List<String> trustedLocations) {
    StringBuilder sb = new StringBuilder();
    for (String trustedLocationToSave : trustedLocations) {
      sb.append(trustedLocationToSave).append("\n");
    }
    FileUtil.write(getOrCreateTrustConfigurationFile(), sb.toString());
  }

  public List<String> getTrustedLocations() {
    List<String> trustedLocations = new ArrayList<String>();

    String trustConfigurationContent = FileUtil.read(getOrCreateTrustConfigurationFile());
    StringTokenizer stringTokenizer = new StringTokenizer(trustConfigurationContent);

    while(stringTokenizer.hasMoreTokens()) {
      String token = stringTokenizer.nextToken();
      trustedLocations.add(token);
    }

    return trustedLocations;
  }

  public File getOrCreateTrustConfigurationFile() {
    String userHome = System.getProperty("user.home");
    File flashPlayerTrustDir;
    if (SystemInfo.isWindows) {
      flashPlayerTrustDir = new File(userHome, "Application Data\\Macromedia\\Flash Player\\#Security\\FlashPlayerTrust");
    } else if (SystemInfo.isMac) {
      flashPlayerTrustDir = new File(userHome, "Library/Preferences/Macromedia/Flash Player/#Security/FlashPlayerTrust");
    } else {
      return null;
    }

    if (!flashPlayerTrustDir.exists()) {
      flashPlayerTrustDir.mkdirs();
    }

    File trustConfigurationFile = new File(flashPlayerTrustDir, "co2.cfg");
    if (!trustConfigurationFile.exists()) {
      try {
        trustConfigurationFile.createNewFile();
      } catch (IOException e) {
        throw new RuntimeException("Can't create Flash Player trust configuration file", e);
      }
    }

    return trustConfigurationFile;
  }

}
