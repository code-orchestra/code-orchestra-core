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
package jetbrains.mps.plugins;

import jetbrains.mps.project.IModule;

import java.util.*;

public class PluginSorter {
  //todo for now, the cycle will be broken in unknown place
  public static List<IModule> sortByDependencies(Collection<IModule> modules) {
    List<Item> items = new ArrayList<Item>();
    Map<IModule, Item> module2Item = new HashMap<IModule, Item>();
    for (IModule module : modules) {
      Item item = new Item(module, -1);
      items.add(item);
      module2Item.put(module, item);
    }
    int initIndex = 0;
    for (Item item : items) {
      if (item.myInitIndex == -1) {
        initIndex = init(item, module2Item, initIndex);
      }
    }

    IModule[] result = new IModule[initIndex];

    for (Item item : items) {
      result[item.myInitIndex] = item.myModule;
    }
    return Arrays.asList(result);
  }

  private static int init(Item item, Map<IModule, Item> module2Item, int initIndex) {
    item.myInitIndex = -2;
    for (IModule dependency : item.myModule.getDependenciesManager().getAllVisibleModules()) {
      Item depItem = module2Item.get(dependency);
      if (depItem != null) {
        if (depItem.myInitIndex == -1) {
          initIndex = init(depItem, module2Item, initIndex);
        }
      }
    }
    item.myInitIndex = initIndex;
    initIndex++;
    return initIndex;
  }

  private static class Item {
    private Item(IModule module, int initIndex) {
      this.myModule = module;
      this.myInitIndex = initIndex;
    }

    public IModule myModule;
    public int myInitIndex;
  }
}
