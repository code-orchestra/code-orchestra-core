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
package jetbrains.mps.generator.impl.dependencies;

import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNode;
import org.jdom.Attribute;
import org.jdom.Element;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * Evgeny Gryaznov, Jun 1, 2010
 */
public class GenerationRootDependencies {

  private static final String ATTR_ID = "id";
  private static final String ATTR_NAME = "name";
  private static final String ATTR_HASH = "hash";
  private static final String ATTR_DEPENDS_ON_CONDITIONALS = "dependsOnCreated";
  private static final String ATTR_DEPENDS_ON_NODES = "dependsOnNodes";
  private static final String NODE_DEPENDS_ON = "dep";
  private static final String NODE_FILE = "file";
  private static final String ATTR_ROOT_ID = "root";
  private static final String ATTR_MODEL_ID = "model";
  private static final String TRUE = "true";

  private String myRootId;
  private String myRootName;
  private String myHash;
  private boolean myDependsOnConditionals;
  private boolean myDependsOnNodes;
  private List<String> myLocal;
  private List<String> myExternal;
  private List<String> myGeneratedFiles;

  public GenerationRootDependencies(String rootId, String rootName, String rootHash, boolean dependsOnConditionals, boolean dependsOnNodes, List<String> local, List<String> external, List<String> files) {
    this.myRootId = rootId;
    this.myRootName = rootName;
    this.myHash = rootHash;
    this.myDependsOnConditionals = dependsOnConditionals;
    this.myDependsOnNodes = dependsOnNodes;
    this.myLocal = local;
    this.myExternal = external;
    this.myGeneratedFiles = files;
  }

  public String getRootId() {
    return myRootId;
  }

  public String getRootName() {
    return myRootName;
  }

  public String getHash() {
    return myHash;
  }

  public boolean isDependsOnConditionals() {
    return myDependsOnConditionals;
  }

  public boolean isDependsOnNodes() {
    return myDependsOnNodes;
  }

  public List<String> getLocal() {
    return Collections.unmodifiableList(myLocal);
  }

  public List<String> getExternal() {
    return Collections.unmodifiableList(myExternal);
  }

  public List<String> getFiles() {
    return Collections.unmodifiableList(myGeneratedFiles);
  }

  public void addGeneratedFile(String name) {
    if (name == null) throw new IllegalArgumentException("name is null");
    myGeneratedFiles.add(name);
  }

  public void saveTo(Element element) {
    if (myRootId != null) {
      element.setAttribute(ATTR_ID, this.myRootId);
    }
    if (myRootName != null) {
      element.setAttribute(ATTR_NAME, this.myRootName);
    }
    if (myHash != null) {
      element.setAttribute(ATTR_HASH, this.myHash);
    }
    if (myDependsOnConditionals) {
      element.setAttribute(ATTR_DEPENDS_ON_CONDITIONALS, TRUE);
    }
    if (myDependsOnNodes) {
      element.setAttribute(ATTR_DEPENDS_ON_NODES, TRUE);
    }
    for (String id : myLocal) {
      Element node = new Element(NODE_DEPENDS_ON);
      node.setAttribute(ATTR_ROOT_ID, id);
      element.addContent(node);
    }
    for (String id : myExternal) {
      Element node = new Element(NODE_DEPENDS_ON);
      node.setAttribute(ATTR_MODEL_ID, id);
      element.addContent(node);
    }
    for (String file : myGeneratedFiles) {
      Element node = new Element(NODE_FILE);
      node.setAttribute(ATTR_NAME, file);
      element.addContent(node);
    }
  }

  public static String getValue(Element e, String attrId) {
    Attribute attr = e.getAttribute(attrId);
    return attr == null ? null : attr.getValue();
  }

  public static GenerationRootDependencies fromXml(Element element, boolean isCommon) {
    String rootId = isCommon ? null : getValue(element, ATTR_ID);
    String rootName = getValue(element, ATTR_NAME);
    String rootHash = getValue(element, ATTR_HASH);
    boolean dependsOnConditionals = "true".equals(getValue(element, ATTR_DEPENDS_ON_CONDITIONALS));
    boolean dependsOnNodes = "true".equals(getValue(element, ATTR_DEPENDS_ON_NODES));
    List<String> local = new ArrayList<String>();
    List<String> external = new ArrayList<String>();
    List<String> files = new ArrayList<String>();
    for (Element e : ((List<Element>) element.getChildren(NODE_DEPENDS_ON))) {
      Attribute attr = e.getAttribute(ATTR_ROOT_ID);
      if (attr != null) {
        local.add(attr.getValue());
      } else if ((attr = e.getAttribute(ATTR_MODEL_ID)) != null) {
        external.add(attr.getValue());
      }
    }
    for (Element e : ((List<Element>) element.getChildren(NODE_FILE))) {
      String v = getValue(e, ATTR_NAME);
      if (v != null) {
        files.add(v);
      }
    }
    return new GenerationRootDependencies(rootId, rootName, rootHash, dependsOnConditionals, dependsOnNodes, local, external, files);
  }

  public static GenerationRootDependencies fromData(RootDependenciesBuilder l, List<String> generatedFiles) {
    final Collection<SNode> localNodes = l.getDependsOn();
    final Collection<SModelDescriptor> externalModels = l.getDependsOnModels();

    List<String> local = new ArrayList<String>(localNodes.size());
    for (SNode n : localNodes) {
      local.add(n.getId());
    }
    Collections.sort(local);

    List<String> external = new ArrayList<String>(externalModels.size());
    for (SModelDescriptor m : externalModels) {
      final SModelReference modelRef = m.getSModelReference();
      if(modelRef == null) {
        continue; // TODO report error?
      }
      external.add(modelRef.toString());
    }
    Collections.sort(external);
    Collections.sort(generatedFiles);

    final SNode originalRoot = l.getOriginalRoot();
    return new GenerationRootDependencies(
      originalRoot != null ? originalRoot.getId() : null,
      originalRoot != null ? originalRoot.getName() : null,
      l.getHash(), l.isDependsOnConditionals(), l.isDependsOnModelNodes(),
      local, external, generatedFiles);
  }
}
