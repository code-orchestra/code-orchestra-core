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
package jetbrains.mps.ide.findusages.findalgorithm.resultproviders.treenodes;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import jetbrains.mps.ide.findusages.findalgorithm.filters.BaseFilter;
import jetbrains.mps.ide.findusages.model.SearchQuery;
import jetbrains.mps.ide.findusages.model.SearchResults;
import jetbrains.mps.ide.progress.TaskProgressSettings;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.ModelAccess;
import org.jdom.Element;

public class FilterNode extends BaseNode {
  private static final String FILTER = "filter";
  private static final String CLASS_NAME = "class_name";

  private static final Logger LOG = Logger.getLogger(FilterNode.class);

  private BaseFilter myFilter = null;

  public FilterNode() {

  }

  public FilterNode(BaseFilter filter) {
    myFilter = filter;
  }

  public void addChild(BaseLeaf child) {
    assert (myChildren.isEmpty());
    super.addChild(child);
  }

  public String getTaskName() {
    return myFilter.getDescription();
  }

  public String getTaskKind() {
    return "filter";
  }

  public SearchResults doGetResults(final SearchQuery query, final ProgressIndicator indicator) {
    indicator.setText(getTaskName() + " started");
    //indicator.startTask(getTaskName(), getTaskKind());
    final SearchResults[] results = new SearchResults[1];
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        SearchResults childRes = myChildren.get(0).getResults(query, indicator);
        try {
          results[0] = myFilter.filter(childRes);
        } catch (Throwable t) {
          LOG.error(t.getMessage(), t);
          results[0] = childRes;
        }
      }
    });
    //indicator.finishTask(getTaskName());

    return results[0];
  }

  public long getEstimatedTime(IScope scope) {
    return TaskProgressSettings.getInstance().getEstimatedTimeMillis(getTaskName());
  }

  public void write(Element element, Project project) throws CantSaveSomethingException {
    super.write(element, project);
    Element filterXML = new Element(FILTER);
    filterXML.setAttribute(CLASS_NAME, myFilter.getClass().getName());
    element.addContent(filterXML);
  }

  public void read(Element element, Project project) throws CantLoadSomethingException {
    super.read(element, project);
    Element filterXML = element.getChild(FILTER);
    String filterName = filterXML.getAttribute(CLASS_NAME).getValue();
    try {
      Class filterClass = null;
      for (Language l : project.getComponent(MPSProject.class).getProjectModules(Language.class)) {
        filterClass = l.getClass(filterName);
        if (filterClass != null) break;
      }
      if (filterClass == null) {
        try {
          filterClass = Class.forName(filterName);
        } catch (ClassNotFoundException e) {
          filterClass = null;
        }
      }
      if (filterClass != null) {
        myFilter = (BaseFilter) filterClass.newInstance();
      } else {
        throw new CantLoadSomethingException("Can't find filter class " + filterName);
      }
    } catch (Throwable t) {
      throw new CantLoadSomethingException("Can't instantiate or read filter " + filterName, t);
    }
  }
}
