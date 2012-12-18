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
package jetbrains.mps.smodel.structure;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.behaviour.BehaviorConstants;
import jetbrains.mps.smodel.constraints.*;
import jetbrains.mps.smodel.structure.ConstraintsDescriptor.CanBeRoles;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

import static jetbrains.mps.smodel.structure.DescriptorUtils.getObjectByClassNameForConcept;

public class InterpretedConstraintsDataHolder extends ConstraintsDataHolder {
  private static final Logger LOG = Logger.getLogger(InterpretedConstraintsDataHolder.class);

  private final String fqName;
  private final Method alternativeIconMethod;

  public InterpretedConstraintsDataHolder(String fqName) {
    this.fqName = fqName;

    this.alternativeIconMethod = getMethod(fqName, BehaviorConstants.GET_ALTERNATIVE_ICON_METHOD_NAME, SNode.class);
  }

  private static Method getMethod(final String conceptFqName, final String methodName, final Class... parameterTypes) {
    Object constraintsObject = getObjectByClassNameForConcept(NameUtil.getAspectNodeFqName(conceptFqName, LanguageAspect.CONSTRAINTS) + "_Constraints", conceptFqName, false);

    if (constraintsObject == null) {
      return null;
    }

    try {
      return constraintsObject.getClass().getMethod(methodName, parameterTypes);
    } catch (NoSuchMethodException e) {
      //it's ok
      return null;
    }
  }

  private <T> CanBeASomethingMethod<T> _getCanBeASomethingMethod(CanBeRoles role) {
    Method method = getMethod(fqName, role.methodName, role.parameterTypes);
    return method != null ? new InterpretedCanBeASomethingMethod<T>(method, role) : null;
  }

  @Override
  public CanBeASomethingMethod<CanBeAChildContext> getCanBeAChildMethod() {
    return _getCanBeASomethingMethod(CanBeRoles.CHILD);
  }

  @Override
  public CanBeASomethingMethod<CanBeARootContext> getCanBeARootMethod() {
    return _getCanBeASomethingMethod(CanBeRoles.ROOT);
  }

  @Override
  public CanBeASomethingMethod<CanBeAParentContext> getCanBeAParentMethod() {
    return _getCanBeASomethingMethod(CanBeRoles.PARENT);
  }

  @Override
  public CanBeASomethingMethod<CanBeAnAncestorContext> getCanBeAnAncestorMethod() {
    return _getCanBeASomethingMethod(CanBeRoles.ANCESTOR);
  }

  @Override
  public String getConceptFqName() {
    return fqName;
  }

  @Override
  public boolean isAlternativeIcon() {
    return alternativeIconMethod != null;
  }

  @Override
  public String getAlternativeIcon(SNode node) {
    try {
      return (String) alternativeIconMethod.invoke(null, node);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  public String getDefaultConcreteConceptFqName() {
    Method method = getMethod(fqName, BehaviorConstants.GET_DEFAULT_CONCRETE_CONCEPT_FQ_NAME);

    if (method == null) {
      return fqName;
    }

    try {
      return (String) method.invoke(null);
    } catch (Exception e) {
      LOG.error(e);
      return fqName;
    }
  }

  @Override
  public Map<String, INodePropertyGetter> getNodePropertyGetters() {
    return ModelConstraintsManager.getInstance().getDirectNodePropertyGetters(fqName);
  }

  @Override
  public Map<String, INodePropertySetter> getNodePropertySetters() {
    return ModelConstraintsManager.getInstance().getDirectNodePropertySetters(fqName);
  }

  @Override
  public Map<String, INodePropertyValidator> getNodePropertyValidators() {
    return ModelConstraintsManager.getInstance().getDirectNodePropertyValidators(fqName);
  }

  @Override
  public Map<String, INodeReferentSearchScopeProvider> getNodeNonDefaultSearchScopeProviders() {
    return ModelConstraintsManager.getInstance().getNodeNonDefaultSearchScopeProviders(fqName);
  }

  @Override
  public Map<String, INodeReferentSetEventHandler> getNodeReferentSetEventHandlers() {
    return ModelConstraintsManager.getInstance().getDirectNodeReferentSetEventHandlers(fqName);
  }

  @Override
  public INodeReferentSearchScopeProvider getNodeDefaultSearchScopeProvider() {
    return ModelConstraintsManager.getInstance().getNodeDefaultSearchScopeProvider(fqName);
  }

  private static SNodePointer getConceptConstraint(final Method method, final String role) {
    return ModelAccess.instance().runReadAction(new Computable<SNodePointer>() {
      @Override
      public SNodePointer compute() {
        return NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<SNodePointer>() {
          @Override
          public SNodePointer compute() {
            SNode constraints = getConceptConstraints(GlobalScope.getInstance(), method);
            if (constraints == null) {
//          throw new RuntimeException("Empty concept constraints");
              return null;
            } else {
              return new SNodePointer(SLinkOperations.getTarget(constraints, role, true));
            }
          }
        });
      }
    });
  }

  private static SNode getConceptConstraints(IScope scope, Method method) {
    Class cls = method.getDeclaringClass();
    String fqName = cls.getName();
    String modelName = NameUtil.namespaceFromLongName(fqName);
    String rootName = NameUtil.shortNameFromLongName(fqName);
    Language language = scope.getLanguage(NameUtil.namespaceFromLongName(modelName));
    if (language == null) {
      return null;
    }
    SModelDescriptor sm = language.getConstraintsModelDescriptor();
    if (sm == null) return null;
    SNode root = SModelOperations.getRootByName(sm.getSModel(), rootName);
    if (root == null) return null;
    if (jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations.isInstanceOf(root, SConstraintsUtil.concept_ConceptConstraints)) {
      return root;
    }
    return null;
  }

  private static class InterpretedCanBeASomethingMethod<T> implements CanBeASomethingMethod<T> {
    @NotNull
    private final Method method;

    private final CanBeRoles role;

    private InterpretedCanBeASomethingMethod(@NotNull Method method, CanBeRoles role) {
      this.method = method;
      this.role = role;
    }

    @Override
    public boolean canBe(IOperationContext operationContext, T context, @Nullable CheckingNodeContext checkingNodeContext) {
      try {
        boolean result = (Boolean) method.invoke(null, operationContext, context);

        if (checkingNodeContext != null && !result) {
          checkingNodeContext.breakingNodePointer = getConceptConstraint(method, role.roleNameInConstraints);
        }

        return result;
      } catch (IllegalAccessException e) {
        LOG.error(e);
      } catch (InvocationTargetException e) {
        LOG.error(e);
      }

      // ?
      return false;
    }
  }
}
