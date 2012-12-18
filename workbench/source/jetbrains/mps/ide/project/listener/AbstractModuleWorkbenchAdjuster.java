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
package jetbrains.mps.ide.project.listener;

import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.project.AbstractModule;
import org.jetbrains.annotations.NotNull;

/**
 * Evgeny Gryaznov, Aug 26, 2010
 */
public class AbstractModuleWorkbenchAdjuster implements ApplicationComponent {
  @NotNull
  public String getComponentName() {
    return "Abstract Module Workbench Adjuster";
  }

  public void initComponent() {
    AbstractModule.registerModelCreationListener(new StructureAspectCreationListener());
    AbstractModule.registerModelCreationListener(new GeneratorModelCreationListener());
    AbstractModule.registerModelCreationListener(new LanguageAspectCreationListener());
    AbstractModule.registerModelCreationListener(new LanguageModelCreationListener());
    AbstractModule.registerModelCreationListener(new TestsModelCreationListener());
  }

  public void disposeComponent() {
  }
}
