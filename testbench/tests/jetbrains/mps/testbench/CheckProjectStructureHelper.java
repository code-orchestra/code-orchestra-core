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
package jetbrains.mps.testbench;

import com.intellij.ide.IdeEventQueue;
import com.intellij.openapi.project.ProjectManager;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.TestMain;
import jetbrains.mps.generator.ModelGenerationStatusManager;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.structure.project.ProjectDescriptor;
import jetbrains.mps.project.validation.ModelValidator;
import jetbrains.mps.project.validation.ModuleValidatorFactory;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.vfs.IFile;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.jetbrains.annotations.NotNull;

import javax.swing.SwingUtilities;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class CheckProjectStructureHelper {

  private final ModelsExtractor myModelsExtractor = new ModelsExtractor(false);

  /**
   * An opaque token to represent testing state.
   */
  public static abstract class Token {
  }

  public CheckProjectStructureHelper() {
  }

  public void load(final Iterable<IFile> files) {
    try {
      SwingUtilities.invokeAndWait(new Runnable() {
        @Override
        public void run() {
          ModelAccess.instance().runWriteAction(new Runnable() {
            public void run() {
              myModelsExtractor.loadModels(files);

              // ???
              Testbench.reloadAll();
            }
          });
        }
      });
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public List<String> check(Token token, List<IFile> files) {
    return ((PrivToken) token).check(files);
  }

  public List<String> checkStructure(Token token, List<IFile> files) {
    return ((PrivToken) token).checkStructure(files);
  }

  public List<String> checkGenerationStatus(Token token, List<IFile> files) {
    return ((PrivToken) token).checkGenerationStatus(files);
  }

  public List<String> checkModule(Token token, List<IFile> files) {
    return ((PrivToken) token).checkModule(files);
  }

  public void cleanUp(Token tok) {
    ((PrivToken) tok).cleanUp();
  }

  public String formatErrors(List<String> errors) {
    StringBuilder sb = new StringBuilder();
    String sep = "";
    for (String er : errors) {
      sb.append(sep).append(er);
      sep = "\n";
    }
    return sb.toString();
  }

  public Token init(String[][] macros) {
    BasicConfigurator.configure();
    Logger.getRootLogger().setLevel(Level.INFO);
    Testbench.initLogging();

    IdeMain.setTestMode(TestMode.CORE_TEST);
    TestMain.configureMPS(new String[0]);

    for (String[] macro : macros) {
      Testbench.setMacro(macro[0], macro[1]);
    }
    Testbench.initLibs();
    Testbench.makeAll();
    Testbench.reloadAll();

    com.intellij.openapi.project.Project ideaProject = ProjectManager.getInstance().getDefaultProject();
    File projectFile = FileUtil.createTmpFile();
    MPSProject project = new MPSProject(ideaProject);
    project.init(projectFile, new ProjectDescriptor());
    return new PrivToken(project);
  }

  public void dispose() {
    myModelsExtractor.clear();
  }

  // Private

  private class PrivToken extends Token {
    private final MPSProject project;

    public PrivToken(MPSProject project) {
      this.project = project;
    }

    public List<String> check(Iterable<IFile> files) {
      return CheckProjectStructureHelper.this.doCheck(files, project);
    }

    public List<String> checkStructure(List<IFile> files) {
      return CheckProjectStructureHelper.this.doCheckStructure(files, project);
    }

    public List<String> checkGenerationStatus(List<IFile> files) {
      return CheckProjectStructureHelper.this.doCheckGenerationStatus(files, project);
    }

    public List<String> checkModule(List<IFile> files) {
      return CheckProjectStructureHelper.this.doCheckModule(files, project);
    }

    public void cleanUp() {
      CheckProjectStructureHelper.this.doCleanUp(project);
    }
  }

  private List<String> doCheck(Iterable<IFile> files, MPSProject project) {
    ModelsExtractor me = new ModelsExtractor(false);
    me.loadModels(files);

    // ???
    //Testbench.reloadAll();

    return checkModels(me.getModels());
  }

  private List<String> doCheckStructure(List<IFile> files, MPSProject project) {
    ModelsExtractor me = new ModelsExtractor(true);
    me.loadModels(files);

    // ???
    //Testbench.reloadAll();

    return checkStructure(me.getModels());
  }

  private List<String> doCheckGenerationStatus(List<IFile> files, MPSProject project) {
    ModelsExtractor me = new ModelsExtractor(false);
    me.loadModels(files);

    // ???
    //Testbench.reloadAll();

    return checkModelsGenerationStatus(me.getModels());
  }

   private List<String> doCheckModule(List<IFile> files, MPSProject project) {
    ModelsExtractor me = new ModelsExtractor(false);
    me.loadModels(files);

    return checkModules(me.getModules(files));
  }

  private void doCleanUp(final MPSProject project) {
    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      public void run() {
        project.dispose(false);
        IdeEventQueue.getInstance().flushQueue();
        System.gc();
      }
    });
  }

  private List<String> checkModelsGenerationStatus(final Iterable<SModelDescriptor> models) {
    final List<String> errors = new ArrayList<String>();
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        for (SModelDescriptor sm : models) {
          if(!sm.isGeneratable()) continue;

          IModule module = sm.getModule();
          if (module == null) {
            errors.add("Model without a module: " + sm.getSModelReference().toString());
            continue;
          }
          String genHash = ModelGenerationStatusManager.getLastGenerationHash(sm);
          if (genHash == null) {
            errors.add("No generated hash for " + sm.getSModelReference().toString());
            continue;
          }
          String realHash = sm.getModelHash();
          if (realHash == null) {
            errors.add("cannot gen cache for " + sm.getSModelReference().toString());
            continue;
          }
          if (!realHash.equals(genHash)) {
            errors.add("model requires generation: " + sm.getSModelReference().toString() + " last genHash:" + genHash + " modelHash:" + realHash);
          }
        }
      }
    });
    return errors;
  }

  private List<String> checkStructure(final Iterable<SModelDescriptor> models) {
    final List<String> errors = new ArrayList<String>();
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        for (SModelDescriptor sm : models) {
          if (!SModelStereotype.isUserModel(sm)) continue;
          checkModelNodes(sm.getSModel(), errors);
        }
      }
    });
    return errors;
  }

  private List<String> checkModels(final Iterable<SModelDescriptor> models) {
    final List<String> errors = new ArrayList<String>();
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        for (SModelDescriptor sm : models) {
          if (!SModelStereotype.isUserModel(sm)) continue;
          StringBuilder errorMessages = checkModel(sm);

          if (errorMessages.length() > 0) {
            errors.add("Broken References: " + errorMessages.toString());
          }
        }
      }
    });
    return errors;
  }

   private List<String> checkModules(final Iterable<IModule> modules) {
    final List<String> errors = new ArrayList<String>();
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        for (IModule sm : modules) {
          StringBuilder errorMessages = checkModule(sm);
          if (errorMessages.length() > 0) {
            errors.add(errorMessages.toString());
          }
        }
      }
    });
    return errors;
  }

  private static void checkModelNodes(@NotNull SModel model, @NotNull List<String> result) {
    for (SNode node : model.nodes()) {
      for (String propname : node.getProperties().keySet()) {
        SNode decl = node.getPropertyDeclaration(propname);
        if (decl == null) {
          result.add("unknown property: `" + propname + "' in node " + node.getDebugText());
        }
      }
      for (SReference ref : node.getReferencesIterable()) {
        SNode decl = node.getLinkDeclaration(ref.getRole());
        if (decl == null) {
          result.add("unknown link role: `" + ref.getRole() + "' in node " + node.getDebugText());
        }
      }
      for (SNode child : node.getChildren()) {
        SNode decl = child.getRoleLink();
        if (decl == null) {
          result.add("unknown child role: `" + child.getRole_() + "' in node " + node.getDebugText());
        }
      }
    }
  }

  private StringBuilder checkModel(final SModelDescriptor sm) {
    final IScope scope = sm.getModule().getScope();
    StringBuilder errorMessages = new StringBuilder();
    List<String> validationResult = ModelAccess.instance().runReadAction(new Computable<List<String>>() {
      public List<String> compute() {
        return new ModelValidator(sm.getSModel()).validate(scope);
      }
    });
    if(!validationResult.isEmpty()) {
      errorMessages.append("errors in model: ").append(sm.getSModelReference().toString()).append("\n");
      for (String item : validationResult) {
        errorMessages.append("\t");
        errorMessages.append(item);
        errorMessages.append("\n");
      }
    }

    for (SNode node : sm.getSModel().nodes()) {
      Testbench.LOG.debug("Checking node " + node);
      if (SModelUtil.findConceptDeclaration(node.getConceptFqName(), GlobalScope.getInstance()) == null) {
        errorMessages.append("Unknown concept ");
        errorMessages.append(node.getConceptFqName());
        errorMessages.append("\n");
      }
    }

    for (SNode node : sm.getSModel().nodes()) {
      for (SReference ref : node.getReferences()) {
        if (SNodeUtil.hasReferenceMacro(node, ref.getRole())) {
          continue;
        }

        if (ref.getTargetNodeSilently() == null) {
          errorMessages.
            append("Broken reference in model {").
            append(node.getModel().getLongName()).
            append("}").
            append(" node ").
            append(node.getId()).
            append("(").
            append(node).
            append(")\n");
        }
      }
    }
    return errorMessages;
  }

  private StringBuilder checkModule(final IModule module) {
    StringBuilder errorMessages = new StringBuilder();
    List<String> validationResult = ModelAccess.instance().runReadAction(new Computable<List<String>>() {
      public List<String> compute() {
        return ModuleValidatorFactory.createValidator(module).getErrors();
      }
    });
    if(!validationResult.isEmpty()) {
      for (String item : validationResult) {
        errorMessages.append("\t");
        errorMessages.append(item);
        errorMessages.append("\n");
      }
    }
    return errorMessages;
  }

}
