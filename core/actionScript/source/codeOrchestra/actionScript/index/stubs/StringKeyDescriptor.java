package codeOrchestra.actionScript.index.stubs;

import com.intellij.util.io.KeyDescriptor;
import org.apache.commons.lang.ObjectUtils;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

/**
 * @author Alexander Eliseyev
 */
public class StringKeyDescriptor implements KeyDescriptor<String> {

  private byte[] myBytes = new byte[1024];

  private String getString(byte[] b, int off, int len) {
    byte[] bytes = new byte[len];
    System.arraycopy(b, off, bytes, 0, len);
    return new String(bytes);
  }

  @Override
  public void save(DataOutput out, String value) throws IOException {
    if (value == null) {
      return;
    }
    int valueLength = value.length();
    out.writeShort(valueLength);
    out.write(value.getBytes(), 0, valueLength);
  }

  @Override
  public String read(DataInput in) throws IOException {
    short rootFqNameLength = in.readShort();
    in.readFully(myBytes, 0, rootFqNameLength);
    String fqName = getString(myBytes, 0, rootFqNameLength);
    if (fqName == null) {
      return "";
    }
    return fqName;
  }

  @Override
  public int getHashCode(String value) {
    return value.hashCode();
  }

  @Override
  public boolean isEqual(String val1, String val2) {
    return ObjectUtils.equals(val1, val2);
  }
}
