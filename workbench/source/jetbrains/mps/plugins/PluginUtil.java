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

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.actions.Ide_ApplicationPlugin;
import jetbrains.mps.ide.actions.Ide_ProjectPlugin;
import jetbrains.mps.lang.plugin.generator.baseLanguage.template.util.PluginNameUtils;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.plugins.applicationplugins.BaseApplicationPlugin;
import jetbrains.mps.plugins.projectplugins.BaseProjectPlugin;
import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.LanguageAspect;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.util.IterableUtil;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.Nullable;

import java.util.*;

public class PluginUtil {
  private static final Logger LOG = Logger.getLogger(PluginUtil.class);

  public static final String IDE_MODULE_ID = "jetbrains.mps.ide";

  public static Set<IModule> collectPluginModules(Project project) {
    MPSProject mpsProject = project.getComponent(MPSProject.class);

    Set<IModule> modules = new HashSet<IModule>();

    for (Solution s : mpsProject.getProjectModules(Solution.class)) {
      modules.addAll(IterableUtil.asCollection(s.getScope().getVisibleLanguages()));
      modules.addAll(IterableUtil.asCollection(s.getScope().getVisibleDevkits()));
    }

    for (Language l : mpsProject.getProjectModules(Language.class)) {
      modules.add(l);
    }

    for (DevKit dk : mpsProject.getProjectModules(DevKit.class)) {
      modules.add(dk);
    }

    modules.addAll(MPSModuleRepository.getInstance().getAllLanguages());
    modules.addAll(MPSModuleRepository.getInstance().getAllDevkits());

    return modules;
  }

  public static List<Solution> getBootstrapPluginModules() {
    Solution ide = MPSModuleRepository.getInstance().getSolution(IDE_MODULE_ID);
    return ide != null ? Collections.singletonList(ide) : Collections.<Solution>emptyList();
  }

  public static <T> List<T> createPlugins(Collection<IModule> modules, PluginCreator<T> creator) {
    List<IModule> sortedModules = PluginSorter.sortByDependencies(modules);

    final ArrayList<T> plugins = new ArrayList<T>();
    for (IModule module : sortedModules) {
      String pluginClassName = creator.getPlugin(module);
      if (pluginClassName == null) continue;
      T plugin = (T) createPlugin(module, pluginClassName);
      if (plugin == null) continue;

      plugins.add(plugin);
    }

    return plugins;
  }

  private static Object createPlugin(IModule module, String className) {
    try {
      Class pluginClass = module.getClass(className);
      if (pluginClass == null) return null;

      return pluginClass.newInstance();
    } catch (Throwable t) {
      LOG.error(t);
      return null;
    }
  }

  private static Collection<PluginContributor> myPluginContributors = new ArrayList();

  public static void addPluginContributor(PluginContributor contributor) {
    myPluginContributors.add(contributor);
  }

  public static Collection<PluginContributor> getPluginContributors() {
    return myPluginContributors;
  }

  private static abstract class PluginCreator<T> {
    @Nullable
    public final String getPlugin(IModule module) {
      if (module instanceof Language) {
        Language language = (Language) module;
        if (LanguageAspect.PLUGIN.get(language) == null) return null;
        return getPlugin(language);
      } else if (module instanceof Solution) {
        Solution solution = (Solution) module;
        return getPlugin(solution);
      } else if (module instanceof DevKit) {
        return null;
      } else {
        throw new IllegalStateException("Module type \"" + module.getClass().getSimpleName() + "\" is not supported");
      }
    }

    @Nullable
    public abstract String getPlugin(Language l);

    @Nullable
    public abstract String getPlugin(Solution s);
  }

  public static final class ProjectPluginCreator extends PluginCreator<BaseProjectPlugin> {
    public String getPlugin(Language l) {
      return LanguageAspect.PLUGIN.get(l).getLongName() + "." + PluginNameUtils.getPluginName(l);
    }

    public String getPlugin(Solution s) {
      if (s.getModuleFqName().equals(IDE_MODULE_ID)) return Ide_ProjectPlugin.class.getName();
      return NameUtil.capitalize(NameUtil.shortNameFromLongName(s.getModuleFqName())) + "_ProjectPlugin";
    }
  }

  public static final class ApplicationPluginCreator extends PluginCreator<BaseApplicationPlugin> {
    public String getPlugin(Language l) {
      return LanguageAspect.PLUGIN.get(l).getLongName() + "." + PluginNameUtils.getApplicationPluginName(l);
    }

    public String getPlugin(Solution s) {
      if (s.getModuleFqName().equals(IDE_MODULE_ID)) return Ide_ApplicationPlugin.class.getName();
      return NameUtil.capitalize(NameUtil.shortNameFromLongName(s.getModuleFqName())) + "_ApplicationPlugin";
    }
  }
}
