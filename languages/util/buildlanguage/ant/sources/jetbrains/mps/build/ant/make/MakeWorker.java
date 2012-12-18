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
package jetbrains.mps.build.ant.make;

import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.build.ant.MpsWorker;
import jetbrains.mps.build.ant.WhatToDo;
import jetbrains.mps.make.MPSCompilationResult;
import jetbrains.mps.make.ModuleMaker;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.Condition;
import org.apache.tools.ant.ProjectComponent;

import java.io.File;
import java.util.LinkedHashSet;
import java.util.Set;

public class MakeWorker extends MpsWorker {

  public static void main(String[] args) {
    MakeWorker generator = new MakeWorker(WhatToDo.fromDumpInFile(new File(args[0])), new LogLogger());
    generator.workFromMain();
  }

  public MakeWorker(WhatToDo whatToDo, ProjectComponent component) {
    super(whatToDo, component);
  }

  public MakeWorker(WhatToDo whatToDo, AntLogger logger) {
    super(whatToDo, logger);
  }

  @Override
  protected void executeTask(MPSProject project, ObjectsToProcess go) {
    Set<IModule> toCompile = new LinkedHashSet<IModule>();
    toCompile.addAll(go.getModules());
    for (MPSProject p  : go.getProjects()) {
      toCompile.addAll(p.getModules());  
    }
    for (final SModelDescriptor modelDescriptor : go.getModels()) {
      IModule owningModule = ModelAccess.instance().runReadAction(new Computable<IModule>() {
        public IModule compute() {
          return modelDescriptor.getModule();
        }
      });

      toCompile.add(owningModule);
    }
    final Set<IModule> finalToCompile = CollectionUtil.filter(toCompile, new Condition<IModule>() {
      @Override
      public boolean met(IModule module) {
        return module.isCompileInMPS() && !module.isPackaged();
      }
    });
    if (finalToCompile.isEmpty()) return;
    info("Starting compilation:");
    StringBuffer sb = new StringBuffer();
    for (IModule m : finalToCompile) {
      sb.append("    ");
      sb.append(m.getModuleFqName());
      sb.append("\n");
    }
    info(sb.toString());
    MPSCompilationResult result = ModelAccess.instance().runReadAction(new Computable<MPSCompilationResult>() {
      public MPSCompilationResult compute() {
        return new ModuleMaker().make(finalToCompile, new EmptyProgressIndicator() {
          @Override
          public void setText2(String text) {
            info("    " + text);
          }

          @Override
          public void setText(String text) {
            info(text);
          }
        });
      }
    });
    info(result.toString());
  }

  @Override
  protected void showStatistic() {
    failBuild("make");
  }
}
