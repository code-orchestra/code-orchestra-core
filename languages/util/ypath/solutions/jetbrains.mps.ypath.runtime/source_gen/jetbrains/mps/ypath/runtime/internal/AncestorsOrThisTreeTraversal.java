package jetbrains.mps.ypath.runtime.internal;

/*Generated by MPS */

import jetbrains.mps.ypath.runtime.ITreeTraversal;
import jetbrains.mps.ypath.runtime.IFeatureDescriptor;
import java.util.Iterator;
import java.util.Stack;
import java.util.NoSuchElementException;

public class AncestorsOrThisTreeTraversal<T> extends AbstractChainTreeTraversal<T> implements ITreeTraversal<T> {
  public AncestorsOrThisTreeTraversal(ITreeTraversal<T> source) {
    super(source);
  }

  public AncestorsOrThisTreeTraversal(ITreeTraversal<T> source, IFeatureDescriptor<T> fd) {
    super(source, fd);
  }

  public Iterator<T> iterator() {
    return new AncestorsOrThisTreeTraversal.AncestorsOrThisIterator(getSourceTraversal().iterator());
  }

  private class AncestorsOrThisIterator implements Iterator<T> {
    private Stack<Iterator<T>> ancestorsIteratorsStack = new Stack<Iterator<T>>();
    private T nextNode = null;
    private boolean hasNextNode = false;

    private AncestorsOrThisIterator(Iterator<T> source) {
      ancestorsIteratorsStack.push(source);
      moveToNext();
    }

    private void moveToNext() {
      this.nextNode = null;
      this.hasNextNode = false;
      while (!(ancestorsIteratorsStack.isEmpty())) {
        Iterator<T> it = ancestorsIteratorsStack.pop();
        if (it.hasNext()) {
          ancestorsIteratorsStack.push(it);
          T node = it.next();
          Iterator<T> parentIt = getOppositeContents(node).iterator();
          if (parentIt.hasNext()) {
            ancestorsIteratorsStack.push(parentIt);
          }
          this.nextNode = node;
          this.hasNextNode = true;
          break;
        }
      }
    }

    public boolean hasNext() {
      return hasNextNode;
    }

    public T next() {
      if (!(hasNextNode)) {
        throw new NoSuchElementException();
      }
      T tmp = nextNode;
      moveToNext();
      return tmp;
    }

    public void remove() {
      throw new UnsupportedOperationException();
    }
  }
}
