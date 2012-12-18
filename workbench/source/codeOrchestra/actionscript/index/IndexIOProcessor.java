package codeOrchestra.actionscript.index;

import com.intellij.util.indexing.FileContent;
import org.w3c.dom.Element;

import java.io.InterruptedIOException;
import java.util.List;
import java.util.Map;

/**
 * RE-3949
 * @author Anton.I.Neverov
 */
public interface IndexIOProcessor<Key, Value> {

  String serialize(Map<Key, Value> map);
  Map<Key,Value> load(List<Element> elementList, FileContent inputData) throws IndexIOProcessorException;

}
