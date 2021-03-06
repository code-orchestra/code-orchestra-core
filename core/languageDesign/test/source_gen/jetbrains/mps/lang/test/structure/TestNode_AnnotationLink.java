package jetbrains.mps.lang.test.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;

public class TestNode_AnnotationLink {
  public static final String TEST_NODE = "testNode";

  public static void setTestNode(BaseConcept source, INodeAnnotattion target) {
    source.setAttribute(TestNode_AnnotationLink.TEST_NODE, target);
  }

  public static INodeAnnotattion getTestNode(BaseConcept source) {
    return (INodeAnnotattion) source.getAttribute(TestNode_AnnotationLink.TEST_NODE);
  }
}
