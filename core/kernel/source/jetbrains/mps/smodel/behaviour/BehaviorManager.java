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
package jetbrains.mps.smodel.behaviour;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.language.ConceptRegistry;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public final class BehaviorManager implements ApplicationComponent {
  // todo: static it!
  public static BehaviorManager getInstance() {
    return ApplicationManager.getApplication().getComponent(BehaviorManager.class);
  }

  public BehaviorManager(ClassLoaderManager classLoaderManager) {
  }

  public void initComponent() {
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "Behavior Manager";
  }

  public void disposeComponent() {
  }

  public void initNode(SNode node) {
    ConceptRegistry.getInstance().getBehaviorDescriptorForInstanceNode(node).initNode(node);
  }

  public <T> T invoke(Class<T> returnType, SNode node, String methodName, Class[] parametersTypes, Object... parameters) {
    return ConceptRegistry.getInstance().getBehaviorDescriptorForInstanceNode(node).invoke(returnType, node, methodName, parametersTypes, parameters);
  }

  public <T> T invokeSuper(Class<T> returnType, SNode node, String callerConceptFqName, String methodName, Class[] parametersTypes, Object... parameters) {
    return ConceptRegistry.getInstance().getBehaviorDescriptorForInstanceNode(node).invokeSuper(returnType, node, callerConceptFqName, methodName, parametersTypes, parameters);
  }
}
