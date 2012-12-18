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
package jetbrains.mps.workbench;

public enum ActionPlace {
  EDITOR("MPS_Editor"),

  PROJECT_PANE_SNODE("MPS_ProjectPane_SNode"),
  PROJECT_PANE_SMODEL("MPS_ProjectPane_SModel"),
  PROJECT_PANE_MODULE("MPS_ProjectPane_Module"),
  PROJECT_PANE_LANGUAGE("MPS_ProjectPane_Language"),
  PROJECT_PANE_DEVKIT("MPS_ProjectPane_Devkit"),
  PROJECT_PANE_SOLUTION("MPS_ProjectPane_Solution"),
  PROJECT_PANE_LIBRARY("MPS_ProjectPane_Library"),
  PROJECT_PANE_PROJECT("MPS_ProjectPane_Project"),
  PROJECT_PANE_GENERATOR("MPS_ProjectPane_Generator"),
  PROJECT_PANE_TRANSIENT_MODULES("MPS_ProjectPane_TransientModels"),
  PROJECT_PANE_PACKAGE("MPS_ProjectPane_Package"),
  PROJECT_PANE_NAMESPACE("MPS_ProjectPane_Namespace"),
  PROJECT_PANE_RUNTIME_FOLDER("MPS_ProjectPane_RuntimeFolder"),
  PROJECT_PANE_ACCESSORIES("MPS_ProjectPane_Accessories"),
  PROJECT_PANE_FILE("MPS_ProjectPane_File"),
  PROJECT_PANE_FOLDER("MPS_ProjectPane_Folder"),
  PROJECT_PANE("MPS_ProjectPane");

  private String myId = "";

  private ActionPlace(String id) {
    myId = id;
  }
}
