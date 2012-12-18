package codeOrchestra.actionScript.index.stubs;

import com.intellij.util.io.KeyDescriptor;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

/**
 * @author Alexander Eliseyev
 */
public class ASStubsDescriptorKeyDescriptor implements KeyDescriptor<ASStubsDescriptor> {

  private byte[] myBytes = new byte[1024];

  private String getString(byte[] b, int off, int len) {
    byte[] bytes = new byte[len];
    System.arraycopy(b, off, bytes, 0, len);
    return new String(bytes);
  }

  @Override
  public void save(DataOutput out, ASStubsDescriptor value) throws IOException {
    if (value == null) {
      return;
    }

    String rootFqName = value.getRootFqName();
    int rootFqNameLength = rootFqName.length();
    out.writeShort(rootFqNameLength);
    out.write(rootFqName.getBytes(), 0, rootFqNameLength);

    String conceptFqName = value.getConceptFqName();
    int conceptFqNameLength = conceptFqName.length();
    out.writeShort(conceptFqNameLength);
    out.write(conceptFqName.getBytes(), 0, conceptFqNameLength);
  }

  @Override
  public ASStubsDescriptor read(DataInput in) throws IOException {
    short rootFqNameLength = in.readShort();
    in.readFully(myBytes, 0, rootFqNameLength);
    String rootFqName = getString(myBytes, 0, rootFqNameLength);

    short conceptFqNameLength = in.readShort();
    in.readFully(myBytes, 0, conceptFqNameLength);
    String conceptFqName = getString(myBytes, 0, conceptFqNameLength);

    return new ASStubsDescriptor(rootFqName, conceptFqName);
  }

  @Override
  public int getHashCode(ASStubsDescriptor value) {
    return value.hashCode();
  }

  @Override
  public boolean isEqual(ASStubsDescriptor val1, ASStubsDescriptor val2) {
    if (val1 == null && val2 != null) {
      return false;
    }
    if (val1 != null && val2 == null) {
      return false;
    }
    return val1.equals(val2);
  }

}
