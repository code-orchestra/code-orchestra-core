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
import java.awt.Rectangle;

/**
 * Created by IntelliJ IDEA.
 * User: User
 * Date: 09.12.2009
 * Time: 22:46:48
 * To change this template use File | Settings | File Templates.
 */
public abstract class AbstractAdditionalPainter<T> implements AdditionalPainter<T> {

  public void afterAdding(EditorComponent editorComponent) {
  }

  public void beforeRemoval(EditorComponent editorComponent) {
  }

  @Override
  public Color getCellsFontColor(EditorCell_Label cell) {
    return null;
  }

  @Override
  public Rectangle getCoverageArea(EditorComponent editorComponent) {
    return null;
  }

  @Override
  public boolean isAbove(AdditionalPainter additionalPainter, EditorComponent editorComponent) {
    return false;
  }
}
