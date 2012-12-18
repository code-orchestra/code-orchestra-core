package tests;

/*Generated by MPS */

import junit.framework.TestCase;
import java.util.regex.Pattern;
import junit.framework.Assert;

public class PerlReplace_Test extends TestCase {
  private static Pattern REPLREGEXP_a1a0a = Pattern.compile("(\\w)\\1*(?:\\s*)", 0);
  private static Pattern REPLREGEXP_a2a0a = Pattern.compile("(\\w)\\1*(?:\\s*)", 0);
  private static Pattern REPLREGEXP_a0a1a = Pattern.compile("\\s*(\\w+)\\s+(\\w+)", 0);
  private static Pattern REPLREGEXP_a1a1a = Pattern.compile("(\\w)", 0);
  private static Pattern REPLREGEXP_a0a2a = Pattern.compile("a", 0);
  private static Pattern REPLREGEXP_a1a2a = Pattern.compile("a", 2);
  private static Pattern REPLREGEXP_a0a3a = Pattern.compile(".+", 0);
  private static Pattern REPLREGEXP_a1a3a = Pattern.compile(".+", 32);
  private static Pattern REPLREGEXP_a0a4a = Pattern.compile("^(\\w+):", 8);
  private static Pattern REPLREGEXP_a1a4a = Pattern.compile("^(\\w+):", 0);
  private static Pattern REPLREGEXP_a0a5a = Pattern.compile("\\w", 0);
  private static Pattern REPLREGEXP_a1a5a = Pattern.compile("\\w", 0);
  private static Pattern REPLREGEXP_a2a5a = Pattern.compile("\\w", 0);
  private static Pattern REPLREGEXP_a3a5a = Pattern.compile("\\w", 0);
  private static Pattern REPLREGEXP_a4a5a = Pattern.compile("\\w", 0);
  private static Pattern REPLREGEXP_a5a5a = Pattern.compile("\\w", 0);
  private static Pattern REPLREGEXP_a6a5a = Pattern.compile("\\w", 0);
  private static Pattern REPLREGEXP_a7a5a = Pattern.compile("\\w", 0);
  private static Pattern REPLREGEXP_a8a5a = Pattern.compile("\\w", 0);
  private static Pattern REPLREGEXP_a9a5a = Pattern.compile("\\w", 0);
  private static Pattern REPLREGEXP_a01a5a = Pattern.compile("\\w", 0);
  private static Pattern REPLREGEXP_a11a5a = Pattern.compile("\\w", 0);
  private static Pattern REPLREGEXP_a21a5a = Pattern.compile("\\w", 0);

  public void test_simple() throws Exception {
    String input = "aaabbccddeeffffffff";
    Assert.assertEquals("a!b!c!d!e!f!", REPLREGEXP_a1a0a.matcher(input).replaceAll("$1!"));
    Assert.assertEquals("a!bbccddeeffffffff", REPLREGEXP_a2a0a.matcher(input).replaceFirst("$1!"));
  }

  public void test_swap() throws Exception {
    Assert.assertEquals("word2 first", REPLREGEXP_a0a1a.matcher("   first   word2").replaceFirst("$2 $1"));
    REPLREGEXP_a1a1a.matcher("").replaceFirst("[$1]");
  }

  public void test_oneLetter() throws Exception {
    Assert.assertEquals("A", REPLREGEXP_a0a2a.matcher("A").replaceFirst("AA"));
    Assert.assertEquals("AA", REPLREGEXP_a1a2a.matcher("A").replaceFirst("AA"));
  }

  public void test_dotAllMode() throws Exception {
    Assert.assertEquals("!\n!\n!", REPLREGEXP_a0a3a.matcher("aaaaa\nddddd\nwwwww").replaceAll("!"));
    Assert.assertEquals("!", REPLREGEXP_a1a3a.matcher("aaaaa\nddddd\nwwwww").replaceAll("!"));
  }

  public void test_multiLine() throws Exception {
    Assert.assertEquals("sada\n[asdad]\nasda\n[asada]", REPLREGEXP_a0a4a.matcher("sada\nasdad:\nasda\nasada:").replaceAll("[$1]"));
    Assert.assertEquals("sada\nasdad:\nasda\nasada:", REPLREGEXP_a1a4a.matcher("sada\nasdad:\nasda\nasada:").replaceAll("[$1]"));
  }

  public void test_checkLiterals() throws Exception {
    Assert.assertEquals("\\", REPLREGEXP_a0a5a.matcher("a").replaceFirst("\\\\"));
    Assert.assertEquals("[]", REPLREGEXP_a1a5a.matcher("a").replaceFirst("[]"));
    Assert.assertEquals("$", REPLREGEXP_a2a5a.matcher("a").replaceFirst("\\$"));
    Assert.assertEquals("\"", REPLREGEXP_a3a5a.matcher("a").replaceFirst("\""));
    Assert.assertEquals("\"", REPLREGEXP_a4a5a.matcher("a").replaceFirst("\""));
    Assert.assertEquals("()", REPLREGEXP_a5a5a.matcher("a").replaceFirst("()"));
    Assert.assertEquals("{}", REPLREGEXP_a6a5a.matcher("a").replaceFirst("{}"));
    Assert.assertEquals("\n", REPLREGEXP_a7a5a.matcher("a").replaceFirst("\n"));
    Assert.assertEquals("^", REPLREGEXP_a8a5a.matcher("a").replaceFirst("^"));
    Assert.assertEquals("'", REPLREGEXP_a9a5a.matcher("a").replaceFirst("'"));
    Assert.assertEquals("'", REPLREGEXP_a01a5a.matcher("a").replaceFirst("\'"));
    Assert.assertEquals("\u2606", REPLREGEXP_a11a5a.matcher("a").replaceFirst("\u2606"));
    Assert.assertEquals("\r", REPLREGEXP_a21a5a.matcher("a").replaceFirst("\r"));
  }
}
