package codeOrchestra.actionscript.index;

import org.w3c.dom.Element;

import java.util.List;

/**
 * RE-3949
 * @author Anton.I.Neverov
 */
public interface SingleEntryIndexIOProcessor<Value> {

  String serialize(Value value);
  Value load(List<Element> elementList) throws IndexIOProcessorException;

}
