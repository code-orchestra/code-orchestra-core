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
import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.components.ComponentsUtil;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import jetbrains.mps.ide.findusages.model.SearchResult;
import jetbrains.mps.ide.findusages.view.treeholder.tree.TextOptions;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.INodeRepresentator;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.path.PathItemRole;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.SNodeUtil;
import org.apache.commons.lang.StringEscapeUtils;
import org.jdom.Element;

import javax.swing.Icon;
import java.util.List;

public class NodeNodeData extends BaseNodeData {
  private static final Logger LOG = Logger.getLogger(NodeNodeData.class);

  private static final String NODE = "node";

  private SNodePointer myNodePointer;

  public NodeNodeData(PathItemRole role, SNode node, boolean isResultNode, INodeRepresentator nodeRepresentator, boolean resultsSection) {
    super(
      role,
      (isResultNode && nodeRepresentator != null) ?
        nodeRepresentator.getPresentation(node) :
        snodeRepresentation(node),
      nodeAdditionalInfo(node),
      false,
      isResultNode,
      resultsSection
    );
    myNodePointer = new SNodePointer(node);
  }

  public NodeNodeData(PathItemRole role, SearchResult result, boolean isResultNode, INodeRepresentator nodeRepresentator, boolean resultsSection) {
    super(
      role,
      (isResultNode && nodeRepresentator != null) ?
        nodeRepresentator.getPresentation(result.getObject()) :
        snodeRepresentation((SNode) result.getPathObject()),
      nodeAdditionalInfo((SNode) result.getPathObject()),
      false,
      isResultNode,
      resultsSection
    );
    myNodePointer = new SNodePointer((SNode) result.getPathObject());
  }

  public NodeNodeData(Element element, Project project) throws CantLoadSomethingException {
    read(element, project);
  }

  public SNodePointer getNodePointer() {
    return myNodePointer;
  }

  public SNode getNode() {
    return (SNode) getIdObject();
  }

  public Icon getIcon() {
    if (myNodePointer.getNode() == null) return null;
    return IconManager.getIconFor(myNodePointer.getNode());
  }

  public Object getIdObject() {
    return myNodePointer.getNode();
  }

  public void write(Element element, Project project) throws CantSaveSomethingException {
    super.write(element, project);
    Element nodeXML = new Element(NODE);
    if (myNodePointer.getNode() != null) {
      nodeXML.addContent(ComponentsUtil.nodeToElement(myNodePointer.getNode()));
    }
    element.addContent(nodeXML);
  }

  public void read(Element element, Project project) throws CantLoadSomethingException {
    super.read(element, project);
    List children = element.getChild(NODE).getChildren();
    myNodePointer = new SNodePointer((SNode)null);
    if (!children.isEmpty()) {
      myNodePointer = ComponentsUtil.nodePointerFromElement((Element) children.get(0));
    }
  }

  public static String snodeRepresentation(final SNode node) {
    return ModelAccess.instance().runReadAction(new Computable<String>() {
      public String compute() {
        try {
          String presentation = SNodeUtil.getPresentation(node);
          String result = (presentation != null) ? presentation : node.toString();
          LOG.assertLog(result != null);
          result = StringEscapeUtils.escapeHtml(result);
          return result;
        } catch (Throwable t) {
          LOG.error(t);
          return "Exception was thrown during node representation calculation " + t.getMessage();
        }
      }
    });
  }

  public static String nodeAdditionalInfo(final SNode node) {
    return ModelAccess.instance().runReadAction(new Computable<String>() {
      public String compute() {
        if (node.getParent() == null) return "";
        return "role: " +
          "<i>" +
          StringEscapeUtils.escapeHtml(node.getRole_()) +
          "</i>" +
          "; " +
          "in: " +
          "<i>" +
          snodeRepresentation(node.getParent()) +
          "</i>";
      }
    });
  }

  public String getText(TextOptions options) {
    boolean showCounter = options.myCounters && isResultsSection();
    String counter = showCounter ? " " + sizeRepresentation(options.mySubresultsCount) : "";
    return super.getText(options) + counter;
  }

  private static String sizeRepresentation(int size) {
    return "<font color='gray'>(" + Integer.toString(size) + ")</font>";
  }
}
