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
package jetbrains.mps.migration20.stages.util;

import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ModelResolveCache {
  Map<String, List<SModel>> globalCache = new HashMap<String, List<SModel>>();
  Map<String, List<SModel>> moduleCache = new HashMap<String, List<SModel>>();

  public ModelResolveRes resolveModel(IModule module, String oldId, SNodeId nodeId) {
    List<SModel> mRep = moduleCache.get(oldId);
    if (mRep == null) {
      mRep = resolveModelInModule(module, oldId);
      moduleCache.put(oldId, mRep);
    }

    List<SModel> gRep = globalCache.get(oldId);
    if (gRep == null) {
      gRep = resolveModelAnywhere(oldId);
      globalCache.put(oldId, gRep);
    }

    for (SModel model : mRep) {
      if (model.getNodeById(nodeId) != null) {
        return new ModelResolveRes(model, false);
      }
    }

    for (SModel model : gRep) {
      if (model.getNodeById(nodeId) != null) {
        return new ModelResolveRes(model, true);
      }
    }

    return new ModelResolveRes();
  }

  public void clearModuleCache() {
    moduleCache.clear();
  }

  private List<SModel> resolveModelAnywhere(String oldId) {
    ArrayList<SModel> res = new ArrayList<SModel>();
    for (SModelDescriptor md : SModelRepository.getInstance().getModelDescriptors()) {
      SModelReference mdRef = md.getSModelReference();
      SModelId mdId = mdRef.getSModelId();
      if (mdId instanceof SModelId.RegularSModelId) continue;
      if (!(matches(oldId, ((SModelId.ForeignSModelId) mdId).getId()))) continue;

      res.add(md.getSModel());
    }
    return res;
  }

  private List<SModel> resolveModelInModule(IModule module, String oldId) {
    ArrayList<SModel> res = new ArrayList<SModel>();
    for (SModelDescriptor md : module.getScope().getModelDescriptors()) {
      SModelReference mdRef = md.getSModelReference();
      SModelId mdId = mdRef.getSModelId();
      if (mdId instanceof SModelId.RegularSModelId) continue;
      if (!(matches(oldId, ((SModelId.ForeignSModelId) mdId).getId()))) continue;

      res.add(md.getSModel());
    }
    return res;
  }

  private boolean matches(String id1, String id2) {
    String id1Ste = id1.substring(0, id1.indexOf("#"));
    String id2Ste = id2.substring(0, id1.indexOf("#"));

    if (!(id1Ste.equals(id2Ste))) {
      return false;
    }

    String id1M = id1.substring(id1.lastIndexOf("#") + 1, id1.length());
    String id2M = id2.substring(id2.lastIndexOf("#") + 1, id2.length());

    if (!(id1M.equals(id2M))) {
      return false;
    }

    return true;
  }

  public static class ModelResolveRes {
    public SModelReference replacement = null;
    public boolean needReload = false;

    public ModelResolveRes() {
    }

    public ModelResolveRes(SModel model, boolean reload) {
      replacement = model.getSModelReference();
      needReload = reload;
    }
  }
}
