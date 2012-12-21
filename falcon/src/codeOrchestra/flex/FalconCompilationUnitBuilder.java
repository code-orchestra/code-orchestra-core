package codeOrchestra.flex;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.processors.SNodeProcessorProvider;
import codeOrchestra.flex.tree.OutOfPackageScriptNode;
import jetbrains.mps.generator.TransientSModel;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.SModel.ImportElement;
import org.apache.flex.compiler.internal.projects.CompilerProject;
import org.apache.flex.compiler.internal.projects.DefinitionPriority;
import org.apache.flex.compiler.internal.scopes.ASFileScope;
import org.apache.flex.compiler.internal.tree.as.*;
import org.apache.flex.compiler.internal.units.ASCompilationUnit;
import org.apache.flex.compiler.internal.workspaces.Workspace;
import org.apache.flex.compiler.problems.ICompilerProblem;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.IContainerNode.ContainerType;
import org.apache.flex.utils.FilenameNormalization;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class FalconCompilationUnitBuilder {

  private static FalconCompilationUnitBuilder instance = new FalconCompilationUnitBuilder();

  private FalconCompilationUnitBuilder() {

  }

  public static FalconCompilationUnitBuilder getInstance() {
    return instance;
  }

  public ASCompilationUnit buildCompilationUnit(SNode root, CompilerProject project) throws FalconCompilationUnitBuilderException {

    String rootNodeName = FalconProjectBuilder.getRootFQName(root);

    // TODO: hack that overrides CO-4905
    if (rootNodeName == null && root.getConceptFqName().equals("codeOrchestra.actionScript.structure.TopLevelNamespace")) {
      SNode namespace = root.getChild("namespace");
      if (namespace != null) {
        rootNodeName = namespace.getName();
      }
    }

    SModel myModel = root.getModel();
    myModel = myModel instanceof TransientSModel ? ((TransientSModel) myModel).getOriginalModel() : myModel ;

    if (rootNodeName == null) {
      throw new FalconCompilationUnitBuilderException("Cannot get root name for node " + myModel.getLongName() + "#" + root.getId());
    }

    // Process root
    NodeBase rootNode;
    try {
      SNodeProcessor processor = SNodeProcessorProvider.getInstance().getProcessor(root);
      IASNode processingResult = processor.process();
      if (!(processingResult instanceof NodeBase)) {
        throw new FalconCompilationUnitBuilderException("Root node processor must return NodeBase instance");
      }
      rootNode = (NodeBase) processingResult;
    } catch (SNodeProcessorException e) {
      throw new FalconCompilationUnitBuilderException("Error while processing root " + rootNodeName, e);
    }

    // Process out of package
    List<NodeBase> outOfPackageNodes = new ArrayList<NodeBase>();
    for (SNode node : root.getChildren("outOfPackageNode")) { // We skip children in role outOfPackageButton
      try {
        SNodeProcessor processor = SNodeProcessorProvider.getInstance().getProcessor(node);
        IASNode processingResult = processor.process();
        if (!(processingResult instanceof NodeBase)) {
          throw new FalconCompilationUnitBuilderException("Out of package node processor must return NodeBase instance");
        }
        outOfPackageNodes.add((NodeBase) processingResult);
      } catch (SNodeProcessorException e) {
        throw new FalconCompilationUnitBuilderException("Error while processing out of package node " + node.getModel().getLongName() + "#" + node.getId(), e);
      }
    }

    Workspace workspace = project.getWorkspace();

    // File
    FileNode fileNode = new FileNode(workspace);
    fileNode.setProblems(Collections.<ICompilerProblem>emptyList()); // =)

    // Compilation unit
    String fakeFilePath = FilenameNormalization.normalize(rootNodeName + ".as"); // TODO: We need any unique string here
    ASCompilationUnit asCompilationUnit = new ASCompilationUnit(project, fakeFilePath, DefinitionPriority.BasePriority.SOURCE_PATH);
    workspace.addCompilationUnit(asCompilationUnit);
    asCompilationUnit.setFileNode(fileNode);
    fileNode.setSourcePath(fakeFilePath);
    fileNode.setScope(new ASFileScope(fileNode));
    fileNode.getFileScope().setCompilationUnit(asCompilationUnit);

    // Package
    String modelName = root.getModel().getLongName();
    ExpressionNodeBase packageName = modelName.isEmpty() ? null : buildPackageName(modelName);
    PackageNode packageNode = new PackageNode(packageName, null);
    fileNode.addChild(packageNode);
    packageNode.setParent(fileNode);

    ScopedBlockNode packageScopedBlockNode = packageNode.getScopedNode();
    packageScopedBlockNode.setContainerType(ContainerType.BRACES);

    // Add out of package nodes to fileNode
    for (NodeBase node : outOfPackageNodes) {
      if (node instanceof OutOfPackageScriptNode) {
        // There is no such node in the Falcon tree, it is simply list of statements
        for (NodeBase statement : ((OutOfPackageScriptNode) node).getStatements()) {
          fileNode.addChild(statement);
          statement.setParent(fileNode);
        }
      } else {
        fileNode.addChild(node);
        node.setParent(fileNode);
      }
    }

    // Imports
    for (ImportElement importElement : myModel.importedModels()) {
      SModelReference modelReference = importElement.getModelReference();
      SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(modelReference);
      if (modelDescriptor == null) {
        throw new RuntimeException("Can't get model from repository: " + modelReference.toString());
      }

      String importedModelName = modelDescriptor.getLongName();
      if (importedModelName.isEmpty()) {
        // Do not add default package import
        continue;
      }
      if ("flash.metadata".equals(importedModelName)) {
        // Do not add flash.metadata.* import
        continue;
      }
      if ("#assets#-Project_assets".equals(importedModelName)) {
        // Do not add assets import
        continue;
      }
      ExpressionNodeBase importedPackageName = buildImportName(importedModelName);

      if (importedPackageName != null) { // TODO: What are we checking here?
        packageScopedBlockNode.addItem(new ImportNode(importedPackageName));
      }
    }

    // Add root
    packageScopedBlockNode.addChild(rootNode);
    rootNode.setParent(packageScopedBlockNode);

    project.addCompilationUnit(asCompilationUnit);

    return asCompilationUnit;
  }

  private ExpressionNodeBase buildPackageName(String modelName) {
    String[] nameParts = modelName.split("\\.");
    ExpressionNodeBase packageName = null;
    for (String namePart : nameParts) {
      IdentifierNode identifierNode = new IdentifierNode(namePart);
      if (packageName == null) {
        packageName = identifierNode;
      } else {
        packageName = new FullNameNode(packageName, null, identifierNode);
      }
    }
    return packageName;
  }

  private ExpressionNodeBase buildImportName(String modelName) {
    ExpressionNodeBase packageName = buildPackageName(modelName);
    packageName = new FullNameNode(packageName, null, LanguageIdentifierNode.buildAnyType());
    return packageName;
  }

}
