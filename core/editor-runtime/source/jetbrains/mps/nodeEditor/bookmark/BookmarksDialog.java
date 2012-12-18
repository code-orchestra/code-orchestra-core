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
package jetbrains.mps.nodeEditor.bookmark;

import com.intellij.openapi.project.Project;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;

import com.intellij.openapi.wm.WindowManager;
import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;


public class BookmarksDialog extends BaseDialog {
  private BookmarkManager myBookmarkManager;
  private JPanel myMainComponent = new JPanel();
  private BookmarksTree myTree;

  public BookmarksDialog(Project project, BookmarkManager bookmarkManager) {
     super(WindowManager.getInstance().getFrame(project), 
       "Editor Bookmarks");
    myBookmarkManager = bookmarkManager;
    myTree = new BookmarksTree(project, bookmarkManager);

    setTitle("Editor Bookmarks");

    myMainComponent.setLayout(new GridBagLayout());
    JScrollPane scrollPane = ScrollPaneFactory.createScrollPane(myTree);
    JPanel rightPanel = new JPanel(new GridBagLayout());
    GridBagConstraints constraints = new GridBagConstraints();
    constraints.weightx = 1;
    constraints.weighty = 0;
    constraints.gridx = 0;
    constraints.fill = GridBagConstraints.HORIZONTAL;
    constraints.anchor = GridBagConstraints.CENTER;

    constraints.gridy = 0;
    rightPanel.add(new JButton(new AbstractAction("Go to") {
      public void actionPerformed(ActionEvent e) {
        myTree.gotoSelectedBookmark();
        dispose();
      }
    }), constraints);

    constraints.gridy = 1;
    rightPanel.add(new JButton(new AbstractAction("View Source") {
      public void actionPerformed(ActionEvent e) {
        myTree.gotoSelectedBookmark();
      }
    }), constraints);

    constraints.gridy = 2;
    rightPanel.add(new JButton(new AbstractAction("Remove") {
      public void actionPerformed(ActionEvent e) {
        myTree.removeSelectedBookmark();
      }
    }), constraints);

    constraints.gridy = 3;
    rightPanel.add(new JButton(new AbstractAction("Remove All") {
      public void actionPerformed(ActionEvent e) {
        myBookmarkManager.clearBookmarks();
      }
    }), constraints);

    constraints.gridy = 4;
    rightPanel.add(new JButton(new AbstractAction("Close") {
      public void actionPerformed(ActionEvent e) {
        dispose();
      }
    }), constraints);

    constraints.gridy = 5;
    constraints.weighty = 1;
    rightPanel.add(new JPanel(), constraints);

    GridBagConstraints outerConstraints = new GridBagConstraints();
    outerConstraints.gridy = 0;
    outerConstraints.weighty = 1;

    outerConstraints.gridx = 0;
    outerConstraints.weightx = 1;
    outerConstraints.fill = GridBagConstraints.BOTH;
    myMainComponent.add(scrollPane, outerConstraints);

    outerConstraints.gridx = 1;
    outerConstraints.weightx = 0;
    outerConstraints.anchor = GridBagConstraints.NORTH;
    outerConstraints.fill = GridBagConstraints.NONE;
    myMainComponent.add(rightPanel, outerConstraints);

    myTree.rebuildNow();
/*    Frame mainFrame = WindowManager.getInstance().getFrame(myProject);
    setSize(400,400);
    setLocation(mainFrame.getX()+(mainFrame.getWidth() - getWidth())/2, mainFrame.getY()+(mainFrame.getHeight() - getHeight())/2);
    setModal(true);*/
  }

  protected JComponent getMainComponent() {
    return myMainComponent;
  }

  @Override
  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(100,100,400,300);
  }
}
