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
package jetbrains.mps.ide.findusages.findalgorithm.resultproviders.treenodes;

import java.util.List;

public abstract class BaseLeaf extends BaseNode {
  public BaseLeaf() {

  }

  public void addChild(BaseNode child) {
    throw new UnsupportedOperationException("add child to leaf node");
  }

  public void removeChild(BaseNode child) {
    throw new UnsupportedOperationException("remove child from leaf node");
  }

  public void clearChildren() {
    throw new UnsupportedOperationException("clear children in leaf node");
  }

  public List<BaseNode> getChildren() {
    throw new UnsupportedOperationException("get children in leaf node");
  }
}
