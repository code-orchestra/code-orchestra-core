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
package jetbrains.mps.generator.impl;

import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.generator.IGeneratorLogger.ProblemDescription;
import jetbrains.mps.generator.impl.cache.BrokenCacheException;
import jetbrains.mps.generator.impl.cache.MappingsMemento;
import jetbrains.mps.generator.impl.cache.TransientModelWithMetainfo;
import jetbrains.mps.generator.impl.dependencies.DependenciesBuilder;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.util.Pair;
import org.jetbrains.annotations.NotNull;

import java.util.*;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * Evgeny Gryaznov, Feb 16, 2010
 */
public class GeneratorMappings {

  /* mapping,input -> output */
  private final ConcurrentMap<String, Map<SNode, Object>> myMappingNameAndInputNodeToOutputNodeMap = new ConcurrentHashMap<String, Map<SNode, Object>>();

  /* input -> output */
  private final Map<SNode, Object> myCopiedOutputNodeForInputNode;

  /* Object means multiple nodes for the template */
  private final ConcurrentMap<SNode, Object> myTemplateNodeToOutputNodeMap = new ConcurrentHashMap<SNode, Object>();

  /* new style map: Object means multiple nodes for the template */
  private final ConcurrentMap<String, Object> myTemplateNodeIdToOutputNodeMap = new ConcurrentHashMap<String, Object>();

  /* template,input -> output */
  private final ConcurrentMap<Pair<SNode, SNode>, SNode> myTemplateNodeAndInputNodeToOutputNodeMap = new ConcurrentHashMap<Pair<SNode, SNode>, SNode>();

  /* new style map: template,input -> output */
  private final ConcurrentMap<Pair<String, SNode>, SNode> myTemplateNodeIdAndInputNodeToOutputNodeMap = new ConcurrentHashMap<Pair<String, SNode>, SNode>();

  public GeneratorMappings(int numberOfNodesInModel) {
    /* we use non-default load factor to reduce memory usage */
    myCopiedOutputNodeForInputNode = new ConcurrentHashMap<SNode, Object>(numberOfNodesInModel, 2);
  }

  // add methods

  void addOutputNodeByTemplateNode(SNode templateNode, @NotNull SNode outputNode) {
    if(myTemplateNodeToOutputNodeMap.putIfAbsent(templateNode, outputNode) != null) {
      myTemplateNodeToOutputNodeMap.put(templateNode, this);
    }
  }

  void addOutputNodeByTemplateNode(String templateNodeId, @NotNull SNode outputNode) {
    if(myTemplateNodeIdToOutputNodeMap.putIfAbsent(templateNodeId, outputNode) != null) {
      myTemplateNodeIdToOutputNodeMap.put(templateNodeId, this);
    }
  }

  void addOutputNodeByInputNodeAndMappingName(SNode inputNode, String mappingName, SNode outputNode) {
    if (mappingName == null) return;
    Map<SNode, Object> currentMapping = myMappingNameAndInputNodeToOutputNodeMap.get(mappingName);
    if (currentMapping == null) {
      myMappingNameAndInputNodeToOutputNodeMap.putIfAbsent(mappingName, new HashMap<SNode, Object>());
      currentMapping = myMappingNameAndInputNodeToOutputNodeMap.get(mappingName);
    }
    synchronized (currentMapping) {
      Object o = currentMapping.get(inputNode);
      if (o == null) {
        currentMapping.put(inputNode, outputNode);
      } else if (o instanceof List) {
        ((List<SNode>) o).add(outputNode);
      } else if(o != outputNode) {
        List<SNode> list = new ArrayList<SNode>(4);
        list.add((SNode) o);
        list.add(outputNode);
        currentMapping.put(inputNode, list);
      } else {
        // TODO warning
      }
    }
  }

  void addCopiedOutputNodeForInputNode(SNode inputNode, SNode outputNode) {
    if (outputNode == null) {
      return;
    }
    synchronized (inputNode) {
      Object o = myCopiedOutputNodeForInputNode.get(inputNode);
      if (o == null) {
        myCopiedOutputNodeForInputNode.put(inputNode, outputNode);
      } else if (o instanceof List) {
        //((List<SNode>) o).add(outputNode);
      } else {
        //List<SNode> list = new ArrayList<SNode>(2);
        //list.add((SNode) o);
        //list.add(outputNode);
        //myCopiedOutputNodeForInputNode.put(inputNode, list);
        myCopiedOutputNodeForInputNode.put(inputNode, Collections.singletonList((SNode)o));
      }
    }
  }

  void addOutputNodeByInputAndTemplateNode(SNode inputNode, SNode templateNode, SNode outputNode) {
    // todo: combination of (templateN, inputN) -> outputN
    // todo: is not unique
    // todo: generator should report error on attempt to obtain not unique output-node
    if (templateNode == null) return;
    myTemplateNodeAndInputNodeToOutputNodeMap.put(new Pair(templateNode, inputNode), outputNode);
  }

  void addOutputNodeByInputAndTemplateNode(SNode inputNode, String templateNodeId, SNode outputNode) {
    // todo: combination of (templateN, inputN) -> outputN
    // todo: is not unique
    // todo: generator should report error on attempt to obtain not unique output-node
    if (templateNodeId == null) return;
    myTemplateNodeIdAndInputNodeToOutputNodeMap.put(new Pair(templateNodeId, inputNode), outputNode);
  }
  
  void addOutputNodeByIndirectInputAndTemplateNode(SNode inditectInputNode, SNode templateNode, SNode outputNode) {
    // todo: combination of (templateN, inputN) -> outputN
    // todo: is not unique
    // todo: generator should report error on attempt to obtain not unique output-node
    Pair key = new Pair(templateNode, inditectInputNode);
    myTemplateNodeAndInputNodeToOutputNodeMap.putIfAbsent(key, outputNode);
  }

  void addOutputNodeByIndirectInputAndTemplateNode(SNode inditectInputNode, String templateNodeId, SNode outputNode) {
    // todo: combination of (templateN, inputN) -> outputN
    // todo: is not unique
    // todo: generator should report error on attempt to obtain not unique output-node
    Pair key = new Pair(templateNodeId, inditectInputNode);
    myTemplateNodeIdAndInputNodeToOutputNodeMap.putIfAbsent(key, outputNode);
  }

  // find methods

  public SNode findOutputNodeByTemplateNodeUnique(SNode templateNode) {
    Object o = myTemplateNodeToOutputNodeMap.get(templateNode);
    return o instanceof SNode ? (SNode) o : null;
  }

  public SNode findOutputNodeByTemplateNodeUnique(String templateNode) {
    Object o = myTemplateNodeIdToOutputNodeMap.get(templateNode);
    return o instanceof SNode ? (SNode) o : null;
  }

  public SNode findOutputNodeByInputNodeAndMappingName(SNode inputNode, String mappingName, IGeneratorLogger logger) {
    if (mappingName == null) return null;
    Map<SNode, Object> currentMapping = myMappingNameAndInputNodeToOutputNodeMap.get(mappingName);
    if (currentMapping == null) return null;
    Object o = currentMapping.get(inputNode);
    if (o instanceof List) {
      List<SNode> list = (List<SNode>) o;
      ProblemDescription[] descr = new ProblemDescription[list.size()];
      for (int i = 0; i < list.size(); i++) {
        descr[i] = new ProblemDescription(list.get(i), "output [" + i + "] : " + list.get(i).getDebugText());
      }
      logger.warning(inputNode, "" + list.size() + " output nodes found for mapping label '" + mappingName + "' and input " + inputNode.getDebugText(), descr);
      return list.get(0);
    }

    return (SNode) o;
  }

  public List<SNode> findAllOutputNodesByInputNodeAndMappingName(SNode inputNode, String mappingName) {
    if (mappingName == null) return null;
    Map<SNode, Object> currentMapping = myMappingNameAndInputNodeToOutputNodeMap.get(mappingName);
    if (currentMapping == null) return null;
    Object o = currentMapping.get(inputNode);
    if (o == null) return Collections.emptyList();
    if (o instanceof List) return ((List<SNode>) o);
    return Collections.singletonList((SNode) o);
  }

  public SNode findCopiedOutputNodeForInputNode(@NotNull SNode inputNode) {
    Object o = myCopiedOutputNodeForInputNode.get(inputNode);
    if (o instanceof SNode) {
      return (SNode) o;
    }
    if (o instanceof List) {
      return (SNode) ((List) o).get(0);
    }
    return null;
  }

  public SNode findOutputNodeByInputAndTemplateNode(SNode inputNode, SNode templateNode) {
    return myTemplateNodeAndInputNodeToOutputNodeMap.get(new Pair(templateNode, inputNode));
  }

  public SNode findOutputNodeByInputAndTemplateNode(SNode inputNode, String templateNodeId) {
    return myTemplateNodeIdAndInputNodeToOutputNodeMap.get(new Pair(templateNodeId, inputNode));
  }

  public boolean isInputNodeHasUniqueCopiedOutputNode(SNode inputNode) {
    Object o = myCopiedOutputNodeForInputNode.get(inputNode);
    return !(o instanceof List);
  }

  // serialization

  public void export(TransientModelWithMetainfo model, DependenciesBuilder builder) {
    for (Entry<String, Map<SNode, Object>> o : myMappingNameAndInputNodeToOutputNodeMap.entrySet()) {
      String label = o.getKey();
      for(Entry<SNode, Object> i : o.getValue().entrySet()) {
        SNode inputNode = i.getKey();
        SNode originalRoot = inputNode == null ? null : builder.getOriginalForInput(inputNode.getTopmostAncestor());
        MappingsMemento mappingsMemento = model.getMappingsMemento(originalRoot, true);
        mappingsMemento.addOutputNodeByInputNodeAndMappingName(inputNode == null ? null : inputNode.getSNodeId(), label, i.getValue());
      }
    }

    for (Entry<SNode, Object> o : myCopiedOutputNodeForInputNode.entrySet()) {
      SNode inputNode = o.getKey();
      Object value = o.getValue();
      if(value instanceof SNode) {
        SNodeId targetId = ((SNode) value).getSNodeId();
        if(inputNode.getSNodeId().equals(targetId)) {
          continue; /* trivial */
        }
        MappingsMemento mappingsMemento = model.getMappingsMemento(builder.getOriginalForInput(inputNode.getTopmostAncestor()), true);
        mappingsMemento.addOutputNodeByInputNode(inputNode.getSNodeId(), targetId, true);
      } else if(value instanceof List) {
        SNodeId targetId = ((List<SNode>) value).get(0).getSNodeId();
        MappingsMemento mappingsMemento = model.getMappingsMemento(builder.getOriginalForInput(inputNode.getTopmostAncestor()), true);
        mappingsMemento.addOutputNodeByInputNode(inputNode.getSNodeId(), targetId, false);
      }
    }
  }

  public void importPersisted(MappingsMemento val, SModel inputModel, SModel outputModel) throws BrokenCacheException {

    // labels
    for(Entry<String, Map<SNodeId, Object>> e : val.getMappingNameAndInputNodeToOutputNodeMap().entrySet()) {
      String mappingName = e.getKey();
      Map<SNode, Object> currentMapping = myMappingNameAndInputNodeToOutputNodeMap.get(mappingName);
      if (currentMapping == null) {
        myMappingNameAndInputNodeToOutputNodeMap.putIfAbsent(mappingName, new HashMap<SNode, Object>());
        currentMapping = myMappingNameAndInputNodeToOutputNodeMap.get(mappingName);
      }
      for(Entry<SNodeId,Object> n : e.getValue().entrySet()) {
        SNodeId key = n.getKey();
        SNode inputNode = null;
        if(key != null) {
          inputNode = inputModel.getNodeById(key);
          if(inputNode == null) {
            continue;
          }
        }
        Object value = n.getValue();
        if(value instanceof SNodeId) {
          SNode outputNode = outputModel.getNodeById((SNodeId) value);
          if(outputNode == null) {
            continue;
          }
          addOutputNode(currentMapping, inputNode, outputNode);
        } else if(value instanceof List) {
          for(SNodeId id : (List<SNodeId>)value) {
            SNode outputNode = outputModel.getNodeById(id);
            if(outputNode == null) {
              continue;
            }
            addOutputNode(currentMapping, inputNode, outputNode);
          }
        }
      }
    }

    // output for input
    for(Entry<SNodeId, Object> e : val.getCopiedOutputNodeForInputNode().entrySet()) {
      SNode inputNode = inputModel.getNodeById(e.getKey());
      if(inputNode == null) {
        continue;
      }
      Object value = e.getValue();
      if(value instanceof SNodeId) {
        SNode outputNode = outputModel.getNodeById((SNodeId) value);
        if(outputNode == null) {
          continue;
        }
        myCopiedOutputNodeForInputNode.put(inputNode, outputNode);
      } else if(value instanceof List) {
        SNode outputNode = outputModel.getNodeById(((List<SNodeId>) value).get(0));
        if(outputNode == null) {
          continue;
        }
        myCopiedOutputNodeForInputNode.put(inputNode, Collections.singletonList(outputNode));
      }
    }
  }

  private void addOutputNode(@NotNull Map<SNode, Object> currentMapping, SNode inputNode, @NotNull SNode outputNode) throws BrokenCacheException {
    Object o = currentMapping.get(inputNode);
    if (o == null) {
      currentMapping.put(inputNode, outputNode);
    } else if (o instanceof List) {
      ((List<SNode>) o).add(outputNode);
    } else if(o != outputNode) {
      List<SNode> list = new ArrayList<SNode>(4);
      list.add((SNode) o);
      list.add(outputNode);
      currentMapping.put(inputNode, list);
    } else {
      // TODO ?
    }
  }
}
