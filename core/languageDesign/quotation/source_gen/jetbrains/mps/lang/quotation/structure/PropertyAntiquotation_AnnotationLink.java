package jetbrains.mps.lang.quotation.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;

public class PropertyAntiquotation_AnnotationLink {
  public static final String PROPERTY_ANTIQUOTATION = "propertyAntiquotation";

  public static void setPropertyAntiquotation(BaseConcept source, String propertyName, PropertyAntiquotation target) {
    source.setPropertyAttribute(PropertyAntiquotation_AnnotationLink.PROPERTY_ANTIQUOTATION, propertyName, target);
  }

  public static PropertyAntiquotation getPropertyAntiquotation(BaseConcept source, String propertyName) {
    return (PropertyAntiquotation) source.getPropertyAttribute(PropertyAntiquotation_AnnotationLink.PROPERTY_ANTIQUOTATION, propertyName);
  }
}
