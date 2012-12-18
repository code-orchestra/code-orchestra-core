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
package jetbrains.mps.workbench.actions.goTo.matcher.matchers;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.workbench.actions.goTo.matcher.EntityMatcher;

import java.util.HashSet;
import java.util.Set;

public class CompositeMatcher implements EntityMatcher {
  private EntityMatcher[] myMatcher;

  public CompositeMatcher(EntityMatcher... matcher) {
    myMatcher = matcher;
  }

  public boolean nameMatches(String pattern, String name) {
    for (EntityMatcher matcher : myMatcher) {
      if (matcher.nameMatches(pattern, name)) return true;
    }
    return false;
  }

  public Set<Object> getElementsByPattern(String fullPattern, String shortName, boolean checkboxState, Computable<Boolean> isCancelled) {
    Set<Object> result = new HashSet<Object>();
    for (EntityMatcher matcher : myMatcher) {
      result.addAll(matcher.getElementsByPattern(fullPattern, shortName, checkboxState,isCancelled));
    }
    return result;
  }
}
