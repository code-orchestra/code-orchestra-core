package codeOrchestra.ios.jna.mobileDevice;

import codeOrchestra.ios.jna.util.FieldUtil;
import com.sun.jna.Structure;

import java.util.List;

/**
 * @author: Alexander Eliseyev
 */
public class am_service extends Structure {

  public static class ByReference extends am_service implements Structure.ByReference {
  }

  @Override
  protected List getFieldOrder() {
    return FieldUtil.getFieldsOrderForClass(getClass());
  }
}
