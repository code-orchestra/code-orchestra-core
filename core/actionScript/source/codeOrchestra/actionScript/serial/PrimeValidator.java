package codeOrchestra.actionScript.serial;

/**
 * @author Alexander Eliseyev
 */
public class PrimeValidator {

  public static boolean checkPrime(long n) {
    long primes55[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
      73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179,
      181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257};

    for (int i = 0; i < 55; i++) {
      if (n % primes55[i] == 0) {
        if (n == primes55[i]) {
          return true;
        } else {
          return false;
        }
      }
    }

    long maxtest = n / 16;

    for (long i = 259; i < maxtest; i += 2)
      if (n % i == 0)
        return false;

    return true;
  }


}
