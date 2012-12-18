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
package jetbrains.mps.dataFlow.lang.framework.testLang;

public class IfExpression extends Expression {
  private Expression myCondition;
  private Expression myIfTrue;
  private Expression myIfFalse;

  public IfExpression(Expression condition, Expression ifTrue, Expression ifFalse) {
    myCondition = condition;
    myIfTrue = ifTrue;
    myIfFalse = ifFalse;
  }

  public Expression getCondition() {
    return myCondition;
  }

  public Expression getIfTrue() {
    return myIfTrue;
  }

  public Expression getIfFalse() {
    return myIfFalse;
  }
}
