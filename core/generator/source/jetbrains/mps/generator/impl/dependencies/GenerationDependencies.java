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
package jetbrains.mps.generator.impl.dependencies;

import jetbrains.mps.generator.IncrementalGenerationStrategy;
import jetbrains.mps.generator.ModelDigestHelper;
import jetbrains.mps.smodel.*;
import jetbrains.mps.textGen.TextGenManager;
import org.jdom.Element;

import java.util.*;

/**
 * Evgeny Gryaznov, May 14, 2010
 */
public class GenerationDependencies {

  private static final int DEPENDENCIES_VERSION = 2;

  private static final String ROOT_ELEMENT = "dependencies";
  private static final String NODE_ROOT = "source";
  private static final String NODE_COMMON = "common";
  private static final String ATTR_MODEL_HASH = "modelHash";
  private static final String ATTR_PARAMS_HASH = "parametersHash";
  private static final String ATTR_VERSION = "version";

  private static final String NODE_MODEL = "dep";
  private static final String ATTR_MODEL_ID = "model";
  private static final String ATTR_HASH = "hash";

  private final boolean containsIncrementalInfo;

  private final List<GenerationRootDependencies> myRootDependencies;
  private final Map<String, GenerationRootDependencies> myRootDependenciesMap;
  private final String myModelHash;
  private final String myParametersHash;

  private final Map<String, String> myUsedModelsHashes;

  private /* transient */ final List<GenerationRootDependencies> myUnchanged;
  private /* transient */ final int mySkippedCount;
  private /* transient */ final int myFromCacheCount;

  private GenerationDependencies(String modelHash, String parametersHash) {
    this.containsIncrementalInfo = false;
    this.myModelHash = modelHash;
    this.myParametersHash = parametersHash;

    this.myRootDependencies = Collections.emptyList();
    this.myRootDependenciesMap = Collections.emptyMap();
    this.myUsedModelsHashes = Collections.emptyMap();
    this.myUnchanged = Collections.emptyList();
    this.mySkippedCount = 0;
    this.myFromCacheCount = 0;
  }

  private GenerationDependencies(List<GenerationRootDependencies> data, String modelHash, String parametersHash, Map<String, String> externalHashes, List<GenerationRootDependencies> unchanged, int skippedCount, int fromCacheCount) {
    this.containsIncrementalInfo = true;
    this.myRootDependencies = data;
    this.mySkippedCount = skippedCount;
    this.myFromCacheCount = fromCacheCount;
    this.myRootDependenciesMap = new HashMap<String, GenerationRootDependencies>(data.size());
    this.myModelHash = modelHash;
    this.myParametersHash = parametersHash;
    this.myUnchanged = unchanged;
    this.myUsedModelsHashes = externalHashes;
    for (GenerationRootDependencies rd : data) {
      String id = rd.getRootId();
      myRootDependenciesMap.put(id == null ? ModelDigestHelper.HEADER : id, rd);
    }
  }

  public String getModelHash() {
    return myModelHash;
  }

  public String getParametersHash() {
    return myParametersHash;
  }

  public int getSkippedCount() {
    return mySkippedCount;
  }

  public int getFromCacheCount() {
    return myFromCacheCount;
  }

  public boolean isContainsIncrementalInfo() {
    return containsIncrementalInfo;
  }

  public GenerationRootDependencies getDependenciesFor(String rootId) {
    return myRootDependenciesMap.get(rootId);
  }

  public Map<String, String> getExternalHashes() {
    return Collections.unmodifiableMap(myUsedModelsHashes);
  }

  public List<GenerationRootDependencies> getRootDependencies() {
    return Collections.unmodifiableList(myRootDependencies);
  }

  public List<GenerationRootDependencies> getUnchangedDependencies() {
    return Collections.unmodifiableList(myUnchanged);
  }

  public Element toXml() {
    Element root = new Element(ROOT_ELEMENT);
    root.setAttribute(ATTR_VERSION, Integer.toString(DEPENDENCIES_VERSION));
    if (myModelHash != null) {
      root.setAttribute(ATTR_MODEL_HASH, myModelHash);
    }
    if(myParametersHash != null) {
      root.setAttribute(ATTR_PARAMS_HASH, myParametersHash);
    }
    String[] models = myUsedModelsHashes.keySet().toArray(new String[myUsedModelsHashes.size()]);
    Arrays.sort(models);
    for (String model : models) {
      Element e = new Element(NODE_MODEL);
      e.setAttribute(ATTR_MODEL_ID, model);
      String hash = myUsedModelsHashes.get(model);
      if (hash != null) {
        e.setAttribute(ATTR_HASH, hash);
      }
      root.addContent(e);
    }
    if (myRootDependencies != null) {
      for (GenerationRootDependencies data : myRootDependencies) {
        Element e = new Element(data.getRootId() != null ? NODE_ROOT : NODE_COMMON);
        data.saveTo(e);
        root.addContent(e);
      }
    }
    return root;
  }

  public static GenerationDependencies fromXml(Element root) {
    String version = GenerationRootDependencies.getValue(root, ATTR_VERSION);
    if (version == null || !version.equals(Integer.toString(DEPENDENCIES_VERSION))) {
      /* regenerate all */
      return null;
    }
    Map<String, String> externalHashes = new HashMap<String, String>();
    for (Element e : ((List<Element>) root.getChildren(NODE_MODEL))) {
      String modelReference = GenerationRootDependencies.getValue(e, ATTR_MODEL_ID);
      String rootHash = GenerationRootDependencies.getValue(e, ATTR_HASH);
      if (modelReference != null) {
        externalHashes.put(modelReference, rootHash);
      }
    }
    List<GenerationRootDependencies> data = new ArrayList<GenerationRootDependencies>();
    for (Element e : ((List<Element>) root.getChildren(NODE_COMMON))) {
      data.add(GenerationRootDependencies.fromXml(e, true));
    }
    for (Element e : ((List<Element>) root.getChildren(NODE_ROOT))) {
      data.add(GenerationRootDependencies.fromXml(e, false));
    }
    String modelHash = GenerationRootDependencies.getValue(root, ATTR_MODEL_HASH);
    String paramsHash = GenerationRootDependencies.getValue(root, ATTR_PARAMS_HASH);
    if(externalHashes.isEmpty() && data.isEmpty()) {
      return new GenerationDependencies(modelHash, paramsHash);
    }
    return new GenerationDependencies(data, modelHash, paramsHash, externalHashes, Collections.<GenerationRootDependencies>emptyList(), 0, 0);
  }

  public static String getFileName(SNode outputRootNode) {
    // TODO refactor, use DefaultFileGenerator.getFileName
    String extension = TextGenManager.instance().getExtension(outputRootNode);
    return (extension == null) ? outputRootNode.getName() : outputRootNode.getName() + "." + extension;
  }

  public static GenerationDependencies fromIncremental(Map<SNode, SNode> currentToOriginalMap, RootDependenciesBuilder[] roots, String modelHash, String parametersHash, IOperationContext operationContext, IncrementalGenerationStrategy incrementalStrategy, int skippedCount, int fromCacheCount) {
    Map<String, List<String>> generatedFiles = getGeneratedFiles(currentToOriginalMap);

    List<GenerationRootDependencies> unchanged = null;
    List<GenerationRootDependencies> rootDependencies = new ArrayList<GenerationRootDependencies>(roots.length);
    Map<String, String> externalHashes = new HashMap<String, String>();
    for (RootDependenciesBuilder l : roots) {
      SNode originalRoot = l.getOriginalRoot();
      List<String> files = generatedFiles.get(originalRoot != null ? originalRoot.getId() : "");
      if (files == null) {
        files = Collections.emptyList();
      }
      GenerationRootDependencies dep;
      if (l.isUnchanged()) {
        dep = l.getSavedDependencies();
        if (unchanged == null) {
          unchanged = new ArrayList<GenerationRootDependencies>();
        }
        unchanged.add(dep);
      } else {
        dep = GenerationRootDependencies.fromData(l, files);
      }
      rootDependencies.add(dep);
      for (String modelReference : dep.getExternal()) {
        if (!externalHashes.containsKey(modelReference)) {
          SModelDescriptor sm = SModelRepository.getInstance().getModelDescriptor(SModelReference.fromString(modelReference));
          Map<String, String> hashes = incrementalStrategy.getModelHashes(sm, operationContext);
          String value = hashes != null ? hashes.get(ModelDigestHelper.FILE) : null;
          externalHashes.put(modelReference, value);
        }
      }
    }
    return new GenerationDependencies(rootDependencies, modelHash, parametersHash, externalHashes, unchanged == null ? Collections.<GenerationRootDependencies>emptyList() : unchanged, skippedCount, fromCacheCount);
  }

  public static GenerationDependencies fromNonIncremental(String modelHash, String parametersHash) {
    return new GenerationDependencies(modelHash, parametersHash);
  }

  private static Map<String, List<String>> getGeneratedFiles(Map<SNode, SNode> currentToOriginalMap) {
    Map<String, List<String>> generatedFiles = new HashMap<String, List<String>>();

    for (Map.Entry<SNode, SNode> entry : currentToOriginalMap.entrySet()) {
      String inputRootId = entry.getValue() != null ? entry.getValue().getId() : "";
      SNode outputRoot = entry.getKey();

      List<String> filesList = generatedFiles.get(inputRootId);
      if (filesList == null) {
        filesList = new ArrayList<String>();
        generatedFiles.put(inputRootId, filesList);
      }
      String fileName = getFileName(outputRoot);
      if(fileName != null) {
        filesList.add(fileName);
      }
    }
    return generatedFiles;
  }
}
