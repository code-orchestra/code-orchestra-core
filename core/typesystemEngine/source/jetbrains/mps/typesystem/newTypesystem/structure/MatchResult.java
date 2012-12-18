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
package jetbrains.mps.typesystem.newTypesystem.structure;

import jetbrains.mps.util.Pair;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: User
 * Date: 26.01.2010
 * Time: 17:58:50
 * To change this template use File | Settings | File Templates.
 */
public class MatchResult<M, T> {
  private List<Pair<Type<M, T>, Type<M, T>>> myEquations = null;
  private boolean myIsCorrectMatch;

  public MatchResult() {
    myIsCorrectMatch = true;
  }

  private MatchResult(boolean isCorrect) {
    myIsCorrectMatch = isCorrect;
  }

  public void addEquation(Type<M, T> t1, Type<M, T> t2) {
    if (myEquations == null) myEquations = new ArrayList<Pair<Type<M, T>, Type<M, T>>>(1);
    myEquations.add(new Pair<Type<M, T>, Type<M, T>>(t1, t2));
  }

  public boolean isCorrectMatch() {
    return myIsCorrectMatch;
  }

  public void addEquations(MatchResult<M, T> childResult) {
    myEquations.addAll(childResult.myEquations);
  }

  public static final MatchResult FALSE = new MatchResult(false);
}
