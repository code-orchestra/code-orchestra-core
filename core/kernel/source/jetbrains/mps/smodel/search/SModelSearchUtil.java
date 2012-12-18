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
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.FlattenIterable;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.List;

/**
 * Igor Alshannikov
 * Jan 19, 2006
 */
public class SModelSearchUtil {

  public static ISearchScope createModelAndImportedModelsScope(SModel model, IScope scope) {
    return createModelAndImportedModelsScope(model, false, scope);
  }

  public static ISearchScope createModelAndImportedModelsScope(SModel model, boolean rootsOnly, IScope scope) {
    return new ModelAndImportedModelsScope(model, rootsOnly, scope);
  }

  public static ISearchScope createConceptsFromModelLanguagesScope(SModel model, IScope scope) {
    return new SModelSearchUtil._ConceptsFromModelLanguagesScope(model, false, scope);
  }

  public static ISearchScope createConceptsFromModelLanguagesScope(SModel model, boolean rootsOnly, IScope scope) {
    return new SModelSearchUtil._ConceptsFromModelLanguagesScope(model, rootsOnly, scope);
  }


  public static SNode findLinkDeclaration(SNode conceptDeclaration, String role) {
    if (role == null) return null;
    return new ConceptAndSuperConceptsScope(conceptDeclaration).getLinkDeclarationByRole(role);
  }

  public static SNode/*LinkDeclaration*/ findMostSpecificLinkDeclaration(SNode conceptDeclaration, String role) {
    if (role == null) return null;
    return new ConceptAndSuperConceptsScope(conceptDeclaration).getMostSpecificLinkDeclarationByRole(role);
  }

  public static List<SNode> getLinkDeclarations(SNode concept) {
    return new ConceptAndSuperConceptsScope(concept).getLinkDeclarationsExcludingOverridden();
  }

  public static List<SNode> getAggregationLinkDeclarations(SNode concept) {
    List<SNode> list = new ConceptAndSuperConceptsScope(concept).getLinkDeclarationsExcludingOverridden();
    List<SNode> result = new ArrayList<SNode>();
    for (SNode link : list) {
      if (!SNodeUtil.getLinkDeclaration_IsReference(link)) {
        result.add(link);
      }
    }
    return result;
  }

  public static List<SNode> getReferenceLinkDeclarations(final SNode concept) {
    return NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<List<SNode>>() {
      public List<SNode> compute() {
        List<SNode> list = new ConceptAndSuperConceptsScope(concept).getLinkDeclarationsExcludingOverridden();
        List<SNode> result = new ArrayList<SNode>();
        for (SNode link : list) {
          if (SNodeUtil.getLinkDeclaration_IsReference(link)) {
            result.add(link);
          }
        }
        return result;
      }
    });
  }


  public static List<SNode> getPropertyDeclarations(SNode concept) {
    return new ConceptAndSuperConceptsScope(concept).getPropertyDeclarations();
  }

  @Nullable
  public static SNode findPropertyDeclaration(SNode concept, String propertyName) {
    if (concept == null || propertyName == null) return null;
    return new ConceptAndSuperConceptsScope(concept).getPropertyDeclarationByName(propertyName);
  }

  public static List<SNode> getConceptPropertyDeclarations(SNode concept) {
    List<SNode> result = new ArrayList<SNode>();
    List<SNode> concepts = new ConceptAndSuperConceptsScope(concept).getConcepts();
    for (SNode c : concepts) {
      for(SNode conceptPropertyDeclaration : SNodeUtil.getConcept_ConceptPropertyDeclarations(c)) {
        result.add(conceptPropertyDeclaration);
      }
    }
    return result;
  }

  public static SNode findConceptProperty(SNode concept, String propertyName) {
    if (concept == null) return null;
    return new ConceptAndSuperConceptsScope(concept).getConceptPropertyByName(propertyName);
  }

  public static Iterable<SNode> getConceptLinkDeclarations(SNode concept) {
    FlattenIterable<SNode> result = new FlattenIterable<SNode>(new ArrayList<Iterable<SNode>>());
    List<SNode> concepts = new ConceptAndSuperConceptsScope(concept).getConcepts();
    for (SNode c : concepts) {
      result.add(SNodeUtil.getConcept_ConceptLinkDeclarations(c));
    }
    return result;
  }


  private static class _ConceptsFromModelLanguagesScope extends AbstractSearchScope {
    private SModel myModel;
    private boolean myRootsOnly;
    private IScope myScope;
    private List<SNode> myConcepts;

    public _ConceptsFromModelLanguagesScope(SModel model, boolean rootsOnly, IScope scope) {
      myModel = model;
      myRootsOnly = rootsOnly;
      myScope = scope;
    }

    @NotNull
    public List<SNode> getNodes(Condition<SNode> condition) {
      if (myConcepts == null) {
        myConcepts = new ArrayList<SNode>();
        List<Language> languages = SModelOperations.getLanguages(myModel, myScope);
        for (Language language : languages) {
          if (myRootsOnly) {
            SModel structureModel = language.getStructureModelDescriptor().getSModel();
            for (SNode node : structureModel.roots()) {
              if (SNodeUtil.isInstanceOfConceptDeclaration(node)) {
                myConcepts.add(node);
              }
            }
          } else {
            myConcepts.addAll(language.getConceptDeclarations());
          }
        }
      }

      List<SNode> concepts = new ArrayList<SNode>();
      for (SNode concept : myConcepts) {
        if (condition.met(concept)) {
          concepts.add(concept);
        }
      }

      return concepts;
    }
  }

}
