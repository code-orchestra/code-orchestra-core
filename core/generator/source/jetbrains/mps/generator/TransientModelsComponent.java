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
package jetbrains.mps.generator;

import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelReference;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * Evgeny Gryaznov, 12/3/10
 */
public class TransientModelsComponent implements ProjectComponent {

  private final ConcurrentMap<IModule, TransientModelsModule> myModuleMap = new ConcurrentHashMap<IModule, TransientModelsModule>();
  private int myModelsToKeepMax = 0; /* unlimited */
  private Project myProject;
  private int myKeptModels;
  private TransientSwapOwner myTransientSwapOwner;
  private String mySessionId;

  public TransientModelsComponent(Project project, MPSProject mpsProject) {
    myProject = project;
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "Transient Models Component";
  }

  @Override
  public void initComponent() {
    // TODO unhackme

    try {
      Class<?> soc = Class.forName("jetbrains.mps.ide.generator.TransientSwapOwnerComponent");
      Method getInstance = soc.getMethod("getInstance");
      setTransientSwapOwner((TransientSwapOwner) getInstance.invoke(null));
    }
    catch (ClassNotFoundException ignore) {}
    catch (NoSuchMethodException ignore) {}
    catch (InvocationTargetException ignore) {}
    catch (IllegalAccessException ignore) {}
  }

  @Override
  public void disposeComponent() {
    clearAll();
  }

  public void removeAllTransient() {
    clearAll();
  }

  public Iterable<TransientModelsModule> getModules() {
    ModelAccess.assertLegalRead();

    List<TransientModelsModule> result = new ArrayList<TransientModelsModule>(myModuleMap.size());
    for(TransientModelsModule m : myModuleMap.values()) {
      if(m.hasPublished()) {
        result.add(m);
      }
    }

    return result;
  }

  public void startGeneration(int numberOfModelsToKeep) {
    clearAll();
    mySessionId = newSessionId();
    myKeptModels = 0;
    myModelsToKeepMax = numberOfModelsToKeep;
  }

  private void clearAll() {
    ModelAccess.instance().requireWrite(new Runnable() {
      public void run() {
        List<TransientModelsModule> toRemove = new ArrayList<TransientModelsModule>(myModuleMap.values());
        myModuleMap.clear();
        for(TransientModelsModule m : toRemove) {
          m.disposeModule();
        }
      }
    });

    TransientSwapSpace space = getTransientSwapSpace();
    if (space != null) {
      space.clear();
    }
    mySessionId = null;
  }

  public synchronized void publishAll() {
    ModelAccess.instance().requireWrite(new Runnable() {
      public void run() {
        for(TransientModelsModule m : myModuleMap.values()) {
          m.publishAll();
        }
      }
    });
  }

  public void createModule(final IModule module) {
    if (myModuleMap.containsKey(module)) {
      return;
    }

    final TransientModelsModule transientModelsModule = new TransientModelsModule(module, TransientModelsComponent.this);
    transientModelsModule.initModule();
    myModuleMap.put(module, transientModelsModule);
  }

  public TransientModelsModule getModule(final IModule module) {
    TransientModelsModule transientModelsModule = ModelAccess.instance().requireRead(new Computable<TransientModelsModule>() {
      @Override
      public TransientModelsModule compute() {
        if (myModuleMap.containsKey(module)) {
          return myModuleMap.get(module);
        }

        throw new IllegalStateException();
      }
    });
    return transientModelsModule;
  }

  public boolean canKeepOneMore() {
    if(myModelsToKeepMax <= 0) {
      return true;
    }
    return myKeptModels++ < myModelsToKeepMax;
  }

  public TransientSwapOwner getTransientSwapOwner() {
    return myTransientSwapOwner;
  }

  public void setTransientSwapOwner (TransientSwapOwner transientSwapOwner) {
    myTransientSwapOwner = transientSwapOwner;
  }

  public TransientSwapSpace getTransientSwapSpace () {
    if (mySessionId == null) { return null; }

    TransientSwapOwner tso = getTransientSwapOwner();
    if (tso == null) { return null; }

    TransientSwapSpace space = tso.accessSwapSpace(mySessionId);
    if (space != null) { return space; }

    return tso.initSwapSpace(mySessionId);
  }

  private String newSessionId () {
    return myProject.getLocationHash()+Long.toHexString(System.currentTimeMillis());
  }


  public static interface TransientSwapSpace {

    boolean swapOut(TransientSModel model);

    TransientSModel restoreFromSwap (SModelReference mref);

    void clear();
  }

  public static interface TransientSwapOwner {

    TransientSwapSpace initSwapSpace(String spaceId);

    TransientSwapSpace accessSwapSpace (String spaceId);
  }

}
