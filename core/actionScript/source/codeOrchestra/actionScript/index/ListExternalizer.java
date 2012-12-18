package codeOrchestra.actionScript.index;

import com.intellij.util.io.DataExternalizer;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 */
public class ListExternalizer<T> implements DataExternalizer<List<T>> {
  private DataExternalizer<T> myInnerExternalizer;

  public ListExternalizer(DataExternalizer<T> innerExternalizer) {
    myInnerExternalizer = innerExternalizer;
  }

  public void save(DataOutput output, List<T> elements) throws IOException {
    output.writeInt(elements.size());
    for (T element : elements) {
      myInnerExternalizer.save(output, element);
    }
  }

  public List<T> read(DataInput input) throws IOException {
    List<T> result = new ArrayList<T>();
    for (int i = input.readInt(); i > 0; i--) {
      result.add(myInnerExternalizer.read(input));
    }
    return result;
  }
}
