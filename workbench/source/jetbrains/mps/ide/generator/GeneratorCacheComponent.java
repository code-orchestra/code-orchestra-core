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
package jetbrains.mps.ide.generator;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.application.PathManager;
import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.generator.GenerationCacheContainer;
import jetbrains.mps.generator.GenerationCacheContainer.FileBasedGenerationCacheContainer;
import org.jetbrains.annotations.NotNull;

import java.io.File;

/**
 * Evgeny Gryaznov, Sep 21, 2010
 */
public class GeneratorCacheComponent implements ApplicationComponent {

  private File generatorCaches;

  public static GeneratorCacheComponent getInstance() {
    return ApplicationManager.getApplication().getComponent(GeneratorCacheComponent.class);
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Generator caches component";
  }

  @Override
  public void initComponent() {
    generatorCaches = new File(PathManager.getSystemPath(), "mps-generator");
    if(!generatorCaches.exists() && !generatorCaches.mkdirs()) {
      generatorCaches = null;
    }
  }

  @Override
  public void disposeComponent() {
  }

  public GenerationCacheContainer getCache() {
    return new FileBasedGenerationCacheContainer(generatorCaches);
  }
}
