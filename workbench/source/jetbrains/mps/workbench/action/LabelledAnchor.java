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
package jetbrains.mps.workbench.action;

import com.intellij.openapi.actionSystem.AnActionEvent;

import java.util.Map;

public class LabelledAnchor extends BaseAction {
  private String myId;

  public LabelledAnchor(String id) {
    super();
    myId = id;
  }

  public String getId() {
    return myId;
  }

  protected void doUpdate(AnActionEvent e, Map<String, Object> _params) {
    e.getPresentation().setEnabled(false);
    e.getPresentation().setVisible(false);
  }

  public void doExecute(AnActionEvent e, Map<String, Object> _params) {

  }
}
