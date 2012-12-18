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

import jetbrains.mps.generator.GenerationStatus;
import jetbrains.mps.generator.TransientSModel;
import jetbrains.mps.generator.cache.CacheGenerator;
import jetbrains.mps.generator.impl.dependencies.GenerationDependencies;
import jetbrains.mps.generator.impl.dependencies.GenerationRootDependencies;
import jetbrains.mps.generator.template.TemplateQueryContext;
import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.make.java.BLDependenciesCache;
import jetbrains.mps.make.java.ModelDependencies;
import jetbrains.mps.make.java.RootDependencies;
import jetbrains.mps.messages.IMessage;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.textGen.TextGenManager;
import jetbrains.mps.textGen.TextGenerationResult;
import jetbrains.mps.textGen.TextGenerationUtil;
import jetbrains.mps.traceInfo.*;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.NotNull;

import java.util.*;

public class TextGenerator {
  private static final Logger LOG = Logger.getLogger(TextGenerator.class);

  private final StreamHandler myStreamHandler;
  private CacheGenerator[] myCacheGenerators;
  private List<IMessage> myTextGenProblems = new ArrayList<IMessage>();
  private boolean myFailIfNoTextgen = false;
  private boolean myGenerateDebugInfo = true;

  public TextGenerator(StreamHandler streamHandler, CacheGenerator... generators) {
    myStreamHandler = streamHandler;
    myCacheGenerators = generators;
  }

  public void setFailIfNoTextgen(boolean failIfNoTextgen) {
    myFailIfNoTextgen = failIfNoTextgen;
  }

  public void setGenerateDebugInfo(boolean needDebugInfo) {
    myGenerateDebugInfo = needDebugInfo;
  }

  public Collection<IMessage> errors() {
    return Collections.unmodifiableList(myTextGenProblems);
  }

  public boolean handleOutput(IOperationContext context, GenerationStatus status) {
    if (!status.isOk()) return false;

    Map<SNode, Object> outputNodeContents = new LinkedHashMap<SNode, Object>();
    if (!generateText(context, status, outputNodeContents)) return false;

    generateFiles(status, outputNodeContents);
    generateCaches(status);
    return true;
  }

  private boolean generateText(IOperationContext context, GenerationStatus status, Map<SNode, Object> outputNodeContents) {
    boolean hasErrors = false;
    ModelDependencies dependRoot = new ModelDependencies();
    DebugInfo info = null;
    if (myGenerateDebugInfo) {
      status.setDebugInfo(info = new DebugInfo());
    }
    status.setBLDependencies(dependRoot);

    SModel outputModel = status.getOutputModel();
    if (outputModel == null) return !hasErrors;

    StringBuilder[] buffers = new StringBuilder[]{new StringBuilder(8192), new StringBuilder(32768) };

    for (SNode outputNode : outputModel.roots()) {
      try {
        buffers[0].setLength(0);
        buffers[1].setLength(0);
        if(buffers[0].capacity() > 100000) {
          buffers[0] = new StringBuilder(8192);
        }
        if(buffers[1].capacity() > 200000) {
          buffers[1] = new StringBuilder(32768);
        }
        TextGenerationResult result = TextGenerationUtil.generateText(context, outputNode, myFailIfNoTextgen, myGenerateDebugInfo, buffers);
        hasErrors |= result.hasErrors();
        if (result.hasErrors()) {
          myTextGenProblems.addAll(result.problems());
        } else {
          Object contents = result.getResult();
          if (TextGenerationUtil.NO_TEXTGEN != contents) {
            String fileName = outputNode.getName() + "." + TextGenManager.instance().getExtension(outputNode);
            if (info != null) {
              fillDebugInfo(info, fileName, result);
            }
            fillDependencies(dependRoot, outputNode, fileName, result);
            outputNodeContents.put(outputNode, contents);
          } else {
            // ignore this node
          }
        }
      } finally {
        TextGenManager.reset();
      }
    }
    return !hasErrors;
  }

  private void fillDebugInfo(@NotNull DebugInfo info, String fileName, TextGenerationResult result) {
    Map<SNode, TraceablePositionInfo> positions = result.getPositions();
    Map<SNode, ScopePositionInfo> scopePositions = result.getScopePositions();
    Map<SNode, UnitPositionInfo> unitPositions = result.getUnitPositions();
    if (positions == null && scopePositions == null && unitPositions == null) {
      return;
    }
    if (positions != null) {
      for (SNode out : positions.keySet()) {
        SNode input = out;
        input = getOriginalInputNodeForNearestParent(input);
        if (input != null && !(input.isDisposed())) {
          TraceablePositionInfo positionInfo = result.getPositions().get(out);
          positionInfo.setNodeId(input.getId());
          info.setModel(input.getModel());
          positionInfo.setFileName(fileName);
          info.addPosition(positionInfo, input.getTopmostAncestor().getId());
        }
      }
    }
    if (scopePositions != null) {
      for (SNode out : scopePositions.keySet()) {
        SNode input = out;
        input = getOriginalInputNodeForNearestParent(input);
        if (input != null && !(input.isDisposed())) {
          ScopePositionInfo positionInfo = result.getScopePositions().get(out);
          positionInfo.setNodeId(input.getId());
          info.setModel(input.getModel());
          positionInfo.setFileName(fileName);
          Map<SNode, VarInfo> varMap = positionInfo.getTempVarInfoMap();
          for (SNode varNode : varMap.keySet()) {
            SNode originalVar = getOriginalInputNode(varNode);
            VarInfo varInfo = varMap.get(varNode);
            if (originalVar != null && !(originalVar.isDisposed())) {
              String s = originalVar.getId();
              varInfo.setNodeId(s);
            } else {
              positionInfo.removeVarInfo(varInfo);
            }
          }
          positionInfo.clearTempVarInfoMap();
          info.addScopePosition(positionInfo, input.getTopmostAncestor().getId());
        }
      }
    }
    if (unitPositions != null) {
      for (SNode out : unitPositions.keySet()) {
        SNode input = out;
        input = getOriginalInputNodeForNearestParent(input);
        UnitPositionInfo positionInfo = result.getUnitPositions().get(out);
        positionInfo.setFileName(fileName);
        String id = null;
        if (input != null && !(input.isDisposed())) {
          positionInfo.setNodeId(input.getId());
          info.setModel(input.getModel());
          id = input.getTopmostAncestor().getId();
        }
        info.addUnitPosition(positionInfo, id);
      }
    }
  }

  private SNode getOriginalInputNodeForNearestParent(SNode output) {
    while (output != null) {
      SNode node = getOriginalInputNode(output);
      if (node != null) {
        return node;
      }
      output = output.getParent();
    }
    return null;
  }

  private SNode getOriginalInputNode(SNode input) {
    while (input != null && !(input.isDisposed())
      && (input.getModel() instanceof TransientSModel)) {
      input = (SNode) input.getUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE);
    }
    return input;
  }

  private void fillDependencies(ModelDependencies root, SNode outputNode, String fileName, TextGenerationResult result) {
    if (result.hasDependencies()) {
      root.addDependencies(new RootDependencies(NameUtil.nodeFQName(outputNode), fileName, result.getDependencies(TextGenManager.DEPENDENCY),
        result.getDependencies(TextGenManager.EXTENDS)));
    }
  }

  private String getFileName(SNode outputRootNode) {
    String extension = TextGenManager.instance().getExtension(outputRootNode);
    return (extension == null) ? outputRootNode.getName() : outputRootNode.getName() + "." + extension;
  }

  private void generateFiles(GenerationStatus status, Map<SNode, Object> outputNodeContents) {
    for (SNode outputRootNode : outputNodeContents.keySet()) {
      String name = getFileName(outputRootNode);
      Object contents = outputNodeContents.get(outputRootNode);
      if (contents instanceof String) {
        myStreamHandler.saveStream(name, (String) contents, false);
      } else {
        myStreamHandler.saveStream(name, (byte[]) contents, false);
      }
    }

    DebugInfo debugInfoCache = null;
    ModelDependencies modelDep = null;

    GenerationDependencies dependencies = status.getDependencies();
    if (dependencies != null) {
      // process unchanged files
      for (GenerationRootDependencies rdep : dependencies.getUnchangedDependencies()) {
        for (String filename : rdep.getFiles()) {
          if (myStreamHandler.touch(filename, false)) {
            // re-register baselanguage dependencies
            if (modelDep == null) {
              modelDep = BLDependenciesCache.getInstance().get(status.getOriginalInputModel());
            }
            if (modelDep != null) {
              RootDependencies root = modelDep.getDependency(filename);
              if (root != null) {
                status.getBLDependencies().replaceRoot(root);
              }
            }
          }
        }

        // re-register debug
        if (debugInfoCache == null) {
          debugInfoCache = TraceInfoCache.getInstance().get(status.getOriginalInputModel());
        }
        if (debugInfoCache != null) {
          DebugInfoRoot infoRoot = debugInfoCache.getRootInfo(rdep.getRootId());
          if (infoRoot != null && status.getDebugInfo() != null) {
            status.getDebugInfo().replaceRoot(infoRoot);
          }
        }
      }
    }
  }

  private void generateCaches(GenerationStatus status) {
    for (CacheGenerator g : myCacheGenerators) {
      try {
        if(g != null) {
          g.generateCache(status, myStreamHandler);
        }
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }
}
