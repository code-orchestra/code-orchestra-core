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

import jetbrains.mps.smodel.SModelAdapter;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.event.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * Igor Alshannikov
 * Aug 28, 2007
 */
public abstract class AbstractCache extends SModelAdapter {
  private final Object myKey;
  private final ConcurrentMap<String, DataSet> myDataSets = new ConcurrentHashMap<String, DataSet>();

  protected AbstractCache(Object key) {
    super(SModelListenerPriority.PLATFORM);
    myKey = key;
  }

  public Object getKey() {
    return myKey;
  }

  protected void clearCache() {
    myDataSets.clear();
  }

  public boolean isAttached() {
    return CachesManager.getInstance().getCache(myKey, null, null) == this;
  }

  public abstract Set<SModelDescriptor> getDependsOnModels(Object element);

  public void removeDataSet(DataSet dataSet) {
    myDataSets.remove(dataSet.getId());
  }

  protected DataSet getDataSet(String dataSetId, DataSetCreator creator) {
    DataSet result = myDataSets.get(dataSetId);
    if (result != null || creator == null) {
      return result;
    }
    result = creator.create(this);
    assert result.getId().equals(dataSetId);
    result.init();
    DataSet existing = myDataSets.putIfAbsent(dataSetId, result);
    if (existing != null) {
      // ignored, drop dataSet
      return existing;
    }
    return result;
  }

  public List<DataSet> getDataSets() {
    return new ArrayList<DataSet>(myDataSets.values());
  }

  // model listener

  public void loadingStateChanged(SModelDescriptor model, boolean isLoading) {
  }

  public void languageAdded(SModelLanguageEvent event) {
  }

  public void languageRemoved(SModelLanguageEvent event) {
  }

  public void importAdded(SModelImportEvent event) {
  }

  public void importRemoved(SModelImportEvent event) {
  }

  public void devkitAdded(SModelDevKitEvent event) {
  }

  public void devkitRemoved(SModelDevKitEvent event) {
  }

  public void rootAdded(SModelRootEvent event) {
  }

  public void rootRemoved(SModelRootEvent event) {
  }

  public void beforeRootRemoved(SModelRootEvent event) {
  }

  public void propertyChanged(SModelPropertyEvent event) {
  }

  public void childAdded(SModelChildEvent event) {
  }

  public void childRemoved(SModelChildEvent event) {
  }

  public void beforeChildRemoved(SModelChildEvent event) {
  }

  public void referenceAdded(SModelReferenceEvent event) {
  }

  public void referenceRemoved(SModelReferenceEvent event) {
  }

  public interface DataSetCreator<T extends AbstractCache> {
    DataSet create(T ownerCache);
  }
}
