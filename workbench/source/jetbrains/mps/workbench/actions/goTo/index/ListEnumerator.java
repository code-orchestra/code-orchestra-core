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
package jetbrains.mps.workbench.actions.goTo.index;

import com.intellij.util.io.KeyDescriptor;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ListEnumerator<T> implements KeyDescriptor<List<T>> {

  private KeyDescriptor<T> myElementKeyDescriptor;

  public ListEnumerator(KeyDescriptor<T> elementKeyDescriptor) {
    myElementKeyDescriptor = elementKeyDescriptor;
  }

  @Override
  public int getHashCode(List<T> value) {
    return value.hashCode();
  }

  @Override
  public boolean isEqual(List<T> val1, List<T> val2) {
    return val1.equals(val2);
  }

  @Override
  public void save(DataOutput out, List<T> value) throws IOException {
    out.writeInt(value.size());
    for (T item : value) {
      myElementKeyDescriptor.save(out, item);
    }
  }

  @Override
  public List<T> read(DataInput in) throws IOException {
    int size = in.readInt();
    List<T> result = new ArrayList<T>();
    for (int i = 0; i < size; i++) {
      result.add(myElementKeyDescriptor.read(in));
    }
    return result;
  }
}
