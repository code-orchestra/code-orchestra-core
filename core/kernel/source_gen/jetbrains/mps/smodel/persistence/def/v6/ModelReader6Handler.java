package jetbrains.mps.smodel.persistence.def.v6;

/*Generated by MPS */

import jetbrains.mps.xmlQuery.runtime.XMLSAXHandler;
import jetbrains.mps.smodel.BaseSModelDescriptor;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import java.util.Stack;
import org.xml.sax.Locator;
import jetbrains.mps.smodel.ModelLoadingState;
import jetbrains.mps.smodel.SModelHeader;
import jetbrains.mps.smodel.SModel;
import org.xml.sax.SAXException;
import org.xml.sax.Attributes;
import org.xml.sax.SAXParseException;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.xmlQuery.runtime.BreakParseSAXException;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.smodel.SReference;

public class ModelReader6Handler extends XMLSAXHandler<BaseSModelDescriptor.ModelLoadResult> {
  private static String[] EMPTY_ARRAY = new String[0];
  protected static Log log = LogFactory.getLog(ModelReader6Handler.class);

  private ModelReader6Handler.modelElementHandler modelhandler = new ModelReader6Handler.modelElementHandler();
  private ModelReader6Handler.persistenceElementHandler persistencehandler = new ModelReader6Handler.persistenceElementHandler();
  private ModelReader6Handler.tag_with_namespaceElementHandler tag_with_namespacehandler = new ModelReader6Handler.tag_with_namespaceElementHandler();
  private ModelReader6Handler.importElementHandler importhandler = new ModelReader6Handler.importElementHandler();
  private ModelReader6Handler.root_stubsElementHandler root_stubshandler = new ModelReader6Handler.root_stubsElementHandler();
  private ModelReader6Handler.nodeElementHandler nodehandler = new ModelReader6Handler.nodeElementHandler();
  private ModelReader6Handler.propertyElementHandler propertyhandler = new ModelReader6Handler.propertyElementHandler();
  private ModelReader6Handler.linkElementHandler linkhandler = new ModelReader6Handler.linkElementHandler();
  private Stack<ModelReader6Handler.ElementHandler> myHandlersStack = new Stack<ModelReader6Handler.ElementHandler>();
  private Stack<Object> myValues = new Stack<Object>();
  private Locator myLocator;
  private BaseSModelDescriptor.ModelLoadResult myResult;
  private ModelLoadingState fieldtoState;
  private SModelHeader fieldheader;
  private SModel fieldmodel;
  private VersionUtil fieldhelper;

  public ModelReader6Handler(ModelLoadingState toState, SModelHeader header) {
    fieldtoState = toState;
    fieldheader = header;
  }

  public BaseSModelDescriptor.ModelLoadResult getResult() {
    return myResult;
  }

  @Override
  public void setDocumentLocator(Locator locator) {
    myLocator = locator;
  }

  @Override
  public void characters(char[] array, int start, int len) throws SAXException {
    ModelReader6Handler.ElementHandler current = (myHandlersStack.empty() ?
      (ModelReader6Handler.ElementHandler) null :
      myHandlersStack.peek()
    );
    if (current != null) {
      current.handleText(myValues.peek(), new String(array, start, len));
    }
  }

  @Override
  public void endElement(String uri, String localName, String qName) throws SAXException {
    ModelReader6Handler.ElementHandler current = myHandlersStack.pop();
    Object childValue = myValues.pop();
    if (current != null) {
      current.validate(childValue);
      if (myHandlersStack.empty()) {
        myResult = (BaseSModelDescriptor.ModelLoadResult) childValue;
      } else {
        myHandlersStack.peek().handleChild(myValues.peek(), qName, childValue);
      }
    }
  }

  @Override
  public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
    ModelReader6Handler.ElementHandler current = (myHandlersStack.empty() ?
      (ModelReader6Handler.ElementHandler) null :
      myHandlersStack.peek()
    );
    if (current == null) {
      // root 
      current = modelhandler;
    } else {
      current = current.createChild(qName);
    }

    // check required 
    for (String attr : current.requiredAttributes()) {
      if (attributes.getValue(attr) == null) {
        throw new SAXParseException("attribute " + attr + " is absent", null);
      }
    }

    Object result = current.createObject(attributes);
    if (myHandlersStack.empty()) {
      myResult = (BaseSModelDescriptor.ModelLoadResult) result;
    }

    // handle attributes 
    for (int i = 0; i < attributes.getLength(); i++) {
      String name = attributes.getQName(i);
      String value = attributes.getValue(i);
      current.handleAttribute(result, name, value);
    }
    myHandlersStack.push(current);
    myValues.push(result);
  }

  private class ElementHandler {
    private ElementHandler() {
    }

    protected Object createObject(Attributes attrs) {
      return null;
    }

    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
    }

    protected ModelReader6Handler.ElementHandler createChild(String tagName) throws SAXException {
      throw new SAXParseException("unknown tag: " + tagName, null);
    }

    protected void handleChild(Object resultObject, String tagName, Object value) throws SAXException {
      throw new SAXParseException("unknown child: " + tagName, null);
    }

    protected void handleText(Object resultObject, String value) throws SAXException {
      if (value.trim().length() == 0) {
        return;
      }
      throw new SAXParseException("text is not accepted", null);
    }

    protected String[] requiredAttributes() {
      return ModelReader6Handler.EMPTY_ARRAY;
    }

    protected void validate(Object resultObject) throws SAXException {
    }
  }

  public class modelElementHandler extends ModelReader6Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{"modelUID"};

    public modelElementHandler() {
    }

    @Override
    protected BaseSModelDescriptor.ModelLoadResult createObject(Attributes attrs) {
      fieldmodel = new SModel(SModelReference.fromString(attrs.getValue("modelUID")));
      fieldmodel.setPersistenceVersion(6);
      fieldmodel.getSModelHeader().updateDefaults(fieldheader);
      fieldmodel.setLoading(true);
      fieldhelper = new VersionUtil(fieldmodel.getSModelReference());
      return new BaseSModelDescriptor.ModelLoadResult(fieldmodel, ModelLoadingState.NOT_LOADED);
    }

    @Override
    protected String[] requiredAttributes() {
      return requiredAttributes;
    }

    @Override
    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
      BaseSModelDescriptor.ModelLoadResult result = (BaseSModelDescriptor.ModelLoadResult) resultObject;
      if ("modelUID".equals(name)) {
        return;
      }
      super.handleAttribute(resultObject, name, value);
    }

    @Override
    protected ModelReader6Handler.ElementHandler createChild(String tagName) throws SAXException {
      if ("persistence".equals(tagName)) {
        return persistencehandler;
      }
      if ("language".equals(tagName)) {
        return tag_with_namespacehandler;
      }
      if ("language-engaged-on-generation".equals(tagName)) {
        return tag_with_namespacehandler;
      }
      if ("devkit".equals(tagName)) {
        return tag_with_namespacehandler;
      }
      if ("import".equals(tagName)) {
        return importhandler;
      }
      if ("node".equals(tagName)) {
        return nodehandler;
      }
      if ("root_stubs".equals(tagName)) {
        return root_stubshandler;
      }
      return super.createChild(tagName);
    }

    @Override
    protected void handleChild(Object resultObject, String tagName, Object value) throws SAXException {
      BaseSModelDescriptor.ModelLoadResult result = (BaseSModelDescriptor.ModelLoadResult) resultObject;
      if ("persistence".equals(tagName)) {
        return;
      }
      if ("language".equals(tagName)) {
        String child = (String) value;
        fieldmodel.addLanguage(ModuleReference.fromString(child));
        return;
      }
      if ("language-engaged-on-generation".equals(tagName)) {
        String child = (String) value;
        fieldmodel.addEngagedOnGenerationLanguage(ModuleReference.fromString(child));
        return;
      }
      if ("devkit".equals(tagName)) {
        String child = (String) value;
        fieldmodel.addDevKit(ModuleReference.fromString(child));
        return;
      }
      if ("import".equals(tagName)) {
        String[] child = (String[]) value;
        fieldhelper.addImport(fieldmodel, child[0], child[1], Integer.parseInt(child[2]), child[3] != null);
        return;
      }
      if ("node".equals(tagName)) {
        SNode child = (SNode) value;
        if (child != null) {
          fieldmodel.addRoot(child);
        }
        return;
      }
      if ("root_stubs".equals(tagName)) {
        Object child = (Object) value;
        if (fieldtoState == ModelLoadingState.ROOTS_LOADED) {
          result.setState(ModelLoadingState.ROOTS_LOADED);
          fieldmodel.setLoading(false);
          throw new BreakParseSAXException();
        }
        return;
      }
      super.handleChild(resultObject, tagName, value);
    }

    @Override
    protected void validate(Object resultObject) throws SAXException {
      if (!(validateInternal((BaseSModelDescriptor.ModelLoadResult) resultObject))) {
        throw new SAXParseException("missing tags", null);
      }
    }

    private boolean validateInternal(BaseSModelDescriptor.ModelLoadResult result) throws SAXException {
      result.setState(ModelLoadingState.FULLY_LOADED);
      fieldmodel.setLoading(false);
      return true;
    }
  }

  public class persistenceElementHandler extends ModelReader6Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{"version"};

    public persistenceElementHandler() {
    }

    @Override
    protected Integer createObject(Attributes attrs) {
      return Integer.parseInt(attrs.getValue("version"));
    }

    @Override
    protected String[] requiredAttributes() {
      return requiredAttributes;
    }

    @Override
    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
      Integer result = (Integer) resultObject;
      if ("version".equals(name)) {
        return;
      }
      super.handleAttribute(resultObject, name, value);
    }
  }

  public class tag_with_namespaceElementHandler extends ModelReader6Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{"namespace"};

    public tag_with_namespaceElementHandler() {
    }

    @Override
    protected String createObject(Attributes attrs) {
      return attrs.getValue("namespace");
    }

    @Override
    protected String[] requiredAttributes() {
      return requiredAttributes;
    }

    @Override
    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
      String result = (String) resultObject;
      if ("namespace".equals(name)) {
        return;
      }
      super.handleAttribute(resultObject, name, value);
    }
  }

  public class importElementHandler extends ModelReader6Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{"index", "version", "modelUID"};

    public importElementHandler() {
    }

    @Override
    protected String[] createObject(Attributes attrs) {
      return new String[]{attrs.getValue("index"), attrs.getValue("modelUID"), attrs.getValue("version"), null};
    }

    @Override
    protected String[] requiredAttributes() {
      return requiredAttributes;
    }

    @Override
    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
      String[] result = (String[]) resultObject;
      if ("index".equals(name)) {
        return;
      }
      if ("version".equals(name)) {
        return;
      }
      if ("modelUID".equals(name)) {
        return;
      }
      if ("implicit".equals(name)) {
        result[3] = value;
        return;
      }
      super.handleAttribute(resultObject, name, value);
    }
  }

  public class root_stubsElementHandler extends ModelReader6Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{};

    public root_stubsElementHandler() {
    }

    @Override
    protected ModelReader6Handler.ElementHandler createChild(String tagName) throws SAXException {
      if ("node".equals(tagName)) {
        return nodehandler;
      }
      return super.createChild(tagName);
    }

    @Override
    protected void handleChild(Object resultObject, String tagName, Object value) throws SAXException {
      Object result = (Object) resultObject;
      if ("node".equals(tagName)) {
        SNode child = (SNode) value;
        if (fieldtoState == ModelLoadingState.ROOTS_LOADED && child != null) {
          fieldmodel.addRoot(child);
        }
        return;
      }
      super.handleChild(resultObject, tagName, value);
    }
  }

  public class nodeElementHandler extends ModelReader6Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{"type"};

    public nodeElementHandler() {
    }

    @Override
    protected SNode createObject(Attributes attrs) {
      return new SNode(fieldmodel, fieldhelper.readType(attrs.getValue("type")));
    }

    @Override
    protected String[] requiredAttributes() {
      return requiredAttributes;
    }

    @Override
    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
      SNode result = (SNode) resultObject;
      if ("type".equals(name)) {
        return;
      }
      if ("role".equals(name)) {
        result.setRoleInParent(fieldhelper.readRole(value));
        return;
      }
      if ("id".equals(name)) {
        SNodeId id = SNodeId.fromString(value);
        if (id == null) {
          throw new SAXParseException("bad node ID", null);
        }
        result.setId(id);
        return;
      }
      super.handleAttribute(resultObject, name, value);
    }

    @Override
    protected ModelReader6Handler.ElementHandler createChild(String tagName) throws SAXException {
      if ("property".equals(tagName)) {
        return propertyhandler;
      }
      if ("link".equals(tagName)) {
        return linkhandler;
      }
      if ("node".equals(tagName)) {
        return nodehandler;
      }
      return super.createChild(tagName);
    }

    @Override
    protected void handleChild(Object resultObject, String tagName, Object value) throws SAXException {
      SNode result = (SNode) resultObject;
      if ("property".equals(tagName)) {
        String[] child = (String[]) value;
        if (child[1] != null) {
          result.setProperty(fieldhelper.readName(child[0]), child[1]);
        }
        return;
      }
      if ("link".equals(tagName)) {
        String[] child = (String[]) value;
        if (child[2] == null) {
          if (log.isErrorEnabled()) {
            log.error("couldn't create reference '" + child[0] + "' : traget node id is null");
          }
          return;
        }
        SReference ref = fieldhelper.readLink(result, child[0], child[2], child[1]);
        if (ref != null) {
          result.addReference(ref);
        }
        return;
      }
      if ("node".equals(tagName)) {
        SNode child = (SNode) value;
        result.addChild(child.getRole_(), child);
        return;
      }
      super.handleChild(resultObject, tagName, value);
    }
  }

  public class propertyElementHandler extends ModelReader6Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{"name"};

    public propertyElementHandler() {
    }

    @Override
    protected String[] createObject(Attributes attrs) {
      return new String[]{attrs.getValue("name"), null};
    }

    @Override
    protected String[] requiredAttributes() {
      return requiredAttributes;
    }

    @Override
    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
      String[] result = (String[]) resultObject;
      if ("name".equals(name)) {
        return;
      }
      if ("value".equals(name)) {
        result[1] = value;
        return;
      }
      super.handleAttribute(resultObject, name, value);
    }
  }

  public class linkElementHandler extends ModelReader6Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{};

    public linkElementHandler() {
    }

    @Override
    protected String[] createObject(Attributes attrs) {
      return new String[]{null, null, null};
    }

    @Override
    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
      String[] result = (String[]) resultObject;
      if ("role".equals(name)) {
        result[0] = value;
        return;
      }
      if ("resolveInfo".equals(name)) {
        result[1] = value;
        return;
      }
      if ("targetNodeId".equals(name)) {
        result[2] = value;
        return;
      }
      super.handleAttribute(resultObject, name, value);
    }
  }
}
