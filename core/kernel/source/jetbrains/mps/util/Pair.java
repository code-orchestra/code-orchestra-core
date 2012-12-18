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

import org.apache.commons.lang.ObjectUtils;

@SuppressWarnings({"InstanceVariableNamingConvention"})
public class Pair<T1, T2> {
  @SuppressWarnings({"ClassEscapesDefinedScope"})
  public T1 o1;
  @SuppressWarnings({"ClassEscapesDefinedScope"})
  public T2 o2;

  public Pair(T1 o1, T2 o2) {
    this.o1 = o1;
    this.o2 = o2;
  }

  public int hashCode() {
    int result = 0;
    if (o1 != null) result += o1.hashCode();
    if (o2 != null) result += o2.hashCode() * 37;
    return result;
  }

  public boolean equals(Object obj) {
    if (this == obj) return true;
    if (!(obj instanceof Pair)) return false;
    Pair pair = (Pair) obj;
    return ObjectUtils.equals(pair.o1, o1) && ObjectUtils.equals(pair.o2, o2);
  }


  public String toString() {
    return "(" + o1 + ", " + o2 + ")";
  }
}
