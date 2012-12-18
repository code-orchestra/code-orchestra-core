package codeOrchestra.actionscript.view.assets;

import codeOrchestra.actionScript.assets.AssetsManager;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.*;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.Nullable;

import java.io.File;
import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public abstract class ASAbstractAssetsTreeNode extends ASDirectoryAssetTreeNode {

  private static final String FILE_ASSET_CONCEPT = "codeOrchestra.projectAssets.structure.FileAsset";

  protected MPSProject project;
  protected Solution solution;

  private boolean myInitialized;

  protected ASAbstractAssetsTreeNode(String text, MPSProject project, Solution solution) {
    super(text, new ModuleContext(solution, project.getProject()));
    this.project = project;
    this.solution = solution;

    setRelativePath("/");
    setAbsolutePath(project.getProject().getComponent(AssetsManager.class).createOrGetProjectAssetsDir().getPath());
  }

  @Override
  public boolean isInitialized() {
    return myInitialized;
  }

  @Override
  public void init() {
    if (myInitialized) {
      return;
    }

    removeAllChildren();
    populate();
    myInitialized = true;
  }

  private void populate() {
    ModelAccess.instance().runReadAction(new Runnable() {
      @Override
      public void run() {
        SModel assetsSModel = getAssetsSModel();
        if (assetsSModel == null) {
          return;
        }

        // Add the subnodes
        Iterator<SNode> rootIterator = assetsSModel.rootsIterator();
        while (rootIterator.hasNext()) {
          SNode root = rootIterator.next();
          if (root.isInstanceOfConcept(FILE_ASSET_CONCEPT)) {
            addAssetTreeNode(root.getProperty(ASFileAssetTreeNode.RELATIVE_PATH_PROPERTY_NAME), root);
          }
        }

        // Sort the nodes - folders go first
        sortChildren(new Comparator<MPSTreeNode>() {
          public int compare(MPSTreeNode mpsTreeNode1, MPSTreeNode mpsTreeNode2) {
            if (mpsTreeNode1 instanceof ASDirectoryAssetTreeNode && !(mpsTreeNode2 instanceof ASDirectoryAssetTreeNode)) {
              return -1;
            }
            if (!(mpsTreeNode1 instanceof ASDirectoryAssetTreeNode) && mpsTreeNode2 instanceof ASDirectoryAssetTreeNode) {
              return 1;
            }
            return 0;
          }
        });
      }
    });
  }

  private void addAssetTreeNode(String relativePath, SNode assetRoot) {
    if (relativePath.startsWith(File.separator)) {
      relativePath = relativePath.substring(1);
    }

    final ASFileAssetTreeNode asFileAssetTreeNode = new ASFileAssetTreeNode(assetRoot, getOperationContext());

    File assetFileRelative = new File(relativePath);
    String relativeDir = assetFileRelative.getParent();
    if (relativeDir == null) {
      add(asFileAssetTreeNode);
      return;
    }

    ASDirectoryAssetTreeNode directoryTreeNode = createOrGetDirectoryFor(relativeDir);
    directoryTreeNode.add(asFileAssetTreeNode);
    directoryTreeNode.setAbsolutePath(new File(asFileAssetTreeNode.getAssetAbsolutePath()).getParent());
    directoryTreeNode.setRelativePath(new File(asFileAssetTreeNode.getAssetRelativePath()).getParent());
  }

  private ASDirectoryAssetTreeNode createOrGetDirectoryFor(String relativeDir) {
    String[] relativeDirSplitted = StringUtils.split(relativeDir, File.separator);

    ASDirectoryAssetTreeNode lastDir = this;
    for (String relativeDirSplittedPiece : relativeDirSplitted) {
      ASDirectoryAssetTreeNode newDir = null;

      for (Object childObj : lastDir.getChildrenVector()) {
        if (childObj instanceof ASDirectoryAssetTreeNode) {
          ASDirectoryAssetTreeNode directoryAssetTreeNode = (ASDirectoryAssetTreeNode) childObj;
          if (relativeDirSplittedPiece.equals(directoryAssetTreeNode.getText())) {
            newDir = directoryAssetTreeNode;
            break;
          }
        }
      }

      if (newDir == null) {
        newDir = new ASDirectoryAssetTreeNode(relativeDirSplittedPiece);
        lastDir.add(newDir);
      }

      lastDir = newDir;
    }

    return lastDir;
  }

  @Nullable
  protected SModel getAssetsSModel() {
    SModelReference assetModelReference = AssetsManager.createAssetModelReference(solution.toString());
    SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(assetModelReference);
    if (modelDescriptor != null) {
      return modelDescriptor.getSModel();
    }
    return null;
  }

}
