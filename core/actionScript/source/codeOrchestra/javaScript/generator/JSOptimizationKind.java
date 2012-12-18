package codeOrchestra.javaScript.generator;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;

import java.util.HashSet;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public enum JSOptimizationKind {

  // Not an optimization (non-advanced)

  EnableFlashStage("Enable Flash Stage", false, false, OutputType.HTML5_APPLICATION),

  // Eugene's optimizations (non-advanced)

  DeleteWhitespaces("Delete whitespaces in generated code", false),
  DeleteUnusedMembers("Delete unused members in generated code", false, OutputType.HTML5_APPLICATION),

  // Anton's optimizations (advanced)

  AccessExpressionToMemberAccess("Convert object[\"property\"] to object.property where possible"),
  CompactIfStatement("Convert simple if statements to ternary or logical operators"),
  EvaluateSimpleExpressions("Evaluate simple expressions"),
  InlinePrivateMethods("Inline private methods"),
  MergeLocalVariables("Reuse local variables instead of declaring new ones where possible"),
  SetShortNames("Use short names for variables and private methods"),
  SimplifyEmptyArrayAndObjectCreation("Use [] and {} instead of new Array() and new Object()");

  private String presentation;
  private Set<OutputType> outputTypes;
  private boolean advanced;
  private boolean defaultValue;

  private JSOptimizationKind(String presentation) {
    this(presentation, OutputType.HTML5_APPLICATION, OutputType.HTML5_LIBRARY);
  }

  private JSOptimizationKind(String presentation, boolean advanced) {
    this(presentation, advanced, OutputType.HTML5_APPLICATION, OutputType.HTML5_LIBRARY);
  }

  private JSOptimizationKind(String presentation, OutputType... applicableOutputTypes) {
    this(presentation, true, applicableOutputTypes);
  }

  private JSOptimizationKind(String presentation, boolean advanced, OutputType... applicableOutputTypes) {
    this(presentation, advanced, true, applicableOutputTypes);
  }

  private JSOptimizationKind(String presentation, boolean advanced, boolean defaultValue, OutputType... applicableOutputTypes) {
    this.presentation = presentation;
    this.advanced = advanced;
    this.defaultValue = defaultValue;

    this.outputTypes = new HashSet<OutputType>();
    for (OutputType applicableOutputType : applicableOutputTypes) {
      this.outputTypes.add(applicableOutputType);
    }
  }

  public boolean getDefaultValue() {
    return defaultValue;
  }

  public boolean isAdvanced() {
    return advanced;
  }

  public boolean isApplicable(OutputType outputType) {
    return outputTypes.contains(outputType);
  }

  public String getPresentation() {
    return presentation;
  }

}
