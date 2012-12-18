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


/**
 * @author fyodor
 */
public final class Triplet<E, F, G> {

  private final E x;
  private final F y;
  private final G z;

  public Triplet(E x, F y, G z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  public E first() {
    return x;
  }

  public F second() {
    return y;
  }

  public G third() {
    return z;
  }

  public Object get(int idx) {
    switch (idx) {
      case 0:
        return x;
      case 1:
        return y;
      case 2:
        return z;
      default:
        throw new ArrayIndexOutOfBoundsException();
    }
  }

  public Object[] toArray() {
    return new Object[]{x, y, z};
  }

  @Override
  public String toString() {
    return "[" + String.valueOf(x) + ", " + String.valueOf(y) + ", " + String.valueOf(z) + "]";
  }

  @Override
  public int hashCode() {
    int h = 17;
    h = h * 37 + (x != null ? x.hashCode() : 19);
    h = h * 37 + (y != null ? y.hashCode() : 23);
    h = h * 37 + (z != null ? z.hashCode() : 29);
    return h;
  }

  @Override
  public boolean equals(Object obj) {
    if (obj == this) {
      return true;
    }
    if (!(obj instanceof Triplet)) {
      return false;
    }
    Triplet<?, ?, ?> that = (Triplet<?, ?, ?>) obj;
    return eq(this.x, that.x) && eq(this.y, that.y) && eq(this.z, that.z);
  }

  private boolean eq(Object a, Object b) {
    return (a == b) || ((a != null) ? a.equals(b) : false);
  }

}
