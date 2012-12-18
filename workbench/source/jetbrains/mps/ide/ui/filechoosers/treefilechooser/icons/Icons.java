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
package jetbrains.mps.ide.ui.filechoosers.treefilechooser.icons;

import javax.swing.Icon;
import javax.swing.ImageIcon;

public class Icons {
  public static final Icon USER_HOME_ICON = new ImageIcon(Icons.class.getResource("userHome.png"));
  public static final Icon MPS_HOME_ICON = new ImageIcon(Icons.class.getResource("mpsHome.png"));
  public static final Icon PROJECT_HOME_ICON = jetbrains.mps.ide.projectPane.Icons.PROJECT_ICON;
  public static final Icon MODULE_HOME_ICON = new ImageIcon(Icons.class.getResource("moduleHome.png"));

  public static final Icon NEW_FOLDER_ICON = new ImageIcon(Icons.class.getResource("newFolder.png"));
  public static final Icon DELETE_ICON = new ImageIcon(Icons.class.getResource("delete.png"));

  public static final Icon REFRESH_ICON = new ImageIcon(Icons.class.getResource("refresh.png"));
  public static final Icon SHOW_HIDDEN_ICON = new ImageIcon(Icons.class.getResource("showHiddens.png"));
}
