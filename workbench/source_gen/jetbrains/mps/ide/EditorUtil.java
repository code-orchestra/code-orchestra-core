package jetbrains.mps.ide;

/*Generated by MPS */

import javax.swing.JComponent;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.project.IModule;
import jetbrains.mps.util.Macros;
import jetbrains.mps.util.MacrosFactory;
import java.io.File;
import javax.swing.JButton;
import javax.swing.AbstractAction;
import java.awt.event.ActionEvent;
import java.awt.Component;
import javax.swing.SwingUtilities;
import javax.swing.JFrame;
import jetbrains.mps.ide.ui.filechoosers.treefilechooser.TreeFileChooser;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.smodel.ModelAccess;

public class EditorUtil {
  public EditorUtil() {
  }

  public static JComponent createSelectIconButton(SNode sourceNode, final EditorContext context) {
    return EditorUtil.createSelectIconButton(sourceNode, "iconPath", context);
  }

  public static JComponent createSelectIconButton(final SNode sourceNode, final String propertyName, final EditorContext context) {
    IModule module = sourceNode.getModel().getModelDescriptor().getModule();
    final Macros macros = MacrosFactory.moduleDescriptor(module);
    String path = sourceNode.getProperty(propertyName);
    final IModule finalModule = module;
    String filename = (finalModule == null ?
      null :
      macros.expandPath(path, finalModule.getDescriptorFile())
    );
    final File baseFile = (filename == null ?
      null :
      new File(filename)
    );
    final JButton button = new JButton();
    button.setAction(new AbstractAction("...") {
      public void actionPerformed(ActionEvent e) {
        Component root = SwingUtilities.getRoot(button);
        JFrame frame = (root instanceof JFrame ?
          (JFrame) root :
          null
        );
        TreeFileChooser chooser = new TreeFileChooser();
        chooser.setContext(context.getOperationContext());
        if (baseFile != null && baseFile.exists()) {
          chooser.setInitialFile(FileSystem.getInstance().getFileByPath(baseFile.getAbsolutePath()));
        }
        IFile result = chooser.showDialog(frame);
        if (result == null) {
          return;
        }
        String selectedPath = result.getPath();
        final String pathToShow;
        if (finalModule != null) {
          pathToShow = macros.shrinkPath(selectedPath, finalModule.getDescriptorFile());
        } else {
          pathToShow = selectedPath;
        }
        ModelAccess.instance().runWriteActionInCommand(new Runnable() {
          public void run() {
            sourceNode.setProperty(propertyName, pathToShow);
          }
        });
      }
    });
    return button;
  }
}
