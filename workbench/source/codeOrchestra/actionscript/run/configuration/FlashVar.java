package codeOrchestra.actionscript.run.configuration;

import java.io.Serializable;

/**
 * @author Alexander Eliseyev
 */
public class FlashVar implements Serializable, Cloneable {

  private String key;
  private String value;

  public FlashVar() {
    // do nothing
  }

  public FlashVar(String key, String value) {
    this.key = key;
    this.value = value;
  }

  public String getKey() {
    return key;
  }

  public void setKey(String key) {
    if (key == null) {
      this.key = null;
    } else {
      this.key = key.trim();
    }
  }

  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    if (value == null) {
      this.value = null;
    } else {
      this.value = value.trim();
    }
  }

  @Override
  public String toString() {
    return "" + key + ":" + value; 

  }
}
