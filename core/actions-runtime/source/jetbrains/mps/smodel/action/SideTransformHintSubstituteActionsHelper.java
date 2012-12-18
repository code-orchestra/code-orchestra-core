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
package jetbrains.mps.smodel.action;

import jetbrains.mps.actions.runtime.impl.SideTransformUtil;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.CellSide;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.TypeChecker;

import java.util.*;

public class SideTransformHintSubstituteActionsHelper {
  public static final String SIDE_TRANSFORM_TAG_SEPARATOR = "|";
  private static final Logger LOG = Logger.getLogger(SideTransformHintSubstituteActionsHelper.class);

  private IOperationContext myContext;
  private SNode mySourceNode;
  private Set<String> myTransformTags = new LinkedHashSet<String>();
  private CellSide mySide;

  public SideTransformHintSubstituteActionsHelper(SNode sourceNode, CellSide side, String transformTags, IOperationContext context) {
    myContext = context;
    while (AttributeOperations.isAttribute(sourceNode)) {
      sourceNode = sourceNode.getParent();
    }
    mySourceNode = sourceNode;
    if (transformTags != null) {
      for (StringTokenizer tokenizer = new StringTokenizer(transformTags, SIDE_TRANSFORM_TAG_SEPARATOR); tokenizer.hasMoreTokens();) {
        myTransformTags.add(tokenizer.nextToken());
      }
    }
    mySide = side;
  }

  public boolean canCreateActions() {
    TypeChecker.getInstance().enableTypesComputingForCompletion();
    try {
      return SideTransformUtil.getApplicableActionsBuilders(mySourceNode, myTransformTags, mySide, myContext).iterator().hasNext();
    } finally {
      TypeChecker.getInstance().clearTypesComputedForCompletion();
    }
  }

  public List<INodeSubstituteAction> createActions() {
    final List<INodeSubstituteAction>[] result = new List[1];
    // enable R/O access
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        TypeChecker.getInstance().enableTypesComputingForCompletion();
        try {
          result[0] = SideTransformUtil.createActions(mySourceNode, myTransformTags, mySide, myContext);
        } catch (Throwable t) {
          LOG.error(t);
          result[0] = new ArrayList<INodeSubstituteAction>();
        } finally {
          TypeChecker.getInstance().clearTypesComputedForCompletion();
        }
      }
    });

    return result[0];
  }
}
