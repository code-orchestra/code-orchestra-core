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
package jetbrains.mps.ide.editorTabs;

import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import java.util.ArrayList;
import java.util.List;

public abstract class EditorTabDescriptor implements Comparable<EditorTabDescriptor> {
  public abstract String getTitle();

  @Nullable
  public Character getShortcutChar() {
    return null;
  }

  //is is assumed that if returns 0, this means "I don't know"
  public int compareTo(EditorTabDescriptor o) {
    return 0;
  }

  public SNode getBaseNode(SNode aspect) {
    return aspect;
  }

  public boolean isApplicable(SNode node) {
    return true;
  }

  public List<SNode> getNodes(SNode baseNode) {
    ArrayList<SNode> result = new ArrayList<SNode>();
    result.add(baseNode);
    return result;
  }

  public List<SNode> getConcepts(SNode baseNode) {
    return new ArrayList<SNode>();
  }

  public boolean commandOnCreate() {
    return true;
  }

  public SNode createNode(SNode baseNode, SNode concept) {
    throw new UnsupportedOperationException();
  }

  @Nullable
  public Icon getIcon() {
    return null;
  }

  public boolean isSingle(){
    return false;
  }
}
