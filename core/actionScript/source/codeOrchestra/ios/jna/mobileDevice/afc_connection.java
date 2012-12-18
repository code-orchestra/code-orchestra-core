package codeOrchestra.ios.jna.mobileDevice;

import codeOrchestra.ios.jna.util.FieldUtil;
import com.sun.jna.Pointer;
import com.sun.jna.Structure;

import java.util.List;

/**
 * @author: Alexander Eliseyev
 */
public class afc_connection extends Structure {

  public static class ByReference extends afc_connection implements Structure.ByReference {
  }

  public int handle;            /* 0 */
  public int unknown0;          /* 4 */
  public char unknown1;         /* 8 */
  public char[] padding = new char[3];       /* 9 */
  public int unknown2;          /* 12 */
  public int unknown3;          /* 16 */
  public int unknown4;          /* 20 */
  public int fs_block_size;     /* 24 */
  public int sock_block_size;   /* 28: always 0x3c */
  public int io_timeout;        /* 32: from AFCConnectionOpen, usu. 0 */
  public Pointer afc_lock;                 /* 36 */
  public int context;           /* 40 */

  @Override
  protected List getFieldOrder() {
    return FieldUtil.getFieldsOrderForClass(getClass());
  }

}
