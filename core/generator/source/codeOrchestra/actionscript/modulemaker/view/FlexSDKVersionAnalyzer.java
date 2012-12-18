package codeOrchestra.actionscript.modulemaker.view;

import codeOrchestra.actionscript.util.XMLUtils;
import org.w3c.dom.Document;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 * @author Alexander Eliseyev
 */
public class FlexSDKVersionAnalyzer {

  private static final String BUILD_PROPERTIES_NAME = "build.properties";
  private static final String FLEX_SDK_DESCRIPTION_XML_NAME = "flex-sdk-description.xml";

  public static int getFlexSDKMajorVersion(String flexSDKPath) {
    String versionString = getFlexSDKVersion(flexSDKPath);
    if (versionString != null) {
      return getMajorVersion(versionString);
    }
    return -1;
  }

  public static String getFlexSDKVersion(String flexSDKPath) {
    File flexDir = new File(flexSDKPath);
    if (!flexDir.exists()) {
      return null;
    }

    // Try build.properties
    File buildPropertiesFile = new File(flexDir.getPath() + File.separator + BUILD_PROPERTIES_NAME);
    if (buildPropertiesFile.exists()) {
      Properties buildProperties = new Properties();
      try {
        buildProperties.load(new FileInputStream(buildPropertiesFile));
        Object versionProperty = buildProperties.get("release.version");
        if (versionProperty != null) {
          return (String) versionProperty;
        }
      } catch (IOException e) {
        // ignore
      }
    }

    // Try XML file
    File flexSdkDescriptionXmlFile = new File(flexDir.getPath() + File.separator + FLEX_SDK_DESCRIPTION_XML_NAME);
    if (flexSdkDescriptionXmlFile.exists()) {
      Document sdkDescription = XMLUtils.fileToDOM(flexSdkDescriptionXmlFile);
      if (sdkDescription != null) {
        try {
          String versionStr = sdkDescription.getDocumentElement().getElementsByTagName("version").item(0).getTextContent();
          return versionStr;
        } catch (Throwable t) {
          // ignore
        }
      }
    }

    return null;
  }

  private static int getMajorVersion(String versionStr) {
    if (!versionStr.isEmpty()) {
      try {
        return Integer.parseInt(versionStr.substring(0, 1));
      } catch (NumberFormatException e) {
        // ignore
      }
    }
    return -1;
  }

}
