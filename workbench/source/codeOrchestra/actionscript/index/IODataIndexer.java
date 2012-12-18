package codeOrchestra.actionscript.index;

import com.intellij.openapi.diagnostic.Logger;
import com.intellij.util.SystemProperties;
import com.intellij.util.indexing.DataIndexer;
import com.intellij.util.indexing.FileContent;
import jetbrains.mps.util.PathManager;
import org.apache.commons.codec.digest.DigestUtils;
import org.jetbrains.annotations.NotNull;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

/**
 * RE-3949
 * @author Anton.I.Neverov
 */
public abstract class IODataIndexer<Key, Value> implements DataIndexer<Key, Value, FileContent> {
  private static final Logger LOG = Logger.getInstance("#codeOrchestra.actionscript.index.IODataIndexer");

  private static Mode myMode = Mode.NORMAL;

  // Save
  private static Map<Class, FileWriter> myWriters = new HashMap<Class, FileWriter>();
  private static Map<Class, File> myFiles = new HashMap<Class, File>();
  private static Map<Class, Map<String, String>> myIndexedFileIDs = new HashMap<Class, Map<String, String>>();
  private static int saveSessionsCounter = 0;
  private static final String INDEX_SAVE_PATH = SystemProperties.getUserHome() + File.separator + "MPSIndex";

  // Load
  private static Map<String, Map<String, List<Element>>> xmlElementsMap = new HashMap<String, Map<String, List<Element>>>();

  protected abstract Map<Key,Value> mapInternal(FileContent inputData);
  protected abstract IndexIOProcessor<Key, Value> getIndexIOProcessor();
  protected abstract String getIndexName();

  @NotNull
  @Override
  public Map<Key,Value> map(FileContent inputData) {
    switch (myMode) {
      case NORMAL:
        return mapInternal(inputData);
      case SAVE_INDEX:
        Map<Key,Value> result = mapInternal(inputData);
        if (isApplicable(inputData)) {
          saveIndexData(inputData, result);
        }
        return result;
      case LOAD_INDEX:
        if (isApplicable(inputData)) {
          return loadIndexData(inputData);
        }
        LOG.warn("Index data for file " + inputData.getFile().getPath() + " is not available. Performing normal indexing.");
        return mapInternal(inputData);
    }
    return null;
  }

  public static void enterSaveMode() {
    if (myMode != Mode.NORMAL) {
      throw new RuntimeException("IODataIndexer must be in normal mode in order to enter save mode");
    }

    saveSessionsCounter++;
    if (saveSessionsCounter != 1) {
      LOG.warn("Starting index save session number " + saveSessionsCounter + ". Previous results might be erased.");
    }

    File myDir = new File(INDEX_SAVE_PATH);
    if (!(myDir.exists() && myDir.isDirectory())) {
      if (!myDir.mkdirs()) {
        throw new RuntimeException("Cannot create directory " + INDEX_SAVE_PATH);
      }
    }

    myMode = Mode.SAVE_INDEX;
    LOG.info("Entered save mode");
  }

  public static void exitSaveMode() {
    if (myMode != Mode.SAVE_INDEX) {
      throw new RuntimeException("IODataIndexer must be in save mode in order to exit it");
    }

    // flush and close files
    for (FileWriter fileWriter : myWriters.values()) {
      try {
        fileWriter.append("</root>");
        fileWriter.flush();
        fileWriter.close();
      } catch (IOException e) {
        throw new RuntimeException("IOException has occured during saving", e);
      }
    }
    myWriters.clear();

    // check that all indices were saved
    for (String name : IndexIOUtil.INDICES) {
      boolean exists = false;
      for (File file : myFiles.values()) {
        if (name.equals(file.getName()) && file.exists()) {
          exists = true;
          break;
        }
      }
      if (!exists) {
        throw new RuntimeException("Index " + name + " was not saved");
      }
    }

    // zip files
    zipFiles();

    // delete files
    for (File file : myFiles.values()) {
      if (!file.delete()) {
        throw new RuntimeException("Cannot delete index file " + file.getName());
      }
    }
    myFiles.clear();

    myIndexedFileIDs.clear();

    myMode = Mode.NORMAL;
    LOG.info("Exited save mode");
  }

  public static void enterLoadMode() throws IODataIndexerException {
    if (myMode != Mode.NORMAL) {
      throw new IODataIndexerException();
    }

    ZipFile zipFile;
    try {
      zipFile = new ZipFile(PathManager.getHomePath() + File.separator + "MPS.index");
      for (String name : IndexIOUtil.INDICES) {
        ZipEntry entry = zipFile.getEntry(name);
        if (entry == null) {
          throw new RuntimeException("Cannot get " + name + " from MPS.index");
        }
        InputStream inputStream = zipFile.getInputStream(entry);
        parseXML(new InputStreamReader(inputStream), name);
      }
    } catch (IOException ioe) {
      LOG.warn("Failed to enter load mode");
      throw new IODataIndexerException();
    }

    try {
      zipFile.close();
    } catch (IOException e) {
      LOG.warn("Cannot close zip");
    }

    myMode = Mode.LOAD_INDEX;
    LOG.info("Entered load mode");
  }

  public static void exitLoadMode() {
    if (myMode != Mode.LOAD_INDEX) {
      throw new RuntimeException("IODataIndexer must be in load mode in order to exit it");
    }

    xmlElementsMap.clear();

    myMode = Mode.NORMAL;
    LOG.info("Exited load mode");
  }

  private boolean isApplicable(FileContent inputData) {
    String name = inputData.getFile().getName();
    return name.endsWith(".mps") || name.endsWith(".msd");
  }

  private String calculateFileID(FileContent inputData) {
    String path = inputData.getFile().getPath().replaceAll("[./\\\\: ]", "");
    String homePath = PathManager.getHomePath().replaceAll("[./\\\\: ]", "");

    if (path.startsWith(homePath)) {
      return path.substring(homePath.length());
    }

    LOG.warn("File id was not calculated properly for file " + inputData.getFile().getPath());
    return inputData.getFile().getName();
  }

  private void saveIndexData(FileContent inputData, Map<Key, Value> result) {
    String serializedData = getIndexIOProcessor().serialize(result);
    synchronized (getClass()) {
      try {
        FileWriter writer = getWriter();
        String fileID = calculateFileID(inputData);
        if (myIndexedFileIDs.get(getClass()).keySet().contains(fileID)) {
          LOG.warn("\nAdding record with existing file id\n\tExisting: "
            + fileID + " (" + myIndexedFileIDs.get(getClass()).get(fileID) + ")\n\tNew:      "
            + fileID + " (" + inputData.getFile().getPath() + "\nMaybe we need new algorithm?");
        }
        myIndexedFileIDs.get(getClass()).put(fileID, inputData.getFile().getPath());
        writer
          .append("<file id=\"")
          .append(fileID)
          .append("\">\n");
        writer.append(serializedData);
        writer.append("</file>\n");
        writer.flush();
      } catch (IOException e) {
        throw new RuntimeException("IOException has occured during writing index by indexer " + getClass().getName());
      }
    }
  }

  private Map<Key, Value> loadIndexData(FileContent inputData) {
    Map<String, List<Element>> indexMap = xmlElementsMap.get(getIndexName());
    if (indexMap != null) {
      List<Element> elementList = indexMap.get(calculateFileID(inputData));
      if (elementList != null) {
        try {
          synchronized (getClass()) {
            // Each indexer uses only its own document
            return getIndexIOProcessor().load(elementList, inputData);
          }
        } catch (IndexIOProcessorException e) {
          LOG.warn("Index data for " + getIndexName() + " and file " + inputData.getFile().getPath() + " is corrupted. Performing normal indexing.");
          return mapInternal(inputData);
        }
      }
      LOG.warn("Index data for " + getIndexName() + " and file " + inputData.getFile().getPath() + " was not loaded. Performing normal indexing.");
      return mapInternal(inputData);
    }
    LOG.warn("Index data for " + getIndexName() + " was not loaded. Performing normal indexing.");
    return mapInternal(inputData);
  }

  private static void zipFiles() {
    byte[] buffer = new byte[1024 * 256];

    try {
      ZipOutputStream out = new ZipOutputStream(new FileOutputStream(INDEX_SAVE_PATH + File.separator + "MPS.index"));
      out.setMethod(ZipOutputStream.DEFLATED);

      for (File file : myFiles.values()) {
        ZipEntry entry = new ZipEntry(file.getName());
        out.putNextEntry(entry);
        FileInputStream fis = new FileInputStream(file);

        int length;
        while((length = fis.read(buffer)) > 0)
        {
          out.write(buffer, 0, length);
        }

        fis.close();
        out.closeEntry();
      }

      out.close();
    } catch (IOException e) {
      throw new RuntimeException("IOException has occured during zipping");
    }
  }

  private static void parseXML(Reader reader, String indexName) {
    DocumentBuilderFactory fact = DocumentBuilderFactory.newInstance();
    Document doc;
    try {
      DocumentBuilder db;
      db = fact.newDocumentBuilder();
      doc = db.parse(new InputSource(reader));
    } catch (Exception e) {
      throw new RuntimeException("Cannot parse xml for index " + indexName);
    }

    Element rootElement = doc.getDocumentElement();
    if (rootElement == null) {
      throw new RuntimeException("Cannot parse xml for index " + indexName);
    }

    HashMap<String, List<Element>> indexMap = new HashMap<String, List<Element>>();
    xmlElementsMap.put(indexName, indexMap);

    // Fill xmlElementsMap with index data
    for (int i = 0; i < rootElement.getChildNodes().getLength(); i++) {
      Node fileItem = rootElement.getChildNodes().item(i);
      if (fileItem instanceof Element && "file".equals(((Element) fileItem).getTagName())) {
        String fileID = ((Element) fileItem).getAttribute("id");

        ArrayList<Element> itemList = new ArrayList<Element>();
        indexMap.put(fileID, itemList);

        for (int j = 0; j < fileItem.getChildNodes().getLength(); j++) {
          Node item = fileItem.getChildNodes().item(j);
          if (item instanceof Element) {
            itemList.add((Element) item);
          }
        }
      }
    }
  }

  private FileWriter getWriter() {
    synchronized (getClass()) {
      if (myWriters.get(getClass()) == null) {
        try {
          File file = new File(INDEX_SAVE_PATH + File.separator + getIndexName());
          if (file.exists()) {
            if (!file.delete()) {
              throw new RuntimeException("Cannot delete existing index file " + file.getName());
            }
          }
          if (!file.createNewFile()) {
            throw new RuntimeException("Cannot create index file " + file.getName());
          }
          myFiles.put(getClass(), file);
          FileWriter writer = new FileWriter(file);
          myWriters.put(getClass(), writer);
          myIndexedFileIDs.put(getClass(), new HashMap<String, String>());
          writer.append("<root>\n");
          writer.flush();
          return writer;
        } catch (IOException e) {
          throw new RuntimeException("IOException has occured during file creation by indexer " + getClass().getName());
        }
      }
      return myWriters.get(getClass());
    }
  }

  private enum Mode {
    SAVE_INDEX,
    LOAD_INDEX,
    NORMAL
  }
}
