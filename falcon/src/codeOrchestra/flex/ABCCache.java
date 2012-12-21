package codeOrchestra.flex;

import org.apache.flex.compiler.internal.tree.as.FileNode;
import org.apache.flex.compiler.internal.units.requests.ABCBytesRequestResult;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Anton.I.Neverov
 */
public class ABCCache {

  private Map<String, ABCBytesRequestResult> abcCache = new HashMap<String, ABCBytesRequestResult>();

  public ABCBytesRequestResult get(IASNode key) {
    return abcCache.get(calculate(key));
  }

  public ABCBytesRequestResult put(IASNode key, ABCBytesRequestResult value) {
    return abcCache.put(calculate(key), value);
  }

  public ABCBytesRequestResult remove(IASNode key) {
    return abcCache.remove(calculate(key));
  }

  private String calculate(IASNode node) {
    if (node instanceof FileNode) {
      return ((FileNode) node).getContainingFilePath();
    }
    throw new RuntimeException();
  }

}
