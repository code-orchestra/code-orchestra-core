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
package jetbrains.mps.ide.findusages.view.optionseditor;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import jetbrains.mps.ide.findusages.view.optionseditor.options.BaseOptions;
import org.jdom.Element;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class FindUsagesOptions implements Cloneable {
  private static final String OPTION = "option";
  private static final String CLASS_NAME = "class_name";

  private Map<Class, BaseOptions> myOptions = new LinkedHashMap<Class, BaseOptions>();

  public FindUsagesOptions(Element element, Project project) throws CantLoadSomethingException {
    read(element, project);
  }

  public FindUsagesOptions(BaseOptions... options) {
    for (BaseOptions o : options) {
      myOptions.put(o.getClass(), o);
    }
  }

  public FindUsagesOptions clone() {
    List<BaseOptions> optionsCopy = new ArrayList<BaseOptions>(myOptions.size());
    for (BaseOptions option : myOptions.values()) {
      optionsCopy.add(option.clone());
    }
    return new FindUsagesOptions((BaseOptions[]) optionsCopy.toArray());
  }

  public void setOption(BaseOptions options) {
    myOptions.put(options.getClass(), options);
  }

  public <T> T getOption(Class<T> optionClass) {
    return (T) myOptions.get(optionClass);
  }

  public void read(Element element, Project project) throws CantLoadSomethingException {
    for (Element optionXML : (List<Element>) element.getChildren(OPTION)) {
      String className = optionXML.getAttribute(CLASS_NAME).getValue();
      try {
        Object o = Class.forName(className).getConstructor(Element.class, Project.class).newInstance(optionXML, project);
        myOptions.put(o.getClass(), (BaseOptions) o);
      } catch (InvocationTargetException e) {
        if (e.getCause() instanceof CantLoadSomethingException) {
          throw (CantLoadSomethingException) e.getCause();
        } else {
          throwLoadException(e, className);
        }
      } catch (ClassNotFoundException e) {
        throwLoadException(e, className);
      } catch (IllegalAccessException e) {
        throwLoadException(e, className);
      } catch (InstantiationException e) {
        throwLoadException(e, className);
      } catch (NoSuchMethodException e) {
        throwLoadException(e, className);
      } catch (Throwable t) {
        throwLoadException(t, className);
      }
    }
  }

  private void throwLoadException(Throwable t, String className) throws CantLoadSomethingException {
    throw new CantLoadSomethingException("can't instantiate options " + className, t);
  }

  public void write(Element element, Project project) throws CantSaveSomethingException {
    for (BaseOptions option : myOptions.values()) {
      Element optionXML = new Element(OPTION);
      optionXML.setAttribute(CLASS_NAME, option.getClass().getName());
      option.write(optionXML, project);
      element.addContent(optionXML);
    }
  }
}
