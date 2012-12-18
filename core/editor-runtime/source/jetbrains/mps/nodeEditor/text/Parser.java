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
package jetbrains.mps.nodeEditor.text;

import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.MPSModuleRepository;

import java.lang.reflect.Method;
import java.util.List;

public class Parser {
  public static List<SNode> parse(String input, SModel model, String languageNamespace) {
    Class cls;
    try {
      Language l = (Language) MPSModuleRepository.getInstance().getModuleByUID(languageNamespace);
      String name = languageNamespace + ".parser.Parser";
      cls = l.getClass(name);
    } catch (Exception e) {
      return null;
    }
    try {
      Method m = cls.getMethod("parse", String.class, SModel.class);
      return (List<SNode>) m.invoke(null, input, model);
    } catch (Exception e) {
      return null;
    }
  }
}
