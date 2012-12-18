/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.util;

import java.util.*;

/**
 * @author Kostik
 */
public class CollectionUtil {

  public static <T> Iterable<T> asIterable(final Iterator<T> i) {
    return new Iterable<T>() {
      public Iterator<T> iterator() {
        return i;
      }
    };
  }

  public static <T> Iterable<T> asIterable(final Enumeration<T> e) {
    return new Iterable<T>() {
      public Iterator<T> iterator() {
        return new Iterator<T>() {
          public boolean hasNext() {
            return e.hasMoreElements();
          }

          public T next() {
            return e.nextElement();
          }

          public void remove() {
            throw new RuntimeException();
          }
        };
      }
    };
  }

  @Deprecated
  //use Iterable & ConditionalIterable instead
  public static <T, F extends T> List<F> filter(Class<F> cls, List<T> l) {
    List<F> result = new ArrayList<F>();
    for (T t : l) {
      if (cls.isInstance(t)) result.add((F) t);
    }
    return result;
  }

  @Deprecated
  //use Iterable & ConditionalIterable instead
  public static <T, F extends T> Set<F> filter(Class<F> cls, Set<T> s) {
    Set<F> result = new HashSet<F>();
    for (T t : s) {
      if (cls.isInstance(t)) result.add((F) t);
    }
    return result;
  }

  @Deprecated
  //use Iterable & ConditionalIterable instead
  public static <T> List<T> filter(List<? extends T> ts, Condition<T> f) {
    List<T> result = new ArrayList<T>();
    for (T t : ts) {
      if (f.met(t)) {
        result.add(t);
      }
    }
    return result;
  }

  @Deprecated
  //use Iterable & ConditionalIterable instead
  public static <T> Set<T> filter(Set<T> ts, Condition<T> f) {
    Set<T> result = new HashSet<T>();
    for (T t : ts) {
      if (f.met(t)) {
        result.add(t);
      }
    }
    return result;
  }

  public static <T> Set<T> union(Set<T>... sets) {
    Set<T> result = new LinkedHashSet<T>();
    for (Set<T> s : sets) {
      result.addAll(s);
    }
    return result;
  }

  public static <T> List<T> union(List<T>... sets) {
    List<T> result = new ArrayList<T>();
    for (List<T> s : sets) {
      result.addAll(s);
    }
    return result;
  }

  public static <T> Set<T> set(T... ts) {
    Set<T> result = new HashSet<T>();
    result.addAll(Arrays.asList(ts));
    return result;
  }

  @Deprecated //was used by constructors language
  public static <T> List<T> list(T... ts) {
    return Arrays.asList(ts);
  }

  public static <T> Iterator<T> concat(final Iterator<? extends T> it1, final Iterator<? extends T> it2) {
    return new Iterator<T>() {
      public boolean myFirstActive = true;

      public boolean hasNext() {
        if (myFirstActive) {
          if (it1.hasNext()) {
            return true;
          } else {
            myFirstActive = false;
            return it2.hasNext();
          }
        } else {
          return it2.hasNext();
        }
      }

      public T next() {
        if (myFirstActive) {
          if (it1.hasNext()) {
            return it1.next();
          } else {
            myFirstActive = false;
            return it2.next();
          }
        } else {
          return it2.next();
        }
      }

      public void remove() {
        throw new UnsupportedOperationException();
      }
    };
  }

  public static <T> void addMissing(Collection<T> fromCollection, Collection<T> toCollection) {
    for (T t : fromCollection) {
      if (!toCollection.contains(t)) {
        toCollection.add(t);
      }
    }
  }

  public static <T> List<T> subtract(Collection<T> fromCollection, Collection<T> collection) {
    ArrayList<T> result = new ArrayList<T>();
    for (T t : fromCollection) {
      if (!collection.contains(t)) {
        result.add(t);
      }
    }
    return result;
  }

  public static <T> List<T> intersect(Collection<T> collection1, Collection<T> collection2) {
    ArrayList<T> result = new ArrayList<T>();
    for (T t : collection1) {
      if (collection2.contains(t)) {
        result.add(t);
      }
    }
    return result;
  }

  public static <T> boolean intersects(Collection<T> collection1, Collection<T> collection2) {
    for (T t : collection1) {
      if (collection2.contains(t)) {
        return true;
      }
    }
    return false;
  }

  public static <T> void checkForNulls(Iterable<T> resultList) {
    checkForNulls(resultList, "");
  }

  public static <T> void checkForNulls(Iterable<T> resultList, String message) {
    for (T node : resultList) {
      if (node == null) {
        throw new RuntimeException("nulls are not allowed here. " + message);
      }
    }
  }

  public static <T> Iterable<T> withoutNulls(final Iterable<T> resultList) {
    return new Iterable<T>() {
      @Override
      public Iterator<T> iterator() {
        return new SkipNullIterator<T>(resultList.iterator());
      }
    };
  }

  private static class SkipNullIterator<Item> implements Iterator<Item> {
    private Iterator<Item> mySourceIterator;
    private Item myLookup = null;

    public SkipNullIterator(Iterator<Item> iter) {
      mySourceIterator = iter;
    }

    @Override
    public boolean hasNext() {
      if (myLookup != null) return true;
      while (mySourceIterator.hasNext()) {
        myLookup = mySourceIterator.next();
        if (myLookup != null) {
          return true;
        }
      }
      return false;
    }

    @Override
    public Item next() {
      while (myLookup == null) {
        myLookup = mySourceIterator.next();
      }
      Item result = myLookup;
      myLookup = null;
      return result;
    }

    @Override
    public void remove() {
      throw new UnsupportedOperationException();
    }
  }

  public static void main(String[] args) {
    Iterable<String> it1 = CollectionUtil.list("5", "6", "7", "8");
    Iterable<String> it2 = CollectionUtil.list("5", null, "6", null, "7", "8");
    Iterable<String> it3 = CollectionUtil.list("5", null, "6", "7", "8", null, null);
    Iterable<String> it4 = CollectionUtil.list(new String[]{null});
    Iterable<String> it5 = CollectionUtil.list(null, null);
    Iterable<String> it6 = CollectionUtil.list(null, null, null);
    Iterable<String> it7 = CollectionUtil.list();

    printWithoutNulls(it1);
    printWithoutNulls(it2);
    printWithoutNulls(it3);
    printWithoutNulls(it4);
    printWithoutNulls(it5);
    printWithoutNulls(it6);
    printWithoutNulls(it7);
  }

  private static void printWithoutNulls(Iterable it) {
    System.err.println();
    System.err.print("it = (");
    Iterable iterable = withoutNulls(it);
    for (Object elem : iterable) {
      System.err.print(elem);
      System.err.print(",");
    }
    System.err.println(")");
  }
}
