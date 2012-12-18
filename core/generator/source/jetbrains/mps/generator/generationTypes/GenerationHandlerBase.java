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
package jetbrains.mps.generator.generationTypes;

import jetbrains.mps.generator.GenerationCanceledException;
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.ide.progress.ITaskProgressHelper;
import jetbrains.mps.logging.Logger;

/**
 * Evgeny Gryaznov, Jan 20, 2010
 */
public abstract class GenerationHandlerBase implements IGenerationHandler {
  protected static final Logger LOG = Logger.getLogger(IGenerationHandler.class);

  protected IGeneratorLogger myLogger;

  @Override
  public void startGeneration(IGeneratorLogger logger) {
    myLogger = logger;
  }

  @Override
  public void finishGeneration(ITaskProgressHelper progressHelper) {
    myLogger = null;
  }

  protected void info(String text) {
    myLogger.info(text);
  }

  protected void warning(String text) {
    myLogger.warning(text);
  }

  protected void error(String text) {
    myLogger.error(text);
  }

  protected void checkMonitorCanceled(ITaskProgressHelper progressHelper) throws GenerationCanceledException {
    if (progressHelper.isCancelled()) throw new GenerationCanceledException();
  }

  @Override
  public void generationCompleted() {
  }
}
