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
package jetbrains.mps.smodel.persistence.def.v6;

import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.SModel.ImportElement;
import jetbrains.mps.smodel.persistence.def.v5.ModelUtil;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.HashMap;
import java.util.Map;

public class VersionUtil {
  private static final Logger LOG = Logger.getLogger(VersionUtil.class);

  private static final char VERSION_SEPARATOR_CHAR = ':';
  private static final char MODEL_SEPARATOR_CHAR = '.';

  // temporary here (while VersionUtil exists)

  private SModelReference myModelRef;
  private Map<SModelReference, ImportElement> myImports;

  public VersionUtil(SModel model) {
    myModelRef = model.getSModelReference();
    myImports = new HashMap<SModelReference, ImportElement>();
    fillReferenceIDs(model);  // replace "-1" indice to valid values and advance maxImportIndex
    for (ImportElement elem : model.importedModels()) {
      myImports.put(elem.getModelReference(), elem);
    }
    for (ImportElement elem : model.getAdditionalModelVersions()) {
      myImports.put(elem.getModelReference(), elem);
    }
  }

  // when upgrading to 6 persistence some of IDs can be -1 and need to be fixed
  static void fillReferenceIDs(SModel model) {
    for (ImportElement elem : model.importedModels()) {
      fixReferenceID(model, elem);
    }
    for (ImportElement elem : model.getAdditionalModelVersions()) {
      fixReferenceID(model, elem);
    }
  }

  static void fixReferenceID(SModel model, ImportElement elem) {
    if (elem.getReferenceID() < 0) {
      int id = model.getMaxImportIndex();
      model.setMaxImportIndex(++id);
      elem.setReferenceID(id);
    }
  }

  public String genImportIndex(ImportElement elem) {
    return Integer.toString(elem.getReferenceID());
  }

  @NotNull
  public String genReferenceString(@NotNull SModelReference ref, @NotNull String text, boolean usemodel) {
    ImportElement impElem = myImports.get(ref);
    if (impElem == null) {
      LOG.error("model " + ref + " not found in imports");
      return text;
    }
    StringBuilder result = new StringBuilder();
    if (usemodel && !(myModelRef.equals(ref)))  result.append(impElem.getReferenceID()).append(MODEL_SEPARATOR_CHAR);
    result.append(text);
    if (impElem.getUsedVersion() >= 0)  result.append(VERSION_SEPARATOR_CHAR).append(impElem.getUsedVersion());
    return result.toString();
  }
  @NotNull
  private String genReferenceString(@Nullable SNode node, @NotNull String text, boolean usemodel) {
    return node == null ? text : genReferenceString(node.getModel().getSModelReference(), text, usemodel);
  }
  @NotNull
  private String genReferenceString(@Nullable BaseAdapter node, @NotNull String text, boolean usemodel) {
    return node == null ? text : genReferenceString(node.getModel().getSModelReference(), text, usemodel);
  }

  public String genType(@NotNull SNode node) {
    return genReferenceString(node.getConceptDeclarationNode(), node.getConceptFqName(), false);
  }
  public String genRole(@NotNull SNode node) {
    return node.getRole_() == null ? null : genReferenceString(AttributeOperations.isAttribute(node) ? null : node.getRoleLink(), node.getRole_(), true);
  }
  public String genRole(@NotNull SReference ref) {
    return genReferenceString(ref.getSourceNode().getLinkDeclaration(ref.getRole()), ref.getRole(), true);
  }
  public String genName(@NotNull SNode node, @NotNull String prop) {
    return genReferenceString(node.getPropertyDeclaration(prop), prop, true);
  }
  public String genTarget(@NotNull SReference ref) {
    String target = ref instanceof StaticReference ? String.valueOf(ref.getTargetNodeId()) : "^";
    SModelReference targetModel = ref.getTargetSModelReference();
    return targetModel == null ? target : genReferenceString(targetModel, target, true);
  }


  private Map<Integer, ImportElement> myImportByIx;

  public VersionUtil(SModelReference modelRef) {
    myModelRef = modelRef;
    myImports = new HashMap<SModelReference, ImportElement>();
    myImportByIx = new HashMap<Integer, ImportElement>();
  }

  public void addImport(SModel model, String index, String modelUID, int version, boolean implicit) {
    if (modelUID == null) {
      LOG.error("Error loading import element for index " + index + " in " + myModelRef);
      return;
    }
    int ix = Integer.parseInt(index);
    SModelReference modelRef = ModelUtil.upgradeModelUID(SModelReference.fromString(modelUID));
    ImportElement elem = new ImportElement(modelRef, ix, version);
    if (model.getMaxImportIndex() < ix)  model.setMaxImportIndex(ix);
    myImports.put(modelRef, elem);
    myImportByIx.put(ix, elem);
    if (implicit)
      model.addAdditionalModelVersion(elem);
    else
      model.addModelImport(elem);
  }

  public SModelReference getSModelReference(int ix) {
    return ix == -1 ? myModelRef : myImportByIx.get(ix).getModelReference();
  }


  private static class ParseResult {  // [modelID.]text[:version]
    public int modelID;
    public String text;
    public int version;
  }

  private ParseResult parse(String src, boolean hasmodel) {
    ParseResult res = parseWithoutCheck(src, hasmodel);

    // check integrity except concepts and attribute roles
    if (hasmodel && !AttributeOperations.isOldAttributeRole(res.text)) {
      ImportElement elem = myImports.get(getSModelReference(res.modelID));
      if (elem == null || res.version != myImports.get(getSModelReference(res.modelID)).getUsedVersion()) {
        LOG.error("wrong version of " + src + ", model=" + getSModelReference(res.modelID) + ". Possible reason: merge conflict was not resolved.");
      }
    }

    return res;
  }

  private static ParseResult parseWithoutCheck(String src, boolean hasmodel) {
    ParseResult res = new ParseResult();
    char[] chars = src.toCharArray();
    int i0 = -1, i1 = chars.length;
    if (hasmodel) { // false means we shouldn't try to parse model id
      while (++i0 < i1)  if (!Character.isDigit(chars[i0]))  break;
      if (i0 == i1 || chars[i0] != MODEL_SEPARATOR_CHAR)  i0 = -1;
    }
    while (i0 < --i1)  if (!Character.isDigit(chars[i1]))  break;
    if (i0 == i1 || chars[i1] != VERSION_SEPARATOR_CHAR)  i1 = chars.length;
    res.text = src.substring(i0 + 1, i1);
    res.modelID = i0 > 0 ? Integer.parseInt(src.substring(0, i0)) : -1;
    res.version = i1 < chars.length-1 ? Integer.parseInt(src.substring(i1 + 1)) : -1;
    return res;
  }

  public String readType(String s) {
    return parse(s, false).text;
  }
  public String readRole(String s) {
    return parse(s, true).text;
  }
  public String readName(String s) {
    return parse(s, true).text;
  }

  public SReference readLink(SNode node, String rawRole, String rawTarget, String resolveInfo) {
    String role = readRole(rawRole);
    ParseResult target = parse(rawTarget, true);
    SModelReference modelRef = getSModelReference(target.modelID);
    if (modelRef == null) {
      LOG.error("couldn't create reference '" + role + "' : import for index [" + target.modelID + "] not found");
      return null;
    } else if (target.text.equals("^")) {
      return new DynamicReference(role, node, modelRef, resolveInfo);
    } else {
      return new StaticReference(role, node, modelRef, SNodeId.fromString(target.text), resolveInfo);
    }
  }

  public static String readRoleSimple(String s) {
    return parseWithoutCheck(s, true).text;
  }
}
