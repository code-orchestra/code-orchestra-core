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
package jetbrains.mps.nodeEditor;

import jetbrains.mps.nodeEditor.cells.EditorCell_Label;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Rectangle;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 01.12.2009
 * Time: 14:57:26
 * To change this template use File | Settings | File Templates.
 */
public interface AdditionalPainter<Item> {
  public boolean paintsAbove();
  public void paint(Graphics g, EditorComponent editorComponent);
  public boolean paintsBackground();
  public void paintBackground(Graphics g, EditorComponent editorComponent);

  //returns an item which this painter paints. if it paints itself then just return this
  public Item getItem();

  public void afterAdding(EditorComponent editorComponent);
  public void beforeRemoval(EditorComponent editorComponent);

  public Color getCellsFontColor(EditorCell_Label cell);
  public Rectangle getCoverageArea(EditorComponent editorComponent);

  public boolean isAbove(AdditionalPainter additionalPainter, EditorComponent editorComponent);
}
