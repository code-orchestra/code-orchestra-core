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
package jetbrains.mps;

import com.intellij.diagnostic.MessagePool;
import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import org.jetbrains.annotations.NotNull;

import javax.swing.SwingUtilities;

//this is to get rid of memleak in case exception class is loaded by a language classloader
public class MessagesPoolClearer implements ApplicationComponent {
  private ClassLoaderManager myManager;
  private ReloadAdapter myHandler;

  public MessagesPoolClearer(ClassLoaderManager manager) {
    myManager = manager;
  }

  @NotNull
  public String getComponentName() {
    return MessagesPoolClearer.class.getSimpleName();
  }

  public void initComponent() {
    myHandler = new ReloadAdapter() {
      public void unload() {
        SwingUtilities.invokeLater(new Runnable() {
          public void run() {
            MessagePool.getInstance().clearFatals();
          }
        });
      }
    };
    myManager.addReloadHandler(myHandler);
  }

  public void disposeComponent() {
    myManager.removeReloadHandler(myHandler);
  }
}
