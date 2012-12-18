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
package jetbrains.mps.ide;

import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.options.Configurable;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import jetbrains.mps.ide.CustomizationSettings.MyState;
import jetbrains.mps.plugins.projectplugins.ProjectPluginManager;
import org.jetbrains.annotations.Nls;

import javax.swing.*;
import java.awt.BorderLayout;

@State(
  name = "CustomizationSettings",
  storages = {
    @Storage(
      id = "other",
      file = "$APP_CONFIG$/other.xml"
    )}
)

public class CustomizationSettings implements PersistentStateComponent<MyState>, Configurable {
  private MyState myState = new MyState();

  private JRadioButton myDontShow;
  private JRadioButton myTabPerAspect;
  private JRadioButton myTabPerNode;
  private JRadioButton myAllTabs;

  private JRadioButton myFirstSelection;

  @Nls
  public String getDisplayName() {
    return "MPS Editor";
  }

  public Icon getIcon() {
    return null;
  }

  public String getHelpTopic() {
    // MPS-13112
    return "mps.editor";
  }

  public MyState getState() {
    return myState;
  }

  public void loadState(MyState state) {
    myState = state;
  }

  public JComponent createComponent() {
    JPanel eTabs = new JPanel();
    eTabs.setLayout(new BoxLayout(eTabs, BoxLayout.Y_AXIS));
    eTabs.setBorder(BorderFactory.createTitledBorder("Editor tabs"));

    ButtonGroup group = new ButtonGroup();

    myDontShow = new JRadioButton("Do not show tabs");
    eTabs.add(myDontShow);
    group.add(myDontShow);

    myTabPerAspect = new JRadioButton("Show 1 tab for each aspect");
    eTabs.add(myTabPerAspect);
    group.add(myTabPerAspect);

    myTabPerNode = new JRadioButton("Each aspect node in a separate tab");
    eTabs.add(myTabPerNode);
    group.add(myTabPerNode);

    myAllTabs = new JRadioButton("Each aspect node in a separate tab, tabs for non-existing aspects");
    eTabs.add(myAllTabs);
    group.add(myAllTabs);

    myFirstSelection = myTabPerAspect;
    myFirstSelection.setSelected(true);

    JPanel result = new JPanel(new BorderLayout());
    result.add(eTabs, BorderLayout.NORTH);
    result.add(new JPanel(), BorderLayout.CENTER);
    return result;
  }

  public boolean isModified() {
    return !myFirstSelection.isSelected();
  }

  public void apply() throws ConfigurationException {
    myState.show = myTabPerAspect.isSelected() ||myTabPerNode.isSelected() || myAllTabs.isSelected();
    myState.showPlain = myTabPerNode.isSelected() || myAllTabs.isSelected();
    myState.showGrayed = myAllTabs.isSelected();
    applyState();
    for (Project p : ProjectManager.getInstance().getOpenProjects()) {
      p.getComponent(ProjectPluginManager.class).recreateTabbedEditors();
    }
  }

  public void reset() {
    applyState();
    myFirstSelection.setSelected(true);
  }

  private void applyState() {
    if (!myState.show) {
      myFirstSelection = myDontShow;
    } else if (!myState.showPlain) {
      myFirstSelection = myTabPerAspect;
    } else if (!myState.showGrayed) {
      myFirstSelection = myTabPerNode;
    } else {
      myFirstSelection = myAllTabs;
    }
  }

  public void disposeUIResources() {

  }

  public static class MyState {
    private boolean showPlain = true;
    private boolean showGrayed = true;
    private boolean show = true;

    //setters are for persistence
    public void setShowPlain(boolean showPlain) {
      this.showPlain = showPlain;
    }

    //setters are for persistence
    public void setShowGrayed(boolean showGrayed) {
      this.showGrayed = showGrayed;
    }

    //setters are for persistence
    public void setShow(boolean show) {
      this.show = show;
    }

    public boolean isShowPlain() {
      return showPlain;
    }

    public boolean isShowGrayed() {
      return showGrayed;
    }

    public boolean isShow() {
      return show;
    }
  }
}
