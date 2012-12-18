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

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicInteger;

public class Interner {

  private final DumbestLRUCache<String> myCache;

  public Interner(int size) {
    myCache = new DumbestLRUCache<String>(size) {
      @Override
      public String canonic(String s) {
        // Ensure we cache only what's necessary!
        return new String(s);
      }
    };
  }

  public String intern(String s) {
    if (s == null) {
      return null;
    }
    return myCache.cacheObject(s);
  }

  @Override
  public String toString() {
    return "Interner["+myCache.toString()+"]";
  }

  public int size () {
    return myCache.size ();
  }

  private static class DumbestLRUCache<K> {

    private static final int DEFAULT_MAX_SIZE = 20000;
    private static final double FIRST_LEVEL_RATIO = 0.6;

    private AtomicInteger roomLeftFirstLevel;
    private AtomicInteger roomLeftSecondLevel;

    private ConcurrentHashMap<K, K> firstLevelCache;
    private ConcurrentLinkedQueue<K> firstLevelQueue = new ConcurrentLinkedQueue<K>();

    private ConcurrentHashMap<K, K> secondLevelCache;
    private ConcurrentLinkedQueue<K> secondLevelQueue = new ConcurrentLinkedQueue<K>();

    private ConcurrentHashMap<K, K> transitionalCache = new ConcurrentHashMap<K, K>();

    private int myMaxSize;

    public DumbestLRUCache (int maxSize) {
      myMaxSize = maxSize;
      roomLeftFirstLevel = new AtomicInteger((int)(myMaxSize*FIRST_LEVEL_RATIO));
      roomLeftSecondLevel = new AtomicInteger((int)(myMaxSize*(1.-FIRST_LEVEL_RATIO)));
      firstLevelCache = new ConcurrentHashMap<K, K>((int)(myMaxSize*FIRST_LEVEL_RATIO));
      secondLevelCache = new ConcurrentHashMap<K, K>((int)(myMaxSize*(1.-FIRST_LEVEL_RATIO)));
    }

    public DumbestLRUCache () {
      this(DEFAULT_MAX_SIZE);
    }

    public int size() {
      return firstLevelCache.size() + secondLevelCache.size();
    }

    protected K canonic(K k) {
      return k;
    }

    @Override
    public String toString() {
      return "LRU["+firstLevelCache.size()+", "+secondLevelCache.size()+"]";
    }

    public K cacheObject (K toCache) {
      K cached = secondLevelCache.get(toCache);
      if (cached != null) {
        return cached;
      }

      cached = firstLevelCache.get(toCache);
      if (cached != null) {
        return primPromote(toCache, cached);
      }

      cached = transitionalCache.get(toCache);
      if (cached != null) {
        return cached;
      }

      return primCacheObject(canonic(toCache), toCache);
    }

    private K primPromote(K toCache, K cached) {
      K transit = transitionalCache.putIfAbsent(cached, cached);
      if (transit != null) {
        return transit;
      }

      // current thread has a mutex on 'cached'
      K alreadyPromoted = secondLevelCache.putIfAbsent(cached, cached);
      if (alreadyPromoted != null) {
        boolean removed = transitionalCache.remove(cached, toCache);
        assert removed;

        return alreadyPromoted;
      }
      secondLevelQueue.add(cached);

      if (firstLevelCache.remove(cached, toCache)) {
        roomLeftFirstLevel.incrementAndGet();
      }

      if (roomLeftSecondLevel.decrementAndGet() <= 0) {
        K toDemote = secondLevelQueue.poll();
        assert toDemote != null;

        primCacheObject(toDemote, toDemote);

        if (transitionalCache.putIfAbsent(toDemote, toDemote) == null) {
          if (secondLevelCache.remove(toDemote, toDemote)) {
            roomLeftSecondLevel.incrementAndGet();
          }
          transitionalCache.remove(toDemote, toDemote);
        }
        else {
          secondLevelQueue.add(toDemote);
        }
      }

      transitionalCache.remove(cached, toCache);
      return cached;
    }

    private K primCacheObject(K canonic, K toCache) {
      if (transitionalCache.putIfAbsent(canonic, canonic) == null) {
        K alreadyCached = firstLevelCache.putIfAbsent(canonic, canonic);

        if (alreadyCached != null) {
          boolean removed = transitionalCache.remove(canonic, toCache);
          assert removed;

          return alreadyCached;
        }

        // current thread has a mutex on 'canonic'
        firstLevelQueue.add(canonic);

        if (roomLeftFirstLevel.decrementAndGet() <= 0) {
          K toRemove = firstLevelQueue.poll();
          assert toRemove != null;

          if (transitionalCache.putIfAbsent(toRemove, toRemove) == null) {
            if (firstLevelCache.remove(toRemove, toRemove)) {
              roomLeftFirstLevel.incrementAndGet();
            }
            transitionalCache.remove(toRemove, toRemove);
          }
          else {
            firstLevelQueue.add(toRemove);
          }
        }

        transitionalCache.remove(canonic, canonic);
      }

      return canonic;
    }

  }
}
