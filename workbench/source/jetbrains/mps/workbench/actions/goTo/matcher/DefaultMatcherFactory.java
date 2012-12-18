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

import com.intellij.ide.util.gotoByName.ChooseByNameModel;
import jetbrains.mps.workbench.actions.goTo.matcher.matchers.CompositeMatcher;
import jetbrains.mps.workbench.actions.goTo.matcher.matchers.DefaultMatcher;
import jetbrains.mps.workbench.actions.goTo.matcher.matchers.MPSMatcher;
import jetbrains.mps.workbench.choose.base.FakePsiContext;

public class DefaultMatcherFactory {
  public static EntityMatcher createMPSMatcher(ChooseByNameModel model) {
    return new MPSMatcher(model) {
      protected boolean canShowListForEmptyPattern() {
        return false;
      }
    };
  }

  public static EntityMatcher createIdeaMatcher(ChooseByNameModel model) {
    return new DefaultMatcher(model, new FakePsiContext()) {
      protected boolean canShowListForEmptyPattern() {
        return false;
      }
    };

  }

  public static EntityMatcher createAllMatcher(ChooseByNameModel model) {
    return new CompositeMatcher(createMPSMatcher(model), createIdeaMatcher(model));
  }
}
