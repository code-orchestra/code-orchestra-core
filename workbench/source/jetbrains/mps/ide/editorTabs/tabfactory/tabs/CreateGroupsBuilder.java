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
package jetbrains.mps.ide.editorTabs.tabfactory.tabs;

import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DefaultActionGroup;
import jetbrains.mps.ide.editorTabs.EditorTabComparator;
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import jetbrains.mps.ide.editorTabs.tabfactory.NodeChangeCallback;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.SNodeUtil;
import jetbrains.mps.util.NameUtil;
import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

public class CreateGroupsBuilder {
  public static List<DefaultActionGroup> getCreateGroups(SNodePointer baseNode, Collection<EditorTabDescriptor> possibleTabs, SNode currentAspect, NodeChangeCallback callback) {
    List<DefaultActionGroup> groups = new ArrayList<DefaultActionGroup>();

    List<EditorTabDescriptor> tabs = new ArrayList<EditorTabDescriptor>(possibleTabs);
    Collections.sort(tabs, new EditorTabComparator());

    for (final EditorTabDescriptor d : tabs) {
      List<SNode> nodes = d.getNodes(baseNode.getNode());
      if (!nodes.isEmpty() && d.isSingle()) continue;

      boolean current = false;
      if (currentAspect != null) {
        for (SNode aspect : nodes) {
          if (aspect.getContainingRoot().equals(currentAspect)) {
            current = true;
            break;
          }
        }
      }

      DefaultActionGroup group = getCreateGroup(baseNode, callback, d);
      if (group == null) continue;

      if (current) {
        groups.add(0, group);
      } else {
        groups.add(group);
      }
    }
    return groups;
  }

  public static DefaultActionGroup getCreateGroup(SNodePointer baseNode, NodeChangeCallback callback, EditorTabDescriptor d) {
    List<SNode> concepts = d.getConcepts(baseNode.getNode());
    if (concepts.isEmpty()) return new DefaultActionGroup();

    DefaultActionGroup group = new DefaultActionGroup(d.getTitle(), false);
    for (final SNode concept : concepts) {
      group.add(new CreateAction(concept, d, baseNode, callback));
    }
    return group;
  }

  private static String getConceptAlias(SNode concept) {
    String alias = SNodeUtil.getConceptAlias(concept);
    if (StringUtils.isEmpty(alias)) {
      return concept.getName();
    } else {
      return alias;
    }
  }

  private static class CreateAction extends AnAction {
    private final SNode myConcept;
    private final EditorTabDescriptor myDescriptor;
    private SNodePointer myBaseNode;
    private NodeChangeCallback myCallback;

    public CreateAction(SNode concept, EditorTabDescriptor descriptor, SNodePointer baseNode, NodeChangeCallback callback) {
      super(getConceptAlias(concept).replaceAll("_", "__"), "", IconManager.getIconForConceptFQName(NameUtil.nodeFQName(concept)));
      myConcept = concept;
      myDescriptor = descriptor;
      myBaseNode = baseNode;
      myCallback = callback;
    }

    public void actionPerformed(AnActionEvent e) {
      final SNode[] created = new SNode[1];

      final Runnable r1 = new Runnable() {
        public void run() {
          created[0] = myDescriptor.createNode(myBaseNode.getNode(), myConcept);
        }
      };

      final Runnable r2 = new Runnable() {
        public void run() {
          String mainPack = myBaseNode.getNode().getProperty(SNode.PACK);
          created[0].setProperty(SNode.PACK, mainPack);
          myCallback.changeNode(created[0]);
        }
      };

      if (myDescriptor.commandOnCreate()) {
        ModelAccess.instance().runWriteActionInCommand(new Runnable() {
          public void run() {
            r1.run();
          }
        });
      } else {
        r1.run();
      }
      if (created[0] == null) return;
      ModelAccess.instance().runWriteActionInCommand(r2);
    }
  }
}
