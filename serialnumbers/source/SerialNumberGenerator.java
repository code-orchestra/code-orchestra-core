import org.apache.commons.lang.StringUtils;

import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public class SerialNumberGenerator {

  private static final String SEPATATOR = "-";
  private static final int SEGMENT_LENGTH = 4;

  private String[] primes;
  private long maxSegmentRadixDec;

  public SerialNumberGenerator() {
    // Calculate maximum decimal value to fit into the serial number segment converted to radix
    long l = 0;
    while (Radix.toRadix(++l).length() < SEGMENT_LENGTH + 1) {
    }
    this.maxSegmentRadixDec = l - 1;

    // Calculate the number of primes fitting into the segment
    PrimeGenerator primeGenerator = new PrimeGenerator(maxSegmentRadixDec);
    int i = 0;
    List<Long> primesList = primeGenerator.generate();
    this.primes = new String[primesList.size()];
    for (Long decimalPrime : primesList) {
      this.primes[i++] = addZeroesToSegment(Radix.toRadix(decimalPrime));
    }
  }

  private String getRandomRadixPrime() {
    return primes[new Random().nextInt(primes.length - 1)];
  }

  public Set<String> createSerialNumbers(int count) {
    Set<String> serials = new HashSet<String>(count);

    int collisionCount = 0;

    String newSerial;
    for (int i = 0; i < count; i++) {
      while (true) {
        newSerial = createSerialNumber();
        if (!serials.contains(newSerial)) {
          serials.add(newSerial);
          break;
        } else {
          collisionCount++;
        }
      }
    }

    System.out.println("Collisions count: " + collisionCount);

    return serials;
  }

  public String createSerialNumber() {
    StringBuilder serialSB = new StringBuilder();

    // 1,4 - reverse
    // 2,3 -   swap 2,3 symbols

    serialSB.append(StringUtils.reverse(getRandomRadixPrime()));
    serialSB.append(SEPATATOR);
    serialSB.append(doMagicSwap(getRandomRadixPrime()));
    serialSB.append(SEPATATOR);
    serialSB.append(doMagicSwap(getRandomRadixPrime()));
    serialSB.append(SEPATATOR);
    serialSB.append(StringUtils.reverse(getRandomRadixPrime()));
    return serialSB.toString();
  }

  private static String doMagicSwap(String str) {
    return "" + str.charAt(0) + str.charAt(2) + str.charAt(1) + str.charAt(3);
  }

  private String addZeroesToSegment(String numberStr) {
    StringBuilder numberSB = new StringBuilder();
    for (int i = 0; i < (SEGMENT_LENGTH - numberStr.length()); i++) {
      numberSB.append('0');
    }
    numberSB.append(numberStr);

    if (numberStr.length() > SEGMENT_LENGTH) {
      throw new IllegalStateException("Wrong input: " + numberStr);
    }

    return numberSB.toString();
  }

}
