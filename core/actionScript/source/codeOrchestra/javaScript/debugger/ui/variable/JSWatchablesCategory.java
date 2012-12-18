package codeOrchestra.javaScript.debugger.ui.variable;

import jetbrains.mps.debug.api.programState.WatchablesCategory;

/**
 * @author Alexander Eliseyev
 */
public class JSWatchablesCategory extends WatchablesCategory {

  public static final WatchablesCategory GLOBAL_PLACEHOLDER = new JSWatchablesCategory("global variables", 0);
  public static final WatchablesCategory LOCAL_VARIABLE = new JSWatchablesCategory("local variable", 3);

  private final int myOrder;

  public JSWatchablesCategory(String categoryName, int order) {
    super(categoryName);

    myOrder = order;
  }

  @Override
  public int compareTo(WatchablesCategory o) {
    if (!(o instanceof JSWatchablesCategory)) return 1;
    return myOrder - ((JSWatchablesCategory) o).myOrder;
  }

}
