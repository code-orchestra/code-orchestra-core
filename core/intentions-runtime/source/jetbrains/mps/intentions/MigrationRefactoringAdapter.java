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
package jetbrains.mps.intentions;

import jetbrains.mps.lang.script.runtime.AbstractMigrationRefactoring;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.NameUtil;

import java.util.List;
import java.util.ArrayList;

public class MigrationRefactoringAdapter extends BaseIntention {
  private AbstractMigrationRefactoring myRefactoring;
  private SNode myMigrationScript;  //todo: do we really need migration script i.e. a link to SNode here?

  public MigrationRefactoringAdapter(AbstractMigrationRefactoring refactoring, SNode migrationScript) {
    myRefactoring = refactoring;
    myMigrationScript = migrationScript;
  }

  public String getConcept() {
    return myRefactoring.getFqNameOfConceptToSearchInstances();
  }

  public boolean isParameterized() {
    return false;  
  }

  public String getDescription(SNode node, EditorContext editorContext) {
    return "Migration: " + NameUtil.multiWordCapitalize(myRefactoring.getName());
  }

  public boolean isApplicable(SNode node, EditorContext editorContext) {
    return myRefactoring.isApplicableInstanceNode(node);
  }

  public boolean isAvailableInChildNodes() {
    return false;
  }

  public List parameter(SNode node, EditorContext editorContext) {
    return null;
  }

  public void execute(SNode node, EditorContext editorContext) {
    List<SNode> allParents = new ArrayList<SNode>();
    for (SNode currentNode = node; currentNode != null; currentNode = currentNode.getParent()) {
      allParents.add(currentNode);
    }
    myRefactoring.doUpdateInstanceNode(node);
    // Node was removed/replaced - trying to select first parent remaining in model
    if (node != null && node.getContainingRoot() == null) {
      for (SNode predecessor : allParents) {
        if (predecessor.getContainingRoot() != null) {
          editorContext.selectWRTFocusPolicy(predecessor);
          break;
        }
      }
    }
  }

  public IntentionType getType() {
    return IntentionType.MIGRATION;
  }

  public String getLocationString() {
    return myMigrationScript.getModel().getLongName();
  }

  public SNode getNodeByIntention() {
    return null;
  }

  public List<Intention> getParameterizedInstances(SNode node, EditorContext editorContext) {
    List<Intention> list = new ArrayList<Intention>();
    list.add(this);
    return list;
  }
}
