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
package jetbrains.mps.lang.editor.cellProviders;

import jetbrains.mps.editor.runtime.impl.CellUtil;
import jetbrains.mps.nodeEditor.attribute.AttributeKind;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.*;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.cells.*;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteInfo;
import jetbrains.mps.nodeEditor.cellMenu.CellContext;
import jetbrains.mps.nodeEditor.cellProviders.CellProviderWithRole;

public class ConceptPropertyCellProvider extends CellProviderWithRole {
  public static final int DEFAULT_FONT_STYLE = MPSFonts.BOLD;


  private String myConceptPropertyName;
  private SNode myConceptPropertyDeclaration;

  public void setRole(Object role) {
    myConceptPropertyName = role.toString();
    myConceptPropertyDeclaration = CellUtil.getConceptPropertyDeclaration(getSNode(), myConceptPropertyName);
  }

  public ConceptPropertyCellProvider(SNode node, EditorContext context) {
    super(node, context);
  }


  public EditorCell createEditorCell(EditorContext editorContext) {
    String text = getSNode().getConceptProperty(myConceptPropertyName);
    EditorCell_Label editorCell;
    String errorText = myNoTargetText;
    if ((errorText == null) || (errorText.length() == 0)) {
      errorText = " <no  " + myConceptPropertyName + "  value> ";
    }
    editorCell = EditorCell_Property.create(myEditorContext, new ConstantModelAccessor(text), getSNode());
    editorCell.setDefaultText(errorText);
    editorCell.setEditable(true);
    editorCell.getStyle().set(StyleAttributes.FONT_STYLE, DEFAULT_FONT_STYLE);
    return editorCell;
  }


  public NodeSubstituteInfo createDefaultSubstituteInfo() {
    return null;
  }

  public SNode getRoleAttribute() {
    return null;
  }

  public Class getRoleAttributeClass() {
    return AttributeKind.Nothing.class;
  }

  public CellContext getCellContext() {
    return new ConceptPropertyCellContext(getSNode(), myConceptPropertyDeclaration);
  }
}
