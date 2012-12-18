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
public final class Quadruplet<E, F, G, H> {

  private final E w;
  private final F x;
  private final G y;
  private final H z;

  public Quadruplet(E w, F x, G y, H z) {
    this.w = w;
    this.x = x;
    this.y = y;
    this.z = z;
  }

  public E first() {
    return w;
  }

  public F second() {
    return x;
  }

  public G third() {
    return y;
  }

  public H fourth() {
    return z;
  }

  public Object get(int idx) {
    switch (idx) {
      case 0:
        return w;
      case 1:
        return x;
      case 2:
        return y;
      case 3:
        return z;
      default:
        throw new ArrayIndexOutOfBoundsException();
    }
  }

  public Object[] toArray() {
    return new Object[]{w, x, y, z};
  }

  @Override
  public String toString() {
    return "[" + String.valueOf(w) + ", " + String.valueOf(x) + ", " + String.valueOf(y) + ", " + String.valueOf(z) + "]";
  }

  @Override
  public int hashCode() {
    int h = 17;
    h = h * 37 + (w != null ? w.hashCode() : 19);
    h = h * 37 + (x != null ? x.hashCode() : 23);
    h = h * 37 + (y != null ? y.hashCode() : 29);
    h = h * 37 + (z != null ? z.hashCode() : 31);
    return h;
  }

  @Override
  public boolean equals(Object obj) {
    if (obj == this) {
      return true;
    }
    if (!(obj instanceof Quadruplet)) {
      return false;
    }
    Quadruplet<?, ?, ?, ?> that = (Quadruplet<?, ?, ?, ?>) obj;
    return eq(this.w, that.w) && eq(this.x, that.x) && eq(this.y, that.y) && eq(this.z, that.z);
  }

  private boolean eq(Object a, Object b) {
    return (a == b) || ((a != null) ? a.equals(b) : false);
  }

}
