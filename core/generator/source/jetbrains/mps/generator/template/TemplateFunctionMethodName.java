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
package jetbrains.mps.generator.template;

import jetbrains.mps.smodel.SNode;

/**
 * Igor Alshannikov
 * Date: Dec 21, 2006
 */
public class TemplateFunctionMethodName {
  public static String createRootRule_Condition(SNode function) {
    return "createRootRule_Condition_" + function.getId();
  }

  public static String ifMacro_Condition(SNode function) {
    return "ifMacro_Condition_" + function.getId();
  }

  public static String dropRootRule_Condition(SNode function) {
    return "dropRootRule_Condition_" + function.getId();
  }

  public static String baseMappingRule_Condition(SNode function) {
    return "baseMappingRule_Condition_" + function.getId();
  }

  public static String propertyMacro_GetPropertyValue(SNode function) {
    return "propertyMacro_GetPropertyValue_" + function.getId();
  }

  public static String referenceMacro_GetReferent(SNode function) {
    return "referenceMacro_GetReferent_" + function.getId();
  }

  public static String sourceSubstituteMacro_SourceNodesQuery(SNode function) {
    return "sourceNodesQuery_" + function.getId();
  }

  public static String sourceSubstituteMacro_SourceNodeQuery(SNode function) {
    return "sourceNodeQuery_" + function.getId();
  }

  public static String templateFragment_ContextNodeQuery(SNode function) {
    return "templateFragment_ContextNodeQuery_" + function.getId();
  }

  public static String weaving_MappingRule_ContextNodeQuery(SNode function) {
    return "weaving_MappingRule_ContextNodeQuery_" + function.getId();
  }

  public static String mapSrcMacro_MapperFunction(SNode function) {
    return "mapSrcMacro_mapper_" + function.getId();
  }

  public static String mapSrcMacro_PostMapperFunction(SNode function) {
    return "mapSrcMacro_post_mapper_" + function.getId();
  }

  public static String mappingScript_CodeBlock(SNode function) {
    return "mappingScript_CodeBlock_" + function.getId();
  }

  public static String templateArgumentQuery(SNode function) {
    return "templateArgumentQuery_" + function.getId();
  }

  public static String patternRule_Condition(SNode pattern) {
    return "patternRule_Condition_" + pattern.getId();
  }

  public static String mappingConfiguration_Condition(SNode function) {
    return "mappingConfiguration_Condition_" + function.getId();
  }

  public static String insertMacro_Query(SNode function) {
    return "insertMacro_Query_" + function.getId();
  }
}
