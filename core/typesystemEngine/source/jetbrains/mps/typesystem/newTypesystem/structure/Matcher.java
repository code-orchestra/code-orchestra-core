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

import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: User
 * Date: 26.01.2010
 * Time: 14:32:12
 * To change this template use File | Settings | File Templates.
 */
public class Matcher {
  public static <Meta, Target> MatchResult<Meta, Target> match(Type<Meta, Target> type1, Type<Meta, Target> type2) {
    MatchResult<Meta, Target> result = new MatchResult<Meta, Target>();
    if (type1 == type2) return result;
    if (type1 == null || type2 == null) return MatchResult.FALSE;

    //vars
    if (type1.isVar() || type2.isVar()) {
      result.addEquation(type1, type2);
      return result;
    }

    //matching
    if (type1.getMeta() != type2.getMeta()) {
      return MatchResult.FALSE;
    }
    Set<String> referenceRoles = type1.getReferenceRoles();
    referenceRoles.addAll(type2.getReferenceRoles());
    for (String role : referenceRoles) {
      if (type1.getReferent(role) != type2.getReferent(role)) {
        return MatchResult.FALSE;
      }
    }
    //children
    Set<String> childRoles = type1.getChildRoles();
    childRoles.addAll(type2.getChildRoles());
    for (String role : childRoles) {
      List<Type<Meta, Target>> children1 = type1.getChildren(role);
      List<Type<Meta, Target>> children2 = type2.getChildren(role);
      if (children1.size() != children2.size()) {
        return MatchResult.FALSE;
      }
      for (Iterator<Type<Meta, Target>> i1 = children1.iterator(), i2 = children2.iterator(); i1.hasNext() && i2.hasNext();) {
        Type<Meta, Target> child1 = i1.next();
        Type<Meta, Target> child2 = i2.next();
        MatchResult<Meta, Target> childResult = match(child1, child2);
        if (!childResult.isCorrectMatch()) {
          return MatchResult.FALSE;
        } else {
          result.addEquations(childResult);
        }
      }
    }

    return result;
  }
}
