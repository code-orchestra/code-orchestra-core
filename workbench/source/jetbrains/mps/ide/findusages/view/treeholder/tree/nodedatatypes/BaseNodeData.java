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
package jetbrains.mps.ide.findusages.view.treeholder.tree.nodedatatypes;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import jetbrains.mps.ide.findusages.IExternalizeable;
import jetbrains.mps.ide.findusages.view.treeholder.tree.TextOptions;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.path.PathItemRole;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;

public abstract class BaseNodeData implements IExternalizeable {
  private static final String EXPANDED = "expanded";
  private static final String CAPTION = "caption";
  private static final String INFO = "info";
  private static final String EXCLUDED = "excluded";
  private static final String RESULTS_SECTION = "results_section";
  private static final String ISRESULT = "isresult";
  private static final String ROLE = "role";

  private PathItemRole myRole;
  private String myCaption;
  private String myAdditionalInfo;
  private boolean myResultsSection;
  private boolean myIsExcluded;
  private boolean myIsExpanded;
  private boolean myIsResultNode;

  protected BaseNodeData() {

  }

  public BaseNodeData(Element element, Project project) throws CantLoadSomethingException {
    read(element, project);
  }

  public BaseNodeData(PathItemRole role, @NotNull String caption, String additionalInfo, boolean isExpanded, boolean isResultNode, boolean resultsSection) {
    myRole = role;
    myCaption = caption;
    myAdditionalInfo = additionalInfo;
    myResultsSection = resultsSection;
    myIsExcluded = false;
    myIsExpanded = isExpanded;
    myIsResultNode = isResultNode;
  }

  //----MAIN DATA STUFF----

  //must be used only via DataTree

  public void setExcluded(boolean isExcluded) {
    myIsExcluded = isExcluded;
  }

  //must be used only via DataTree
  public void setExpanded(boolean isExpanded) {
    myIsExpanded = isExpanded;
  }

  public boolean isResultsSection() {
    return myResultsSection;
  }

  public boolean isExcluded() {
    return myIsExcluded;
  }

  public boolean isExpanded() {
    return myIsExpanded;
  }

  public PathItemRole getRole() {
    return myRole;
  }

  public String getText(TextOptions options) {
    String add = "";
    if (options.myAdditionalInfo && !myAdditionalInfo.equals("")) {
      add = "(" + myAdditionalInfo + ")";
    }
    return myCaption + add;
  }

  public String getPlainText() {
    return myCaption.replaceAll("<[^>]*>", "");
  }

  public boolean isInvalid() {
    return getIdObject() == null;
  }

  public boolean isResultNode() {
    return myIsResultNode;
  }

  public void setIsResultNode_internal(boolean isResult) {
    myIsResultNode = isResult;
  }

  //----SAVE/LOAD STUFF----

  public void write(Element element, Project project) throws CantSaveSomethingException {
    element.setAttribute(CAPTION, myCaption);
    element.setAttribute(INFO, myAdditionalInfo);
    element.setAttribute(EXCLUDED, Boolean.toString(myIsExcluded));
    element.setAttribute(EXPANDED, Boolean.toString(myIsExpanded));
    element.setAttribute(ISRESULT, Boolean.toString(myIsResultNode));
    element.setAttribute(RESULTS_SECTION, Boolean.toString(myResultsSection));

    Element roleXML = new Element(ROLE);
    PathItemRole.write(myRole, roleXML);
    element.addContent(roleXML);
  }

  public void read(Element element, Project project) throws CantLoadSomethingException {
    myCaption = element.getAttributeValue(CAPTION);
    myAdditionalInfo = element.getAttributeValue(INFO);
    myIsExcluded = Boolean.parseBoolean(element.getAttributeValue(EXCLUDED));
    myIsExpanded = Boolean.parseBoolean(element.getAttributeValue(EXPANDED));
    myIsResultNode = Boolean.parseBoolean(element.getAttributeValue(ISRESULT));
    myResultsSection = Boolean.parseBoolean(element.getAttributeValue(RESULTS_SECTION));

    Element roleXML = element.getChild(ROLE);
    myRole = PathItemRole.read(roleXML);
  }

  //----CONCRETE DATA TYPE STUFF----

  public abstract Icon getIcon();

  public abstract Object getIdObject();
}
