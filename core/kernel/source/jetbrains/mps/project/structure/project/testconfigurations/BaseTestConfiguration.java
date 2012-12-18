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
package jetbrains.mps.project.structure.project.testconfigurations;

import com.intellij.openapi.project.Project;
import jetbrains.mps.generator.GenParameters;

public abstract class BaseTestConfiguration {
  public static final String PROPERTY_NAME = "name";
  private String myName;

  public String getName() {
    return myName;
  }

  public void setName(String name) {
    myName = name;
  }

  public abstract GenParameters getGenParams(Project project, boolean fullRegeneration) throws IllegalGeneratorConfigurationException;
}
