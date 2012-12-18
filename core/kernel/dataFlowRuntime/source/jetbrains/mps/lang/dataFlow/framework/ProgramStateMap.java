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
package jetbrains.mps.lang.dataFlow.framework;

import java.util.AbstractMap;
import java.util.Set;
import java.util.HashSet;

public class ProgramStateMap<V> extends AbstractMap<ProgramState, V> {

  private Program myProgram;
  private Object[] myValues;

  public ProgramStateMap(Program program) {
    myProgram = program;
    myValues = new Object[myProgram.getInstructions().size() * 2];
  }

  public void fillWith() {

  }

  @Override
  public V get(Object key) {
    if (!(key instanceof ProgramState)) {
      throw new IllegalArgumentException();
    }

    ProgramState ps = (ProgramState) key;
    return (V) myValues[ps.getIndex()];
  }

  @Override
  public V put(ProgramState key, V value) {
    int index = key.getIndex();
    V oldValue = (V) myValues[index];
    myValues[index] = value;
    return oldValue;
  }


  @Override
  public int size() {
    return myValues.length;
  }

  public Set<Entry<ProgramState, V>> entrySet() {
    Set<Entry<ProgramState, V>> result = new HashSet<Entry<ProgramState, V>>();
    for (int i = 0; i < myValues.length; i++) {
      result.add(new MyEntry(i));
    }
    return result;
  }

  private class MyEntry implements Entry<ProgramState, V> {
    private int myIndex;

    private MyEntry(int index) {
      myIndex = index;
    }

    public ProgramState getKey() {
      return myProgram.getState(myIndex);
    }

    public V getValue() {
      return (V) myValues[myIndex];
    }

    public V setValue(V value) {
      Object oldValue = myValues[myIndex];
      myValues[myIndex] = value;
      return (V) oldValue;
    }
  }
}
