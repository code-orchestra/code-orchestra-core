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
package jetbrains.mps.nodeEditor;

import com.intellij.util.containers.SortedList;
import jetbrains.mps.nodeEditor.EditorComponent.RebuildListener;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.inspector.InspectorEditorComponent;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.ManyToManyMap;
import org.jetbrains.annotations.NotNull;

import java.awt.Color;
import java.util.*;
import java.util.Map.Entry;


public class NodeHighlightManager implements EditorMessageOwner {
  private static final Comparator<EditorMessage> EDITOR_MESSAGES_COMPARATOR = new Comparator<EditorMessage>() {
    public int compare(EditorMessage m1, EditorMessage m2) {
      return m1.getPriority() - m2.getPriority();
    }
  };

  // TODO: replace myMessagesLock usages with this ?
  private final Object myMessagesLock = new Object();

  @NotNull
  private EditorComponent myEditor;
  private Set<EditorMessage> myMessages = new HashSet<EditorMessage>();
  private Map<EditorMessageOwner, Set<EditorMessage>> myOwnerToMessages = new HashMap<EditorMessageOwner, Set<EditorMessage>>();
  private ManyToManyMap<EditorMessage, SNode> myMessagesToNodes = new ManyToManyMap<EditorMessage, SNode>();

  /**
   * all Caches are synchronized using myMessagesLock
   */
  private Map<EditorCell, List<EditorMessage>> myMessagesCache = Collections.emptyMap();
  private volatile boolean myRebuildMessagesCache = false;
  public ReloadAdapter myHandler = new ReloadAdapter() {
    public void unload() {
      clear();
    }
  };
  private RebuildListener myRebuildListener;
  private Set<EditorMessageIconRenderer> myIconRenderersCache = new HashSet<EditorMessageIconRenderer>();
  private volatile boolean myRebuildIconRenderersCacheFlag = false;

  public NodeHighlightManager(@NotNull EditorComponent editor) {
    myEditor = editor;

    editor.addRebuildListener(myRebuildListener = new RebuildListener() {
      public void editorRebuilt(EditorComponent editor) {
        boolean needRebuild = getMessagesCache().isEmpty();
        if (!needRebuild) {
          for (EditorCell cell : getMessagesCache().keySet()) {
            if (!myEditor.isValid(cell)) {
              needRebuild = true;
              break;
            }
          }
        }
        if (needRebuild) {
          invalidateMessagesCaches();
          repaintAndRebuildEditorMessages();
        }
      }
    });

    ClassLoaderManager.getInstance().addReloadHandler(myHandler);
  }

  /**
   * scheduling lazy rebuild of myMessagesCache and myIconRenderersCache
   * this method can be called from any thread
   * this method should be called inside synchronize(myMessagesLock) block only
   */
  private void invalidateMessagesCaches() {
    myRebuildMessagesCache = true;
    myRebuildIconRenderersCacheFlag = true;
  }

  private Map<EditorCell, List<EditorMessage>> getMessagesCache() {
    synchronized (myMessagesLock) {
      return myMessagesCache;
    }
  }

  private void refreshMessagesCache() {
    assert ModelAccess.instance().isInEDT() : "refreshMessagesCache() should be called from EDT only";
    assert ModelAccess.instance().canRead() : "refreshMessagesCache() should be called inside model read action only";
    synchronized (myMessagesLock) {
      if (myRebuildMessagesCache) {
        myRebuildMessagesCache = false;
        if (myMessages.isEmpty()) {
          myMessagesCache = Collections.emptyMap();
        } else {
          myMessagesCache = new HashMap<EditorCell, List<EditorMessage>>();
          if (myEditor.getRootCell() != null && !myMessages.isEmpty()) {
            rebuildMessages(myEditor.getRootCell());
          }
        }
      }
    }
  }

  /**
   * part of myMessagesCache rebuild process
   * this method should be called inside synchronize(myMessagesLock) block only
   */
  private void rebuildMessages(EditorCell root) {
    List<EditorMessage> messages = calculateMessages(root);
    if (!messages.isEmpty()) {
      myMessagesCache.put(root, messages);
    }

    if (root instanceof EditorCell_Collection) {
      EditorCell_Collection collection = (EditorCell_Collection) root;
      for (EditorCell cell : collection.getCells()) {
        rebuildMessages(cell);
      }
    }
  }

  public List<EditorMessage> getMessages(EditorCell cell) {
    List<EditorMessage> result = getMessagesCache().get(cell);
    if (result != null) {
      return new ArrayList<EditorMessage>(result);
    }
    return Collections.<EditorMessage>emptyList();
  }

  /**
   * part of myMessagesCache rebuild process
   * this method should be called inside synchronize(myMessagesLock) block only
   */
  private List<EditorMessage> calculateMessages(EditorCell cell) {
    final SNode node = cell.getSNode();
    final List<EditorMessage> result = new SortedList<EditorMessage>(EDITOR_MESSAGES_COMPARATOR);
    if (node == null) return result;
    Set<EditorMessage> messageSet = myMessagesToNodes.getBySecond(node);
    for (EditorMessage message : messageSet) {
      if (message.acceptCell(cell, myEditor)) {
        result.add(message);
      }
    }
    if (myEditor.getRootCell() != cell || !(myEditor instanceof InspectorEditorComponent)) {
      // the condition above is because an inspector for the node
      // does not have cells for some node's children (they are edited in main editor)
      // but the cell should not be highlighted only because of this
      if (cell.isBigCell()) {
        for (SNode child : node.getChildren()) {
          EditorCell cellForChild = myEditor.findNodeCell(child);
          if (cellForChild == null) {
            getMessagesFromDescendants(child, result);
          }
        }
      }
    }
    return result;
  }

  private void getMessagesFromDescendants(SNode nodeWithoutCell, List<EditorMessage> messages) {
    messages.addAll(myMessagesToNodes.getBySecond(nodeWithoutCell));
    for (SNode child : nodeWithoutCell.getChildren()) {
      EditorCell cellForChild = myEditor.findNodeCell(child);
      if (cellForChild == null) {
        getMessagesFromDescendants(child, messages);        
      }      
    }
  }

  private void addMessage(EditorMessage m) {
    if (m.getNode() == null) {
      return;
    }

    EditorMessageOwner owner = m.getOwner();
    if (!myOwnerToMessages.containsKey(owner)) {
      myOwnerToMessages.put(owner, new HashSet<EditorMessage>());
    }
    myOwnerToMessages.get(owner).add(m);
    myMessages.add(m);

    myMessagesToNodes.addLink(m, m.getNode());
  }

  private boolean removeMessage(EditorMessage m) {
    if (m == null) {
      return false;
    }
    EditorMessageOwner owner = m.getOwner();
    Set<EditorMessage> messages = myOwnerToMessages.get(owner);
    if (messages != null) {
      messages.remove(m);
      if (messages.isEmpty()) {
        myOwnerToMessages.remove(owner);
      }
    }
    myMessages.remove(m);
    myEditor.getMessagesGutter().remove(m);

    myMessagesToNodes.clearFirst(m);
    return true;
  }

  public void mark(EditorMessage message) {
    for (EditorMessage msg : getMessages()) {
      if (msg.sameAs(message)) return;
    }

    synchronized (myMessagesLock) {
      addMessage(message);
      invalidateMessagesCaches();
    }
    if (message.showInGutter()) {
      myEditor.getMessagesGutter().add(message);
    }
  }

  public void unmark(EditorMessage message) {
    synchronized (myMessagesLock) {
      if (removeMessage(message)) {
        invalidateMessagesCaches();
      }
    }
  }

  private void clear() {
    synchronized (myMessagesLock) {
      if (myMessages.isEmpty()) return;
      for (EditorMessage m : new ArrayList<EditorMessage>(myMessages)) {
        removeMessage(m);
      }
      invalidateMessagesCaches();
    }
    repaintAndRebuildEditorMessages();
  }

  public boolean clearForOwner(EditorMessageOwner owner) {
    return clearForOwner(owner, true);
  }

  public boolean clearForOwner(EditorMessageOwner owner, boolean repaintAndRebuild) {
    boolean result = myEditor.getMessagesGutter().removeMessages(owner);
    synchronized (myMessagesLock) {
      if (myOwnerToMessages.containsKey(owner)) {
        ArrayList<EditorMessage> messages = new ArrayList<EditorMessage>(myOwnerToMessages.get(owner));
        for (EditorMessage m : messages) {
          removeMessage(m);
        }
        invalidateMessagesCaches();
      }
    }
    if (repaintAndRebuild) {
      repaintAndRebuildEditorMessages();
    }
    return result;
  }

  /**
   * perform refresh of messages visible in LeftEditorHighlighter
   * and repaint associated EditorComponent
   */
  public void repaintAndRebuildEditorMessages() {
    ModelAccess.instance().runReadInEDT(new Runnable() {
      public void run() {
        refreshMessagesCache();
        myEditor.getExternalComponent().repaint();
        refreshLeftHighlighterMessages();
      }
    });
  }

  private void refreshLeftHighlighterMessages() {
    assert ModelAccess.instance().isInEDT() : "refreshLeftHighlighterMessages() should be called from EDT only";
    Set<EditorMessageIconRenderer> oldIconRenderers;
    Set<EditorMessageIconRenderer> newIconRenderers;
    synchronized (myMessagesLock) {
      if (!myRebuildIconRenderersCacheFlag) {
        return;
      }
      myRebuildIconRenderersCacheFlag = false;
      oldIconRenderers = myIconRenderersCache;
      newIconRenderers = myIconRenderersCache = new HashSet<EditorMessageIconRenderer>();
      for (EditorMessage message : myMessages) {
        if (message instanceof EditorMessageIconRenderer) {
          myIconRenderersCache.add((EditorMessageIconRenderer) message);
        }
      }
    }
    myEditor.getLeftEditorHighlighter().removeAllIconRenderers(oldIconRenderers);
    myEditor.getLeftEditorHighlighter().addAllIconRenderers(newIconRenderers);
  }

  public void mark(SNode node, Color color, String messageText, EditorMessageOwner owner) {
    if (node == null) return;
    mark(new DefaultEditorMessage(node, color, messageText, owner));
  }

  public void mark(List<EditorMessage> messages) {
    for (int i = 0; i < messages.size(); i++) {
      mark(messages.get(i));
    }
    repaintAndRebuildEditorMessages();
  }

  public void markSingleMessage(EditorMessage message) {
    mark(message);
    repaintAndRebuildEditorMessages();
  }

  public Set<EditorMessage> getMessages() {
    Set<EditorMessage> result = new HashSet<EditorMessage>();
    synchronized (myMessagesLock) {
      result.addAll(myMessages);
    }
    return result;
  }

  public EditorMessage getMessageFor(SNode node) {
    synchronized (myMessagesLock) {
      for (EditorMessage msg : myMessages) {
        if (msg.getNode() == node) return msg;
      }
    }
    return null;
  }

  public List<EditorMessage> getMessagesFor(SNode node) {
    List<EditorMessage> result = new ArrayList<EditorMessage>();
    synchronized (myMessagesLock) {
      result.addAll(myMessagesToNodes.getBySecond(node));
    }
    return result;
  }

  public List<EditorMessage> getMessagesFor(SNode node, EditorMessageOwner owner) {
    List<EditorMessage> result = new ArrayList<EditorMessage>();
    synchronized (myMessagesLock) {
      for (EditorMessage message : myMessagesToNodes.getBySecond(node)) {
        if (message.getOwner() == owner) {
          result.add(message);
        }
      }
    }
    return result;
  }

  public void dispose() {
    assert ModelAccess.instance().isInEDT() : "dispose() should be called from EDT only";
    ClassLoaderManager.getInstance().removeReloadHandler(myHandler);
    myEditor.removeRebuildListener(myRebuildListener);
  }

  public EditorCell getCell(EditorMessage change) {
    if (ModelAccess.instance().canWrite() && ModelAccess.instance().isInEDT()) {
      refreshMessagesCache();
    }
    for (Entry<EditorCell, List<EditorMessage>> e: getMessagesCache().entrySet()) {
      if (e.getValue().contains(change)) {
        return e.getKey();
      }
    }
    return null;
  }
}