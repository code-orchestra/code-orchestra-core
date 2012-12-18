package codeOrchestra.actionscript.view.assets;

import com.intellij.openapi.actionSystem.ActionGroup;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.workbench.action.ActionUtils;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class ASDirectoryAssetTreeNode extends TextTreeNode implements AssetFileProvider {

  private static final String ACTION_GROUP_ID = "codeOrchestra.projectAssets.plugin.ASDirectoryAssetsActions_ActionGroup";

  private String relativePath;
  private String absolutePath;

  public ASDirectoryAssetTreeNode(String name) {
    super(name);
  }

  public ASDirectoryAssetTreeNode(String name, IOperationContext context) {
    super(name, context);
  }

  public String getAssetRelativePath() {
    return relativePath;
  }

  public void setRelativePath(String relativePath) {
    this.relativePath = relativePath;
  }

  public String getAssetAbsolutePath() {
    return absolutePath;
  }

  public void setAbsolutePath(String absolutePath) {
    this.absolutePath = absolutePath;
  }

  @Override
  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ACTION_GROUP_ID);
  }

}
