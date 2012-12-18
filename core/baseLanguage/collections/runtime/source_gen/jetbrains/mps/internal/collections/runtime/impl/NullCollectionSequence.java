package jetbrains.mps.internal.collections.runtime.impl;

/*Generated by MPS */

import jetbrains.mps.internal.collections.runtime.ICollectionSequence;
import java.util.Collection;
import jetbrains.mps.internal.collections.runtime.ISequence;
import jetbrains.mps.baseLanguage.closures.runtime._FunctionTypes;

public abstract class NullCollectionSequence<T> extends NullSequence<T> implements ICollectionSequence<T>, Collection<T> {
  protected static Object[] EMPTY_ARRAY = new Object[0];

  protected NullCollectionSequence() {
  }

  public T addElement(T t) {
    return null;
  }

  public ICollectionSequence<T> addSequence(ISequence<? extends T> seq) {
    return this;
  }

  public T removeElement(T t) {
    return null;
  }

  public ICollectionSequence<T> removeSequence(ISequence<? extends T> seq) {
    return this;
  }

  public ICollectionSequence<T> removeWhere(_FunctionTypes._return_P1_E0<? extends Boolean, ? super T> filter) {
    return this;
  }

  public boolean add(T o) {
    return false;
  }

  public boolean addAll(Collection<? extends T> c) {
    return false;
  }

  public void clear() {
  }

  public boolean contains(Object o) {
    return false;
  }

  public boolean containsAll(Collection<?> c) {
    return false;
  }

  public boolean remove(Object o) {
    return false;
  }

  public boolean removeAll(Collection<?> c) {
    return false;
  }

  public boolean retainAll(Collection<?> c) {
    return false;
  }

  public ICollectionSequence<T> asUnmodifiable() {
    return this;
  }

  public ICollectionSequence<T> asSynchronized() {
    return this;
  }

  public int size() {
    return 0;
  }

  public Object[] toArray() {
    return EMPTY_ARRAY;
  }

  @SuppressWarnings(value = "unchecked")
  public <U> U[] toArray(U[] a) {
    return (U[]) EMPTY_ARRAY;
  }
}
