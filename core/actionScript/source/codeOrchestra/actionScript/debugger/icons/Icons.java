package codeOrchestra.actionScript.debugger.icons;

import javax.swing.Icon;
import javax.swing.ImageIcon;

/**
 * @author Alexander Eliseyev
 */
public class Icons {

  public static final Icon CHROMIUM = new ImageIcon(Icons.class.getResource("chrome.png"));

  public static final Icon BREAKPOINT = new ImageIcon(Icons.class.getResource("db_set_breakpoint.png"));
  public static final Icon INV_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_invalid_breakpoint.png"));
  public static final Icon DISABLED_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_disabled_breakpoint.png"));
  public static final Icon MUTED_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_muted_breakpoint.png"));

  public static final Icon CLASS = new ImageIcon(Icons.class.getResource("class.png"));

  public static final Icon SHOW_AS_TREE = new ImageIcon(Icons.class.getResource("db_show_as_tree.png"));

  public static final Icon FRAMES = new ImageIcon(Icons.class.getResource("db_frames.png"));
  public static final Icon VARIABLES = new ImageIcon(Icons.class.getResource("db_variables.png"));
  public static final Icon WATCHES = new ImageIcon(Icons.class.getResource("db_watches.png"));


  public static final Icon VARIABLE_PRIMITIVE = new ImageIcon(Icons.class.getResource("db_primitive.png"));
  public static final Icon VARIABLE_OBJECT = new ImageIcon(Icons.class.getResource("db_object.png"));
  public static final Icon EXCEPTION_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_exception_breakpoint.png"));
  public static final Icon DISABLED_EXCEPTION_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_disabled_exception_breakpoint.png"));
  public static final Icon METHOD_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_method_breakpoint.png"));
  public static final Icon DISABLED_METHOD_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_disabled_method_breakpoint.png"));
  public static final Icon FIELD_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_field_breakpoint.png"));
  public static final Icon DISABLED_FIELD_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_disabled_field_breakpoint.png"));
  public static final Icon WATCH = new ImageIcon(Icons.class.getResource("db_watch.png"));
  public static final Icon THREAD_RUNNING = new ImageIcon(Icons.class.getResource("db_thread_running.png"));
  public static final Icon THREAD_SUSPENDED = new ImageIcon(Icons.class.getResource("db_thread_suspended.png"));
  public static final Icon THREAD_AT_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_thread_at_breakpoint.png"));

}
