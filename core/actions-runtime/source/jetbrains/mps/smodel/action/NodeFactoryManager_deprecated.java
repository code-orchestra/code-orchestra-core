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

import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.NameUtil;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * author: Igor Alshannikov
 * Sep 20, 2006
 */
/*package*/ class NodeFactoryManager_deprecated {
  private static final Logger LOG = Logger.getLogger(NodeFactoryManager_deprecated.class);

  protected static void setupNode_deprecated(SNode concept, SNode node, SNode sampleNode) {
    Class factoryClass = getFactoryClass(concept);
    if (factoryClass == null) {
      return;
    }

    // try new 'setup method'
    Method method = getSetupMethod_new(factoryClass, node);
    if (method != null) {
      try {
        method.invoke(null, node, sampleNode);
      } catch (IllegalAccessException e) {
        LOG.error(e);
      } catch (InvocationTargetException e) {
        LOG.error(e);
      }
      return;
    }

    // try old 'instantiate method'
    method = getSetupMethod_old(factoryClass, node);
    if (method != null) {
      try {
        method.invoke(null, node);
      } catch (IllegalAccessException e) {
        LOG.error(e);
      } catch (InvocationTargetException e) {
        LOG.error(e);
      }
    }
  }

  private static Class getFactoryClass(SNode conceptDeclaration) {
    String languageNamespace = NameUtil.namespaceFromConceptFQName(NameUtil.nodeFQName(conceptDeclaration));
    Language language = MPSModuleRepository.getInstance().getLanguage(languageNamespace);
    assert language != null;
    return language.getClass(languageNamespace + ".Factory");
  }

  private static Method getSetupMethod_new(Class factoryClass, SNode node) {
    Class newNodeClass = node.getClass();
    while (newNodeClass != SNode.class) {
      String methodName = "setup_" + NameUtil.shortNameFromLongName(newNodeClass.getName());
      try {
        return factoryClass.getMethod(methodName, newNodeClass, SNode.class);
      } catch (NoSuchMethodException e) {
        // ok
      }
//      //test
//      Method declaredMethod = factoryClass.getDeclaredMethods()[1];
//      Class<?>[] parameterTypes = declaredMethod.getParameterTypes();
//      if(newNodeClass == parameterTypes[0]) {
//        System.out.println("OK");
//      }
//      if(sNodeClass == parameterTypes[1]) {
//        System.out.println("OK");
//      }
//      //test
      newNodeClass = newNodeClass.getSuperclass();
    }
    return null;
  }

  private static Method getSetupMethod_old(Class factoryClass, SNode node) {
    Class nodeClass = node.getClass();
    while (nodeClass != SNode.class) {
      String methodName = "instantiate" + NameUtil.shortNameFromLongName(nodeClass.getName());
      try {
        return factoryClass.getMethod(methodName, node.getClass());
      } catch (NoSuchMethodException e) {
        // ok
      }
      nodeClass = nodeClass.getSuperclass();
    }
    return null;
  }
}
