package jetbrains.mps.internalCollections.test.closures;

/*Generated by MPS */

import jetbrains.mps.internal.collections.runtime.ISequence;
import jetbrains.mps.internal.collections.runtime.Sequence;
import jetbrains.mps.internal.collections.runtime.ISelector;
import java.util.Arrays;
import jetbrains.mps.baseLanguage.closures.runtime._FunctionTypes;
import java.util.List;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.internal.collections.runtime.ISequenceClosure;
import java.util.Iterator;
import jetbrains.mps.baseLanguage.closures.runtime.YieldingIterator;
import junit.framework.Assert;
import jetbrains.mps.baseLanguage.closures.runtime.Wrappers;
import jetbrains.mps.internal.collections.runtime.IVisitor;

public class SelectTest_Test extends Util_Test {
  public void test_selectMethod() throws Exception {
    ISequence<Integer> seq = Sequence.fromIterable(this.input5());
    ISequence<Integer> test = seq.select(new ISelector<Integer, Integer>() {
      public Integer select(Integer it) {
        return (it % 2 == 1 ?
          it * 2 :
          it * 3
        );
      }
    });
    this.assertIterableEquals(Arrays.asList(2, 6, 6, 12, 10), test.toIterable());
  }

  public void test_selectMethod2() throws Exception {
    int a = Character.valueOf('a').charValue();
    Iterable<Integer> input = Arrays.asList(a, a + 1, a + 2, a + 3, a + 4);
    ISequence<Integer> seq = Sequence.fromIterable(input);
    ISequence<String> test = seq.select(new ISelector<Integer, String>() {
      public String select(Integer it) {
        return Character.valueOf((char) it.intValue()).toString();
      }
    });
    this.assertIterableEquals(Arrays.asList("a", "b", "c", "d", "e"), test.toIterable());
  }

  public void test_selectorVar() throws Exception {
    ISequence<Integer> seq = Sequence.fromIterable(this.input5());
    ISelector<Integer, Integer> selector = new ISelector<Integer, Integer>() {
      public Integer select(Integer it) {
        return (it % 2 == 1 ?
          it * 2 :
          it * 3
        );
      }
    };
    ISequence<Integer> test = seq.select(selector);
    this.assertIterableEquals(Arrays.asList(2, 6, 6, 12, 10), test.toIterable());
  }

  public void test_selectOperation() throws Exception {
    this.assertIterableEquals(this.expectEven10(), Sequence.fromIterable(this.input5()).select(new ISelector<Integer, Integer>() {
      public Integer select(Integer it) {
        return it * 2;
      }
    }));
    _FunctionTypes._return_P1_E0<? extends Integer, ? super Integer> cl = new _FunctionTypes._return_P1_E0<Integer, Integer>() {
      public Integer invoke(Integer it) {
        return it * 2;
      }
    };
    this.assertIterableEquals(this.expectEven10(), Sequence.fromIterable(this.input5()).select(cl));
  }

  public void test_legacySelector() throws Exception {
    Iterable<Integer> test = Sequence.fromIterable(this.input5()).select(new ISelector<Integer, Integer>() {
      public Integer select(Integer it) {
        return it * 2;
      }
    });
    this.assertIterableEquals(this.expectEven10(), test);
  }

  public void test_selectMany() throws Exception {
    final List<Integer> list = ListSequence.fromListAndArray(new ArrayList<Integer>(), 1, 2, 3);
    Iterable<Integer> test = Sequence.fromClosure(new ISequenceClosure<Integer>() {
      public Iterable<Integer> iterable() {
        return new Iterable<Integer>() {
          public Iterator<Integer> iterator() {
            return new YieldingIterator<Integer>() {
              private int __CP__ = 0;

              protected boolean moveToNext() {
__loop__:
                do {
__switch__:
                  switch (this.__CP__) {
                    case -1:
                      assert false : "Internal error";
                      return false;
                    case 2:
                      this.__CP__ = 1;
                      this.yield(0);
                      return true;
                    case 0:
                      this.__CP__ = 2;
                      break;
                    default:
                      break __loop__;
                  }
                } while (true);
                return false;
              }
            };
          }
        };
      }
    });
    Sequence.fromIterable(test).select(new ISelector<Integer, List<Integer>>() {
      public List<Integer> select(Integer it) {
        return list;
      }
    });
    Iterable<List<Integer>> result = Sequence.fromIterable(test).select(new ISelector<Integer, List<Integer>>() {
      public List<Integer> select(Integer it) {
        return list;
      }
    });
    Assert.assertEquals(list, Sequence.fromIterable(result).first());
  }

  public void test_nextWithoutHasNext() throws Exception {
    this.assertIteratorYields(ListSequence.fromList(ListSequence.fromListAndArray(new ArrayList<Integer>(), 1, 2, 3)).select(new ISelector<Integer, Integer>() {
      public Integer select(Integer i) {
        return i * 2;
      }
    }).iterator(), 2, 4, 6);
  }

  public void test_selectAdvancesTooEarly() throws Exception {
    final List<Integer> test = ListSequence.fromListAndArray(new ArrayList<Integer>(), 1, 2, 3, 4, 5, 6, 7, 8, 9);
    final List<Integer> plusten = ListSequence.fromList(new ArrayList<Integer>());
    final Wrappers._int idx = new Wrappers._int(0);
    ListSequence.fromList(test).select(new ISelector<Integer, Integer>() {
      public Integer select(Integer i) {
        return i;
      }
    }).visitAll(new IVisitor<Integer>() {
      public void visit(Integer i) {
        if (++idx.value < ListSequence.fromList(test).count()) {
          ListSequence.fromList(test).setElement(idx.value, ListSequence.fromList(test).getElement(idx.value) - idx.value);
        }
        ListSequence.fromList(plusten).addElement(i + 10);
      }
    });
    Assert.assertEquals(ListSequence.fromListAndArray(new ArrayList<Integer>(), 11, 11, 11, 11, 11, 11, 11, 11, 11), plusten);
  }
}
