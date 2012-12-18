package codeOrchestra.actionScript.license;


import codeOrchestra.actionScript.serial.SerialValidator;
import org.apache.commons.lang.StringUtils;

import java.util.prefs.BackingStoreException;
import java.util.prefs.Preferences;

/**
 * @author Alexander Eliseyev
 */
public class CodeOrchestraLicenseManager {

  private static Preferences preferences = Preferences.userNodeForPackage(CodeOrchestraLicenseManager.class);

  private static final String SERIAL_NUMBER_KEY = "serial-number";
  private static final String LICENSED_TO_KEY = "licensed-to";

  public static void clearLicenseDate() {
    preferences.put(SERIAL_NUMBER_KEY, StringUtils.EMPTY);
    preferences.put(LICENSED_TO_KEY, StringUtils.EMPTY);

    try {
      preferences.sync();
    } catch (BackingStoreException e) {
      throw new RuntimeException("Can't license data", e);
    }
  }

  public static void main(String[] args) {
    clearLicenseDate();
  }

  public static String getSerialNumber() {
    return preferences.get(SERIAL_NUMBER_KEY, StringUtils.EMPTY);
  }

  public static boolean isLicenseValid() {
    return SerialValidator.getInstance().isValidSerialNumber(getSerialNumber());
  }

  public static void registerProduct(String serialNumber) {
    // This is a bit paranoid, as the serial number must be checked before handing it over here,
    // but hey, you never know.
    if (!SerialValidator.getInstance().isValidSerialNumber(serialNumber)) {
      throw new IllegalArgumentException("Invalid serial number");
    }

    preferences.put(SERIAL_NUMBER_KEY, serialNumber);

    try {
      preferences.sync();
    } catch (BackingStoreException e) {
      throw new RuntimeException("Can't sync license expiry data", e);
    }
  }

  public static String getLicensedTo() {
    if (!isLicenseValid()) {
      return StringUtils.EMPTY;
    }

    String licensedTo = preferences.get(LICENSED_TO_KEY, StringUtils.EMPTY);
    if (StringUtils.isEmpty(licensedTo)) {
      licensedTo = lookupLicensedToBySerialNumber();

      preferences.put(LICENSED_TO_KEY, licensedTo);

      try {
        preferences.sync();
      } catch (BackingStoreException e) {
        throw new RuntimeException("Can't sync license owner data");
      }
    }

    return licensedTo;
  }

  private static String lookupLicensedToBySerialNumber() {
    // TODO: implement
    return "(can't retrieve the license owner's name)";
  }

}
