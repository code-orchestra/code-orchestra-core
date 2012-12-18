import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class PrimeGenerator {

  private long limit;

  public PrimeGenerator(long limit) {
    this.limit = limit;
  }

  public List<Long> generate() {
    List<Long> result = new ArrayList<Long>();

    long lastResult = 0;
    while (true) {
      lastResult = getNextPrime(lastResult);
      if (lastResult < limit) {
        result.add(lastResult++);
      } else {
        break;
      }
    }

    return result;
  }

  public static long getNextPrime(long input) {
    long root;
    boolean isPrime = false;

    if (input <= 1) {
      return 1;
    }
    if (input <= 2) {
      return 2;
    }
    for (int k = 3; k < 9; k += 2) {
      if (input <= k) {
        return k;
      }
    }
    if (input % 2 == 0) {
      input += 1;
    }
    for (long i = input; ; i += 2) {
      root = (long) Math.sqrt(i);
      for (long j = 3; j <= root; j += 2) {
        if (i % j == 0) {
          break;
        }
        if ((root - j) <= 1) {
          isPrime = true;
        }
      }
      if (isPrime == true) {
        return i;
      }
    }
  }

}
