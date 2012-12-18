package codeOrchestra.actionScript.debugger.fdbex;

import flash.tools.debugger.SourceFile;
import flex.tools.debugger.cli.FileInfoCache;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.NotNull;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class FileInfoCacheEx extends FileInfoCache {

  @Deprecated
  public SourceFile getSourceFileByPath(@NotNull String path) {
    File fileToFind = new File(path);
    
    for (SourceFile sourceFile : getFileList()) {
      File file = new File(sourceFile.getFullPath());
      if (file.equals(fileToFind)) {
        return sourceFile;
      }
    }

    return null;
  }

  public SourceFile getSourceFileByFQName(@NotNull String fqName) {
    for (SourceFile sourceFile : getFileList()) {
      if (fqName.equals(getFQName(sourceFile))) {
        return sourceFile;
      }
    }

    return null;
  }
  
  public static String getFQName(SourceFile sourceFile) {
    String fileName = sourceFile.getName();
    if (fileName.toLowerCase().endsWith(".as")) {
      fileName = fileName.substring(0, fileName.length() - 3);
    }    
    
    String namespace = NameUtil.namespaceFromPath(sourceFile.getPackageName());    
    
    return NameUtil.longNameFromNamespaceAndShortName(namespace, fileName);
  }
  
}
