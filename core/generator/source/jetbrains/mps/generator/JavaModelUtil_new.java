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
package jetbrains.mps.generator;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.Nullable;

public class JavaModelUtil_new {
  private static final Logger LOG = Logger.getLogger(JavaModelUtil_new.class);

  @Nullable
  public static SNode findClassifier(Class cls) {
    String name = cls.getName();
    String rootName = NameUtil.shortNameFromLongName(name);
    String modelName = NameUtil.namespaceFromLongName(name);
    return findClassifier(modelName, rootName);
  }

  public static SNode findClassifier(String packageName, String shortClassName) {
    return findClassifier(packageName, shortClassName, false);
  }

  public static SNode findClassifier(String packageName, String shortClassName, boolean reportErrors) {
    SModelFqName fqName = new SModelFqName(packageName, SModelStereotype.getStubStereotypeForId(LanguageID.JAVA));
    SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(fqName);
    if (modelDescriptor == null) {
      if (reportErrors) LOG.error("couldn't find model '" + fqName + "'");
      return null;
    }
    SModel model = modelDescriptor.getSModel();
    SNode rootByName = SModelOperations.getRootByName(model, shortClassName);
    if (rootByName == null && reportErrors) {
      LOG.error("couldn't find root '" + shortClassName + "' in model '" + fqName + "'");
    }
    return rootByName;
  }

//  public static InstanceMethodDeclaration findMethod(Classifier classifier, String methodName, String[] parmTypes) {
//    Iterator<InstanceMethodDeclaration> methods = classifier.methods();
//    while (methods.hasNext()) {
//      InstanceMethodDeclaration method = methods.next();
//      if (methodName.equals(method.getName())) {
//        if (areParametersCompatible(method, parmTypes)) {
//          return method;
//        }
//      }
//    }
//    if (classifier instanceof ClassConcept) {
//      ClassConcept extendedClass = BaseLanguageUtil.getSuperclass((ClassConcept) classifier);
//      if (extendedClass != null) {
//        InstanceMethodDeclaration method = findMethod(extendedClass, methodName, parmTypes);
//        if (method != null) {
//          return method;
//        }
//      }
//    }
//
//    Iterator<ClassifierType> interfaces;
//    if (classifier instanceof Interface) {
//      interfaces = ((Interface) classifier).extendedInterfaces();
//    } else if (classifier instanceof ClassConcept) {
//      interfaces = ((ClassConcept) classifier).implementedInterfaces();
//    } else {
//      throw new RuntimeException("This can't happen");
//    }
//
//    while (interfaces.hasNext()) {
//      ClassifierType classifierType = interfaces.next();
//      InstanceMethodDeclaration method = findMethod(classifierType.getClassifier(), methodName, parmTypes);
//      if (method != null) {
//        return method;
//      }
//    }
//    return null;
//  }

//  public static StaticMethodDeclaration findStaticMethod(Classifier classifier, String methodName, String[] parmTypes) {
//    if (!(classifier instanceof ClassConcept)) return null;
//    ClassConcept javaClass = (ClassConcept) classifier;
//    while (javaClass != null) {
//      Iterator<StaticMethodDeclaration> methods = javaClass.staticMethods();
//      while (methods.hasNext()) {
//        StaticMethodDeclaration method = methods.next();
//        if (methodName.equals(method.getName())) {
//          if (areParametersCompatible(method, parmTypes)) {
//            return method;
//          }
//        }
//      }
//      javaClass = getSuperclass(javaClass);
//    }
//    return null;
//  }

//  private static boolean areParametersCompatible(BaseMethodDeclaration method, String[] parmTypes) {
//    int parametersCount = method.getParametersCount();
//    if (parametersCount == 0 && parmTypes.length == 0) {
//      return true;
//    } else if (parametersCount != parmTypes.length) {
//      return false;
//    }
//    int count = 0;
//    for (Iterator<ParameterDeclaration> parms = method.properties(); parms.hasNext(); count++) {
//      Type parmType = parms.next().getType();
//      // hack ?
//      if (parmType instanceof TypeVariableReference) {
//        // compatible to any type
//        if (parmTypes[count] != null) continue;
//      }
//      if (parmTypes[count] != null && parmType.getName() != null &&
//              !parmTypes[count].equals(parmType.getName())) {
//        return false;
//      }
//    }
//    return true;
//  }
//  public static FieldDeclaration findField(Classifier classifier, String fieldName) {
//    if (!(classifier instanceof ClassConcept)) return null;
//    ClassConcept classConcept = (ClassConcept) classifier;
//    while (classConcept != null) {
//      Iterator<FieldDeclaration> fields = classConcept.fields();
//      while (fields.hasNext()) {
//        FieldDeclaration field = fields.next();
//        if (fieldName.equals(field.getName())) {
//          return field;
//        }
//      }
//      classConcept = getSuperclass(classConcept);
//    }
//    return null;
//  }
//
//  public static StaticFieldDeclaration findStaticField(Classifier classifier, String constantName) {
//    if (classifier == null) return null;
//
//    Iterator<StaticFieldDeclaration> fields = classifier.staticFields();
//    while (fields.hasNext()) {
//      StaticFieldDeclaration field = fields.next();
//      if (constantName.equals(field.getName())) {
//        return field;
//      }
//    }
//
//    if (classifier instanceof ClassConcept) {
//      StaticFieldDeclaration staticField = findStaticField(getSuperclass((ClassConcept) classifier), constantName);
//      if (staticField != null) {
//        return staticField;
//      }
//
//      Iterator<ClassifierType> iterator = ((ClassConcept) classifier).implementedInterfaces();
//      while (iterator.hasNext()) {
//        ClassifierType classifierType = iterator.next();
//        staticField = findStaticField(classifierType.getClassifier(), constantName);
//        if (staticField != null) {
//          return staticField;
//        }
//      }
//    } else {
//      Iterator<ClassifierType> iterator = ((Interface) classifier).extendedInterfaces();
//      while (iterator.hasNext()) {
//        ClassifierType classifierType = iterator.next();
//        StaticFieldDeclaration staticField = findStaticField(classifierType.getClassifier(), constantName);
//        if (staticField != null) {
//          return staticField;
//        }
//      }
//    }
//    return null;
//  }
//
//  public static ClassConcept getSuperclass(ClassConcept subClass) {
//    ClassifierType superclass = subClass.getSuperclass();
//    if (superclass != null) {
//      return (ClassConcept) superclass.getClassifier();
//    }
//    return null;
//  }
}
