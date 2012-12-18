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
package jetbrains.mps.smodel;

/**
 * @deprecated after new "attribute" child in BaseConcept, use AtributeOperations class
 */
@Deprecated
public class AttributesRolesUtil {
  public static final String DEFAULT_ATTRIBUTE_ROLE = "_attr_";
  public static final String STEREOTYPE_DELIM = "$";
  public static final String ATTRIBUTE_STEREOTYPE = "attribute";
  public static final String PROPERTY_ATTRIBUTE_STEREOTYPE = "property_attribute";
  public static final String LINK_ATTRIBUTE_STEREOTYPE = "link_attribute";

  public static String childRoleFromAttributeRole(String attributeRole) {
    String attrRole = ensureNotEmpty(attributeRole);
    return attrRole + STEREOTYPE_DELIM + ATTRIBUTE_STEREOTYPE;
  }

  public static String childRoleFromPropertyAttributeRole(String propertyAttributeRole, String propertyName) {
    String attrRole = ensureNotEmpty(propertyAttributeRole);
    return attrRole + STEREOTYPE_DELIM + PROPERTY_ATTRIBUTE_STEREOTYPE + STEREOTYPE_DELIM + propertyName;
  }

  public static boolean isChildRoleOfPropertyAttributeRole(String propertyAttributeRole, String childRole) {
    String attrRole = ensureNotEmpty(propertyAttributeRole);
    return childRole.startsWith(attrRole + STEREOTYPE_DELIM + PROPERTY_ATTRIBUTE_STEREOTYPE + STEREOTYPE_DELIM);
  }

  public static boolean isChildRoleOfPropertyAttributeForPropertyName(String propertyName, String childRole) {
    return childRole.endsWith(STEREOTYPE_DELIM + PROPERTY_ATTRIBUTE_STEREOTYPE + STEREOTYPE_DELIM + propertyName);
  }

  public static boolean isChildRoleOfLinkAttributeForLinkRole(String linkRole, String childRole) {
    return childRole.endsWith(STEREOTYPE_DELIM + LINK_ATTRIBUTE_STEREOTYPE + STEREOTYPE_DELIM + linkRole);
  }

  public static String childRoleFromLinkAttributeRole(String linkAttributeRole, String linkRole) {
    String attrRole = ensureNotEmpty(linkAttributeRole);
    return attrRole + STEREOTYPE_DELIM + LINK_ATTRIBUTE_STEREOTYPE + STEREOTYPE_DELIM + linkRole;
  }

  public static boolean isChildRoleOfLinkAttributeRole(String linkAttributeRole, String childRole) {
    String attrRole = ensureNotEmpty(linkAttributeRole);
    return childRole.startsWith(attrRole + STEREOTYPE_DELIM + LINK_ATTRIBUTE_STEREOTYPE + STEREOTYPE_DELIM);
  }

  private static String ensureNotEmpty(String attributeRole) {
    if (attributeRole == null || "".equals(attributeRole)) {
      attributeRole = DEFAULT_ATTRIBUTE_ROLE;
    }
    return attributeRole;
  }

  public static boolean isNodeAttributeRole(String role) {
    return role.endsWith(STEREOTYPE_DELIM + ATTRIBUTE_STEREOTYPE) && !(isLinkAttributeRole(role) || isPropertyAttributeRole(role));
  }

  public static boolean isLinkAttributeRole(String role) {
    return role.indexOf(STEREOTYPE_DELIM + LINK_ATTRIBUTE_STEREOTYPE + STEREOTYPE_DELIM) > 0;
  }

  public static boolean isPropertyAttributeRole(String role) {
    return role.indexOf(STEREOTYPE_DELIM + PROPERTY_ATTRIBUTE_STEREOTYPE + STEREOTYPE_DELIM) > 0;
  }

  public static boolean isAttributeRole(String role) {
    return role != null && role.contains(STEREOTYPE_DELIM) &&
      (isNodeAttributeRole(role) || isLinkAttributeRole(role) || isPropertyAttributeRole(role));
  }

  public static String replaceLinkRoleInLinkAttributeRole(String attributeRole, String linkRole) {
    assert isLinkAttributeRole(attributeRole) : "attribute role must be link attribute role. was: " + attributeRole;
    int i = attributeRole.lastIndexOf(STEREOTYPE_DELIM);
    String result = attributeRole.substring(0, i + 1) + linkRole;
    return result;
  }

  public static String getLinkRoleFromLinkAttributeRole(String attributeRole) {
    int index = attributeRole.indexOf(STEREOTYPE_DELIM);
    if (index < 0) return null;
    String tail = attributeRole.substring(index + 1);
    if (tail.startsWith(LINK_ATTRIBUTE_STEREOTYPE)) {
      return tail.substring((STEREOTYPE_DELIM + LINK_ATTRIBUTE_STEREOTYPE).length());
    } else {
      return null;
    }
  }

  public static String getPropertyNameFromPropertyAttributeRole(String attributeRole) {
    int index = attributeRole.indexOf(STEREOTYPE_DELIM);
    if (index < 0) return null;
    String tail = attributeRole.substring(index + 1);
    if (tail.startsWith(PROPERTY_ATTRIBUTE_STEREOTYPE)) {
      return tail.substring((STEREOTYPE_DELIM + PROPERTY_ATTRIBUTE_STEREOTYPE).length());
    } else {
      return null;
    }
  }

  public static String getFeatureAttributeRoleFromChildRole(String attributeRole) {
    int index = attributeRole.indexOf(STEREOTYPE_DELIM);
    if (index < 0) return null;
    String tail = attributeRole.substring(0, index);
    return tail;
  }
}
