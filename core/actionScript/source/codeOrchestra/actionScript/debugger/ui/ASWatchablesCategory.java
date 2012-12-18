package codeOrchestra.actionScript.debugger.ui;

import jetbrains.mps.debug.api.programState.WatchablesCategory;

/**
 * @author Alexander Eliseyev
 */
public class ASWatchablesCategory extends WatchablesCategory {

  public static final WatchablesCategory LOCAL_VARIABLE = new ASWatchablesCategory("local variable", 3);
  public static final WatchablesCategory THIS_OBJECT = new ASWatchablesCategory("this", 1);
  public static final WatchablesCategory CALCULATED_VALUE = new WatchablesCategory("calculated value");
  public static final WatchablesCategory STATIC_CONTEXT = new ASWatchablesCategory("static field", 0);
  public static final WatchablesCategory MEMBER = new ASWatchablesCategory("local variable", 2);
  public static final WatchablesCategory ARGUMENT = new ASWatchablesCategory("local variable", 2);
  public static final WatchablesCategory THROWN_EXCEPTION = new ASWatchablesCategory("exception", 3);
  public static final WatchablesCategory METHOD = new ASWatchablesCategory("method", 4);
  public static final WatchablesCategory RETURN_VALUE = new ASWatchablesCategory("return value", 5);
  public static final WatchablesCategory FIELD_WATCHPOINT = new ASWatchablesCategory("field watchpoint", 6);

  private final int myOrder;

  public ASWatchablesCategory(String categoryName, int order) {
    super(categoryName);

    myOrder = order;
  }

  @Override
  public int compareTo(WatchablesCategory o) {
    if (!(o instanceof ASWatchablesCategory)) return 1;
    return myOrder - ((ASWatchablesCategory) o).myOrder;
  }

}
