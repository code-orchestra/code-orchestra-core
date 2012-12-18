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
package jetbrains.mps.build.ant;

import junit.framework.TestCase;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;
import java.util.Collections;
import java.util.LinkedHashMap;

public class WhatToDoSerializationConsistencyTest extends TestCase {

  public void testCloningConcistencyWithProjects() {
    WhatToDo toDo = new WhatToDo();

    toDo.addProjectFile(new File("languages/util/buildlanguage/BuildLanguage.mpr").getAbsoluteFile(), "blahblahblah1", "blahblahblah2");
    toDo.addProjectFile(new File("languages/util/bash/jetbrains.mps.bash.mpr").getAbsoluteFile(), "blahblahblah1");
    toDo.addProjectFile(new File("languages/util/regexp/regexp.mpr").getAbsoluteFile());

    testToDoConsistency(toDo);
  }

  public void testCloningConcistencyWithModels() {
    WhatToDo toDo = new WhatToDo();

    toDo.addModelFile(new File("languages/util/regexp/languageModels/editor.mps").getAbsoluteFile());
    toDo.addModelFile(new File("languages/util/regexp/languageModels/structure.mps").getAbsoluteFile());
    toDo.addModelFile(new File("languages/util/regexp/languageModels/typesystem.mps").getAbsoluteFile());

    testToDoConsistency(toDo);
  }

  public void testCloningConcistencyWithModules() {
    WhatToDo toDo = new WhatToDo();

    toDo.addModuleFile(new File("languages/util/regexp/solutions/jetbrains.mps.regexp.examples/jetbrains.mps.regexp.examples.msd").getAbsoluteFile());
    toDo.addModuleFile(new File("languages/util/regexp/solutions/jetbrains.mps.regexp.sandbox/jetbrains.mps.regexp.sandbox.msd").getAbsoluteFile());
    toDo.addModuleFile(new File("languages/util/regexp/solutions/jetbrains.mps.regexp.unittest/jetbrains.mps.regexp.unittest.msd").getAbsoluteFile());

    testToDoConsistency(toDo);
  }

  public void testCloningConcistencyWithLibraries() {
    WhatToDo toDo = new WhatToDo();

    toDo.addLibrary("name1", new File("dir1").getAbsoluteFile(), false);
    toDo.addLibrary("name2", new File("dir3").getAbsoluteFile(), true);
    toDo.addLibrary("name3", new File("dir4").getAbsoluteFile(), false);

    testToDoConsistency(toDo);
  }

  public void testCloningConcistencyWithMacro() {
    WhatToDo toDo = new WhatToDo();

    toDo.addMacro("name1", "value1");
    toDo.addMacro("name2", "value2");
    toDo.addMacro("name3", "value3");

    testToDoConsistency(toDo);
  }

  public void testCloningConcistencyWithOtherParameters() {
    WhatToDo toDo = new WhatToDo();

    toDo.updateFailOnError(true);
    toDo.updateLogLevel(239);
    LinkedHashMap<String, String> properties = new LinkedHashMap<String, String>();
    properties.put("name1", "value1");
    properties.put("name2", "value2");
    properties.put("name3", "value3");
    properties.put("name4", "value4");
    toDo.updateProperties(properties);

    testToDoConsistency(toDo);
  }

  private void testToDoConsistency(WhatToDo toDo) {
    WhatToDo toDoFromString = WhatToDo.fromCommandLine(toDo.toString());
    WhatToDo toDoCloned = new WhatToDo();
    toDo.cloneTo(toDoCloned);

    try {
      assertEquals(toDoCloned.toString(), toDoFromString.toString());
      assertDeepObjectEquals(toDoCloned, toDoFromString);
      assertEquals(toDo.toString(), toDoFromString.toString());
      assertDeepObjectEquals(toDo, toDoFromString);
      assertEquals(toDoCloned.toString(), toDo.toString());
      assertDeepObjectEquals(toDoCloned, toDo);
    } catch (IllegalAccessException e) {
      fail(e.getMessage());
    } catch (InvocationTargetException e) {
      fail(e.getMessage());
    }
  }

  private void assertDeepObjectEquals(Object obj1, Object obj2) throws IllegalAccessException, InvocationTargetException {
    assertEquals(obj1.getClass(), obj2.getClass());

    // check fields
    Field[] fields = obj1.getClass().getFields();
    for (Field f : fields) {
      assertEquals("Values of field " + f.getName() + " are different.", f.get(obj1), f.get(obj2));
    }

    // some fields are not public => access them with public methods of shape "getXXX"

    Method[] methods = obj1.getClass().getMethods();
    for (Method m : methods) {
      if (m.getReturnType().equals(void.class)) continue;
      if (!m.getName().startsWith("get")) continue;
      if (m.getParameterTypes().length > 0) continue;

      Object result1 = m.invoke(obj1);
      Object result2 = m.invoke(obj2);

      assertEquals("Results of invoking method " + m.getName() + " are different.", result1, result2);
    }
  }

}
