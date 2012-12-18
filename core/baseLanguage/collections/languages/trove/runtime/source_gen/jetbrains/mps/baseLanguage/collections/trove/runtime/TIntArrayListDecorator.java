package jetbrains.mps.baseLanguage.collections.trove.runtime;

/*Generated by MPS */

import java.util.AbstractList;
import java.util.List;
import java.io.Serializable;
import gnu.trove.TIntArrayList;
import java.util.ListIterator;
import java.util.Iterator;
import java.util.Collection;
import java.util.NoSuchElementException;

public class TIntArrayListDecorator extends AbstractList<Integer> implements List<Integer>, Serializable {
  private static final long serialVersionUID = -2501998260531327522L;

  private TIntArrayList primList;

  public TIntArrayListDecorator() {
  }

  public TIntArrayListDecorator(TIntArrayList prim) {
    this.primList = prim;
  }

  @Override
  protected void removeRange(int fromIdx, int toIdx) {
    this.primList.remove(fromIdx, toIdx - fromIdx);
  }

  @Override
  public int hashCode() {
    return super.hashCode();
  }

  @Override
  public boolean equals(Object that) {
    if (that instanceof TIntArrayListDecorator && this.primList == ((TIntArrayListDecorator) that).primList) {
      return true;
    }
    return super.equals(that);
  }

  @Override
  public List<Integer> subList(int fromIdx, int toIdx) {
    return new TIntArrayListDecorator(this.primList.subList(fromIdx, toIdx));
  }

  @Override
  public ListIterator<Integer> listIterator() {
    return new TIntArrayListDecorator.TIntegerListIterator(0);
  }

  @Override
  public void clear() {
    this.primList.clear();
  }

  @Override
  public int lastIndexOf(Object e) {
    return this.primList.lastIndexOf(this.unwrap(e));
  }

  @Override
  public int indexOf(Object e) {
    return this.primList.indexOf(this.unwrap(e));
  }

  @Override
  public boolean add(Integer e) {
    this.primList.add(this.unwrap(e));
    return true;
  }

  @Override
  public Iterator<Integer> iterator() {
    return this.listIterator();
  }

  @Override
  public boolean addAll(int idx, Collection<? extends Integer> that) {
    return super.addAll(idx, that);
  }

  @Override
  public Integer remove(int e) {
    return this.primList.remove(e);
  }

  @Override
  public void add(int index, Integer e) {
    this.primList.insert(index, this.unwrap(e));
  }

  @Override
  public Integer set(int p0, Integer p1) {
    return super.set(p0, p1);
  }

  @Override
  public Integer get(int index) {
    return this.wrap(this.primList.get(index));
  }

  @Override
  public String toString() {
    return this.primList.toString();
  }

  @Override
  public boolean retainAll(Collection<?> that) {
    return super.retainAll(that);
  }

  @Override
  public boolean removeAll(Collection<?> that) {
    return super.removeAll(that);
  }

  @Override
  public boolean addAll(Collection<? extends Integer> that) {
    return super.addAll(that);
  }

  @Override
  public boolean containsAll(Collection<?> that) {
    return super.containsAll(that);
  }

  @Override
  public boolean remove(Object e) {
    return (e instanceof Integer ?
      this.removePrim(this.unwrap(e)) :
      false
    );
  }

  @Override
  public <T extends Object> T[] toArray(T[] array) {
    return super.toArray(array);
  }

  @Override
  public Object[] toArray() {
    return super.toArray();
  }

  @Override
  public boolean contains(Object e) {
    return (e instanceof Integer ?
      this.primList.contains(this.unwrap(e)) :
      false
    );
  }

  @Override
  public boolean isEmpty() {
    return this.primList.isEmpty();
  }

  public int size() {
    return this.primList.size();
  }

  public ListIterator<Integer> listIterator(int index) {
    return new TIntArrayListDecorator.TIntegerListIterator(index);
  }

  protected boolean removePrim(int primValue) {
    int idx = this.primList.indexOf(primValue);
    if (idx >= 0) {
      this.primList.remove(idx);
      return true;
    }
    return false;
  }

  protected Integer wrap(int primValue) {
    return Integer.valueOf(primValue);
  }

  protected int unwrap(Object value) {
    return ((Integer) value).intValue();
  }

  public class TIntegerListIterator implements ListIterator<Integer> {
    private int nextIdx;

    public TIntegerListIterator(int startAt) {
      this.nextIdx = startAt;
    }

    public void add(Integer e) {
      throw new UnsupportedOperationException();
    }

    public void set(Integer e) {
      throw new UnsupportedOperationException();
    }

    public void remove() {
      TIntArrayListDecorator.this.primList.remove(this.nextIdx);
    }

    public int previousIndex() {
      return this.nextIdx - 1;
    }

    public int nextIndex() {
      return this.nextIdx;
    }

    public Integer previous() {
      if (this.nextIdx > 0 && this.nextIdx <= TIntArrayListDecorator.this.primList.size()) {
        return TIntArrayListDecorator.this.wrap(TIntArrayListDecorator.this.primList.get(--this.nextIdx));
      }
      throw new NoSuchElementException();
    }

    public boolean hasPrevious() {
      return this.nextIdx > 0 && this.nextIdx <= TIntArrayListDecorator.this.primList.size();
    }

    public Integer next() {
      if (this.nextIdx >= 0 && this.nextIdx < TIntArrayListDecorator.this.primList.size()) {
        return TIntArrayListDecorator.this.wrap(TIntArrayListDecorator.this.primList.get(this.nextIdx++));
      }
      throw new NoSuchElementException();
    }

    public boolean hasNext() {
      return this.nextIdx >= 0 && this.nextIdx < TIntArrayListDecorator.this.primList.size();
    }
  }
}
