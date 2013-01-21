package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.Concept;
import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SReference;
import org.apache.flex.compiler.internal.tree.as.metadata.*;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Anton.I.Neverov
 */
public class AnnotationInstanceProcessor extends SNodeProcessor {

  private Map<String, String> values = new HashMap<String, String>();

  public AnnotationInstanceProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("value")) {
      if (!nodeIsInstanceOfConcept(child, Concept.AnnotationPropertyValue)) {
        throw new SNodeProcessorException();
      }
      String key = getNameByReference(child, "key");
      SNode expression = child.getChild("value");
      String value = processAnnotationPropertyValue(expression);
      values.put(key, value);
    } else {
      return false;
    }
    return true;
  }

  private String processAnnotationPropertyValue(SNode expression) throws SNodeProcessorException {
    String value;
    if (isLiteral(expression)) {
        value = expression.getProperty("value");
    } else if (nodeIsInstanceOfConcept(expression, Concept.ClassExpression)) {
      SNode targetNode = getNodeByReference(expression, "reference");
      String className = targetNode.getName();
      if (className == null) {
        throw new SNodeProcessorException();
      }
      String modelName = targetNode.getModel().getLongName();
      if (modelName.isEmpty()) {
        value = className;
      } else {
        value = modelName + "." + className;
      }
    } else if (nodeIsInstanceOfConcept(expression, Concept.DotExpression)) {
      SNode operation = expression.getChild("operation");
      if (operation == null) {
        throw new SNodeProcessorException();
      }
      if (!nodeIsInstanceOfConcept(operation, Concept.StaticFieldReferenceOperation)) {
        throw new SNodeProcessorException();
      }
      SNode initializer = getNodeByReference(operation, "reference").getChild("initializer");
      if (!isLiteral(initializer)) {
        throw new SNodeProcessorException();
      }
      value = initializer.getProperty("value");
    } else {
      throw new SNodeProcessorException();
    }
    return value;
  }

  private boolean isLiteral(SNode expression) {
    return nodeIsInstanceOfConcept(expression, Concept.StringLiteral) ||
      nodeIsInstanceOfConcept(expression, Concept.BooleanConstant);
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    String annotationName = getNameByReference(myNode, "annotation");

    MetaTagNode result;
    if ("AccessibilityClass".equals(annotationName)) {
      result = new AccessibilityTagNode();
    } else if ("Alternative".equals(annotationName)) {
      result = new AlternativeTagNode();
    } else if ("DefaultProperty".equals(annotationName)) {
      result = new DefaultPropertyTagNode();
    } else if ("Effect".equals(annotationName)) {
      result = new EffectTagNode();
    } else if ("Event".equals(annotationName)) {
      result = new EventTagNode();
    } else if ("Inspectable".equals(annotationName)) {
      result = new InspectableTagNode();
    } else if ("States".equals(annotationName)) {
      result = new MultiValueMetaTagNode(annotationName);
    } else if ("ArrayElementType".equals(annotationName) ||
      "HostComponent".equals(annotationName) ||
      "InstanceType".equals(annotationName)) {
      result = new TypedTagNode(annotationName);
    } else if ("Bindable".equals(annotationName) ||
      "NonCommittingChangeEvent".equals(annotationName)) {
      result = new EventTriggerTagNode(annotationName);
    } else {
      result = new BasicMetaTagNode(annotationName);
    }

    if (values.size() == 1) {
      result.addToMap(null, values.values().iterator().next());
    } else {
      for (String value : values.keySet()) {
        result.addToMap(value, values.get(value));
      }
    }

    return result;
  }

}
