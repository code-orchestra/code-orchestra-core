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
package jetbrains.mps.ide.findusages.view.optionseditor.options;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.findalgorithm.finders.GeneratedFinder;
import jetbrains.mps.ide.findusages.findalgorithm.finders.IFinder;
import jetbrains.mps.ide.findusages.findalgorithm.finders.ReloadableFinder;
import jetbrains.mps.ide.findusages.model.IResultProvider;
import jetbrains.mps.ide.findusages.view.FindUtils;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.LanguageAspect;
import jetbrains.mps.util.NameUtil;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FindersOptions extends BaseOptions {
  private static final Logger LOG = Logger.getLogger(FindersOptions.class);

  private static final String FINDERS = "finders";
  private static final String FINDER = "finder";
  private static final String CLASS_NAME = "class_name";

  @NotNull
  private List<String> myFindersClassNames = new ArrayList<String>();

  public FindersOptions(Element element, Project project) throws CantLoadSomethingException {
    read(element, project);
  }

  public FindersOptions(String... findersClassNames) {
    myFindersClassNames = new ArrayList(Arrays.asList(findersClassNames));
  }

  public FindersOptions clone() {
    FindersOptions result = new FindersOptions();
    result.myFindersClassNames.addAll(myFindersClassNames);
    return result;
  }

  @NotNull
  public List<String> getFindersClassNames() {
    return myFindersClassNames;
  }

  public void setFindersClassNames(@NotNull List<String> findersClassNames) {
    myFindersClassNames = findersClassNames;
  }

  public IResultProvider getResult() {
    List<IFinder> finders = new ArrayList<IFinder>();
    for (String finderClassName : myFindersClassNames) {
      String languageNamespacePlusFindUsages = NameUtil.namespaceFromLongName(finderClassName);
      String aspectEnding = "." + LanguageAspect.FIND_USAGES.getName();
      assert languageNamespacePlusFindUsages.endsWith(aspectEnding);
      String languageNamespace = languageNamespacePlusFindUsages.substring(0, languageNamespacePlusFindUsages.length() - aspectEnding.length());

      Language l = GlobalScope.getInstance().getLanguage(languageNamespace);

      if (l == null) {
        LOG.error("Can't find a language " + languageNamespace);
        continue;
      }

      Class finderClass = l.getClass(finderClassName);
      if (finderClass != null) {
        try {
          IFinder finder = (IFinder) finderClass.newInstance();
          if (finder instanceof GeneratedFinder) {
            finder = new ReloadableFinder(l.getModuleReference(), (GeneratedFinder) finder);
          }
          finders.add(finder);
        } catch (Throwable t) {
          LOG.error(t);
        }
      } else {
        LOG.warning("Can't find a class " + finderClassName + " in " + languageNamespace + ". The finder is disabled.");
      }
    }
    return FindUtils.makeProvider(finders);
  }

  public void write(Element element, Project project) {
    Element findersXML = new Element(FINDERS);
    for (String finderClassName : myFindersClassNames) {
      Element finderXML = new Element(FINDER);
      finderXML.setAttribute(CLASS_NAME, finderClassName);
      findersXML.addContent(finderXML);
    }
    element.addContent(findersXML);
  }

  public void read(Element element, Project project) {
    Element findersXML = element.getChild(FINDERS);
    for (Element finderXML : (List<Element>) findersXML.getChildren(FINDER)) {
      String finderName = finderXML.getAttribute(CLASS_NAME).getValue();
      myFindersClassNames.add(finderName);
    }
  }
}
