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
package jetbrains.mps.ide.dependency;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.projectPane.ProjectPane;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ModuleUtil;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ModuleTreeNode extends MPSTreeNode {
  private Project myProject;
  private IModule myModule;
  private boolean myInitialized;

  public ModuleTreeNode(Project project, IModule module) {
    super(module, null);
    myProject = project;
    myModule = module;

    String name = myModule.getModuleFqName();
    setNodeIdentifier(name);

    setText(name);
    setIcon(IconManager.getIconFor(myModule));
  }

  public void doubleClick() {
    ProjectPane.getInstance(myProject).selectModule(myModule, false);
  }

  public int getToggleClickCount() {
    return -1;
  }

  public boolean isInitialized() {
    return myInitialized;
  }

  public void init() {
    if (myInitialized) {
      return;
    }

    TextTreeNode forwardDependencies = new TextTreeNode("Forward");

    TextTreeNode dependOn = new TextTreeNode("Depend On:");
    addModules(dependOn, new ArrayList(myModule.getDependenciesManager().getAllVisibleModules()));
    forwardDependencies.add(dependOn);

    TextTreeNode used = new TextTreeNode("Uses:");
    addModules(used, ModuleUtil.refsToLanguages(myModule.getUsedLanguagesReferences()));
    forwardDependencies.add(used);

    if (myModule instanceof Language) {
      TextTreeNode extend = new TextTreeNode("Extends:");
      addModules(extend, ((Language) myModule).getExtendedLanguages());
      forwardDependencies.add(extend);
    }

    add(forwardDependencies);

    TextTreeNode backwardDependencies = new TextTreeNode("Backward");

    TextTreeNode dependent = new TextTreeNode("Dependent:");
    addModules(dependent, getDependents(myModule));
    backwardDependencies.add(dependent);

    if (myModule instanceof Language) {
      Language lang = (Language) myModule;

      TextTreeNode usedBy = new TextTreeNode("Used By:");
      addModules(usedBy, getUsedBy(lang));
      backwardDependencies.add(usedBy);

      TextTreeNode extendedBy = new TextTreeNode("Extended By:");
      addModules(extendedBy, getExtendedBy(lang));
      backwardDependencies.add(extendedBy);
    }

    add(backwardDependencies);

    myInitialized = true;
  }

  public IModule getModule() {
    return myModule;
  }

  private void addModules(MPSTreeNode node, List<? extends IModule> ms) {
    List<? extends IModule> modules = new ArrayList<IModule>(ms);
    Collections.sort(modules, new ModulesComparator());
    for (IModule m : modules) {
      node.add(new ModuleTreeNode(myProject, m));
    }
  }

  private List<IModule> getDependents(IModule module) {
    List<IModule> result = new ArrayList<IModule>();
    for (IModule m : MPSModuleRepository.getInstance().getAllModules()) {
      if (m.getDependenciesManager().getAllVisibleModules().contains(module)) {
        result.add(m);
      }
    }
    return result;
  }

  private List<IModule> getUsedBy(Language l) {
    List<IModule> result = new ArrayList<IModule>();
    ModuleReference ref = l.getModuleReference();
    for (IModule m : MPSModuleRepository.getInstance().getAllModules()) {
      if (m.getUsedLanguagesReferences().contains(ref)) {
        result.add(m);
      }
    }
    return result;
  }

  private List<Language> getExtendedBy(Language lang) {
    List<Language> result = new ArrayList<Language>();
    for (Language l : MPSModuleRepository.getInstance().getAllLanguages()) {
      if (l.getExtendedLanguages().contains(lang)) {
        result.add(l);
      }
    }
    return result;
  }
}
