package codeOrchestra.actionScript.index;

import com.intellij.util.io.KeyDescriptor;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 */
public class SNodeIdDescriptor implements KeyDescriptor<SNodeId> {

  public void save(DataOutput out, SNodeId nodeId) throws IOException {
    writeString(out, nodeId.getModelReference());
    writeString(out, nodeId.getNodeId());
  }

  public SNodeId read(DataInput input) throws IOException {
    return new SNodeId(readString(input), readString(input));
  }

  public int getHashCode(SNodeId id) {
    return id.hashCode();
  }

  public boolean isEqual(SNodeId first, SNodeId second) {
    return first.equals(second);
  }

  private static void writeString(DataOutput out, String text) throws IOException {
    byte[] bytes = text.getBytes();
    out.writeInt(bytes.length);
    out.write(bytes);
  }

  private static String readString(DataInput input) throws IOException {
    int length = input.readInt();
    byte[] bytes = new byte[length];
    input.readFully(bytes);
    return new String(bytes);
  }
}
