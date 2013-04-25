package codeOrchestra.actionscript.util.ArchivingUtility;

import com.intellij.openapi.util.Pair;
import jetbrains.mps.ide.properties.SolutionProperties;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.smodel.Language;
import org.apache.commons.io.FilenameUtils;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Target;
import org.apache.tools.ant.taskdefs.Zip;
import org.apache.tools.ant.types.ZipFileSet;

import java.io.*;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * author: Daniil
 */
public class ZipUtilForModule {

  public static final String ASSETS_DIR_NAME = "assets";
  public static final String MODULES_DIR_NAME = "modules";
  public static final String LANGS_DIR_NAME = "languages";
  public static final String ZIP_TARGET_NAME = "ziptarget";

  public static boolean isValidName(String name) {
    if (name.equals(".svn") || name.equals(".git") || name.equals("source_gen") || name.equals("compile_errors.log")
      || name.equals("source_gen.caches") || name.equals("classes_gen") || name.equals(".gitignore") || name.contains(".zip") || name.equals("output_swf")) {
      return false;
    } else {
      return true;
    }
  }

  //http://ant.apache.org/manual/dirtasks.html
  public static String[] getAntExcludes() {
    return new String[]{
      "**/source_gen",
      "**/source_gen/**",
      "**/source_gen.caches",
      "**/source_gen.caches/**",
      "**/classes_gen",
      "**/classes_gen/**",
      "**/output_swf",
      "**/output_swf/**",

      "**/compile_errors.log",
      "compile_errors.log",
      "**/.zip",
      ".zip",

      "**/*~",
      "**/#*#",
      "**/.#*",
      "**/%*%",
      "**/._*",
      "**/CVS",
      "**/CVS/**",
      "**/.cvsignore",
      "**/SCCS",
      "**/SCCS/**",
      "**/vssver.scc",
      "**/.svn",
      "**/.svn/**",
      "**/.DS_Store",
      "**/.git",
      "**/.git/**",
      "**/.gitattributes",
      "**/.gitignore",
      "**/.gitmodules",
      "**/.hg",
      "**/.hg/**",
      "**/.hgignore",
      "**/.hgsub",
      "**/.hgsubstate",
      "**/.hgtags",
      "**/.bzr",
      "**/.bzr/**",
      "**/.bzrignore"
    };
  }


  public static Pair<String, String> makeSplittedRealPath(ZipEntry zippedElement, String moduleDestDir, String langsDestDir, String assetsDestDir) {
    String basePath = null;
    String relativePath = null;
    String elementName = zippedElement.getName();
    if (elementName.startsWith("assets/")) {
      basePath = assetsDestDir;
      relativePath = elementName.substring(7);
    } else if (elementName.startsWith("modules/")) {
      basePath = moduleDestDir;
      relativePath = elementName.substring(8);
    } else if (elementName.startsWith("languages/")) {
      basePath = langsDestDir;
      relativePath = elementName.substring(10);
    }
    basePath = basePath.replace("/", File.separator);
    return new Pair<String, String>(basePath, relativePath);
  }

  public static void importModule(String sourceZIPPath, String moduleDestDir, String langsDestDir, String assetsDestDir, List<String> blacklistedAssetsNames) throws IOException {
    ZipFile zip = new ZipFile(sourceZIPPath);
    new File(moduleDestDir).mkdir();

    Enumeration zippedElements = zip.entries();
    LinkedList<ZipEntry> zippedFiles = new LinkedList<ZipEntry>();
    while (zippedElements.hasMoreElements()) {
      ZipEntry currZippedElement = (ZipEntry) zippedElements.nextElement();

      Pair<String, String> realPath = makeSplittedRealPath(currZippedElement, moduleDestDir, langsDestDir, assetsDestDir);
      if (currZippedElement.isDirectory()) {
        String newDirectoryPath = realPath.getFirst() + File.separator + realPath.getSecond();
        File newDirectory = new File(newDirectoryPath);
        if (!newDirectory.exists()) {
          newDirectory.mkdir();
        }
      } else {
        zippedFiles.add(currZippedElement);
      }
    }

    for (ZipEntry currZippedElement : zippedFiles) {
      Pair<String, String> realPath = makeSplittedRealPath(currZippedElement, moduleDestDir, langsDestDir, assetsDestDir);

      InputStream in = zip.getInputStream(currZippedElement);
      String newFilePath = realPath.getFirst() + File.separator + realPath.getSecond();
      File newFile = new File(newFilePath);
      if (newFile.exists()) {
        newFile.delete();
      }
      OutputStream out = new FileOutputStream(newFilePath);

      byte[] buffer = new byte[1024];
      int len;
      while ((len = in.read(buffer)) >= 0) {
        out.write(buffer, 0, len);
      }

      in.close();
      out.close();
    }
    zip.close();
  }

  public static ArrayList<String> extractFileNamesFromZIP(String sourcePath) {
    ArrayList<String> result = new ArrayList<String>();
    try {
      ZipFile zip = new ZipFile(sourcePath);
      Enumeration entries = zip.entries();
      while (entries.hasMoreElements()) {
        ZipEntry entry = (ZipEntry) entries.nextElement();
        result.add(entry.getName());
      }
      zip.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
    return result;
  }

  public static void exportModule(ArchivingUtilityExportContext auContext) throws IOException {
    //http://stackoverflow.com/questions/1399126/java-util-zip-recreating-directory-structure
    Project project = new Project();
    project.init();

    Zip zip = new Zip();
    zip.setDestFile(auContext.getDestinationFile());
    zip.setProject(project);

    List<IModule> modulesToExport = auContext.getModulesToExport();
    for (IModule currModule : modulesToExport) {
      String normalizedPath = FilenameUtils.normalize(currModule.getBundleHome().getPath());
      File fileToZip = new File(normalizedPath);
      ZipFileSet fileSet = new ZipFileSet();

      String modulePrefix = MODULES_DIR_NAME;
      if (currModule instanceof Solution) {
        modulePrefix = MODULES_DIR_NAME;
      } else
      if (currModule instanceof Language) {
        modulePrefix = LANGS_DIR_NAME;
      }

      fileSet.setPrefix(modulePrefix + "/" + currModule.getModuleFqName());
      fileSet.appendExcludes(getAntExcludes());
      zip.addFileset(fileSet);

      if (fileToZip.isDirectory()) {
        fileSet.setDir(fileToZip);
      }
    }

    if (auContext.getAssetsToExport().size() > 0) {
      String baseAssetsModulePath = ArchivingUtility.assetsModuleToPath(auContext.getAssetsModule());
      if (null != baseAssetsModulePath) {
        String normalizedPath = FilenameUtils.normalize(baseAssetsModulePath);
        File fileToZip = new File(normalizedPath);
        List<String> assetsToExport = auContext.getAssetsToExport();
        ZipFileSet fileSet = new ZipFileSet();
        fileSet.setPrefix(ASSETS_DIR_NAME);
        fileSet.appendExcludes(getAntExcludes());
        if (fileToZip.isDirectory()) {
          fileSet.setDir(fileToZip);
        }

        ArrayList<String> assetsToExportFiltered = new ArrayList<String>();
        for (String currAsset : assetsToExport) {
          if (currAsset.startsWith("/") || currAsset.startsWith("\\")) {
            String newAsset = currAsset.substring(1);
            assetsToExportFiltered.add(newAsset);
          }
        }

        String[] includes = assetsToExportFiltered.toArray(new String[assetsToExportFiltered.size()]);
        fileSet.appendIncludes(includes);
        zip.addFileset(fileSet);
      }
    }

    Target target = new Target();
    target.setName(ZIP_TARGET_NAME);
    target.addTask(zip);
    project.addTarget(target);
    project.executeTarget(ZIP_TARGET_NAME);
  }
}
