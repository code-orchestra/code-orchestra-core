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
package jetbrains.mps.smodel;

import jetbrains.mps.project.SModelRoot;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.List;

public enum LanguageAspect {
  STRUCTURE("structure") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.STRUCTURE;
    }

    public String getHelpURL() {
      return "http://confluence.jetbrains.com/display/MPSD2/Structure";
    }
  },

  EDITOR("editor") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.EDITOR;
    }

    public String getHelpURL() {
      return "http://confluence.jetbrains.com/display/MPSD2/Editor";
    }
  },

  ACTIONS("actions") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.ACTIONS;
    }

    public String getHelpURL() {
      return "http://confluence.jetbrains.com/display/MPSD2/Editor+Actions";
    }
  },

  CONSTRAINTS("constraints") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.CONSTRAINTS;
    }

    public String getHelpURL() {
      return "http://confluence.jetbrains.com/display/MPSD2/Constraints";
    }
  },

  BEHAVIOR("behavior") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.BEHAVIOR;
    }

    public String getHelpURL() {
      return "http://confluence.jetbrains.com/display/MPSD2/Behavior";
    }
  },

  TYPESYSTEM("typesystem") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.TYPESYSTEM;
    }

    public List<ModuleReference> getAllLanguagesToImport(Language l) {
      List<ModuleReference> result = new ArrayList<ModuleReference>(super.getAllLanguagesToImport(l));
      result.add(l.getModuleReference());
      return result;
    }

    public String getHelpURL() {
      return "http://confluence.jetbrains.com/display/MPSD2/Typesystem";
    }
  },

  REFACTORINGS("refactorings") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.REFACTORING;
    }

    public String getHelpURL() {
      return "";
    }
  },

  SCRIPTS("scripts") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.SCRIPT;
    }

    public String getHelpURL() {
      return "";
    }
  },

  INTENTIONS("intentions") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.INTENTIONS;
    }

    public String getHelpURL() {
      return "http://confluence.jetbrains.com/display/MPSD2/Intentions";
    }
  },

  FIND_USAGES("findUsages") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.FIND_USAGES;
    }

    public String getHelpURL() {
      return "http://confluence.jetbrains.com/display/MPSD2/Find+usages";
    }
  },

  PLUGIN("plugin") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.PLUGIN;
    }

    public String getHelpURL() {
      return "http://confluence.jetbrains.com/display/MPSD2/Plugin";
    }
  },

  DATA_FLOW("dataFlow") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.DATA_FLOW;
    }

    public String getHelpURL() {
      return "http://confluence.jetbrains.com/display/MPSD2/Data+flow#Dataflow-intermediatelanguage";
    }
  },

  TEST("test") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.TEST;
    }

    public String getHelpURL() {
      return "http://confluence.jetbrains.com/display/MPSD2/Language+tests+language#Languagetestslanguage-introduction";
    }
  },

  TEXT_GEN("textGen") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.TEXT_GEN;
    }

    public String getHelpURL() {
      return "";
    }
  },

  STUBS("stubs") {
    public ModuleReference getMainLanguage() {
      return BootstrapLanguages.STUBS;
    }

    public String getHelpURL() {
      return "";
    }
  },;

  private String myName;

  LanguageAspect(String name) {
    myName = name;
  }

  public boolean is(SModel model) {
    return is(model.getModelDescriptor());
  }

  public boolean is(SModelDescriptor sm) {
    return Language.getModelAspect(sm) == this;
  }

  public EditableSModelDescriptor get(Language l) {
    SModelFqName fqName = new SModelFqName(l.getModuleFqName() + "." + myName, null);
    EditableSModelDescriptor md = (EditableSModelDescriptor) SModelRepository.getInstance().getModelDescriptor(fqName);
    if (md == null) return null;
    if (SModelRepository.getInstance().getOwners(md).contains(l)) return md;
    return null;
  }

  public SModelReference get(ModuleReference l) {
    return new SModelReference(l.getModuleFqName() + "." + myName, null);
  }

  public String getName() {
    return myName;
  }

  public SModelDescriptor createNew(Language l) {
    return createNew(l, true);
  }

  public SModelDescriptor createNew(final Language l, final boolean saveModel) {
    assert get(l) == null;

    SModelRoot modelRoot;
    SModelDescriptor structureModel = l.getStructureModelDescriptor();
    if (structureModel == null) {
      modelRoot = l.getSModelRoots().get(0);
    } else {
      modelRoot = ModelRootUtil.getSModelRoot(structureModel);
    }
    final SModelDescriptor model = l.createModel(getModuleUID(l), modelRoot);
    return model;
  }

  public List<ModuleReference> getAllLanguagesToImport(Language l) {
    List<ModuleReference> result = new ArrayList<ModuleReference>();
    if (getMainLanguage() != null) {
      result.add(getMainLanguage());
    }
    return result;
  }

  @Nullable
  public abstract String getHelpURL();

  public abstract ModuleReference getMainLanguage();

  private SModelFqName getModuleUID(Language l) {
    return new SModelFqName(l.getModuleFqName() + "." + getName(), "");
  }
}
