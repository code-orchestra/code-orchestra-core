/*
 * Copyright 2000-2009 JetBrains s.r.o.
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

import com.intellij.ide.util.gotoByName.temp.IdeaItemProvider;
import com.intellij.openapi.util.Computable;
import com.intellij.psi.PsiElement;

import java.util.List;

public class MPSPackageItemProvider extends IdeaItemProvider {
  public MPSPackageItemProvider(PsiElement context) {
    super(context);
  }

  public List<Object> filterElements(String pattern, boolean everywhere, Computable<Boolean> cancelled, int maxListSize, String extra) {
    return super.filterElements(transformPattern(pattern), everywhere, cancelled, maxListSize, extra);
  }

  public List<String> getNamesByPattern(String[] names, String pattern) {
    return super.getNamesByPattern(names, transformPattern(pattern));
  }

  private String transformPattern(String pattern) {
    if ("".equals(pattern)) return "*";
    if (pattern.endsWith(" ")) return pattern;
    else return pattern + ".*";
  }
}
