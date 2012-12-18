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
package jetbrains.mps.lang.typesystem.runtime;

import jetbrains.mps.lang.pattern.GeneratedMatchingPattern;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 29.09.2010
 * Time: 19:30:53
 * To change this template use File | Settings | File Templates.
 */
public class IsApplicable2Status {
  private boolean myIsApplicable;
  private GeneratedMatchingPattern myPattern1;
  private GeneratedMatchingPattern myPattern2;

  public static final IsApplicable2Status FALSE_STATUS = new IsApplicable2Status(false, null, null);

  public IsApplicable2Status(boolean isApplicable, GeneratedMatchingPattern pattern1, GeneratedMatchingPattern pattern2) {
    myIsApplicable = isApplicable;
    myPattern1 = pattern1;
    myPattern2 = pattern2;
  }

  public boolean isApplicable() {
    return myIsApplicable;
  }

  public GeneratedMatchingPattern getPattern1() {
    return myPattern1;
  }

  public GeneratedMatchingPattern getPattern2() {
    return myPattern2;
  }
}
