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

import com.intellij.openapi.application.PathMacros;
import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.util.PathUtil;
import jetbrains.mps.library.BaseLibraryManager.MyState;
import jetbrains.mps.library.LibraryInitializer;
import jetbrains.mps.library.LibraryManager;
import jetbrains.mps.logging.ILoggingHandler;
import jetbrains.mps.logging.LogEntry;
import jetbrains.mps.make.ModuleMaker;
import jetbrains.mps.project.IModule;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import org.apache.log4j.Logger;

import javax.swing.SwingUtilities;
import java.io.File;
import java.util.LinkedHashSet;

public class Testbench {
  static final Logger LOG = Logger.getLogger(Testbench.class);

  private Testbench() {
  }

  public static void setMacro(String macroName, String path) {
    String canonicalPath = PathUtil.getCanonicalPath(path);
    File file = new File(canonicalPath);
    if (file.exists() && file.isDirectory()) {
      PathMacros.getInstance().setMacro(macroName, canonicalPath);
    }
  }

  public static void makeAll() {
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        EmptyProgressIndicator indicator = new EmptyProgressIndicator();

        ClassLoaderManager.getInstance().updateClassPath();

        ModuleMaker maker = new ModuleMaker();
        maker.make(new LinkedHashSet<IModule>(MPSModuleRepository.getInstance().getAllModules()), indicator);

        ClassLoaderManager.getInstance().reloadAll(indicator);
      }
    });
  }

  public static void reloadAll() {
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        EmptyProgressIndicator indicator = new EmptyProgressIndicator();
        ClassLoaderManager.getInstance().reloadAll(indicator);
      }
    });
  }

  public static void initLibs() {
    MyState state = LibraryManager.getInstance().getState();
    LibraryManager.getInstance().loadState(state);
    try {
    SwingUtilities.invokeAndWait(new Runnable() {
      @Override
      public void run() {
        ModelAccess.instance().runWriteAction(new Runnable() {
          public void run() {
            LibraryInitializer.getInstance().update();
          }
        });
      }
    });
    }
    catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public static void initLogging() {
    jetbrains.mps.logging.Logger.addLoggingHandler(new LoggingHandlerAdapter());
  }

  private static class LoggingHandlerAdapter implements ILoggingHandler {

    public void info(LogEntry e) {
     LOG.info(e.getMessage());
    }

    public void warning(LogEntry e) {
      LOG.warn(e.getMessage());
    }

    public void debug(LogEntry e) {
      LOG.debug(e.getMessage());
    }

    public void error(LogEntry e) {
      if (e.getThrowable() != null) {
        LOG.error(e.getThrowable());
      } else {
        LOG.error(e.getMessage());
      }
    }

    public void fatal(LogEntry e) {
      if (e.getThrowable() != null) {
        LOG.fatal(e.getThrowable());
      } else {
        LOG.fatal(e.getMessage());
      }
    }
  }
}