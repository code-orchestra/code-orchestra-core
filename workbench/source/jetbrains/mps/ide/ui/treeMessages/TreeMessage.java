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
package jetbrains.mps.ide.ui.treeMessages;

import java.awt.Color;

/**
 * Created by IntelliJ IDEA.
 * User: User
 * Date: 19.02.2010
 * Time: 19:07:40
 * To change this template use File | Settings | File Templates.
 */
public class TreeMessage {
  private Color myColor;
  private String myAdditionalText;
  private TreeMessageOwner myOwner;

  public TreeMessage(Color color, String additionalText, TreeMessageOwner owner) {
    myColor = color;
    myAdditionalText = additionalText;
    myOwner = owner;
  }

  public Color getColor() {
    return myColor;
  }

  public boolean alternatesColor() {
    return myColor != null;
  }

  public String getAdditionalText() {
    return myAdditionalText;
  }

  public boolean hasAdditionalText() {
    return myAdditionalText != null;
  }

  public TreeMessageOwner getOwner() {
    return myOwner;
  }

  public int getPriority() {
    return 0;
  }
}
