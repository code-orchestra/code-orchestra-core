package jetbrains.mps.make.unittest;

/*Generated by MPS */

import java.util.Set;
import jetbrains.mps.internal.collections.runtime.SetSequence;
import java.util.HashSet;
import java.util.Map;
import java.util.List;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import java.util.HashMap;
import jetbrains.mps.baseLanguage.closures.runtime._FunctionTypes;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.internal.make.runtime.util.GraphAnalyzer;

public class Graph<V> {
  private Set<V> vertices = SetSequence.fromSet(new HashSet<V>());
  private Map<V, List<V>> fwEdges = MapSequence.fromMap(new HashMap<V, List<V>>());
  private Map<V, List<V>> bkEdges = MapSequence.fromMap(new HashMap<V, List<V>>());
  private _FunctionTypes._return_P1_E0<? extends Comparable<?>, ? super V> sorter;
  private boolean asc;

  public Graph() {
  }

  public void addEdges(V from, V... to) {
    List<V> fw = MapSequence.fromMap(fwEdges).get(from);
    if (fw == null) {
      fw = ListSequence.fromList(new ArrayList<V>());
      MapSequence.fromMap(fwEdges).put(from, fw);
    }
    SetSequence.fromSet(vertices).addElement(from);
    for (V next : to) {
      ListSequence.fromList(fw).addElement(next);
      List<V> bk = MapSequence.fromMap(bkEdges).get(next);
      if (bk == null) {
        bk = ListSequence.fromList(new ArrayList<V>());
        MapSequence.fromMap(bkEdges).put(next, bk);
      }
      ListSequence.fromList(bk).addElement(from);
      SetSequence.fromSet(vertices).addElement(next);
    }
  }

  public void sort(_FunctionTypes._return_P1_E0<? extends Comparable<?>, ? super V> sorter, boolean asc) {
    this.sorter = sorter;
    this.asc = asc;
  }

  public Iterable<V> getVertices() {
    return (sorter != null ?
      SetSequence.fromSet(vertices).sort(sorter, asc) :
      vertices
    );
  }

  public GraphAnalyzer<V> getCycleDetector() {
    return new GraphAnalyzer<V>() {
      @Override
      public Iterable<V> forwardEdges(V v) {
        return MapSequence.fromMap(fwEdges).get(v);
      }

      @Override
      public Iterable<V> vertices() {
        return getVertices();
      }

      @Override
      public Iterable<V> backwardEdges(V v) {
        return MapSequence.fromMap(bkEdges).get(v);
      }
    };
  }
}
