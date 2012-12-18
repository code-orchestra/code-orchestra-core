/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.debugger.api.ui.icons;

import javax.swing.Icon;
import javax.swing.ImageIcon;

public class Icons {
  public static final Icon BREAKPOINT = new ImageIcon(Icons.class.getResource("db_set_breakpoint.png"));
  public static final Icon INV_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_invalid_breakpoint.png"));
  public static final Icon DISABLED_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_disabled_breakpoint.png"));
  public static final Icon MUTED_BREAKPOINT = new ImageIcon(Icons.class.getResource("db_muted_breakpoint.png"));

  public static final Icon SHOW_AS_TREE = new ImageIcon(Icons.class.getResource("db_show_as_tree.png"));

  public static final Icon FRAMES = new ImageIcon(Icons.class.getResource("db_frames.png"));
  public static final Icon VARIABLES = new ImageIcon(Icons.class.getResource("db_variables.png"));
  public static final Icon WATCHES = new ImageIcon(Icons.class.getResource("db_watches.png"));

}
