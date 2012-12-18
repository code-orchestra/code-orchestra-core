package codeOrchestra.actionScript.update;

import jetbrains.mps.util.JDOMUtil;
import org.apache.tools.ant.util.FileUtils;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public class ApplicationSnapshot {

  private static Set<String> updatableDirs = new HashSet<String>();
  static {
    updatableDirs.add("bin");
    updatableDirs.add("languages");
    updatableDirs.add("lib");
    updatableDirs.add("plugin");
    updatableDirs.add("plugins");
  }

  private static final FileFilter JAR_FILTER = new FileFilter() {
    public boolean accept(File file) {
      return file.getName().toLowerCase().endsWith(".jar");
    }
  };

  // -- XML elements/attributes names
  public static final String APPLICATION_SNAPSHOT_ELEMENT = "applicationSnapshot";
  public static final String FILE_ELEMENT = "file";
  public static final String RELATIVE_PATH_ATTRIBUTE = "relativePath";
  public static final String CHECKSUM_ATTRIBUTE = "checkSum";

  // -- Factory
  
  public static ApplicationSnapshot fromDocument(Document document) throws ApplicationSnapshotParseException {
    Element applicationSnapshot = document.getRootElement();

    if (applicationSnapshot == null || !APPLICATION_SNAPSHOT_ELEMENT.equals(applicationSnapshot.getName())) {
      throw new ApplicationSnapshotParseException("Wrong root element");
    }

    LinkedHashMap<String, Long> relativePathToChecksum = new LinkedHashMap<String, Long>();
    List<Element> children = applicationSnapshot.getChildren(FILE_ELEMENT);    
    if (children != null) {
      for (Element fileElement : children) {
        String relativePath = fileElement.getAttributeValue(RELATIVE_PATH_ATTRIBUTE);
        Long checkSum = Long.decode(fileElement.getAttributeValue(CHECKSUM_ATTRIBUTE));
        relativePathToChecksum.put(relativePath, checkSum);
      }
    }
    
    return new ApplicationSnapshot(relativePathToChecksum);
  }

  public static ApplicationSnapshot fromApplicationPath(String applicationPath) {
    File applicationDir = new File(applicationPath);
    assert applicationDir.exists();
    assert applicationDir.isDirectory();

    Map<String, Long> relativePathToChecksum = new LinkedHashMap<String, Long>();

    for (File applicationFile : listFileRecursively(applicationDir, JAR_FILTER, 0)) {
      try {
        String relativePath = FileUtils.getRelativePath(applicationDir, applicationFile);
        long checksum = Checksum.getChecksum(applicationFile);

        if (checksum != Checksum.INVALID_CHECKSUM) {
          relativePathToChecksum.put(relativePath, checksum);
        }
      } catch (Throwable e) {
        continue; // ignore
      }
    }

    return new ApplicationSnapshot(relativePathToChecksum);
  }
  
  // -- Instance
  
  private Map<String, Long> relativePathToChecksum = new LinkedHashMap<String, Long>();
  
  private ApplicationSnapshot(Map<String, Long> relativePathToChecksum) {
    this.relativePathToChecksum = relativePathToChecksum;
  }

  public Document toXML() {
    Element applicationSnapshotElement = new Element(APPLICATION_SNAPSHOT_ELEMENT);

    for (String relativePath : relativePathToChecksum.keySet()) {
      Long checkSum = relativePathToChecksum.get(relativePath);

      Element fileElement = new Element(FILE_ELEMENT);
      fileElement.setAttribute(RELATIVE_PATH_ATTRIBUTE, relativePath);
      fileElement.setAttribute(CHECKSUM_ATTRIBUTE, checkSum.toString());

      applicationSnapshotElement.addContent(fileElement);
    }

    return new Document(applicationSnapshotElement);
  }

  public List<String> filesToSend(ApplicationSnapshot clientSnapshot) {
    List<String> filesRelativePaths = new ArrayList<String>();
    
    for (String relativePath : relativePathToChecksum.keySet()) {
      Long checkSum = relativePathToChecksum.get(relativePath);
      Long clientCheckSum = clientSnapshot.getChecksum(relativePath);

      if (!clientCheckSum.equals(checkSum)) {
        System.out.println(relativePath + ": " + checkSum + " != " + clientCheckSum);

        filesRelativePaths.add(relativePath);
      }
    }

    return filesRelativePaths;
  }
  
  public Long getChecksum(String relativePath) {
    Long checkSum = relativePathToChecksum.get(relativePath);
    if (checkSum != null) {
      return checkSum;
    }
    return Checksum.INVALID_CHECKSUM;
  }
  
  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    ApplicationSnapshot snapshot = (ApplicationSnapshot) o;

    if (relativePathToChecksum != null ? !relativePathToChecksum.equals(snapshot.relativePathToChecksum) : snapshot.relativePathToChecksum != null)
      return false;

    return true;
  }

  @Override
  public int hashCode() {
    return relativePathToChecksum != null ? relativePathToChecksum.hashCode() : 0;
  }

  // --- Static stuff
  
  private static List<File> listFileRecursively(File dir, FileFilter fileFilter, final int recursionLevel) {
    assert dir.isDirectory();
    List<File> files = new ArrayList<File>();

    File[] subdirs = dir.listFiles(new FileFilter() {
      public boolean accept(File f) {
        if (!f.isDirectory()) {
          return false;
        }
        if (".svn".equals(f.getName())) {
          return false;
        }
        if (recursionLevel == 0 && !updatableDirs.contains(f.getName())) {
          return false;
        }

        return true;
      }
    });

    if (subdirs != null) {
      for (File subdir : subdirs) {
        files.addAll(listFileRecursively(subdir, fileFilter, recursionLevel + 1));
      }
      addArrayToList(files, dir.listFiles(fileFilter));
    }

    return files;
  }

  private static void addArrayToList(List<File> filesList, File[] filesArray) {
    for (File file : filesArray) {
      filesList.add(file);
    }
  }

  public static void main(String[] args) throws IOException, JDOMException, ApplicationSnapshotParseException {
    String xmlPath = "/Users/eliseev/TMP/applicationSnapshot.xml";
    String applicationPath1 = "/Users/eliseev/TMP/Release/CodeOrchestra.app";
    String applicationPath2 = "/Users/eliseev/TMP/Release-9090/CodeOrchestra.app";

    ApplicationSnapshot snapshot1 = ApplicationSnapshot.fromApplicationPath(applicationPath1);
    ApplicationSnapshot snapshot2 = ApplicationSnapshot.fromApplicationPath(applicationPath2);
    //ApplicationSnapshot snapshot2 = ApplicationSnapshot.fromDocument(JDOMUtil.loadDocument(new File(xmlPath)));

    for (String relativePathToSend : snapshot1.filesToSend(snapshot2)) {
      //System.out.println(relativePathToSend);
    }

  }

}
