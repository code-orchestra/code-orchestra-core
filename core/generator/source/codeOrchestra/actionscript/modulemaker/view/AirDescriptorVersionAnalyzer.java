package codeOrchestra.actionscript.modulemaker.view;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public final class AirDescriptorVersionAnalyzer {

  private static final String DESCRIPTOR_FILENAME_START = "Descriptor.";
  private static final String DESCRIPTOR_FILENAME_END = ".xsd";

  private AirDescriptorVersionAnalyzer() {
  }

  private static String extractDescriptorVersion(String templateDescriptorFileName) {
    try {
      String temp = templateDescriptorFileName.substring(DESCRIPTOR_FILENAME_START.length());
      return temp.substring(0, temp.indexOf(DESCRIPTOR_FILENAME_END));
    } catch (Throwable t) {
      return null;
    }
  }

  private static int numberPresentation(String version) {
    String temp = version.replace(".", "");
    while (temp.length() < 3) {
      temp += "0";
    }
    return Integer.parseInt(temp);
  }

  public static List<String> getAvailableAIRDescriptorVersions(String flexSDKPath) {
    List<String> availableDescriptorNames = new ArrayList<String>();

    File airDescriptorTemplatesDir = new File(flexSDKPath, "templates" + File.separator + "air");
    if (airDescriptorTemplatesDir.exists()) {
      File[] templateDescriptors = airDescriptorTemplatesDir.listFiles(new FilenameFilter() {
        @Override
        public boolean accept(File parent, String fileName) {
          return fileName.startsWith(DESCRIPTOR_FILENAME_START) && fileName.endsWith(DESCRIPTOR_FILENAME_END);
        }
      });

      for (File templateDescriptor : templateDescriptors) {
        String descriptorVersion = extractDescriptorVersion(templateDescriptor.getName());
        if (descriptorVersion != null) {
          availableDescriptorNames.add(descriptorVersion);
        }
      }
    }

    // Sort by the number presentation, the highest version going first
    Collections.sort(availableDescriptorNames, new Comparator<String>() {
      @Override
      public int compare(String version1, String version2) {
        return numberPresentation(version2) - numberPresentation(version1);
      }
    });

    return availableDescriptorNames;
  }

}
