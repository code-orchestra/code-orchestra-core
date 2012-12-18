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
package jetbrains.mps.workbench.nodesFs;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.vfs.DeprecatedVirtualFileSystem;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.util.LocalTimeCounter;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.event.*;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.ConditionalIterator;
import jetbrains.mps.util.Pair;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.SwingUtilities;
import java.io.IOException;
import java.util.*;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MPSNodesVirtualFileSystem extends DeprecatedVirtualFileSystem implements ApplicationComponent {

  public static MPSNodesVirtualFileSystem getInstance() {
    return ApplicationManager.getApplication().getComponent(MPSNodesVirtualFileSystem.class);
  }

  private SModelCommandListener myCommandListener = new MyCommandListener();
  private SModelListener myModelListener = new MyModelListener();
  private SModelRepositoryListener mySModelRepositoryListener = new MyModelRepositoryListener();
  private Map<SNodePointer, MPSNodeVirtualFile> myVirtualFiles = new ConcurrentHashMap<SNodePointer, MPSNodeVirtualFile>();
  private boolean myDisposed = false;

  public MPSNodeVirtualFile getFileFor(@NotNull final SNode node) {
    return ModelAccess.instance().runReadAction(new Computable<MPSNodeVirtualFile>() {
      public MPSNodeVirtualFile compute() {
        SNodePointer nodePointer = new SNodePointer(node);
        return getFileFor(nodePointer);
      }
    });
  }

  public MPSNodeVirtualFile getFileFor(@NotNull final SNodePointer nodePointer) {
    if (myVirtualFiles.containsKey(nodePointer)) return myVirtualFiles.get(nodePointer);

    MPSNodeVirtualFile vf = new MPSNodeVirtualFile(nodePointer);
    myVirtualFiles.put(nodePointer, vf);
    return vf;
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "MPS File System";
  }

  public void initComponent() {
    GlobalSModelEventsManager.getInstance().addGlobalCommandListener(myCommandListener);
    GlobalSModelEventsManager.getInstance().addGlobalModelListener(myModelListener);

    SModelRepository.getInstance().addModelRepositoryListener(mySModelRepositoryListener);
  }

  public void disposeComponent() {
    SModelRepository.getInstance().removeModelRepositoryListener(mySModelRepositoryListener);

    GlobalSModelEventsManager.getInstance().removeGlobalModelListener(myModelListener);
    GlobalSModelEventsManager.getInstance().removeGlobalCommandListener(myCommandListener);
    myDisposed = true;
  }

  @NotNull
  @NonNls
  public String getProtocol() {
    return "mps";
  }

  @Nullable
  public VirtualFile findFileByPath(final @NotNull @NonNls String path) {
    return ModelAccess.instance().runReadAction(new Computable<VirtualFile>() {
      public VirtualFile compute() {
        Pattern p = Pattern.compile("(.*)/(.*)");
        Matcher m = p.matcher(path);
        if (!m.matches()) return null;

        SModelReference reference = SModelReference.fromString(m.group(1));
        final String name = m.group(2);
        SModelDescriptor sm = GlobalScope.getInstance().getModelDescriptor(reference);
        if (sm == null) return null;

        Condition<SNode> cond = new Condition<SNode>() {
          public boolean met(SNode node) {
            return node.getPresentation().equals(name);
          }
        };
        Iterator<SNode> iter = new ConditionalIterator<SNode>(sm.getSModel().rootsIterator(), cond);
        if (!iter.hasNext()) return null;
        return getFileFor(iter.next());
      }
    });
  }

  public void refresh(boolean asynchronous) {

  }

  @Nullable
  public VirtualFile refreshAndFindFileByPath(@NotNull String path) {
    return null;
  }

  boolean hasVirtualFileFor(SNodePointer nodePointer) {
    return myVirtualFiles.containsKey(nodePointer);
  }

  protected void deleteFile(Object requestor, @NotNull VirtualFile vFile) throws IOException {
    throw new UnsupportedOperationException();
  }

  protected void moveFile(Object requestor, @NotNull VirtualFile vFile, @NotNull VirtualFile newParent) throws IOException {
    throw new UnsupportedOperationException();
  }

  protected void renameFile(Object requestor, @NotNull VirtualFile vFile, @NotNull String newName) throws IOException {
    throw new UnsupportedOperationException();
  }

  protected VirtualFile createChildFile(Object requestor, @NotNull VirtualFile vDir, @NotNull String fileName) throws IOException {
    throw new UnsupportedOperationException();
  }

  @NotNull
  protected VirtualFile createChildDirectory(Object requestor, @NotNull VirtualFile vDir, @NotNull String dirName) throws IOException {
    throw new UnsupportedOperationException();
  }

  protected VirtualFile copyFile(Object requestor, @NotNull VirtualFile virtualFile, @NotNull VirtualFile newParent, @NotNull String copyName) throws IOException {
    throw new UnsupportedOperationException();
  }

  private void updateModificationStamp(SNode rootNode) {
    MPSNodeVirtualFile vf = myVirtualFiles.get(new SNodePointer(rootNode.getContainingRoot()));
    if (vf != null) {
      vf.setModificationStamp(LocalTimeCounter.currentTime());
      vf.setTimeStamp(System.currentTimeMillis());
    }
  }

  private class MyCommandListener implements SModelCommandListener {
    public void eventsHappenedInCommand(final List<SModelEvent> events) {
      MyModelEventVisitor visitor = new MyModelEventVisitor();
      for (SModelEvent e : events) {
        e.accept(visitor);
      }
      final VFSNotifier vfsNotifier = new VFSNotifier(visitor.myDeletedFiles, visitor.myRenamedFiles);
      if (vfsNotifier.hasPendingNotifications()) {
        for (MPSNodeVirtualFile deletedFile : visitor.myDeletedFiles) {
          myVirtualFiles.remove(deletedFile.getSNodePointer());
        }

        SwingUtilities.invokeLater(new Runnable() {
          public void run() {
            ModelAccess.instance().runWriteActionInCommand(vfsNotifier);
          }
        });
      }

    }
  }

  private class MyModelEventVisitor extends SModelEventVisitorAdapter {
    private Collection<MPSNodeVirtualFile> myDeletedFiles = new ArrayList<MPSNodeVirtualFile>();
    private Collection<Pair<MPSNodeVirtualFile, String>> myRenamedFiles = new ArrayList<Pair<MPSNodeVirtualFile, String>>();

    public void visitRootEvent(SModelRootEvent event) {
      if (!event.isRemoved()) return;

      SNodePointer rootNodePointer = new SNodePointer(event.getRoot());
      MPSNodeVirtualFile vf = myVirtualFiles.get(rootNodePointer);
      if (vf != null) {
        myDeletedFiles.add(vf);
      }
    }

    public void visitPropertyEvent(final SModelPropertyEvent event) {
      if (event.getNode().isDisposed()) return;

      MPSNodeVirtualFile vf = myVirtualFiles.get(new SNodePointer(event.getNode()));
      if (!event.getNode().isRoot() || vf == null) return;
      String newName = event.getNode().getPresentation();
      if (!newName.equals(vf.getName())) {
        myRenamedFiles.add(new Pair<MPSNodeVirtualFile, String>(vf, newName));
      }
    }
  }

  private class MyModelRepositoryListener extends SModelRepositoryAdapter {
    public void beforeModelRemoved(SModelDescriptor modelDescriptor) {
      if (modelDescriptor.getLoadingState() == ModelLoadingState.NOT_LOADED) return;

      Collection<MPSNodeVirtualFile> deletedFiles = new ArrayList<MPSNodeVirtualFile>();
      for (SNode root : modelDescriptor.getSModel().roots()) {
        SNodePointer pointer = new SNodePointer(root);
        MPSNodeVirtualFile vf = myVirtualFiles.get(pointer);
        if (vf == null) continue;
        deletedFiles.add(vf);
        myVirtualFiles.remove(pointer);
      }
      VFSNotifier vfsNotifier = new VFSNotifier(deletedFiles, Collections.<Pair<MPSNodeVirtualFile, String>>emptyList());
      if (vfsNotifier.hasPendingNotifications()) {
        ModelAccess.instance().runWriteInEDT(vfsNotifier);
      }
    }
  }

  private class MyModelListener extends SModelAdapter {
    public void eventFired(SModelEvent event) {
      if (event.getAffectedRoot() == null) return;
      updateModificationStamp(event.getAffectedRoot());
    }

    public void modelReplaced(final SModelDescriptor sm) {
      for (SNode root : sm.getSModel().roots()) {
        updateModificationStamp(root);
      }

      Collection<MPSNodeVirtualFile> deletedFiles = new ArrayList<MPSNodeVirtualFile>();
      Collection<Pair<MPSNodeVirtualFile, String>> renamedFiles = new ArrayList<Pair<MPSNodeVirtualFile, String>>();
      for (Iterator<Entry<SNodePointer, MPSNodeVirtualFile>> it = myVirtualFiles.entrySet().iterator(); it.hasNext();) {
        Entry<SNodePointer, MPSNodeVirtualFile> entry = it.next();
        if (entry.getKey().getModel() != sm) continue;

        SNode node = entry.getKey().getNode();
        MPSNodeVirtualFile file = entry.getValue();
        if (node == null) {
          deletedFiles.add(file);
          it.remove();
        } else {
          String oldName = file.getName();
          String newName = node.getPresentation();
          if (!oldName.equals(newName)) {
            renamedFiles.add(new Pair<MPSNodeVirtualFile, String>(file, newName));
          }
        }
      }

      VFSNotifier vfsNotifier = new VFSNotifier(deletedFiles, renamedFiles);
      if (vfsNotifier.hasPendingNotifications()) {
        ModelAccess.instance().runWriteInEDT(vfsNotifier);
      }
    }
  }

  private class VFSNotifier implements Runnable {
    private Collection<MPSNodeVirtualFile> myDeleterFiles;
    private Collection<Pair<MPSNodeVirtualFile, String>> myRenamedFiles;

    private VFSNotifier(Collection<MPSNodeVirtualFile> deletedFiles, Collection<Pair<MPSNodeVirtualFile, String>> renamedFiles) {
      myDeleterFiles = deletedFiles;
      myRenamedFiles = renamedFiles;
    }

    @Override
    public void run() {
      if (myDisposed) {
        return;
      }
      for (MPSNodeVirtualFile deletedFile : myDeleterFiles) {
        fireBeforeFileDeletion(this, deletedFile);
        deletedFile.invalidate();
        fireFileDeleted(this, deletedFile, deletedFile.getName(), null);
      }

      for (Pair<MPSNodeVirtualFile, String> renamedFile : myRenamedFiles) {
        MPSNodeVirtualFile vf = renamedFile.o1;
        String oldName = vf.getName();
        String newName = renamedFile.o2;
        fireBeforePropertyChange(this, vf, VirtualFile.PROP_NAME, oldName, newName);
        vf.updateFields();
        firePropertyChanged(this, vf, VirtualFile.PROP_NAME, oldName, newName);
      }
    }

    public boolean hasPendingNotifications() {
      return !myDeleterFiles.isEmpty() || !myRenamedFiles.isEmpty();
    }
  }
}
