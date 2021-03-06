package jetbrains.mps.smodel.persistence.def.v7;

/*Generated by MPS */

import jetbrains.mps.xmlQuery.runtime.XMLSAXHandler;
import java.util.List;
import jetbrains.mps.smodel.persistence.lines.LineContent;
import java.util.Stack;
import org.xml.sax.Locator;
import jetbrains.mps.smodel.persistence.def.v5.LineContentAccumulator;
import org.xml.sax.SAXException;
import org.xml.sax.Attributes;
import org.xml.sax.SAXParseException;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeId;

public class LineToContentMapReader7Handler extends XMLSAXHandler<List<LineContent>> {
  private static String[] EMPTY_ARRAY = new String[0];

  private LineToContentMapReader7Handler.modelElementHandler modelhandler = new LineToContentMapReader7Handler.modelElementHandler();
  private LineToContentMapReader7Handler.rootsElementHandler rootshandler = new LineToContentMapReader7Handler.rootsElementHandler();
  private LineToContentMapReader7Handler.rootContentElementHandler rootContenthandler = new LineToContentMapReader7Handler.rootContentElementHandler();
  private LineToContentMapReader7Handler.nodeElementHandler nodehandler = new LineToContentMapReader7Handler.nodeElementHandler();
  private LineToContentMapReader7Handler.propertyElementHandler propertyhandler = new LineToContentMapReader7Handler.propertyElementHandler();
  private LineToContentMapReader7Handler.linkElementHandler linkhandler = new LineToContentMapReader7Handler.linkElementHandler();
  private LineToContentMapReader7Handler.nullElementHandler nullhandler = new LineToContentMapReader7Handler.nullElementHandler();
  private Stack<LineToContentMapReader7Handler.ElementHandler> myHandlersStack = new Stack<LineToContentMapReader7Handler.ElementHandler>();
  private Stack<Object> myValues = new Stack<Object>();
  private Locator myLocator;
  private List<LineContent> myResult;
  private LineContentAccumulator fieldaccumulator;

  public LineToContentMapReader7Handler() {
  }

  public List<LineContent> getResult() {
    return myResult;
  }

  @Override
  public void setDocumentLocator(Locator locator) {
    myLocator = locator;
  }

  @Override
  public void characters(char[] array, int start, int len) throws SAXException {
    globalHandleText(myValues.firstElement(), new String(array, start, len));
    LineToContentMapReader7Handler.ElementHandler current = (myHandlersStack.empty() ?
      (LineToContentMapReader7Handler.ElementHandler) null :
      myHandlersStack.peek()
    );
    if (current != null) {
      current.handleText(myValues.peek(), new String(array, start, len));
    }
  }

  @Override
  public void endElement(String uri, String localName, String qName) throws SAXException {
    LineToContentMapReader7Handler.ElementHandler current = myHandlersStack.pop();
    Object childValue = myValues.pop();
    if (current != null) {
      current.validate(childValue);
      if (myHandlersStack.empty()) {
        myResult = (List<LineContent>) childValue;
      } else {
        myHandlersStack.peek().handleChild(myValues.peek(), qName, childValue);
      }
    }
  }

  @Override
  public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
    LineToContentMapReader7Handler.ElementHandler current = (myHandlersStack.empty() ?
      (LineToContentMapReader7Handler.ElementHandler) null :
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
      myResult = (List<LineContent>) result;
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

  public void globalHandleText(Object resultObject, String value) {
    List<LineContent> result = (List<LineContent>) resultObject;
    fieldaccumulator.processText(value, myLocator);
  }

  private class ElementHandler {
    private ElementHandler() {
    }

    protected Object createObject(Attributes attrs) {
      return null;
    }

    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
    }

    protected LineToContentMapReader7Handler.ElementHandler createChild(String tagName) throws SAXException {
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
      return LineToContentMapReader7Handler.EMPTY_ARRAY;
    }

    protected void validate(Object resultObject) throws SAXException {
    }
  }

  public class modelElementHandler extends LineToContentMapReader7Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{};

    public modelElementHandler() {
    }

    @Override
    protected List<LineContent> createObject(Attributes attrs) {
      fieldaccumulator = new LineContentAccumulator();
      return fieldaccumulator.getLineToContentMap();
    }

    @Override
    protected LineToContentMapReader7Handler.ElementHandler createChild(String tagName) throws SAXException {
      if ("persistence".equals(tagName)) {
        return nullhandler;
      }
      if ("language".equals(tagName)) {
        return nullhandler;
      }
      if ("language-engaged-on-generation".equals(tagName)) {
        return nullhandler;
      }
      if ("devkit".equals(tagName)) {
        return nullhandler;
      }
      if ("import".equals(tagName)) {
        return nullhandler;
      }
      if ("roots".equals(tagName)) {
        return rootshandler;
      }
      if ("root".equals(tagName)) {
        return rootContenthandler;
      }
      return super.createChild(tagName);
    }

    @Override
    protected void handleChild(Object resultObject, String tagName, Object value) throws SAXException {
      List<LineContent> result = (List<LineContent>) resultObject;
      if ("persistence".equals(tagName)) {
        return;
      }
      if ("language".equals(tagName)) {
        return;
      }
      if ("language-engaged-on-generation".equals(tagName)) {
        return;
      }
      if ("devkit".equals(tagName)) {
        return;
      }
      if ("import".equals(tagName)) {
        return;
      }
      if ("roots".equals(tagName)) {
        return;
      }
      if ("root".equals(tagName)) {
        return;
      }
      super.handleChild(resultObject, tagName, value);
    }
  }

  public class rootsElementHandler extends LineToContentMapReader7Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{};

    public rootsElementHandler() {
    }

    @Override
    protected LineToContentMapReader7Handler.ElementHandler createChild(String tagName) throws SAXException {
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
        fieldaccumulator.popNode(myLocator);
        return;
      }
      super.handleChild(resultObject, tagName, value);
    }
  }

  public class rootContentElementHandler extends LineToContentMapReader7Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{};

    public rootContentElementHandler() {
    }

    @Override
    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
      SNode result = (SNode) resultObject;
      if ("id".equals(name)) {
        fieldaccumulator.pushNode(SNodeId.fromString(value), myLocator);
        return;
      }
      super.handleAttribute(resultObject, name, value);
    }

    @Override
    protected LineToContentMapReader7Handler.ElementHandler createChild(String tagName) throws SAXException {
      if ("node".equals(tagName)) {
        return nodehandler;
      }
      return super.createChild(tagName);
    }

    @Override
    protected void handleChild(Object resultObject, String tagName, Object value) throws SAXException {
      SNode result = (SNode) resultObject;
      if ("node".equals(tagName)) {
        SNode child = (SNode) value;
        fieldaccumulator.popNode(myLocator);
        return;
      }
      super.handleChild(resultObject, tagName, value);
    }
  }

  public class nodeElementHandler extends LineToContentMapReader7Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{};

    public nodeElementHandler() {
    }

    @Override
    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
      SNode result = (SNode) resultObject;
      if ("id".equals(name)) {
        fieldaccumulator.pushNode(SNodeId.fromString(value), myLocator);
        return;
      }
      super.handleAttribute(resultObject, name, value);
    }

    @Override
    protected LineToContentMapReader7Handler.ElementHandler createChild(String tagName) throws SAXException {
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
        String child = (String) value;
        if (child != null) {
          fieldaccumulator.saveProperty(child, myLocator);
        }
        return;
      }
      if ("link".equals(tagName)) {
        String child = (String) value;
        if (child != null) {
          fieldaccumulator.saveReference(child, myLocator);
        }
        return;
      }
      if ("node".equals(tagName)) {
        SNode child = (SNode) value;
        fieldaccumulator.popNode(myLocator);
        return;
      }
      super.handleChild(resultObject, tagName, value);
    }
  }

  public class propertyElementHandler extends LineToContentMapReader7Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{"name"};

    public propertyElementHandler() {
    }

    @Override
    protected String createObject(Attributes attrs) {
      return attrs.getValue("name");
    }

    @Override
    protected String[] requiredAttributes() {
      return requiredAttributes;
    }

    @Override
    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
      String result = (String) resultObject;
      if ("name".equals(name)) {
        return;
      }
      super.handleAttribute(resultObject, name, value);
    }
  }

  public class linkElementHandler extends LineToContentMapReader7Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{"role"};

    public linkElementHandler() {
    }

    @Override
    protected String createObject(Attributes attrs) {
      return attrs.getValue("role");
    }

    @Override
    protected String[] requiredAttributes() {
      return requiredAttributes;
    }

    @Override
    protected void handleAttribute(Object resultObject, String name, String value) throws SAXException {
      String result = (String) resultObject;
      if ("role".equals(name)) {
        return;
      }
      super.handleAttribute(resultObject, name, value);
    }
  }

  public class nullElementHandler extends LineToContentMapReader7Handler.ElementHandler {
    private String[] requiredAttributes = new String[]{};

    public nullElementHandler() {
    }
  }
}
