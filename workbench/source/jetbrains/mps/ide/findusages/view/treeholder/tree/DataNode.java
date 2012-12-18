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
package jetbrains.mps.ide.findusages.view.treeholder.tree;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import jetbrains.mps.ide.findusages.IExternalizeable;
import jetbrains.mps.ide.findusages.view.treeholder.tree.nodedatatypes.BaseNodeData;
import jetbrains.mps.ide.findusages.view.treeholder.tree.nodedatatypes.ModelNodeData;
import jetbrains.mps.ide.findusages.view.treeholder.tree.nodedatatypes.NodeNodeData;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.Condition;
import org.jdom.Element;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class DataNode implements IExternalizeable {
  private static final Logger LOG = Logger.getLogger(DataNode.class);

  private static final String CHILDREN = "children";
  private static final String CHILD = "child";
  private static final String DATA = "data";
  private static final String DATA_CLASS = "data_class";

  private BaseNodeData myData;
  private ArrayList<DataNode> myChildren = new ArrayList<DataNode>();

  public DataNode(BaseNodeData data) {
    myData = data;
  }

  public DataNode(Element element, Project project) throws CantLoadSomethingException {
    read(element, project);
  }

  public BaseNodeData getData() {
    return myData;
  }

  public List<DataNode> getDescendantsWithCondition(Condition<BaseNodeData> c) {
    List<DataNode> result = new ArrayList<DataNode>();
    if (c.met(myData)) result.add(this);
    for (DataNode child : getChildren()) {
      result.addAll(child.getDescendantsWithCondition(c));
    }
    return result;
  }

  public List<DataNode> getDescendantsByDataClass(final Class dataClass) {
    return getDescendantsWithCondition(new Condition<BaseNodeData>() {
      public boolean met(BaseNodeData data) {
        return dataClass.isInstance(data);
      }
    });
  }

  public boolean containsNodes(Class dataClass) {
    return !getDescendantsByDataClass(dataClass).isEmpty();
  }

  //-------DATA QUERY--------

  public List<SModelDescriptor> getIncludedModels() {
    List<SModelDescriptor> models = new ArrayList<SModelDescriptor>();
    if (myData instanceof ModelNodeData) {
      if (!myData.isInvalid() && !myData.isExcluded()) {
        models.add(((SModel) myData.getIdObject()).getModelDescriptor());
      }
    }
    for (DataNode child : myChildren) {
      models.addAll(child.getIncludedModels());
    }
    return models;
  }

  public List<SModelDescriptor> getAllModels() {
    List<DataNode> modelNodes = getDescendantsWithCondition(new Condition<BaseNodeData>() {
      public boolean met(BaseNodeData nodeData) {
        return nodeData instanceof ModelNodeData;
      }
    });

    List<SModelDescriptor> result = new ArrayList<SModelDescriptor>();
    for (DataNode node : modelNodes) {
      SModel model = (SModel) ((ModelNodeData) node.getData()).getIdObject();
      if (model != null) result.add(model.getModelDescriptor());
    }
    return result;
  }

  public List<SNodePointer> getIncludedResultNodes() {
    List<SNodePointer> nodes = new ArrayList<SNodePointer>();
    if (myData instanceof NodeNodeData) {
      if (!myData.isInvalid() && !myData.isExcluded() && myData.isResultNode()) {
        nodes.add(new SNodePointer((SNode) myData.getIdObject()));
      }
    }
    for (DataNode child : myChildren) {
      nodes.addAll(child.getIncludedResultNodes());
    }
    return nodes;
  }

  public List<SNodePointer> getAllResultNodes() {
    List<DataNode> nodeNodes = getDescendantsWithCondition(new Condition<BaseNodeData>() {
      public boolean met(BaseNodeData nodeData) {
        return nodeData instanceof NodeNodeData && nodeData.isResultNode();
      }
    });
    List<SNodePointer> result = new ArrayList<SNodePointer>();
    for (DataNode node : nodeNodes) {
      SNode n = (SNode) ((NodeNodeData) node.getData()).getIdObject();
      if (n != null) result.add(new SNodePointer(n));
    }
    return result;
  }

  //-------CHILD MANIPULATION--------

  public void add(DataNode o) {
    myChildren.add(o);
  }

  public List<DataNode> getChildren() {
    return Collections.unmodifiableList(myChildren);
  }

  //-------PERSISTENCE--------

  public void read(Element element, Project project) throws CantLoadSomethingException {
    Element dataXML = element.getChild(DATA);
    String dataClass = dataXML.getAttributeValue(DATA_CLASS);
    try {
      Class<?> cls = Class.forName(dataClass);
      myData = (BaseNodeData) cls.getConstructor(Element.class, Project.class).newInstance(dataXML, project);
    } catch (InvocationTargetException e) {
      if (e.getCause() instanceof CantLoadSomethingException) {
        throw (CantLoadSomethingException) e.getCause();
      } else {
        throwLoadException(e);
      }
    } catch (ClassNotFoundException e) {
      throwLoadException(e);
    } catch (NoSuchMethodException e) {
      throwLoadException(e);
    } catch (IllegalAccessException e) {
      throwLoadException(e);
    } catch (InstantiationException e) {
      throwLoadException(e);
    }

    myChildren.clear();
    Element childrenXML = element.getChild(CHILDREN);
    for (Element nodeXML : (List<Element>) childrenXML.getChildren(CHILD)) {
      myChildren.add(new DataNode(nodeXML, project));
    }
  }

  public void write(Element element, Project project) throws CantSaveSomethingException {
    Element dataXML = new Element(DATA);
    dataXML.setAttribute(DATA_CLASS, myData.getClass().getName());
    myData.write(dataXML, project);
    element.addContent(dataXML);

    Element childrenXML = new Element(CHILDREN);
    for (DataNode node : getChildren()) {
      Element childXML = new Element(CHILD);
      node.write(childXML, project);
      childrenXML.addContent(childXML);
    }
    element.addContent(childrenXML);
  }

  private void throwLoadException(Throwable t) throws CantLoadSomethingException {
    LOG.warning("can't instantiate node", t);
    throw new CantLoadSomethingException("can't instantiate node", t);
  }
}
