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
package jetbrains.mps.workbench.actions.goTo.matcher;

import com.intellij.ide.util.gotoByName.temp.ChooseByNameBase;
import com.intellij.ide.util.gotoByName.temp.ItemProvider;
import com.intellij.openapi.util.Computable;

import java.util.ArrayList;
import java.util.List;

public class CompositeItemProvider implements ItemProvider {
  private ItemProvider[] myProviders;

  public CompositeItemProvider(ItemProvider... providers) {
    myProviders = providers;
  }

  public void setBase(ChooseByNameBase base) {
    for (ItemProvider provider : myProviders) {
      provider.setBase(base);
    }
  }

  public List<String> getNamesByPattern(String[] names, String pattern) {
    List<String> res = new ArrayList<String>();
    for (ItemProvider matcher : myProviders) {
      res.addAll(matcher.getNamesByPattern(names, pattern));
    }
    return res;
  }

  public List<Object> filterElements(String pattern, boolean everywhere, Computable<Boolean> cancelled, int maxListSize, String extra) {
    List<Object> res = new ArrayList<Object>();
    for (ItemProvider matcher : myProviders) {
      res.addAll(matcher.filterElements(pattern, everywhere, cancelled, maxListSize, extra));
    }
    return res;
  }
}
