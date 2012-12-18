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
package jetbrains.mps.nodeEditor.leftHighlighter;

import jetbrains.mps.smodel.SNode;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 12.10.2010
 * Time: 20:40:04
 * To change this template use File | Settings | File Templates.
 */
public class SimpleTextElement implements NodeTextElement {
  private String myText;
  private SNode myNode;

  public SimpleTextElement(String text, SNode node) {
    myText = text;
    myNode = node;
  }

  @Override
  public String getText() {
    return myText;
  }

  @Override
  public SNode getNode() {
    return myNode;
  }

  @Override
  public int compareTo(NodeTextElement o) {
    if (o == null) return 1;
    if (o.getNode().isAncestorOf(myNode)) {
      return -1;
    }
    if (myNode.isAncestorOf(o.getNode())) {
      return 1;
    }
    return 0;
  }
}
