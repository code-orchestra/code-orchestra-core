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
package jetbrains.mps.smodel.search;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.smodel.NodeReadAccessCasterInEditor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Condition;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Igor Alshannikov
 * Aug 30, 2007
 */
public class ConceptAndSuperConceptsScope extends AbstractSearchScope {
  private SNode myTopConcept;

  public ConceptAndSuperConceptsScope(@Nullable SNode topConcept) {
    myTopConcept = topConcept;
  }

  public List<SNode> getConcepts() {
    if (myTopConcept == null) return Collections.emptyList();
    return Arrays.asList(ConceptAndSuperConceptsCache.getInstance(myTopConcept).getConcepts());
  }

  public SNode getPropertyDeclarationByName(final String name) {
    if (myTopConcept == null) return null;
    return NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<SNode>() {
      public SNode compute() {
        return ConceptAndSuperConceptsCache.getInstance(myTopConcept).getPropertyDeclarationByName(name);
      }
    });
  }

  public List<SNode> getPropertyDeclarations() {
    if (myTopConcept == null) return Collections.emptyList();
    return NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<List<SNode>>() {
      public List<SNode> compute() {
        return ConceptAndSuperConceptsCache.getInstance(myTopConcept).getPropertyDeclarations();
      }
    });
  }

  public SNode getLinkDeclarationByRole(final String role) {
    if (myTopConcept == null) return null;
    return NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<SNode>() {
      public SNode compute() {
        return ConceptAndSuperConceptsCache.getInstance(myTopConcept).getLinkDeclarationByRole(role);
      }
    });
  }

  public SNode getMostSpecificLinkDeclarationByRole(final String role) {
    if (myTopConcept == null) return null;
    return NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<SNode>() {
      public SNode compute() {
        return ConceptAndSuperConceptsCache.getInstance(myTopConcept).getMostSpecificLinkDeclarationByRole(role);
      }
    });
  }

  public List<SNode> getLinkDeclarationsExcludingOverridden() {
    if (myTopConcept == null) return Collections.emptyList();
    return NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<List<SNode>>() {
      public List<SNode> compute() {
        return ConceptAndSuperConceptsCache.getInstance(myTopConcept).getLinkDeclarationsExcludingOverridden();
      }
    });
  }

  public SNode getConceptPropertyByName(final String name) {
    if (myTopConcept == null) return null;
    return NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<SNode>() {
      public SNode compute() {
        return ConceptAndSuperConceptsCache.getInstance(myTopConcept).getConceptPropertyByName(name);
      }
    });
  }


  @NotNull
  public List<SNode> getNodes(Condition<SNode> condition) {
    if (myTopConcept == null) return Collections.emptyList();
    List<SNode> result = new ArrayList<SNode>();
    // filter by condition
    for (SNode node : getConcepts()) {
      if (node == null) continue;
      for (SNode n : node.getDescendantsIterable(condition, true)) {
        result.add(n);
      }
    }
    return result;
  }
}
