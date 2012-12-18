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
package jetbrains.mps.nodeEditor.icons;

import javax.swing.*;

/**
 * @author Kostik
 */
public class Icons {
  public static final Icon OK = new ImageIcon(Icons.class.getResource("errorsOK.png"));
  public static final Icon IN_PROGRESS = new ImageIcon(Icons.class.getResource("errorsInProgress.png"));
  public static final Icon ERRORS = new ImageIcon(Icons.class.getResource("errorsFound.png"));
  public static final Icon WARNINGS = new ImageIcon(Icons.class.getResource("warningsFound.png"));
}
