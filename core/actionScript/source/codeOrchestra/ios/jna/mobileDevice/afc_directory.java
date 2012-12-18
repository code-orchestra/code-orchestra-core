package codeOrchestra.ios.jna.mobileDevice;

import codeOrchestra.ios.jna.util.FieldUtil;
import com.sun.jna.Structure;

import java.util.List;

/**
 * @author: Alexander Eliseyev
 */
public class afc_directory extends Structure {

  public static class ByReference extends afc_directory implements Structure.ByReference {
  }

  public char[] unknown = new char[0];       /* size unknown */

  @Override
  protected List getFieldOrder() {
    return FieldUtil.getFieldsOrderForClass(getClass());
  }
}
