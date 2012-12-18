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
package jetbrains.mps.codeStyle;

import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.util.SystemProperties;
import jetbrains.mps.util.Pair;
import org.jetbrains.annotations.NotNull;

public class CodeStyleSettings implements ProjectComponent {

  public CodeStyleSettings() {
  }

  public static CodeStyleSettings getInstance(Project project) {
    if (project == null) return null;
    return project.getComponent(CodeStyleSettings.class);
  }

  private MyState myState = new MyState();

  private static final String ourSystemLineSeparator = SystemProperties.getLineSeparator();

  public Pair<String, String> getFieldSettings() {
    return new Pair<String, String>(myState.getFieldPrefix(), myState.getFieldSuffix());
  }

  public Pair<String, String> getStaticFieldSettings() {
    return new Pair<String, String>(myState.getStaticFieldPrefix(), myState.getStaticFieldSuffix());
  }

  public Pair<String, String> getParameterSettings() {
    return new Pair<String, String>(myState.getParameterPrefix(), myState.getParameterSuffix());
  }

  public Pair<String, String> getLocalVariableSettings() {
    return new Pair<String, String>(myState.getLocalVariablePrefix(), myState.getLocalVariableSuffix());
  }

  public void setFieldSettings(Pair<String, String> settings) {
    myState.setFieldPrefix(settings.o1);
    myState.setFieldSuffix(settings.o2);
  }

  public void setStaticFieldSettings(Pair<String, String> settings) {
    myState.setStaticFieldPrefix(settings.o1);
    myState.setStaticFieldSuffix(settings.o2);
  }

  public void setParameterSettings(Pair<String, String> settings) {
    myState.setParameterPrefix(settings.o1);
    myState.setParameterSuffix(settings.o2);
  }

  public void setLocalVariableSettings(Pair<String, String> settings) {
    myState.setLocalVariablePrefix(settings.o1);
    myState.setLocalVariableSuffix(settings.o2);
  }

  @NotNull
  public String getLineSeparator() {
    return (myState.myLineSeparator == null) ? ourSystemLineSeparator : myState.myLineSeparator;
  }

  public String getLineSeparatorSetting() {
    return myState.myLineSeparator;
  }

  public void setLineSeparator(String lineSeparator) {
    myState.myLineSeparator = lineSeparator;
  }

  public MyState getState() {
    return myState;
  }

  public void loadState(MyState state) {
    myState = state;
  }

  public void projectOpened() {
  }

  public void projectClosed() {
  }

  @NotNull
  public String getComponentName() {
    return "Code Style Settings";
  }

  public void initComponent() {
  }

  public void disposeComponent() {
  }

  public static class MyState {
    private String myFieldPrefix;
    private String myFieldSuffix;
    private String myStaticFieldPrefix;
    private String myStaticFieldSuffix;
    private String myParameterPrefix;
    private String myParameterSuffix;
    private String myLocalVariablePrefix;
    private String myLocalVariableSuffix;
    private String myLineSeparator;

    public String getFieldPrefix() {
      return myFieldPrefix;
    }

    public void setFieldPrefix(String fieldPrefix) {
      myFieldPrefix = fieldPrefix;
    }

    public String getFieldSuffix() {
      return myFieldSuffix;
    }

    public void setFieldSuffix(String fieldSuffix) {
      myFieldSuffix = fieldSuffix;
    }

    public String getStaticFieldPrefix() {
      return myStaticFieldPrefix;
    }

    public void setStaticFieldPrefix(String staticFieldPrefix) {
      myStaticFieldPrefix = staticFieldPrefix;
    }

    public String getStaticFieldSuffix() {
      return myStaticFieldSuffix;
    }

    public void setStaticFieldSuffix(String staticFieldSuffix) {
      myStaticFieldSuffix = staticFieldSuffix;
    }

    public String getParameterPrefix() {
      return myParameterPrefix;
    }

    public void setParameterPrefix(String parameterPrefix) {
      myParameterPrefix = parameterPrefix;
    }

    public String getParameterSuffix() {
      return myParameterSuffix;
    }

    public void setParameterSuffix(String parameterSuffix) {
      myParameterSuffix = parameterSuffix;
    }

    public String getLocalVariablePrefix() {
      return myLocalVariablePrefix;
    }

    public void setLocalVariablePrefix(String localVariablePrefix) {
      myLocalVariablePrefix = localVariablePrefix;
    }

    public String getLocalVariableSuffix() {
      return myLocalVariableSuffix;
    }

    public void setLocalVariableSuffix(String localVariableSuffix) {
      myLocalVariableSuffix = localVariableSuffix;
    }

    public String getLineSeparator() {
      return myLineSeparator;
    }

    public void setLineSeparator(String lineSeparator) {
      myLineSeparator = lineSeparator;
    }
  }
}
