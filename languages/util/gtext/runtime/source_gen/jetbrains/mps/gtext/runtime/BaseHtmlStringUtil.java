package jetbrains.mps.gtext.runtime;

/*Generated by MPS */

import java.util.regex.Pattern;

public class BaseHtmlStringUtil {
  private static final String EMPTY_STRING = "";
  private static final String BAD_SYMBOL_CHAR = "\u25A1";
  private static final String[] _charsToEntities;
  private static final String[] _charsToLiterals;
  private static final String _literalChars;
  private static final Pattern _newLine = Pattern.compile("\n");
  private static final Pattern _doubleQuote = Pattern.compile("\"");
  private static final BaseHtmlStringUtil.DeprecatedSymbolsInterval[] _deprecatedIntervals;

  protected BaseHtmlStringUtil() {
  }

  public static String html(final Object object) {
    if (object == null) {
      return EMPTY_STRING;
    }
    final String str = object.toString();
    final int capacity = str.length();
    StringBuilder builder = null;
    for (int i = 0; i < capacity; i++) {
      final char c = str.charAt(i);
      if (_charsToEntities[c] != null) {
        if (builder == null) {
          builder = new StringBuilder(capacity + 100);
          builder.append(str.substring(0, i));
        }
        builder.append(_charsToEntities[c]);
      } else
      if (builder != null) {
        builder.append(c);
      }
    }
    if (builder != null) {
      return builder.toString();
    }
    return str;
  }

  public static String stringLiteral(final Object object) {
    if (object == null) {
      return EMPTY_STRING;
    }
    final String str = object.toString();
    final int capacity = str.length();
    StringBuilder builder = null;
    for (int i = 0; i < capacity; i++) {
      final char c = str.charAt(i);
      String literal = ((c < _charsToLiterals.length) ?
        _charsToLiterals[c] :
        null
      );
      if (literal != null) {
        if (builder == null) {
          builder = new StringBuilder(capacity + 16);
          builder.append(str.substring(0, i));
        }
        builder.append(literal);
      } else
      if (builder != null) {
        builder.append(c);
      }
    }
    if (builder != null) {
      return builder.toString();
    }
    return str;
  }

  public static String singleLine(final String string) {
    if (string == null) {
      return EMPTY_STRING;
    }
    return _newLine.matcher(string).replaceAll(" ");
  }

  public static String doubleToSingleQuotes(final String string) {
    if (string == null) {
      return EMPTY_STRING;
    }
    return _doubleQuote.matcher(string).replaceAll("'");
  }

  public static String singleLineAnddoubleToSingleQuotes(final String string) {
    return BaseHtmlStringUtil.doubleToSingleQuotes(BaseHtmlStringUtil.singleLine(string));
  }

  private static class DeprecatedSymbolsInterval {
    private final int start;
    private final int end;

    private DeprecatedSymbolsInterval(int start, int end) {
      this.start = start;
      this.end = end;
    }
  }

  static {
    _charsToEntities = new String[65536];
    _deprecatedIntervals = new BaseHtmlStringUtil.DeprecatedSymbolsInterval[]{new BaseHtmlStringUtil.DeprecatedSymbolsInterval(0, 8), new BaseHtmlStringUtil.DeprecatedSymbolsInterval(11, 12), new BaseHtmlStringUtil.DeprecatedSymbolsInterval(14, 31), new BaseHtmlStringUtil.DeprecatedSymbolsInterval(127, 132), new BaseHtmlStringUtil.DeprecatedSymbolsInterval(134, 159), new BaseHtmlStringUtil.DeprecatedSymbolsInterval(55296, 57343), new BaseHtmlStringUtil.DeprecatedSymbolsInterval(64976, 64991), new BaseHtmlStringUtil.DeprecatedSymbolsInterval(65534, 65535)};
    for (BaseHtmlStringUtil.DeprecatedSymbolsInterval deprecatedInterval : _deprecatedIntervals) {
      for (int i = deprecatedInterval.start; i <= deprecatedInterval.end; i++) {
        _charsToEntities[i] = BAD_SYMBOL_CHAR;
      }
    }
    _charsToEntities['<'] = "&lt;";
    _charsToEntities['>'] = "&gt;";
    _charsToEntities['&'] = "&amp;";
    _charsToEntities['\"'] = "&quot;";
    _charsToEntities['\''] = "&#39;";
    _charsToLiterals = new String[128];
    _charsToLiterals[0] = " ";
    _charsToLiterals['\\'] = "\\\\";
    _charsToLiterals['\"'] = "\\\"";
    _charsToLiterals['\''] = "\\'";
    _charsToLiterals['\n'] = "\\n";
    _charsToLiterals['\r'] = "\\r";
    _charsToLiterals['\t'] = "\\t";
    _literalChars = "\\\"'\n\r\t\u0000";
  }
}
