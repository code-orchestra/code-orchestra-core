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
package jetbrains.mps.nodeEditor.cellProviders;

import jetbrains.mps.nodeEditor.AbstractCellProvider;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteInfo;
import jetbrains.mps.smodel.SNode;

public abstract class CellProviderWithRole extends AbstractCellProvider {
  protected String myNoTargetText;
  protected EditorContext myEditorContext;

  // auxiliary cell provider, which may help to create some parts of resulting cell (used in inheritors)
  protected AbstractCellProvider myAuxiliaryCellProvider;

  // if the cell to provide "allows" "empty" target of its relation.
  // The exact meaning of what is "empty" and what is "to allow"
  // may differ among different inheritors of this class.
  //
  // Default value is false.
  protected boolean myAllowsEmptyTarget = false;


  // if the cell to provide is read-only
  protected boolean myReadOnly = false;


  //it is important for descendants to have a unique constructor and with the same parameters as this one 
  public CellProviderWithRole(SNode node, EditorContext context) {
    super(node);
    myEditorContext = context;
  }

  public EditorContext getEditorContext() {
    return myEditorContext;
  }

  //sets a role object for this provider
  public abstract void setRole(Object role);

  //gets an attribute for this provider's node hanging on this provider's role
  public abstract SNode getRoleAttribute();

  // gets a kind of attributes possibly hanging on this provider's role.
  //todo replace with AttributeKind
  public abstract Class getRoleAttributeClass();


  public abstract NodeSubstituteInfo createDefaultSubstituteInfo();

  //sets a text to show in a cell if no target can be obtained by role
  public void setNoTargetText(String text) {
    myNoTargetText = text;
  }

  public void setReadOnly(boolean readOnly) {
    myReadOnly = readOnly;
  }

  public boolean isReadOnly() {
    return myReadOnly;
  }

  public boolean allowsEmptyTarget() {
    return myAllowsEmptyTarget;
  }

  public void setAllowsEmptyTarget(boolean allowsEmptyTarget) {
    myAllowsEmptyTarget = allowsEmptyTarget;
  }

  public void setAuxiliaryCellProvider(AbstractCellProvider provider) {
    myAuxiliaryCellProvider = provider;
  }

  public AbstractCellProvider getAuxiliaryCellProvider() {
    return myAuxiliaryCellProvider;
  }
}
