package jetbrains.mps.baseLanguage.tuples.test;

/*Generated by MPS */

import junit.framework.TestCase;
import junit.framework.Assert;

public class ExtendedNamedTuples_Test extends TestCase {
  public void test_subtyping() throws Exception {
    ExtendedNamedTuples.Foo foo = new ExtendedNamedTuples.Foo(123, "abc");
    Assert.assertEquals(new ExtendedNamedTuples.Foo(123, "abc"), foo);
    ExtendedNamedTuples.Bar bar = new ExtendedNamedTuples.Bar(321, "CBA", "XYZ", 42);
    foo = bar;
    Assert.assertEquals(new ExtendedNamedTuples.Foo(321, "CBA"), foo);
  }
}
