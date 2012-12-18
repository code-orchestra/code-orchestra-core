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

import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.logging.ILoggingHandler;
import jetbrains.mps.logging.LogEntry;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.make.ModuleMaker;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.validation.ModelValidator;
import jetbrains.mps.project.validation.ModuleValidatorFactory;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.*;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

public class ReferencesTest extends BaseMPSTest {
  private static final Logger LOG = Logger.getLogger(ReferencesTest.class);

  public void testBrokenReferences() {
    IdeMain.setTestMode(TestMode.CORE_TEST) ;
    TestMain.configureMPS();

    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        new ModuleMaker().make(
          new LinkedHashSet<IModule>(MPSModuleRepository.getInstance().getAllModules()),
          new EmptyProgressIndicator());

        ClassLoaderManager.getInstance().reloadAll(new EmptyProgressIndicator());
      }
    });


    final List<String> errors = new ArrayList<String>();
    final List<String> fatals = new ArrayList<String>();

    ILoggingHandler handler = new ILoggingHandler() {
      public void  info(LogEntry e) {
      }

      public void warning(LogEntry e) {        
      }

      public void debug(LogEntry e) {
      }

      public void error(LogEntry e) {
        System.out.println("error: " + e.getMessage());
        errors.add(e.getMessage());
      }

      public void fatal(LogEntry e) {
        System.out.println("fatal: " + e.getMessage());
        fatals.add(e.getMessage());
      }
    };

    Logger.addLoggingHandler(handler);

    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        for (SModelDescriptor sm : SModelRepository.getInstance().getModelDescriptors()) {
          if (!SModelStereotype.isUserModel(sm)) continue;
          checkModel(sm);
        }

        for (IModule m : MPSModuleRepository.getInstance().getAllModules()) {
          checkModule(m);
        }
      }
    });

    Logger.removeLoggingHandler(handler);

    assertTrue(errors.isEmpty());
    assertTrue(fatals.isEmpty());
  }

  private void checkModel(final SModelDescriptor sm) {
    final IScope scope = sm.getModule().getScope();
    List<String> validationResult = ModelAccess.instance().runReadAction(new Computable<List<String>>() {
      public List<String> compute() {
        return new ModelValidator(sm.getSModel()).validate(scope);
      }
    });
    for (String item : validationResult) {
      LOG.error("Error in model " + sm.getSModelReference().getSModelFqName() + " : " + item);
    }

    for (SNode node : sm.getSModel().nodes()) {
      if (SModelUtil.findConceptDeclaration(node.getConceptFqName(), GlobalScope.getInstance()) == null) {
        LOG.error("Error in model " + sm.getSModelReference().getSModelFqName() + " : Unknown concept " + node.getConceptFqName());
      }
    }

    for (SNode node : sm.getSModel().nodes()) {

      for (SReference ref : node.getReferences()) {
        if (SNodeUtil.hasReferenceMacro(node, ref.getRole())) {
          continue;
        }                      

        if (ref.getTargetNode() == null) {
          LOG.error("Error in model " + sm.getSModelReference().getSModelFqName() + " : Broken reference in node " + node);
        }
      }
    }
  }

  private void checkModule(IModule m) {
    List<String> messages = ModuleValidatorFactory.createValidator(m).getErrors();
    for (String msg : messages) {
      LOG.error("Error in module " + m + " : " + msg);
    }
  }
}
