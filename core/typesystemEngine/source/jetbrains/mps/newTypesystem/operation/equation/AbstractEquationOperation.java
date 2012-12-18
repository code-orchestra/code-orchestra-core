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
package jetbrains.mps.newTypesystem.operation.equation;

import jetbrains.mps.newTypesystem.TypesUtil;
import jetbrains.mps.newTypesystem.operation.AbstractOperation;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.EquationInfo;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: Oct 8, 2010
 * Time: 1:17:32 PM
 */
public abstract class AbstractEquationOperation extends AbstractOperation {
  final SNode myChild;
  final SNode myParent;

  AbstractEquationOperation(SNode child, SNode parent, SNode source, EquationInfo info) {
    myChild = child;
    mySource = source;
    myParent = parent;
    setRule(info);
  }

  public String getShortPresentation() {
    return myChild + " = " + myParent;
  }

  public List<SNode> getVariables() {
    LinkedList<SNode> nodes = new LinkedList<SNode>();
    if (TypesUtil.isVariable(myChild)) {
      nodes.add(myChild);
    }
    if (TypesUtil.isVariable(myParent)) {
      nodes.add(myParent);
    }
    return nodes;
  }
}
