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
package jetbrains.mps.generator.test;

import jetbrains.mps.generator.impl.IncrementalGenerationHandler;
import jetbrains.mps.make.java.BLDependenciesCache;
import jetbrains.mps.generator.GenerationCanceledException;
import jetbrains.mps.generator.GenerationOptions;
import jetbrains.mps.generator.GenerationStatus;
import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.generator.generationTypes.GenerationHandlerBase;
import jetbrains.mps.generator.generationTypes.StreamHandler;
import jetbrains.mps.generator.generationTypes.TextGenerator;
import jetbrains.mps.generator.impl.IncrementalGenerationHandler.IncrementalReporter;
import jetbrains.mps.generator.impl.dependencies.GenerationDependencies;
import jetbrains.mps.generator.impl.dependencies.GenerationDependenciesCache;
import jetbrains.mps.generator.impl.plan.GenerationPlan;
import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.ide.progress.ITaskProgressHelper;
import jetbrains.mps.messages.IMessage;
import jetbrains.mps.messages.IMessageHandler;
import jetbrains.mps.messages.MessageKind;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.util.JDOMUtil;
import jetbrains.mps.util.Pair;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jdom.Document;
import org.jdom.Element;
import org.junit.Assert;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Records generation results as Map<String,String>
 *
 * Evgeny Gryaznov, Oct 4, 2010
 */
public class IncrementalTestGenerationHandler extends GenerationHandlerBase {

  private Map<String,String> generatedContent = new HashMap<String,String>();
  private Map<String,String> existingContent;
  private IFile myFilesDir;
  private int timesCalled = 0;
  private boolean myCheckIncremental = false;
  private GenerationDependencies myLastDependencies;

  private GenerationOptions myGenOptions;

  public IncrementalTestGenerationHandler() {
  }

  public IncrementalTestGenerationHandler(Map<String,String> existingContent) {
    this.existingContent = existingContent;
  }

  public void checkIncremental(GenerationOptions op) {
    myGenOptions = op;
    myCheckIncremental = true;
  }

  public GenerationDependencies getLastDependencies() {
    return myLastDependencies;
  }

  public Map<String, String> getGeneratedContent() {
    return generatedContent;
  }

  public IMessageHandler getMessageHandler() {
    return new TestMessageHandler();
  }

  public Map<String, String> getExistingContent() {
    if(existingContent == null) {
      existingContent = new HashMap<String,String>();
      collectExistingContent(existingContent);
    }
    return existingContent;
  }

  @CodeOrchestraPatch
  private void collectExistingContent(Map<String, String> existingContent) {
    if(myFilesDir != null) {
      for (IFile f : myFilesDir.getChildren()) {
        try {
          if (f.isDirectory() || f.getName().endsWith(TraceInfoCache.TRACE_FILE_NAME))  continue; // RE-3635
          if (f.getName().endsWith(".png"))  continue; // temp fix: icons are generated in another facet
          String s = FileUtil.read(new InputStreamReader(f.openInputStream(), FileUtil.DEFAULT_CHARSET));
          existingContent.put(f.getName(), s);
        } catch (IOException e) {
          throw new RuntimeException(e);
        }
      }
    }
  }

  @Override
  public boolean canHandle(SModelDescriptor inputModel) {
    return true;
  }

  @Override
  public void startModule(IModule module, List<SModelDescriptor> inputModels, IOperationContext operationContext, ITaskProgressHelper progressHelper) {
  }

  @Override
  public boolean handleOutput(IModule module, SModelDescriptor inputModel, GenerationStatus status, IOperationContext invocationContext, ITaskProgressHelper progressHelper) {
    myLastDependencies = null;
    IFile targetDir = FileSystem.getInstance().getFileByPath(module.getOutputFor(inputModel));

    Assert.assertTrue(status.isOk());
    Assert.assertTrue("should be called once", timesCalled++ == 0);

    if(myCheckIncremental) {
      GenerationDependencies dep = status.getDependencies();
      if(dep.getFromCacheCount() + dep.getSkippedCount() == 0) {
        final StringBuilder sb = new StringBuilder("Not optimized:\n");
        new IncrementalGenerationHandler(inputModel, invocationContext, myGenOptions, new GenerationPlan(inputModel.getSModel(), GlobalScope.getInstance()).getSignature(), null, new IncrementalReporter() {
          @Override
          public void report(String message) {
            sb.append(message);
            sb.append('\n');
          }
        });
        sb.append('\n');
        Assert.fail(sb.toString());
      }
    }

    if (status.isOk()) {
      myLastDependencies = status.getDependencies();
      myFilesDir = FileGenerationUtil.getDefaultOutputDir(inputModel, targetDir);
      IFile cachesDir = FileGenerationUtil.getDefaultOutputDir(inputModel, FileGenerationUtil.getCachesDir(targetDir));

      StreamHandler streamHandler = new CollectingStreamHandler(cachesDir);
      try {
        boolean result = new TextGenerator(streamHandler,
          //ModelGenerationStatusManager.getInstance().getCacheGenerator(),
          BLDependenciesCache.getInstance().getGenerator(),
          //TraceInfoCache.getInstance().getGenerator(),
          GenerationDependenciesCache.getInstance().getGenerator()
        ).handleOutput(invocationContext, status);
        Assert.assertTrue(result);
      } finally {
        streamHandler.dispose();
      }
    }
    return true;
  }

  @Override
  public long estimateCompilationMillis(List<Pair<IModule, List<SModelDescriptor>>> input) {
    return 0;
  }

  @Override
  public boolean compile(IOperationContext operationContext, List<Pair<IModule, List<SModelDescriptor>>> input, boolean generationOK, ITaskProgressHelper progressHelper) throws GenerationCanceledException, IOException {
    return true;
  }

  public class CollectingStreamHandler implements StreamHandler {

    public CollectingStreamHandler(IFile caches) {
    }

    @Override
    public void saveStream(String name, String content, boolean isCache) {
      if(!isCache) {
        generatedContent.put(name, content);
      }
    }

    @Override
    public void saveStream(String name, Element content, boolean isCache) {
      if (!isCache) {
        try {
          StringWriter writer = new StringWriter();
          JDOMUtil.writeDocument(new Document(content), writer);
          saveStream(name, writer.toString(), isCache);
        } catch (IOException e) {
          Assert.fail(e.toString());
        }
      }
    }

    @Override
    public void saveStream(String name, byte[] content, boolean isCache) {
      Assert.fail("byte stream is not expected");
    }

    @Override
    public boolean touch(String name, boolean isCache) {
      Assert.assertFalse(isCache);
      String value = getExistingContent().get(name);
      Assert.assertNotNull("non-existing file touched: " + value);
      generatedContent.put(name, value);
      return true;
    }

    @Override
    public void dispose() {
    }
  }

  private class TestMessageHandler implements IMessageHandler {

    @Override
    public void handle(IMessage msg) {
      switch (msg.getKind()) {
        case ERROR:
        case WARNING:
          Assert.fail((msg.getKind() == MessageKind.ERROR ? "error: " : "warning: ") + msg.getText() + msg.getException());
          break;

        case INFORMATION:
          //System.out.println(msg.getText());
          break;
      }
    }

    @Override

    public void clear() {
    }
  }
}
