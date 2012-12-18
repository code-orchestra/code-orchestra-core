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
package jetbrains.mps.ide.projectPane.fileSystem;

import javax.swing.Icon;
import javax.swing.ImageIcon;

public class FileIcons {
  public static final Icon FILE_ICON = new ImageIcon(FileIcons.class.getResource("icons/defaultFile.png"));
  public static final Icon CLASS_ICON = new ImageIcon(FileIcons.class.getResource("icons/javaClass.png"));
  public static final Icon JAVA_ICON = new ImageIcon(FileIcons.class.getResource("icons/java.png"));
  public static final Icon XML_ICON = new ImageIcon(FileIcons.class.getResource("icons/xml.png"));
  public static final Icon FILE_VIEW_ICON = new ImageIcon(FileIcons.class.getResource("icons/file_view.png"));
}
