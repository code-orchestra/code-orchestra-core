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
package jetbrains.mps.generator;

import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.util.misc.hash.HashMap;

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: fyodor
 * Date: 7/13/11
 * Time: 9:54 AM
 * To change this template use File | Settings | File Templates.
 */
public class DefaultGenerationParametersProvider implements GenerationParametersProvider {

  private Map<String, Object> defaultParams = new HashMap<String, Object>();
  private Map<SModelDescriptor, Map<String, Object>> paramMaps = new HashMap<SModelDescriptor, Map<String, Object>>();

  public Map<String, Object> getParameters(SModelDescriptor descriptor) {
    if (descriptor == null) { throw new NullPointerException();}

    Map<String, Object> params =
      paramMaps.containsKey(descriptor) ? paramMaps.get(descriptor) : Collections.<String, Object>emptyMap();
    return new DelegatingMapWithDefaults<String, Object> (params, defaultParams);
  }

  public void addParameter (String key, Object value) {
    addParameter(null, key, value);
  }

  public void addParameter (SModelDescriptor descriptor, String key, Object value) {
    if (descriptor == null) {
      defaultParams.put(key, value);
    }
    else{
      if (!paramMaps.containsKey(descriptor)) {
        paramMaps.put(descriptor, new HashMap<String, Object>());
      }
      paramMaps.get(descriptor).put(key, value);
    }
  }


  private static class DelegatingMapWithDefaults<K,V> extends AbstractMap<K,V> {

    private final Map<K, V> myDelegate;
    private final Map<K, V> myDefaults;

    private DelegatingMapWithDefaults(Map<K, V> delegate, Map<K, V> defaults) {
      myDelegate = delegate;
      myDefaults = defaults;
    }

    @Override
    public Set<Entry<K, V>> entrySet() {
      HashSet<Entry<K, V>> set = new HashSet<Entry<K, V>>(myDelegate.entrySet());
      for (Entry<K,V> e: myDefaults.entrySet()) {
        if (!myDelegate.containsKey(e.getKey())) {
          set.add(e);
        }
      }
      return Collections.unmodifiableSet(set);
    }
  }
}
