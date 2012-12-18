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

import jetbrains.mps.lang.dataFlow.framework.StructuralProgramBuilder;

public class ExpressionProgramBuilder extends StructuralProgramBuilder<Expression> {
  protected void doBuild(Expression expr) {    
    if (expr instanceof IfExpression) {
      IfExpression ifExpression = (IfExpression) expr;
      build(ifExpression.getCondition());
      emitIfJump(before(ifExpression.getIfFalse()));
      build(ifExpression.getIfTrue());
      emitJump(after(ifExpression));
      build(ifExpression.getIfFalse());
      return;
    }

    if (expr instanceof WhileExpression) {
      WhileExpression whileExpression = (WhileExpression) expr;
      build(whileExpression.getCondition());
      emitIfJump(after(whileExpression.getBody()));
      build(whileExpression.getBody());
      return;
    }

    if (expr instanceof SeqExpression) {
      SeqExpression seq = (SeqExpression) expr;
      for (Expression e : seq.getExpressions()) {
        build(e);
      }
      return;
    }

    if (expr instanceof NopExpression) {
      return;
    }

    if (expr instanceof AssignmentExpression) {
      AssignmentExpression assignmentExpression = (AssignmentExpression) expr;
      build(assignmentExpression.getValue());
      emitWrite(assignmentExpression.getVariableName());
      return;
    }

    if (expr instanceof VariableExpression) {
      VariableExpression variableExpression = (VariableExpression) expr;
      emitRead(variableExpression.getName());
      return;
    }
  }
}
