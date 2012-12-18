package codeOrchestra.utils.collections;

import java.util.ArrayList;

/**
 * @author Alexander Eliseyev
 */
public class UniqueList<T> extends ArrayList<T> {

  @Override
  public boolean add(T t) {
    if (!contains(t)) {
      return super.add(t);
    }
    return false;
  }

  @Override
  public void add(int i, T t) {
    if (!contains(t)) {
      super.add(i, t);
    }
  }
}
