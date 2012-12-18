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
package jetbrains.mps.typesystem.inference.util;

import jetbrains.mps.lang.pattern.ConceptMatchingPattern;
import jetbrains.mps.lang.pattern.GeneratedMatchingPattern;
import jetbrains.mps.lang.pattern.IMatchingPattern;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Pair;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class ConcurrentSubtypingCache extends SubtypingCache {
  private ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<CacheNodeHandler, MyBoolean>> myCache = new ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<CacheNodeHandler, MyBoolean>>();
  private ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<CacheNodeHandler, MyBoolean>> myCacheWeak = new ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<CacheNodeHandler, MyBoolean>>();
  private final Object myCacheLock = new Object();

  private ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<String, SNode>> myCoerceToConceptsCache = new ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<String, SNode>>();
  private ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<String, SNode>> myCoerceToConceptsCacheWeak = new ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<String, SNode>>();
  private final Object myCoerceToConceptsCacheLock = new Object();

  private ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<Class, Pair<SNode, GeneratedMatchingPattern>>> myCoerceToPatternsCache
    = new ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<Class, Pair<SNode, GeneratedMatchingPattern>>>();
  private ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<Class, Pair<SNode, GeneratedMatchingPattern>>> myCoerceToPatternsCacheWeak
    = new ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<Class, Pair<SNode, GeneratedMatchingPattern>>>();
  private final Object myCoerceToPatternsCacheLock = new Object();

  private static final SNode NULL = new SNode(null, "null", false);

  private SNode preprocessPutNode(SNode node) {
    return node == null ? NULL : node;
  }

  private SNode postprocessGetNode(SNode node) {
    return node == NULL ? null : node;
  }

  private MyBoolean preprocessPutBoolean(Boolean b) {
    if (b == null) return MyBoolean.NULL;
    if (b) return MyBoolean.TRUE;
    else return MyBoolean.FALSE;
  }

  private Boolean postprocessGetBoolean(MyBoolean b) {
    if (b == null) return null;
    switch (b) {
      case FALSE:
        return false;
      case TRUE:
        return true;
      default:
        return null;
    }
  }

  public void addCacheEntry(SNode subtype, SNode supertype, boolean answer, boolean isWeak) {
    boolean bothMaps = answer != isWeak;
    ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<CacheNodeHandler, MyBoolean>> cache1 = isWeak ? myCacheWeak : myCache;
    ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<CacheNodeHandler, MyBoolean>> cache2 = isWeak ? myCache : myCacheWeak;

    CacheNodeHandler subtypeHandler = new CacheNodeHandler(subtype);
    ConcurrentHashMap<CacheNodeHandler, MyBoolean> supertypes2 = null;
    CacheNodeHandler subtypeHandler2 = null;
    ConcurrentHashMap<CacheNodeHandler, MyBoolean> supertypes = cache1.get(subtypeHandler);
    if (bothMaps) {
      subtypeHandler2 = new CacheNodeHandler(subtype);
      supertypes2 = cache2.get(subtypeHandler2);
    }
    if (supertypes == null || (bothMaps && supertypes2 == null)) {
      synchronized (myCacheLock) {
        supertypes = cache1.get(subtypeHandler);
        if (supertypes == null) {
          supertypes = new ConcurrentHashMap<CacheNodeHandler, MyBoolean>();
          cache1.put(subtypeHandler, supertypes);
        }
        if (bothMaps) {
          supertypes2 = cache2.get(subtypeHandler2);
          if (supertypes2 == null) {
            supertypes2 = new ConcurrentHashMap<CacheNodeHandler, MyBoolean>();
            cache2.put(subtypeHandler2, supertypes2);
          }
        }
      }
    }

    supertypes.put(new CacheNodeHandler(supertype), preprocessPutBoolean(answer));
  }

  public Boolean getAnswer(SNode subtype, SNode supertype, boolean isWeak) {
    Map<CacheNodeHandler, ConcurrentHashMap<CacheNodeHandler, MyBoolean>> cache = isWeak ? myCacheWeak : myCache;
    Map<CacheNodeHandler, MyBoolean> supertypes = cache.get(new CacheNodeHandler(subtype));
    if (supertypes == null) return null;
    return postprocessGetBoolean(supertypes.get(new CacheNodeHandler(supertype)));
  }

  private Pair<Boolean, SNode> getCoerced(SNode subtype, String conceptFQName, boolean isWeak) {
    Map<CacheNodeHandler, ConcurrentHashMap<String, SNode>> cache = isWeak ? myCoerceToConceptsCacheWeak : myCoerceToConceptsCache;
    Map<String, SNode> map = cache.get(new CacheNodeHandler(subtype));
    if (map != null && map.containsKey(conceptFQName)) {
      SNode result = postprocessGetNode(map.get(conceptFQName));
      if (result != null && result.shouldHaveBeenDisposed()) {
        map.remove(conceptFQName);
        return new Pair<Boolean, SNode>(false, null);
      } else {
        return new Pair<Boolean, SNode>(true, result);
      }
    } else {
      return new Pair<Boolean, SNode>(false, null);
    }
  }

  private Pair<Boolean, SNode> getCoerced(SNode subtype, Class c, GeneratedMatchingPattern pattern, boolean isWeak) {
    Map<CacheNodeHandler, ConcurrentHashMap<Class, Pair<SNode, GeneratedMatchingPattern>>> cache
      = isWeak ? myCoerceToPatternsCacheWeak : myCoerceToPatternsCache;
    Map<Class, Pair<SNode, GeneratedMatchingPattern>> map = cache.get(new CacheNodeHandler(subtype));
    if (map != null && map.containsKey(c)) {
      Pair<SNode, GeneratedMatchingPattern> patternPair = map.get(c);
      SNode resultNode = patternPair.o1;
      if (resultNode != null && resultNode.shouldHaveBeenDisposed()) {
        map.remove(c);
        return new Pair<Boolean, SNode>(false, null);
      } else {
        pattern.fillFieldValuesFrom(patternPair.o2);
        return new Pair<Boolean, SNode>(true, resultNode);
      }
    } else {
      return new Pair<Boolean, SNode>(false, null);
    }
  }

  private void addCacheEntry(SNode subtype, String conceptFQName, SNode result, boolean isWeak) {
    boolean answer = result != null;
    boolean bothMaps = answer != isWeak;
    ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<String, SNode>> cache1 = isWeak ? myCoerceToConceptsCacheWeak : myCoerceToConceptsCache;
    ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<String, SNode>> cache2 = isWeak ? myCoerceToConceptsCache : myCoerceToConceptsCacheWeak;

    CacheNodeHandler subtypeHandler = new CacheNodeHandler(subtype);
    ConcurrentHashMap<String, SNode> map2 = null;
    CacheNodeHandler subtypeHandler2 = null;
    ConcurrentHashMap<String, SNode> map = cache1.get(subtypeHandler);

    if (bothMaps) {
      subtypeHandler2 = new CacheNodeHandler(subtype);
      map2 = cache2.get(subtypeHandler2);
    }

    if (map == null || (bothMaps && map2 == null)) {
      synchronized (myCoerceToConceptsCacheLock) {
        map = cache1.get(subtypeHandler);
        if (map == null) {
          map = new ConcurrentHashMap<String, SNode>();
          cache1.put(subtypeHandler, map);
        }
        if (bothMaps) {
          map2 = cache2.get(subtypeHandler2);
          if (map2 == null) {
            map2 = new ConcurrentHashMap<String, SNode>();
            cache2.put(subtypeHandler2, map2);
          }
        }
      }
    }

    map.put(conceptFQName, preprocessPutNode(result));
  }

  private void addCacheEntry(SNode subtype, Class c, SNode result, GeneratedMatchingPattern pattern, boolean isWeak) {
    boolean answer = result != null;
    boolean bothMaps = answer != isWeak && result == null;
    ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<Class, Pair<SNode, GeneratedMatchingPattern>>> cache1 = isWeak ? myCoerceToPatternsCacheWeak : myCoerceToPatternsCache;
    ConcurrentHashMap<CacheNodeHandler, ConcurrentHashMap<Class, Pair<SNode, GeneratedMatchingPattern>>> cache2 = isWeak ? myCoerceToPatternsCache : myCoerceToPatternsCacheWeak;

    CacheNodeHandler subtypeHandler = new CacheNodeHandler(subtype);
    ConcurrentHashMap<Class, Pair<SNode, GeneratedMatchingPattern>> map2 = null;
    CacheNodeHandler subtypeHandler2 = null;
    ConcurrentHashMap<Class, Pair<SNode, GeneratedMatchingPattern>> map = cache1.get(subtypeHandler);

    if (bothMaps) {
      subtypeHandler2 = new CacheNodeHandler(subtype);
      map2 = cache2.get(subtypeHandler2);
    }

    if (map == null || (bothMaps && map2 == null)) {
      synchronized (myCoerceToPatternsCacheLock) {
        map = cache1.get(subtypeHandler);
        if (map == null) {
          map = new ConcurrentHashMap<Class, Pair<SNode, GeneratedMatchingPattern>>();
          cache1.put(subtypeHandler, map);
        }
        if (bothMaps) {
          map2 = cache2.get(subtypeHandler2);
          if (map2 == null) {
            map2 = new ConcurrentHashMap<Class, Pair<SNode, GeneratedMatchingPattern>>();
            cache2.put(subtypeHandler2, map2);
          }
        }
      }
    }

    map.put(c, new Pair<SNode, GeneratedMatchingPattern>(result, pattern));
  }

  public void addCacheEntry(SNode subtype, IMatchingPattern pattern, SNode result, boolean isWeak) {
    if (pattern instanceof ConceptMatchingPattern) {
      addCacheEntry(subtype, ((ConceptMatchingPattern) pattern).getConceptFQName(), result, isWeak);
      return;
    }
    if (pattern instanceof GeneratedMatchingPattern) {
      if (!((GeneratedMatchingPattern) pattern).hasAntiquotations()) {
        addCacheEntry(subtype, pattern.getClass(), result, (GeneratedMatchingPattern) pattern, isWeak);
        return;
      }
    }
  }

  public Pair<Boolean, SNode> getCoerced(SNode subtype, IMatchingPattern pattern, boolean isWeak) {
    if (pattern instanceof ConceptMatchingPattern) {
      return getCoerced(subtype, ((ConceptMatchingPattern) pattern).getConceptFQName(), isWeak);
    }
    if (pattern instanceof GeneratedMatchingPattern) {
      if (!((GeneratedMatchingPattern) pattern).hasAntiquotations()) {
        return getCoerced(subtype, pattern.getClass(), (GeneratedMatchingPattern) pattern, isWeak);
      }
    }
    return new Pair<Boolean, SNode>(false, null);
  }

  private static enum MyBoolean {
    NULL, FALSE, TRUE
  }
}