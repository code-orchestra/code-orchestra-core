package codeOrchestra.actionscript.view.assets;

import com.intellij.openapi.actionSystem.ActionGroup;
import codeOrchestra.actionscript.run.BrowserUtil;
import jetbrains.mps.ide.ui.smodel.SNodeTreeNode;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.action.ActionUtils;

import javax.swing.JOptionPane;
import java.io.IOException;

/**
 * @author Alexander Eliseyev
 */
public class ASFileAssetTreeNode extends SNodeTreeNode implements AssetFileProvider {

  private static final Logger LOG = Logger.getLogger(ASFileAssetTreeNode.class);

  public static final String PATH_PROPERTY_NAME = "path";
  public static final String RELATIVE_PATH_PROPERTY_NAME = "relativePath";

  private static final String ACTION_GROUP_ID = "codeOrchestra.projectAssets.plugin.ASFileAssetsActions_ActionGroup";

  private String filePath;
  private String relativePath;

  public ASFileAssetTreeNode(SNode node, IOperationContext operationContext) {
    super(node, operationContext);

    this.filePath = node.getProperty(PATH_PROPERTY_NAME);
    this.relativePath = node.getProperty(RELATIVE_PATH_PROPERTY_NAME);
  }

  public String getAssetRelativePath() {
    return relativePath;
  }

  public String getAssetAbsolutePath() {
    return filePath;
  }

  @Override
  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ACTION_GROUP_ID);
  }

  @Override
  protected void doInit() {
    myInitialized = true;
  }

  @Override
  public boolean isLeaf() {
    return true;
  }

  @Override
  protected boolean enableLayeredIcon() {
    return false;
  }

  @Override
  public void doubleClick() {
    try {
      BrowserUtil.launchBrowser(filePath).start();
    } catch (IOException e) {
      JOptionPane.showMessageDialog(null, "Can't open " + filePath, "File Assets", JOptionPane.ERROR_MESSAGE);
      LOG.error("Can't open " + filePath, e);
    }
  }
}
