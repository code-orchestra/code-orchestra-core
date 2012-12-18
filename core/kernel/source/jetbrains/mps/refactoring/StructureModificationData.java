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
package jetbrains.mps.refactoring;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.JDomReader;
import com.thoughtworks.xstream.io.xml.JDomWriter;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.InternUtil;
import org.jdom.Element;
import org.jetbrains.annotations.Nullable;

import java.util.*;
import java.util.Map.Entry;

public class StructureModificationData {
  private static final String OLD_STRUCTURE_LANGUAGE_NAMESPACE = "jetbrains.mps.bootstrap.structureLanguage";
  private static final String NEW_STRUCTURE_LANGUAGE_NAMESPACE = "jetbrains.mps.lang.structure";

  private static final Logger LOG = Logger.getLogger(StructureModificationData.class);

  // XML elements names
  public static final String REFACTORING_CONTEXT = "refactoringContext";
  public static final String DEPENDENCIES = "dependencies";
  public static final String DEPEND_MODEL = "model";
  public static final String MOVE_MAP = "moveMap";
  public static final String SOURCE_MAP = "sourceMap";
  public static final String CONCEPT_FEATURE_MAP = "conceptFeatureMap";
  public static final String PARAMETERS_MAP = "parametersMap";
  public static final String ENTRY = "entry";
  public static final String KEY = "key";
  public static final String VALUE = "value";
  public static final String PARAMETER_NAME = "parameterName";
  public static final String MODEL_VERSION = "modelVersion";
  public static final String REFACTORING = "refactoring";
  public static final String REFACTORING_CLASS = "refactoringClass";

  //persistent fields
  private Map<ConceptFeature, ConceptFeature> myConceptFeatureMap = new HashMap<ConceptFeature, ConceptFeature>();
  private Map<FullNodeId, FullNodeId> myMoveMap = new HashMap<FullNodeId, FullNodeId>();
  private Map<FullNodeId, FullNodeId> mySourceMap = new HashMap<FullNodeId, FullNodeId>();  // just to show in "Refactoring" panel
  private Map<String, Object> myParametersMap = new HashMap<String, Object>();  // additional parameters - should not be used now
  private int myModelVersion = -1;      // version of the model after refactoring, for compatibility
  private List<Dependency> myDependencies = new ArrayList<Dependency>();  // participating models with their versions before refactoring or null for old data
  private String myRefactoringClassName = null;

  private Serializer mySerializer = new Serializer();

  public StructureModificationData fromElement(Element element) {
    try {
      String versionString = element.getAttributeValue(MODEL_VERSION);
      if (versionString != null) {
        myModelVersion = Integer.parseInt(versionString);
      } else {
        myModelVersion = -1;
      }
    } catch (Throwable t) {
      myModelVersion = -1;
      LOG.error(t);
    }

    // If dependencies element absent then it is an old refactoring context and dependencies are implicit
    Element dependencies = element.getChild(DEPENDENCIES);
    if (dependencies == null) {
      myDependencies = null;
    } else {
      myDependencies = new ArrayList<Dependency>();
      for (Element elem : (List<Element>) dependencies.getChildren(DEPEND_MODEL)) {
        myDependencies.add(new Dependency(elem));
      }
    }

    myRefactoringClassName = element.getChild(REFACTORING).getAttributeValue(REFACTORING_CLASS);
    if (myRefactoringClassName.startsWith(OLD_STRUCTURE_LANGUAGE_NAMESPACE + ".")) {
      myRefactoringClassName = NEW_STRUCTURE_LANGUAGE_NAMESPACE + myRefactoringClassName.substring(OLD_STRUCTURE_LANGUAGE_NAMESPACE.length());
    }

    Element moveMapElement = element.getChild(MOVE_MAP);
    if (moveMapElement != null) {
      for (Element entryElement : (List<Element>) moveMapElement.getChildren(ENTRY)) {
        Element keyElement = entryElement.getChild(KEY);
        Element valueElement = entryElement.getChild(VALUE);
        myMoveMap.put(new FullNodeId(keyElement), new FullNodeId(valueElement));
      }
    }
    Element sourceMapElement = element.getChild(SOURCE_MAP);
    if (sourceMapElement != null) {
      for (Element entryElement : (List<Element>) sourceMapElement.getChildren(ENTRY)) {
        Element keyElement = entryElement.getChild(KEY);
        Element valueElement = entryElement.getChild(VALUE);
        mySourceMap.put(new FullNodeId(keyElement), new FullNodeId(valueElement));
      }
    }
    Element featureMapElement = element.getChild(CONCEPT_FEATURE_MAP);
    if (featureMapElement != null) {
      for (Element entryElement : (List<Element>) featureMapElement.getChildren(ENTRY)) {
        Element keyElement = entryElement.getChild(KEY);
        Element valueElement = entryElement.getChild(VALUE);
        ConceptFeature valueFeature = valueElement == null ? null : new ConceptFeature(valueElement);
        myConceptFeatureMap.put(new ConceptFeature(keyElement), valueFeature);
      }
    }
    Element parametersMapElement = element.getChild(PARAMETERS_MAP);
    if (parametersMapElement != null) {
      for (Element entryElement : (List<Element>) parametersMapElement.getChildren(ENTRY)) {
        Element keyElement = entryElement.getChild(KEY);
        Element valueElement = entryElement.getChild(VALUE);
        String parameterName = keyElement.getAttributeValue(PARAMETER_NAME);
        myParametersMap.put(parameterName, deserialize(valueElement));
      }
    }
    return this;
  }

  public Element toElement() {
    Element refactoringContextElement = new Element(REFACTORING_CONTEXT);
    if (myModelVersion != -1) {
      refactoringContextElement.setAttribute(MODEL_VERSION, myModelVersion + "");
    }

    if (myDependencies != null) {   // can be null for the old history data
      Element dependencies = new Element(DEPENDENCIES);
      for (Dependency dep : myDependencies) {
        dependencies.addContent(dep.toElement());
      }
      refactoringContextElement.addContent(dependencies);
    }

    {
      Element refactoringElement = new Element(REFACTORING);
      if (myRefactoringClassName == null) {
        LOG.error("saving refactoring: refactoring is null");
      } else {
        refactoringElement.setAttribute(REFACTORING_CLASS, myRefactoringClassName);
      }
      refactoringContextElement.addContent(refactoringElement);
    }
    {
      Element moveMapElement = new Element(MOVE_MAP);
      List<Entry<FullNodeId, FullNodeId>> entries = new ArrayList<Entry<FullNodeId, FullNodeId>>(myMoveMap.entrySet());
      Collections.sort(entries,
        new Comparator<Entry<FullNodeId, FullNodeId>>() {
          public int compare(Entry<FullNodeId, FullNodeId> o1, Entry<FullNodeId, FullNodeId> o2) {
            return o1.getKey().compareTo(o2.getKey()) * 10 + o1.getValue().compareTo(o2.getValue());
          }
        });
      for (Entry<FullNodeId, FullNodeId> entry : entries) {
        Element entryElement = new Element(ENTRY);
        Element keyElement = new Element(KEY);
        Element valueElement = new Element(VALUE);
        entry.getKey().toElement(keyElement);
        entry.getValue().toElement(valueElement);
        entryElement.addContent(keyElement);
        entryElement.addContent(valueElement);
        moveMapElement.addContent(entryElement);
      }
      refactoringContextElement.addContent(moveMapElement);
    }
    {
      Element sourceMapElement = new Element(SOURCE_MAP);
      List<Entry<FullNodeId, FullNodeId>> entries = new ArrayList<Entry<FullNodeId, FullNodeId>>(mySourceMap.entrySet());
      Collections.sort(entries,
        new Comparator<Entry<FullNodeId, FullNodeId>>() {
          public int compare(Entry<FullNodeId, FullNodeId> o1, Entry<FullNodeId, FullNodeId> o2) {
            return o1.getKey().compareTo(o2.getKey()) * 10 + o1.getValue().compareTo(o2.getValue());
          }
        });
      for (Entry<FullNodeId, FullNodeId> entry : entries) {
        Element entryElement = new Element(ENTRY);
        Element keyElement = new Element(KEY);
        Element valueElement = new Element(VALUE);
        entry.getKey().toElement(keyElement);
        entry.getValue().toElement(valueElement);
        entryElement.addContent(keyElement);
        entryElement.addContent(valueElement);
        sourceMapElement.addContent(entryElement);
      }
      refactoringContextElement.addContent(sourceMapElement);
    }
    {
      Element featureMapElement = new Element(CONCEPT_FEATURE_MAP);
      List<Entry<ConceptFeature, ConceptFeature>> entries = new ArrayList<Entry<ConceptFeature, ConceptFeature>>(myConceptFeatureMap.entrySet());
      Collections.sort(entries,
        new Comparator<Entry<ConceptFeature, ConceptFeature>>() {
          public int compare(Entry<ConceptFeature, ConceptFeature> o1, Entry<ConceptFeature, ConceptFeature> o2) {
            return o1.getKey().compareTo(o2.getKey()) * 10 + o1.getValue().compareTo(o2.getValue());
          }
        });
      for (Entry<ConceptFeature, ConceptFeature> entry : entries) {
        Element entryElement = new Element(ENTRY);
        Element keyElement = new Element(KEY);
        Element valueElement = new Element(VALUE);
        entry.getKey().toElement(keyElement);
        entryElement.addContent(keyElement);
        ConceptFeature valueFeature = entry.getValue();
        if (valueFeature != null) {
          valueFeature.toElement(valueElement);
          entryElement.addContent(valueElement);
        }
        featureMapElement.addContent(entryElement);
      }
      refactoringContextElement.addContent(featureMapElement);
    }
    {
      Element parametersMapElement = new Element(PARAMETERS_MAP);
      for (Entry<String, Object> entry : myParametersMap.entrySet()) {
        Element keyElement = new Element(KEY);
        keyElement.setAttribute(PARAMETER_NAME, entry.getKey());
        Element valueElement = new Element(VALUE);
        serialize(valueElement, entry.getValue());
        Element entryElement = new Element(ENTRY);
        entryElement.addContent(keyElement);
        entryElement.addContent(valueElement);
        parametersMapElement.addContent(entryElement);
      }
    }
    return refactoringContextElement;
  }

  private void serialize(Element element, Object value) {
    mySerializer.serialize(element, value);
  }

  private Object deserialize(Element element) {
    return mySerializer.deserialize(element);
  }

  public static class Dependency {
    private final String MODEL_UID = "modelUID";
    private final String MODEL_VERSION = "version";

    private SModelReference myModelReference;
    private int myVersion = -1;

    public Dependency(SModelReference modelReference, int version) {
      myModelReference = modelReference;
      myVersion = version;
    }

    public Dependency(Element element){
      fromElement(element);
    }

    public SModelReference getModelReference() {
      return myModelReference;
    }

    public int getUsedVersion() {
      return myVersion;
    }

    public Element toElement() {
      return new Element(DEPEND_MODEL).setAttribute(MODEL_UID, myModelReference.toString()).setAttribute(MODEL_VERSION, myVersion + "");
    }

    public void fromElement(Element element) {
      myModelReference = SModelReference.fromString(element.getAttributeValue(MODEL_UID));
      myVersion = -1;
      String versionString = element.getAttributeValue(MODEL_VERSION);
      if (versionString != null) {
        try {
          myVersion = Integer.parseInt(versionString);
        } catch (NumberFormatException t) {
          LOG.error(t);
        }
      }
    }
  }

  public static class FullNodeId implements Comparable<FullNodeId> {

    @Nullable
    private SNodeId myNodeId;

    private SModelReference myModelReference;

    public static final String MODEL_UID = "modelUID";

    public static final String NODE_ID = "nodeId";
    private static final String NULL = "null";

    public FullNodeId(@Nullable SNodeId nodeId, SModelReference modelReference) {
      myNodeId = nodeId;
      myModelReference = modelReference;
    }

    public FullNodeId(SNode node) {
      this(node.getSNodeId(), node.getModel().getSModelReference());
    }

    public FullNodeId(SModel model) {
      this(null, model.getSModelReference());
    }

    public FullNodeId(Element element) {
      fromElement(element);
    }

    public int compareTo(FullNodeId o) {
      int i2 = myModelReference.getLongName().compareTo(o.myModelReference.getLongName());
      if (i2 != 0) return i2;
      if (myNodeId == null) {
        if (o.myNodeId == null) {
          return 0;
        } else {
          return 1;
        }
      }
      return myNodeId.toString().compareTo(o.myNodeId.toString());
    }

    @Nullable
    public SNodeId getNodeId() {
      return myNodeId;
    }

    public SModelReference getModelUID() {
      return myModelReference;
    }

    public void toElement(Element element) {
      element.setAttribute(MODEL_UID, myModelReference.toString());
      element.setAttribute(NODE_ID, myNodeId == null ? NULL : myNodeId.toString());
    }

    public void fromElement(Element element) {
      myModelReference = SModelReference.fromString(element.getAttributeValue(MODEL_UID));
      String value = element.getAttributeValue(NODE_ID);
      if (value.equals(NULL)) {
        myNodeId = null;
      } else {
        myNodeId = SNodeId.fromString(value);
      }
    }

    public SNode getNode() {
      SModelDescriptor model = getModel();
      if (model == null) {
        return null;
      }
      return model.getSModel().getNodeById(myNodeId);
    }

    public SModelDescriptor getModel() {
      if (myModelReference == null) return null;
      return SModelRepository.getInstance().getModelDescriptor(myModelReference);
    }
  }

  public static enum ConceptFeatureKind {
    NONE, CONCEPT, PROPERTY, CHILD, REFERENCE
  }

  public static class ConceptFeature implements Comparable<ConceptFeature> {
    public static final String FEATURE_NAME = "featureName";
    public static final String FEATURE_KIND = "featureKind";
    public static final String CONCEPT_FQ_NAME = "conceptFQName";

    private ConceptFeatureKind myConceptFeatureKind;
    private String myFeatureName;
    private String myConceptFQName;

    public ConceptFeature(String conceptFQName, ConceptFeatureKind kind, String featureName) {
      myConceptFeatureKind = kind;
      myFeatureName = featureName;
      myConceptFQName = InternUtil.intern(conceptFQName);
    }

    public ConceptFeature(Element element) {
      fromElement(element);
    }

    public int compareTo(ConceptFeature o) {
      int i1 = myConceptFQName.compareTo(o.myConceptFQName);
      int i2 = myConceptFeatureKind.compareTo(o.myConceptFeatureKind);
      int i3 = myFeatureName.compareTo(o.myFeatureName);
      return Math.round(Math.signum(i1) * 100 + Math.signum(i2) * 10 + Math.signum(i3));
    }

    public ConceptFeatureKind getConceptFeatureKind() {
      return myConceptFeatureKind;
    }

    public String getFeatureName() {
      return myFeatureName;
    }

    public String getConceptFQName() {
      return myConceptFQName;
    }

    public void toElement(Element element) {
      if (myFeatureName != null) {
        element.setAttribute(FEATURE_NAME, myFeatureName);
      }
      if (myConceptFQName != null) {
        element.setAttribute(CONCEPT_FQ_NAME, myConceptFQName);
      }
      element.setAttribute(FEATURE_KIND, myConceptFeatureKind.toString());
    }

    public void fromElement(Element element) {
      myFeatureName = element.getAttributeValue(FEATURE_NAME);
      myConceptFQName = element.getAttributeValue(CONCEPT_FQ_NAME);
      myConceptFeatureKind = ConceptFeatureKind.valueOf(element.getAttributeValue(FEATURE_KIND));
    }
  }


  public static class Serializer {
    private static final Logger LOG = Logger.getLogger(Serializer.class);

    public static final String OBJECT_TYPE = "objectType";

    //types
    public static final String SNODE = "snode";
    public static final String STRING = "string";
    public static final String SMODEL = "smodel";
    public static final String SMODEL_DESCRIPTOR = "smodelDescriptor";
    public static final String ISERIALIZABLE = "iserializable";
    public static final String COLLECTION = "collection";
    public static final String DEFAULT = "default";

    public static final String STRING_VALUE = "stringValue";
    public static final String ITEM = "item";
    public static final String MODEL_UID = "modelUID";
    public static final String CLASS_NAME = "className";
    public static final String XSTREAM_VALUE = "xstreamValue";
    public ModelOwner myOwner;


    public void serialize(Element element, Object value) {
      if (value instanceof String) {
        element.setAttribute(OBJECT_TYPE, STRING);
        element.setAttribute(STRING_VALUE, (String) value);
        return;
      }
      if (value instanceof SNode) {
        element.setAttribute(OBJECT_TYPE, SNODE);
        FullNodeId fullNodeId = new FullNodeId((SNode) value);
        fullNodeId.toElement(element);
        return;
      }
      if (value instanceof SModel) {
        element.setAttribute(OBJECT_TYPE, SMODEL);
        element.setAttribute(MODEL_UID, ((SModel) value).toString());
        return;
      }
      if (value instanceof SModelDescriptor) {
        element.setAttribute(OBJECT_TYPE, SMODEL_DESCRIPTOR);
        element.setAttribute(MODEL_UID, ((SModelDescriptor) value).toString());
        return;
      }
      if (value instanceof Collection) {
        element.setAttribute(OBJECT_TYPE, COLLECTION);
        element.setAttribute(CLASS_NAME, value.getClass().getName());
        for (Object o : (Collection) value) {
          Element childElement = new Element(ITEM);
          serialize(childElement, o);
          element.addContent(childElement);
        }
        return;
      }
      {
        element.setAttribute(OBJECT_TYPE, DEFAULT);
        Element child = new Element(XSTREAM_VALUE);
        XStream xStream = new XStream();
        JDomWriter writer = new JDomWriter(child);
        xStream.marshal(value, writer);
        element.setContent(child);
      }
    }

    public Object deserialize(Element element) {
      String objectType = element.getAttributeValue(OBJECT_TYPE);
      if (STRING.equals(objectType)) {
        return element.getAttributeValue(STRING_VALUE);
      }
      if (SNODE.equals(OBJECT_TYPE)) {
        FullNodeId fullNodeId = new FullNodeId(element);
        return fullNodeId.getNode();
      }
      if (SMODEL_DESCRIPTOR.equals(OBJECT_TYPE)) {
        return SModelRepository.getInstance().getModelDescriptor(SModelReference.fromString(element.getAttributeValue(MODEL_UID)));
      }
      if (SMODEL.equals(OBJECT_TYPE)) {
        SModelDescriptor modelDescriptor = SModelRepository.getInstance().
          getModelDescriptor(SModelReference.fromString(element.getAttributeValue(MODEL_UID)));
        if (modelDescriptor == null) {
          return null;
        }
        return modelDescriptor.getSModel();
      }
      if (COLLECTION.equals(OBJECT_TYPE)) {
        String className = element.getAttributeValue(CLASS_NAME);
        Collection collection = null;
        try {
          Class<? extends Collection> c = (Class<? extends Collection>) Class.forName(className);
          collection = c.getConstructor().newInstance();
        } catch (Throwable t) {
          LOG.error(t);
        }
        if (collection != null) {
          for (Element childElement : (List<Element>) element.getChildren(ITEM)) {
            collection.add(deserialize(childElement));
          }
        }
        return collection;
      }
      if (DEFAULT.equals(OBJECT_TYPE)) {
        Element child = element.getChild(XSTREAM_VALUE);
        XStream xStream = new XStream();
        JDomReader reader = new JDomReader(child);
        return xStream.unmarshal(reader);
      }
      return null;
    }
  }
}
