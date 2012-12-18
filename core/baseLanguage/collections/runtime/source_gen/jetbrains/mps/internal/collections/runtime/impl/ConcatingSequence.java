package jetbrains.mps.internal.collections.runtime.impl;

/*Generated by MPS */

import jetbrains.mps.internal.collections.runtime.Sequence;
import jetbrains.mps.internal.collections.runtime.ISequence;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class ConcatingSequence<U> extends Sequence<U> {
  private final ISequence<U> left;
  private final ISequence<U> right;

  public ConcatingSequence(ISequence<U> left, ISequence<U> right) {
    if (left == null || right == null) {
      throw new NullPointerException();
    }
    this.left = left;
    this.right = right;
  }

  public Iterator<U> iterator() {
    return new ConcatingSequence.ConcatingIterator();
  }

  private class ConcatingIterator implements Iterator<U> {
    private U next;
    private HasNextState hasNext = HasNextState.UNKNOWN;
    private Iterator<U> leftIt;
    private Iterator<U> rightIt;

    private ConcatingIterator() {
    }

    public boolean hasNext() {
      if (leftIt == null || rightIt == null) {
        init();
      }
      if (hasNext.unknown()) {
        moveToNext();
      }
      return hasNext.hasNext();
    }

    public U next() {
      if (leftIt == null || rightIt == null) {
        init();
      }
      if (hasNext.unknown()) {
        moveToNext();
      }
      if (!((hasNext.hasNext()))) {
        throw new NoSuchElementException();
      }
      return this.clearNext();
    }

    public void remove() {
      throw new UnsupportedOperationException();
    }

    private void init() {
      this.leftIt = left.toIterable().iterator();
      this.rightIt = right.toIterable().iterator();
    }

    private void moveToNext() {
      this.next = null;
      this.hasNext = HasNextState.AT_END;
      if (leftIt.hasNext()) {
        setNext(leftIt.next());
      } else
      if (rightIt.hasNext()) {
        setNext(rightIt.next());
      }
    }

    private U clearNext() {
      U tmp = next;
      this.next = null;
      this.hasNext = HasNextState.UNKNOWN;
      return tmp;
    }

    private void setNext(U next) {
      this.next = next;
      this.hasNext = HasNextState.HAS_NEXT;
    }
  }
}
