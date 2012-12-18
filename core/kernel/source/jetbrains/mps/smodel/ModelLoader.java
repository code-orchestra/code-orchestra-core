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
package jetbrains.mps.smodel;

import java.util.ArrayList;

public class ModelLoader {
  private SModel myModel;
  private SModel myFullModel;

  public ModelLoader(SModel model, SModel fullModel) {
    myModel = model;
    myFullModel = fullModel;
  }

  public void update() {
    UnregisteredNodes.instance().clear();
    for (SNode root : myModel.roots()) {
      SNode fullRoot = myFullModel.getNodeById(root.getSNodeId());
      if (fullRoot == null) {
        throw new RuntimeException("Can't load the whole model " + myModel.getLongName() + ". Most probably, the model file is broken. See the previous error - it can show what is broken in model file");
      }
      for (SNode child : new ArrayList<SNode>(fullRoot.getChildren(true))) {
        String role = child.getRole_();
        fullRoot.removeChild(child);
        root.addChild(role, child);
      }
    }
  }
}
