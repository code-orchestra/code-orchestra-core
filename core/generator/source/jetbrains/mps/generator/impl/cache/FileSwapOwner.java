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
package jetbrains.mps.generator.impl.cache;

import jetbrains.mps.generator.TransientModelsComponent.TransientSwapOwner;
import jetbrains.mps.generator.TransientModelsComponent.TransientSwapSpace;
import jetbrains.mps.generator.TransientSModel;
import jetbrains.mps.generator.template.TemplateQueryContext;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by IntelliJ IDEA.
 * User: fyodor
 * Date: 1/10/11
 * Time: 10:42 AM
 * To change this template use File | Settings | File Templates.
 */
public abstract class FileSwapOwner implements TransientSwapOwner{

  private static Logger LOG = Logger.getLogger(FileSwapOwner.class);

  private Map<String, File> mySwapSpaces = new ConcurrentHashMap<String, File>();

  abstract protected File getSwapDir ();

  @Override
  public TransientSwapSpace initSwapSpace(String spaceId) {
    return primSwapSpace(spaceId, true);
  }

  @Override
  public TransientSwapSpace accessSwapSpace(String spaceId) {
    return primSwapSpace(spaceId, false);
  }

  private TransientSwapSpace primSwapSpace(String spaceId, boolean init) {
    File swapDir = getSwapDir();
    if (swapDir == null) { LOG.error("No swap directory"); return null; }

    File space = new File (swapDir, spaceId);
    if (space.exists()) {
      if (!space.isDirectory()) { LOG.error("Swap space is not a directory"); return null; }

      if (init) {
        new FileSwapSpace(space).clear();
      }
    }
    else {
      if (!init) { return null; }

      if (!space.mkdirs()) { LOG.error("Couldn't create swap space directory"); return null; }
    }

    return new FileSwapSpace (space);
  }

  public static class FileSwapSpace implements TransientSwapSpace {
    private File mySpaceDir;

    public FileSwapSpace (File dir) {
      mySpaceDir = dir;
    }

    @Override
    public boolean swapOut(TransientSModel model) {
      if (mySpaceDir == null || !mySpaceDir.exists()) throw new IllegalStateException("no swap dir");

      String modelId = model.getSModelReference().getSModelId().toString();
      if(modelId == null || modelId.isEmpty()) { LOG.error("Bad model id <" + modelId + ">"); return false; }
      modelId = modelId.replaceAll(":", "-");

      File swapFile = new File (mySpaceDir, modelId);
      if (swapFile.exists() && !swapFile.delete()) { LOG.error("Couldn't delete swap file"); return false; }

      ArrayList<SNode> roots = new ArrayList<SNode>();
      for (Iterator<SNode> it = model.rootsIterator(); it.hasNext();) {
        roots.add(it.next());
      }
      ModelOutputStream mos = null;
      IOException ioex = null;
      try {
        mos = new ModelOutputStream(new FileOutputStream(swapFile));
        saveModel(model.getSModelReference(), roots, mos);
      } catch (IOException e) {
        ioex = e; LOG.error(e);
      }
      finally {
        if (mos != null) {
          try {
            mos.close();
          } catch (IOException ignore) {}
        }
      }

      return ioex == null;
    }

    @Override
    public TransientSModel restoreFromSwap(SModelReference mref) {
      if (mySpaceDir == null || !mySpaceDir.exists()) throw new IllegalStateException("no swap dir");

      String modelId = mref.getSModelId().toString();
      if(modelId == null || modelId.isEmpty()) { throw new IllegalStateException("bad modelId"); }
      modelId = modelId.replaceAll(":", "-");

      File swapFile = new File (mySpaceDir, modelId);
      if (!swapFile.exists()) { throw new IllegalStateException("no swap file"); }

      ModelInputStream mis = null;
      try {
        mis = new ModelInputStream(new FileInputStream(swapFile));
        return loadModel(mref, mis, new TransientSModel(mref));
      } catch (IOException e) {
        LOG.error(e);
        throw new RuntimeException(e);
      }
      finally {
        if (mis != null) {
          try {
            mis.close();
          } catch (IOException ignore) {}
        }
        if (!swapFile.delete()) {
          LOG.error("Couldn't delete swap file");
        };
      }
    }

    @Override
    public void clear() {
      if (mySpaceDir == null || !mySpaceDir.exists()) throw new IllegalStateException("no swap dir");

      for (File f: mySpaceDir.listFiles()) {
        f.delete();
      }
      mySpaceDir.delete();
      mySpaceDir = null;
    }

    private static final int VERSION = 42;

    public TransientSModel loadModel(SModelReference modelReference, ModelInputStream is, TransientSModel model) throws IOException {
      int version = is.readInt();
      if (version != VERSION) {
        return null;
      }

      model.setLoading(true);
      List<SNode> roots = new NodesAndUserObjectsReader(modelReference).readNodes(model, is);
      for (SNode r: roots) {
        model.addRoot(r);
      }
      // Don't enable events as this will cause TextGen to fail. See MPS-11184
  //    model.setLoading(false);

      return model;
    }

    public void saveModel(SModelReference modelReference, List<SNode> roots, ModelOutputStream os) throws IOException {
      os.writeInt(VERSION);
      new NodesAndUserObjectsWriter(modelReference).writeNodes(roots, os);
    }

  }

  private static class NodesAndUserObjectsWriter extends NodesWriter {

    public NodesAndUserObjectsWriter(@NotNull SModelReference modelReference) {
      super(modelReference);
    }

    @Override
    protected void writeChildren(SNode node, ModelOutputStream os) throws IOException {
      // write user objects here
      Object userObject = node.getUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE);
      if (userObject instanceof SNode) {
        os.writeInt(1);
        os.writeModelReference(((SNode) userObject).getModel().getSModelReference());
        os.writeNodeId(((SNode) userObject).getSNodeId());
      }
      else {
        os.writeInt(0);
      }
      super.writeChildren(node, os);
    }
  }

  private static class NodesAndUserObjectsReader extends NodesReader {

    public NodesAndUserObjectsReader(@NotNull SModelReference modelReference) {
      super(modelReference);
    }

    @Override
    protected void readChildren(SModel model, ModelInputStream is, SNode node) throws IOException {
      // first read user objects
      int uoc = is.readInt();
      if (uoc == 1) {
        SModel tmodel = null;
        SModelReference modelRef = is.readModelReference();
        SNodeId nodeId = is.readNodeId();
        if (LOCAL.equals(modelRef)) {
          tmodel = model;
        }
        else {
          SModelDescriptor mdesc = SModelRepository.getInstance().getModelDescriptor(modelRef);
          if (mdesc != null) {
            tmodel = mdesc.getSModel();
          }
        }
        if (tmodel != null) {
          SNode userObject = tmodel.getNodeById(nodeId);
          node.putUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE, userObject);
        }
        else {
          throw new IOException("couldn't load user object");
        }
      }
      super.readChildren(model, is, node);
    }
  }
}
