package codeOrchestra.actionscript.wonderfl;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.util.SystemProperties;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class WonderflSourcesProvider {

  private static final String userNamesFile = WonderflSourcesProvider.class.getResource("wonderflusers.txt").getFile();
  private static final int userNamesCount = 6000;

  private final static String API_KEY = "bf9ca599fe7a8f9e0425d11e12082ddc59c0dbf8";
  private final static int BUFFER_SIZE = 4096;
  private final static String LOCAL_CACHE_DIRECTORY = SystemProperties.getUserHome() + File.separator + "WonderflSourcesCache";

  private static WonderflSourcesProvider INSTANCE = new WonderflSourcesProvider();

  public static final String AS_EXT = ".as";
  public static final String MXML_EXT = ".mxml";

  private List<String> cachedSources = new ArrayList<String>();
  private List<String> userNames = new ArrayList<String>(userNamesCount);

  private WonderflSourcesProvider() {
    File file = new File(LOCAL_CACHE_DIRECTORY);

    if (!(file.exists())) {
      file.mkdir();
    } else {
      assert file.isDirectory();
    }

    findCachedSources();
    readUserNames();
  }

  public static WonderflSourcesProvider getInstance() {
    return INSTANCE;
  }

  public void updateSources() {
    for (String s : userNames) {
      addSources(s);
    }
  }

  public void updateSources(ProgressIndicator pi) {
    int userCount = userNames.size();
    int i = 1;
    pi.setIndeterminate(true);
    for (String s : userNames) {
      pi.setText("Updating sources for user " + s + "(" + (i++) + "/" + userCount + ")");
      addSources(s);
    }
  }

  public String getSourcesDirectory() {
    return LOCAL_CACHE_DIRECTORY;
  }

  public List<String> getASSources() {
    ArrayList<String> result = new ArrayList<String>();
    for (String s : cachedSources) {
      if (s.endsWith(AS_EXT)) {
        result.add(s);
      }
    }
    return result;
  }

  public List<String> getMXMLSources() {
    ArrayList<String> result = new ArrayList<String>();
    for (String s : cachedSources) {
      if (s.endsWith(MXML_EXT)) {
        result.add(s);
      }
    }
    return result;
  }

  private void readUserNames() {
    try {
      BufferedReader reader = new BufferedReader(new FileReader(userNamesFile));
      String s;
      while ((s = reader.readLine()) != null) {
        userNames.add(s);
      }
      reader.close();
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void findCachedSources() {
    File dir = new File(LOCAL_CACHE_DIRECTORY);
    String[] filenames = dir.list(new FilenameFilter() {
      @Override
      public boolean accept(File dir, String name) {
        return name.endsWith(AS_EXT) || name.endsWith(MXML_EXT);
      }
    });
    cachedSources.addAll(Arrays.asList(filenames));
  }

  private void addSources(String userName) {
    String data;
    try {
      data = getData("http://api.wonderfl.net/user/" + userName + "/codes?api_key=" + API_KEY);
    } catch (IOException e) {
      println("Fetch error for user " + userName);
      return;
    }

    List<String> listOfCodeIDs;
    try {
      listOfCodeIDs = parseCodes(data);
    } catch (ParseException e) {
      println("Parse error for user " + userName);
      return;
    }

    for (String codeId : listOfCodeIDs) {

      String filename = userName + "_" + codeId;
      if (cachedSources.contains(filename + AS_EXT) || cachedSources.contains(filename + MXML_EXT)) {
        continue;
      }

      String codeInJSON;
      try {
        codeInJSON = getData("http://api.wonderfl.net/code/" + codeId + "?api_key=" + API_KEY);
      } catch (IOException e) {
        println("Fetch error for code " + codeId);
        continue;
      }

      String parsedCode;
      try {
        parsedCode = parseCodeInJSON(codeInJSON);
      } catch (ParseException e) {
        println("Parse error for code " + codeId);
        continue;
      }

      String ext = AS_EXT;
      if (parsedCode.startsWith("<?xml")) {
        ext = MXML_EXT;
      }

      File file = new File(LOCAL_CACHE_DIRECTORY, filename + ext);

      try {
        FileWriter writer = new FileWriter(file);
        writer.write(parsedCode);
        writer.close();
      } catch (IOException e) {
        println("Save error for code " + codeId);
        continue;
      }

      cachedSources.add(filename + ext);
    }
  }

  /**
   * Parse response on GET /user/<username>/codes
   *
   * @param data response
   * @return list of code IDs
   * @throws ParseException
   */
  private List<String> parseCodes(String data) throws ParseException {
    JSONParser jsonParser = new JSONParser();

    Object result = jsonParser.parse(data);

    if (!(result instanceof JSONObject)) {
      throw new ParseException(-1);
    }
    Object codes = ((JSONObject) result).get("codes");

    if (!(codes instanceof JSONArray)) {
      throw new ParseException(-1);
    }

    List<String> list = new ArrayList<String>();

    for (Object o : ((JSONArray) codes)) {
      Object compile_ok = ((JSONObject) o).get("compile_ok");
      if ("1".equals(compile_ok)) {
        Object id = ((JSONObject) o).get("id");
        list.add((String) id);
      }
    }

    return list;
  }

  /**
   * Parse response on GET /code/<codeid>
   *
   * @param data response
   * @return as3 code
   * @throws ParseException
   */
  private String parseCodeInJSON(String data) throws ParseException {
    JSONParser jsonParser = new JSONParser();

    Object result = jsonParser.parse(data);
    if (!(result instanceof JSONObject)) {
      throw new ParseException(-1);
    }
    Object code = ((JSONObject) result).get("code");

    if (!(code instanceof JSONObject)) {
      throw new ParseException(-1);
    }
    Object as3 = ((JSONObject) code).get("as3");

    if (!(as3 instanceof String)) {
      throw new ParseException(-1);
    }

    return (String) as3;
  }

  private String getData(String request) throws IOException {
    URL url = new URL(request);
    HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();

    InputStream is = urlConn.getInputStream();

    byte[] buffer = new byte[BUFFER_SIZE];

    int read;

    String result = "";

    while ((read = is.read(buffer, 0, BUFFER_SIZE)) != -1) {
      result += new String(buffer, 0, read);
    }

    return result;
  }

  private void println(String s) {
    System.out.println(s);
  }
}
