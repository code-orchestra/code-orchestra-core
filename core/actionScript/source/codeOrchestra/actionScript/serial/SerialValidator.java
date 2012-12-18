package codeOrchestra.actionScript.serial;

import org.apache.commons.lang.StringUtils;

/**
 * @author Alexander ELiseyev
 */
public final class SerialValidator {

  private static final SerialValidator INSTANCE = new SerialValidator();

  public static SerialValidator getInstance() {
    return INSTANCE;
  }

  private static final String SEPATATOR = "-";
  private static final int SEGMENTS_COUNT = 4;

  private SerialValidator() {
  }

  public boolean isValidSerialNumber(String serialNumber) {
    if (serialNumber == null) {
      return false;
    }

    serialNumber = serialNumber.trim();

    String[] segmentsArray = serialNumber.split(SEPATATOR);
    if (segmentsArray == null || segmentsArray.length != SEGMENTS_COUNT) {
      return false;
    }

    for (int i = 0; i < SEGMENTS_COUNT; i++) {
      if (!isValisSegment(segmentsArray[i], i)) {
        return false;
      }
    }

    return true;
  }

  private static String doMagicSwap(String str) {
    return "" + str.charAt(0) + str.charAt(2) + str.charAt(1) + str.charAt(3);
  }

  private boolean isValisSegment(String segment, int segmentNumber) {
    try {
      if (segmentNumber == 0 || segmentNumber == 3) {
        segment = StringUtils.reverse(segment);
      } else {
        segment = doMagicSwap(segment);
      }
      return PrimeValidator.checkPrime(Radix.fromRadix(segment));
    } catch (Throwable t) {
      return false;
    }
  }

}
