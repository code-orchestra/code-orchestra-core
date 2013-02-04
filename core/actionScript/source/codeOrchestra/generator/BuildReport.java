package codeOrchestra.generator;

import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import codeOrchestra.actionscript.util.XMLUtils;
import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.transform.TransformerException;
import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class BuildReport {

  public static final String LAST_BUILD_XML = "lastBuild.xml";

  public static final String MAIN_CLASS_ELEMENT = "mainClass";
  public static final String LAST_BUILD_ELEMENT = "lastBuild";

  public static boolean isSufficientlyDifferentFrom(CodeOrchestraGenerationContext generationContext) {
    if (generationContext == null) {
      return false;
    }

    BuildReport lastBuild = load(MPSModuleRepository.getInstance().getSolution(generationContext.getRootModule()));
    BuildReport newBuild = fromContext(generationContext);

    return !lastBuild.equals(newBuild);
  }

  public static void memorize(CodeOrchestraGenerationContext generationContext) {
    BuildReport buildReport = fromContext(generationContext);
    buildReport.persist();
  }

  private transient Solution module;

  private String mainClassNodeId;
  private String mainClassModelUID;

  public BuildReport(Solution module) {
    this.module = module;
  }

  private void persist() {
    Document document = XMLUtils.createDocument();
    Element rootElement = document.createElement(LAST_BUILD_ELEMENT);
    document.appendChild(rootElement);

    Element mainClassElement = document.createElement(MAIN_CLASS_ELEMENT);
    mainClassElement.setAttribute(CompilerSettings.MAIN_CLASS_NODE_ID, mainClassNodeId);
    mainClassElement.setAttribute(CompilerSettings.MAIN_CLASS_MODEL_UID, mainClassModelUID);
    rootElement.appendChild(mainClassElement);

    File cachesDir = new File(FileGenerationUtil.getCachesDir(FileSystem.getInstance().getFileByPath(module.getGeneratorOutputPath())).getPath());
    if (!cachesDir.exists()) {
      cachesDir.mkdir();
    }

    File fileToSave = new File(cachesDir.getPath(), LAST_BUILD_XML);
    try {
      XMLUtils.saveToFile(fileToSave.getPath(), document);
    } catch (TransformerException e) {
      throw new RuntimeException("Can't write the last build report file", e);
    }
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    BuildReport lastBuild = (BuildReport) o;

    if (mainClassModelUID != null ? !mainClassModelUID.equals(lastBuild.mainClassModelUID) : lastBuild.mainClassModelUID != null)
      return false;
    if (mainClassNodeId != null ? !mainClassNodeId.equals(lastBuild.mainClassNodeId) : lastBuild.mainClassNodeId != null)
      return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result = mainClassNodeId != null ? mainClassNodeId.hashCode() : 0;
    result = 31 * result + (mainClassModelUID != null ? mainClassModelUID.hashCode() : 0);
    return result;
  }

  private static BuildReport fromContext(CodeOrchestraGenerationContext generationContext) {
    Solution solution = MPSModuleRepository.getInstance().getSolution(generationContext.getRootModule());
    CompilerSettings compilerSettings = solution.getModuleDescriptor().getCompilerSettings();

    BuildReport buildReport = new BuildReport(solution);

    buildReport.mainClassNodeId = compilerSettings.mainClassNodeId;
    buildReport.mainClassModelUID = compilerSettings.mainClassModelUID;
    return buildReport;
  }

  private static BuildReport load(Solution solution) {
    BuildReport lastBuild = new BuildReport(solution);

    IFile cachesDir = FileGenerationUtil.getCachesDir(FileSystem.getInstance().getFileByPath(solution.getGeneratorOutputPath()));
    File reportFile = new File(cachesDir.getPath(), LAST_BUILD_XML);

    if (!reportFile.exists()) {
      return lastBuild;
    }

    Document document = XMLUtils.fileToDOM(reportFile);

    NodeList mainClassElements = document.getDocumentElement().getElementsByTagName(MAIN_CLASS_ELEMENT);
    if (mainClassElements != null && mainClassElements.getLength() == 1) {
      Element mainClassElement = (Element) mainClassElements.item(0);

      lastBuild.mainClassModelUID = mainClassElement.getAttribute(CompilerSettings.MAIN_CLASS_MODEL_UID);
      lastBuild.mainClassNodeId = mainClassElement.getAttribute(CompilerSettings.MAIN_CLASS_NODE_ID);
    }

    return lastBuild;
  }

}
