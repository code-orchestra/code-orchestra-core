package codeOrchestra.actionscript.modulemaker.config.linkreport;

import org.jetbrains.annotations.Nullable;

/**
 * @author Alexander Eliseyev
 */
public class Script {

  @Nullable
  private String name;

  private String definitionId;

  public Script(@Nullable String name, String definitionId) {
    this.name = name;
    this.definitionId = definitionId;
  }

  public Script(String definitionId) {
    this(null, definitionId);
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDefinitionId() {
    return definitionId;
  }

  public void setDefinitionId(String definitionId) {
    this.definitionId = definitionId;
  }
}
