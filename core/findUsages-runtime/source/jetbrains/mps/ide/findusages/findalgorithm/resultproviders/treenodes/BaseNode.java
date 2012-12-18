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

import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import jetbrains.mps.ide.findusages.model.IResultProvider;
import jetbrains.mps.ide.findusages.model.SearchQuery;
import jetbrains.mps.ide.findusages.model.SearchResult;
import jetbrains.mps.ide.findusages.model.SearchResults;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.IScope;
import org.jdom.Element;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * NOTE: all nodes except UnionNode MUST have <2 children
 */
public abstract class BaseNode implements IResultProvider {
  private static final Logger LOG = Logger.getLogger(BaseNode.class);

  private static final String CHILDREN = "children";

  protected BaseNode myParent;
  protected List<BaseNode> myChildren = new ArrayList<BaseNode>();

  public BaseNode() {

  }

  //----TREE STUFF----

  public void setParent(BaseNode parent) {
    myParent = parent;
  }

  public BaseNode getParent() {
    return myParent;
  }

  public void addChild(BaseNode child) {
    myChildren.add(child);
  }

  public void removeChild(BaseNode child) {
    myChildren.remove(child);
  }

  public void clearChildren() {
    myChildren.clear();
  }

  public List<BaseNode> getChildren() {
    return Collections.unmodifiableList(myChildren);
  }

  public boolean isRoot() {
    return myParent == null;
  }

  //----SEARCH STUFF----

  public SearchResults getResults(SearchQuery query, @Nullable ProgressIndicator indicator) {
//    assert !ThreadUtils.isEventDispatchThread();

    if (indicator == null) indicator = new EmptyProgressIndicator();

    SearchResults results = doGetResults(query, indicator);

    //no null pointer exception will occur!!
    if (results.getSearchedNodes().contains(null)) {
      LOG.error("GetResults returned nodes containing null, which means that some of your filters and finders is incorrect");
      results.getSearchedNodes().remove(null);
    }
    boolean error = false;
    for (SearchResult result : (List<SearchResult>) results.getSearchResults()) {
      if (result.getObject() == null) {
        LOG.error("GetResults returned results containing null, which means that some of your filters and finders is incorrect");
        error = true;
      }
    }
    if (error) {
      List<SearchResult> newResults = new ArrayList<SearchResult>();
      for (SearchResult result : (List<SearchResult>) results.getSearchResults()) {
        if (result.getObject() != null) {
          newResults.add(result);
        }
      }
      results = new SearchResults(results.getSearchedNodes(), newResults);
    }

    return results;
  }

  public abstract SearchResults doGetResults(SearchQuery query, ProgressIndicator indicator);

  public long getEstimatedTime(IScope scope) {
    long sumTime = 0;
    for (BaseNode child : myChildren) {
      sumTime = sumTime + child.getEstimatedTime(scope);
    }
    return sumTime;
  }

  //----SAVE/LOAD STUFF----

  public void write(Element element, Project project) throws CantSaveSomethingException {
    Element childrenXML = new Element(CHILDREN);
    for (BaseNode child : myChildren) {
      Element childXML = new Element(child.getClass().getName());
      child.write(childXML, project);
      childrenXML.addContent(childXML);
    }
    element.addContent(childrenXML);
  }

  public void read(Element element, Project project) throws CantLoadSomethingException {
    Element childrenXML = element.getChild(CHILDREN);
    for (Element childXML : (List<Element>) childrenXML.getChildren()) {
      try {
        BaseNode child = (BaseNode) Class.forName(childXML.getName()).newInstance();
        child.read(childXML, project);
        myChildren.add(child);
        child.setParent(this);
      } catch (Throwable t) {
        throw new CantLoadSomethingException("Error while instantiating node: " + t.getMessage(), t);
      }
    }
  }
}
