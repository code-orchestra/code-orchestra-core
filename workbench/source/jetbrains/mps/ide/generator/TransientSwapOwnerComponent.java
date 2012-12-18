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
import jetbrains.mps.generator.TransientModelsComponent.TransientSwapOwner;
import jetbrains.mps.generator.impl.cache.FileSwapOwner;
import org.jetbrains.annotations.NotNull;

import java.io.File;

/**
 * Created by IntelliJ IDEA.
 * User: fyodor
 * Date: 1/10/11
 * Time: 10:30 AM
 * To change this template use File | Settings | File Templates.
 */
public class TransientSwapOwnerComponent extends FileSwapOwner implements ApplicationComponent, TransientSwapOwner{

  private File mySwapDir;

  public static final TransientSwapOwnerComponent getInstance () {
    return ApplicationManager.getApplication().getComponent(TransientSwapOwnerComponent.class);
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Transient models swap owner";
  }

  @Override
  public void initComponent() {
    mySwapDir = new File(PathManager.getSystemPath(), "mps-swap");
    if(!mySwapDir.exists() && !mySwapDir.mkdirs()) {
      mySwapDir = null;
    }
  }

  @Override
  public void disposeComponent() {

  }

  @Override
  protected File getSwapDir() {
    return mySwapDir;
  }
}
