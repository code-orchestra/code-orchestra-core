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
package jetbrains.mps.plugins.applicationplugins;

import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.extensions.PluginId;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import jetbrains.mps.ide.actions.Ide_ApplicationPlugin;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.plugins.PluginContributor;
import jetbrains.mps.plugins.PluginUtil;
import jetbrains.mps.plugins.PluginUtil.ApplicationPluginCreator;
import jetbrains.mps.project.IModule;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.*;

public class ApplicationPluginManager implements ApplicationComponent {
  private static final Logger LOG = Logger.getLogger(ApplicationPluginManager.class);

  private List<BaseApplicationPlugin> mySortedPlugins = new ArrayList<BaseApplicationPlugin>();

  //-------

  public BaseApplicationPlugin getPlugin(PluginId id){
    for (BaseApplicationPlugin p:mySortedPlugins){
      if (p.getId()==id) return p;
    }
    return null;
  }

  public void loadPlugins() {
    mySortedPlugins = createPlugins();

    BaseApplicationPlugin idePlugin = null;

    for (BaseApplicationPlugin p : mySortedPlugins) {
      if (p.getClass().getName().equals(Ide_ApplicationPlugin.class.getName())) {
        idePlugin = p;
        break;
      }
    }

    for (BaseApplicationPlugin plugin : mySortedPlugins) {
      try {
        plugin.createKeymaps();
      } catch (Throwable t1) {
        LOG.error("Plugin " + plugin + " threw an exception during pre-initialization ", t1);
      }
    }

    for (BaseApplicationPlugin plugin : mySortedPlugins) {
      try {
        plugin.createGroups();
      } catch (Throwable t1) {
        LOG.error("Plugin " + plugin + " threw an exception during pre-initialization ", t1);
      }
    }

    for (BaseApplicationPlugin plugin : mySortedPlugins) {
      try {
        plugin.adjustGroups();
      } catch (Throwable t1) {
        LOG.error("Plugin " + plugin + " threw an exception during initialization ", t1);
      }
    }

    for (BaseApplicationPlugin plugin : mySortedPlugins) {
      try {
        plugin.createCustomParts();
      } catch (Throwable t1) {
        LOG.error("Plugin " + plugin + " threw an exception during initialization ", t1);
      }
    }
    if (idePlugin != null) {
      GroupAdjuster.adjustTopLevelGroups(idePlugin);
    }
    GroupAdjuster.refreshCustomizations();
  }

  private List<BaseApplicationPlugin> createPlugins() {
    List<BaseApplicationPlugin> result = new ArrayList<BaseApplicationPlugin>();

    Collection bootstrapPlugins = PluginUtil.getBootstrapPluginModules();
    if (!bootstrapPlugins.isEmpty()) {
      result.addAll(PluginUtil.createPlugins(bootstrapPlugins, new ApplicationPluginCreator()));
    }

    Collection<PluginContributor> pluginContributors = PluginUtil.getPluginContributors();
    for (PluginContributor c:pluginContributors){
      BaseApplicationPlugin plugin = c.createApplicationPlugin();
      if (plugin==null) continue;
      result.add(plugin);
    }

    Set<IModule> modules = new HashSet<IModule>();
    for (Project p : ProjectManager.getInstance().getOpenProjects()) {
      modules.addAll(PluginUtil.collectPluginModules(p));
    }
    result.addAll(PluginUtil.createPlugins(modules, new ApplicationPluginCreator()));

    return result;
  }

  public void disposePlugins() {
    Collections.reverse(mySortedPlugins);
    for (BaseApplicationPlugin plugin : mySortedPlugins) {
      try {
        plugin.dispose();
      } catch (Throwable t) {
        LOG.error("Plugin " + plugin + " threw an exception during disposing ", t);
      }
    }
    mySortedPlugins.clear();
  }

  //----------------COMPONENT STUFF---------------------

  @NonNls
  @NotNull
  public String getComponentName() {
    return "ApplicationPluginManager";
  }

  public void initComponent() {

  }

  public void disposeComponent() {

  }
}
