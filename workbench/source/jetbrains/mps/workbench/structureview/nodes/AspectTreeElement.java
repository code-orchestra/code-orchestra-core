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
package jetbrains.mps.workbench.structureview.nodes;

import com.intellij.ide.util.treeView.smartTree.TreeElement;
import com.intellij.navigation.ItemPresentation;
import com.intellij.openapi.editor.colors.TextAttributesKey;
import com.intellij.openapi.editor.markup.TextAttributes;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNodePointer;

import java.awt.Color;

public class AspectTreeElement extends NodeTreeElement {
  private static final String NON_BIJECTIONAL_NODE_ASPECT = "non-bijectional node aspect";
  protected boolean myIsBijectional;
  protected EditorTabDescriptor myAspectDescriptor;

  public AspectTreeElement(SNodePointer node, EditorTabDescriptor aspectDescriptor, boolean bijectional) {
    super(node);
    myAspectDescriptor = aspectDescriptor;
    myIsBijectional = bijectional;
  }

  public EditorTabDescriptor getAspectDescriptor() {
    return myAspectDescriptor;
  }

  public boolean isBijectional() {
    return myIsBijectional;
  }

  public TreeElement[] getChildren() {
    return new TreeElement[0];
  }

  @Override
  public ItemPresentation getPresentation() {
    //todo use SNodePointer here, get rid of read action
    return ModelAccess.instance().runReadAction(new Computable<ItemPresentation>() {
      public ItemPresentation compute() {
        return new NodeTreeElementPresentation() {
          @Override
          public TextAttributesKey getTextAttributesKey() {
            if (myIsBijectional) return null;

            TextAttributes att = new TextAttributes();
            att.setForegroundColor(Color.GRAY);
            return TextAttributesKey.createTextAttributesKey(NON_BIJECTIONAL_NODE_ASPECT, att);
          }
        };
      }
    });
  }
}
