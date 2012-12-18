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
package jetbrains.mps.plugins;

import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import jetbrains.mps.execution.impl.configurations.RunConfigurationsStateManager;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.make.IMakeNotificationListener;
import jetbrains.mps.make.IMakeNotificationListener.Stub;
import jetbrains.mps.make.IMakeService;
import jetbrains.mps.make.MakeNotification;
import jetbrains.mps.plugins.applicationplugins.ApplicationPluginManager;
import jetbrains.mps.plugins.projectplugins.ProjectPluginManager;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.smodel.ModelAccess;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.concurrent.atomic.AtomicReference;

public class PluginReloader implements ApplicationComponent {
  private ReloadAdapter myReloadListener = new MyReloadAdapter();
  private IMakeNotificationListener myMakeListener = new MyMakeListener ();

  private ClassLoaderManager myClassLoaderManager;
  private ProjectManager myProjectManager;
  private ApplicationPluginManager myPluginManager;
  private IMakeService myMakeService;

  private AtomicReference<Runnable> myLoadPluginsRunnable = new AtomicReference<Runnable>();

  @SuppressWarnings({"UnusedDeclaration"})
  public PluginReloader(ClassLoaderManager classLoaderManager, ProjectManager projectManager, ApplicationPluginManager pluginManager) {
    myClassLoaderManager = classLoaderManager;
    myProjectManager = projectManager;
    myPluginManager = pluginManager;
  }

  private void loadPlugins() {
    checkDisposed();
    myPluginManager.loadPlugins();
    for (Project p : myProjectManager.getOpenProjects()) {
      p.getComponent(ProjectPluginManager.class).loadPlugins();
    }

    loadConfigurations();
  }

  private void disposePlugins() {
    if (isDisposed()) return;

    disposeConfigurations();

    for (Project p : myProjectManager.getOpenProjects()) {
      p.getComponent(ProjectPluginManager.class).disposePlugins();
    }
    myPluginManager.disposePlugins();
  }

  private void loadConfigurations() {
    if (IdeMain.getTestMode() != IdeMain.TestMode.NO_TEST) {
      return;
    }
    for (Project p : myProjectManager.getOpenProjects()) {
      p.getComponent(jetbrains.mps.execution.impl.configurations.RunConfigurationsStateManager.class).initRunConfigurations();
    }
  }

  private void disposeConfigurations() {
    if (IdeMain.getTestMode() != IdeMain.TestMode.NO_TEST) {
      return;
    }
    for (Project p : myProjectManager.getOpenProjects()) {
      p.getComponent(RunConfigurationsStateManager.class).disposeRunConfigurations();
    }
  }

  public void setMakeService (IMakeService makeService) {
    if (myMakeService == null && makeService != null) {
      this.myMakeService = makeService;
      myMakeService.addListener(myMakeListener);
    }
    else if (myMakeService != null && makeService == null) {
      myMakeService.removeListener(myMakeListener);
      this.myMakeService = null;
    }
  }
  //----------------COMPONENT STUFF---------------------

  @NonNls
  @NotNull
  public String getComponentName() {
    return "PluginReloader";
  }

  public void initComponent() {
    myClassLoaderManager.addReloadHandler(myReloadListener);
  }

  public void disposeComponent() {
    myClassLoaderManager.removeReloadHandler(myReloadListener);

    myClassLoaderManager = null;
    myProjectManager = null;
    myPluginManager = null;
  }

  private void checkDisposed () {
    if (isDisposed()) throw new IllegalStateException("already disposed");
  }

  private boolean isDisposed () {
    return myClassLoaderManager == null || myProjectManager == null || myPluginManager == null;
  }

  private class MyReloadAdapter extends ReloadAdapter {

    public void unload() {
      ModelAccess.instance().runWriteInEDT(new Runnable() {
        public void run() {
          //write action is needed the because user can acquire write action inside of this [see MPS-9139]
          disposePlugins();
        }
      });
    }

    public void load() {
      Runnable runnable = new Runnable() {
        public void run() {
          //write action is needed the because user can acquire write action inside of this [see MPS-9139]
          if (!isDisposed()) loadPlugins();
        }
      };
      if (myLoadPluginsRunnable.compareAndSet(null, runnable)) {
        if (myMakeService == null || !myMakeService.isSessionActive()) {
          myLoadPluginsRunnable.set(null);
          ModelAccess.instance().runWriteInEDT(runnable);
        }
      }
    }
  }

  private class MyMakeListener extends Stub {
    @Override
    public void sessionClosed(MakeNotification notification) {
      Runnable runnable = myLoadPluginsRunnable.getAndSet(null);
      if (runnable != null) {
        ModelAccess.instance().runWriteInEDT(runnable);
      }
    }
  }
}
