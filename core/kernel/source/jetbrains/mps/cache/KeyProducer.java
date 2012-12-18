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
package jetbrains.mps.cache;

/**
 * Igor Alshannikov
 * Aug 28, 2007
 */
public class KeyProducer {
  public KeyProducer() {
  }

  public Object createKey(Object innerKey) {
    return new Key(hashCode(), innerKey);
  }

  private static class Key {
    private int myProducerHashCode;
    private Object myInnerKey;

    private Key(int producerHashCode, Object innerKey) {
      myProducerHashCode = producerHashCode;
      myInnerKey = innerKey;
    }

    public boolean equals(Object o) {
      if (this == o) return true;
      if (false == o instanceof Key) return false;
      Key key = (Key) o;
      return myProducerHashCode == key.myProducerHashCode &&
        myInnerKey.equals(key.myInnerKey);
    }

    public int hashCode() {
      return 31 * myProducerHashCode + myInnerKey.hashCode();
    }

    public String toString() {
      return myProducerHashCode + "/" + myInnerKey.toString();
    }
  }
}
