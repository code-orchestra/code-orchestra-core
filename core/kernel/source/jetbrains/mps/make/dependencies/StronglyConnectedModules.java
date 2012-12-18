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
package jetbrains.mps.make.dependencies;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.make.dependencies.graph.Graph;
import jetbrains.mps.make.dependencies.graph.Graphs;
import jetbrains.mps.make.dependencies.graph.IVertex;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.ModelAccess;

import java.util.*;

public class StronglyConnectedModules {
  private static final StronglyConnectedModules INSTANCE = new StronglyConnectedModules();

  private StronglyConnectedModules() {
  }

  public static StronglyConnectedModules getInstance() {
    return INSTANCE;
  }

  public <M extends IModule> List<Set<M>> getStronglyConnectedComponents(Set<M> modules) {
    return getStronglyConnectedComponents(modules, new DefaultModuleDecoratorBuilder<M>());
  }

  public <M extends IModule, D extends IModuleDecorator<M>> List<Set<M>> getStronglyConnectedComponents(Set<M> modules, IModuleDecoratorBuilder<M, D> decoratorBuilder) {
    List<Set<M>> result = new LinkedList<Set<M>>();

    Graph<IModuleDecorator<M>> graph = new Graph<IModuleDecorator<M>>();

    Map<IModule, IModuleDecorator<M>> moduleToDecorator = new LinkedHashMap<IModule, IModuleDecorator<M>>();
    for (M module : modules) {
      IModuleDecorator<M> decorator = decoratorBuilder.decorate(module);
      moduleToDecorator.put(module, decorator);
      graph.add(decorator);
    }

    for (IModuleDecorator<M> decorator : graph.getData()) {
      decorator.fill(moduleToDecorator);
    }

    List<List<IModuleDecorator<M>>> cycles = Graphs.findStronglyConnectedComponents(graph);

    for (List<IModuleDecorator<M>> cycle : cycles) {
      Set<M> mset = new LinkedHashSet<M>();
      result.add(mset);
      for (IModuleDecorator<M> decorator : cycle) {
        mset.add(decorator.getModule());
      }
    }

    Collections.reverse(result);

    return result;
  }

  public static interface IModuleDecorator<M extends IModule> extends IVertex, Comparable<IModuleDecorator<M>> {
    public M getModule();

    public void fill(Map<IModule, IModuleDecorator<M>> map);
  }

  public static interface IModuleDecoratorBuilder<M extends IModule, D extends IModuleDecorator<M>> {
    public D decorate(M module);
  }

  private static class DefaultModuleDecoratorBuilder<M extends IModule> implements IModuleDecoratorBuilder<M, DefaultModuleDecorator<M>> {
    public DefaultModuleDecorator<M> decorate(M module) {
      return new DefaultModuleDecorator<M>(module);
    }
  }

  private static class DefaultModuleDecorator<M extends IModule> implements IModuleDecorator<M> {
    private final M myModule;
    private final Set<DefaultModuleDecorator> myNext = new LinkedHashSet<DefaultModuleDecorator>();

    public DefaultModuleDecorator(M module) {
      myModule = module;
    }

    public void fill(Map<IModule, IModuleDecorator<M>> map) {
      List<IModule> dependency = new ArrayList<IModule>(myModule.getDependenciesManager().getRequiredModules());
      List<IModule> dependencyCopy = new ArrayList<IModule>();
      dependencyCopy.addAll(dependency);
      Collections.sort(dependencyCopy, new Comparator<IModule>() {
        public int compare(IModule o1, IModule o2) {
          return o1.getModuleFqName().compareTo(o2.getModuleFqName());
        }
      });
      for (IModule module : dependencyCopy) {
        DefaultModuleDecorator<M> next = (DefaultModuleDecorator<M>) map.get(module);
        if (next != null) {
          assert next.getModule() == module;
          myNext.add(next);
        }
      }
    }

    public M getModule() {
      return myModule;
    }

    public Set<? extends IVertex> getNexts() {
      return Collections.unmodifiableSet(myNext);
    }

    public int compareTo(IModuleDecorator<M> o) {
      return myModule.getModuleFqName().compareTo(o.getModule().getModuleFqName());
    }

    public String toString() {
      return ModelAccess.instance().runReadAction(new Computable<String>() {
        public String compute() {
          return myModule.toString();
        }
      });
    }
  }

}
