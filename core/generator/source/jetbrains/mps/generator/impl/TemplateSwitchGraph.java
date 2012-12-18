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
package jetbrains.mps.generator.impl;

import jetbrains.mps.generator.runtime.TemplateModel;
import jetbrains.mps.generator.runtime.TemplateReductionRule;
import jetbrains.mps.generator.runtime.TemplateSwitchMapping;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.FlattenIterable;

import java.util.*;

public class TemplateSwitchGraph {

  private Map<SNodePointer, Node> mySwitchToNode = new HashMap<SNodePointer, Node>();

  public TemplateSwitchGraph(Collection<TemplateModel> templateModels) {
    for (TemplateModel templateModel : templateModels) {
      for (TemplateSwitchMapping root : templateModel.getSwitches()) {
        mySwitchToNode.put(root.getSwitchNode(), new Node(root));
      }
    }

    for (Node node : mySwitchToNode.values()) {
      SNodePointer modifiesSwitchPtr = node.mySwitch.getModifiesSwitch();
      if (modifiesSwitchPtr != null) {
        Node modifiedSwitch = mySwitchToNode.get(modifiesSwitchPtr);
        if (modifiedSwitch != null) {
          node.myModified = modifiedSwitch;
        }
      }
      if (node.myModified == null) {
        node.myRules = new LinkedList<TemplateSwitchMapping>();
      }
    }
    for (Node node : mySwitchToNode.values()) {
      Node bottom = node;
      int i = 256;
      while (bottom.myModified != null && --i > 0) {
        bottom = bottom.myModified;
      }
      if (node != bottom) {
        node.myModified = bottom;
        if (i == 0) {
          throw new RuntimeException("Template switch loop in: " + node);     // TODO handle correctly
        }
      }
      bottom.myRules.add(node.mySwitch);
    }
    for (Node node : mySwitchToNode.values()) {
      if (node.myModified == null) {
        node.createFinder();
      }
    }
  }

  public FastRuleFinder getRuleFinder(SNodePointer baseSwitch) {
    Node bottom = mySwitchToNode.get(baseSwitch);
    while (bottom.myModified != null) {
      bottom = bottom.myModified;
    }
    return bottom.finder;
  }

  public TemplateSwitchMapping getSwitch(SNodePointer switch_) {
    Node node = mySwitchToNode.get(switch_);
    return node != null ? node.mySwitch : null;
  }

  private static class Node {
    final TemplateSwitchMapping mySwitch;
    Node myModified;
    List<TemplateSwitchMapping> myRules;
    FastRuleFinder finder;

    public Node(TemplateSwitchMapping switch_) {
      this.mySwitch = switch_;
    }

    private void createFinder() {
      FlattenIterable<TemplateReductionRule> rules = new FlattenIterable<TemplateReductionRule>(new ArrayList<Iterable<TemplateReductionRule>>());
      for (TemplateSwitchMapping sw : myRules) {
        rules.add(sw.getReductionRules());
      }

      this.myRules = null;
      this.finder = new FastRuleFinder(rules);
    }
  }
}
