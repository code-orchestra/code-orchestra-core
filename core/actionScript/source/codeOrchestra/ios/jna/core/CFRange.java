package codeOrchestra.ios.jna.core;

import codeOrchestra.ios.jna.util.FieldUtil;
import com.sun.jna.Structure;

import java.util.List;

public class CFRange extends Structure {

  public static class ByValue extends CFRange implements Structure.ByValue { }

  public long loc;
  public long len;

  @Override
  protected List getFieldOrder() {
    return FieldUtil.getFieldsOrderForClass(getClass());
  }
}