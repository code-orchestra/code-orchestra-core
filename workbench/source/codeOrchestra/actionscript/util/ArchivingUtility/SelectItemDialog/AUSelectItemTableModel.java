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
package codeOrchestra.actionscript.util.ArchivingUtility.SelectItemDialog;

import javax.swing.table.DefaultTableModel;

abstract public class AUSelectItemTableModel extends DefaultTableModel {

  public AUSelectItemTableModel(String[] columns, int itemNum) {
    super(columns, itemNum);
  }

  @Override
  public boolean isCellEditable(int row, int column) {
    return column == 0;
  }
  @Override
  public Class<?> getColumnClass(int column) {
    if (column == 0) { return Boolean.class; }
    return super.getColumnClass(column);
  }
  @Override
  public Object getValueAt(int row, int column) {
    return getValueAtOrig(row,column);
  }

  @Override
  public void setValueAt(Object aValue, int row, int column) {
    setValueAtOrig(aValue,row,column);
    super.setValueAt(aValue, row, column);
  };

  abstract public Object getValueAtOrig(int row, int column);

  abstract public void setValueAtOrig(Object aValue, int row, int column);
}