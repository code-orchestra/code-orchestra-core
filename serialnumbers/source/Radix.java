import java.util.HashMap;

public class Radix {

  final static char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8',
    '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

  private static final int BASE = digits.length;

  final static HashMap<Character, Integer> lookup = new HashMap<Character, Integer>();

  static {
    int i = 0;
    for (char c : digits) {
      lookup.put(c, i++);
    }
  }

  public static long fromRadix(String s) {
    s = s.toUpperCase();

    long result = 0;
    long digit = 0;

    for (int i = 0; i < s.length(); i++) {
      char c = s.charAt(i);
      if (c >= '0' && c <= '9') {
        digit = c - '0';
      } else if (c >= 'A' && c <= 'Z') {
        digit = 10 + c - 'A';
      } else {
        throw new IllegalArgumentException(s);
      }

      if (digit < BASE) {
        result = BASE * result + digit;
      } else {
        throw new IllegalArgumentException(s);
      }
    }
    return result;
  }

  public static String toRadix(long i) {
    char[] buf = new char[BASE * 2 + 1];
    int charPos = BASE * 2;

    i = -i;

    while (i <= -BASE) {
      buf[charPos--] = digits[(int) (-(i % BASE))];
      i /= BASE;
    }

    buf[charPos] = digits[(int) (-i)];

    return new String(buf, charPos, ((BASE * 2 + 1) - charPos));
  }

}