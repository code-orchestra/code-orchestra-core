package codeOrchestra.test;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public class WonderflUserFetcher {

  public static final String USERNAME_START_TOKEN = "\"http://wonderfl.net/user/";
  public static final String USERNAME_END_TOKEN = "/codes\"";

  public static void main(String[] args) {
    Set<String> userNames = new HashSet<String>();

    int i = 1;
    while (true) {
      try {
        fetchUserNames(userNames, i++);
      } catch (NoMoreUsersException e) {
        return;
      }
    }
  }

  private static String extractUserName(String line) {
    return line.substring(line.indexOf(USERNAME_START_TOKEN) + USERNAME_START_TOKEN.length(), line.indexOf(USERNAME_END_TOKEN));
  }

  private static class NoMoreUsersException extends Exception {

  }

  private static void fetchUserNames(Set<String> userNames, int page) throws NoMoreUsersException {
    try {
      Thread.sleep(1000);
    } catch (InterruptedException e) {
      // ignore
    }

    URL url;
    InputStream is = null;
    DataInputStream dis;
    String line;

    boolean fetchedNone = true;

    try {
      url = new URL("http://wonderfl.net/users?page="+page+"&days=all");
      is = url.openStream();  // throws an IOException
      dis = new DataInputStream(new BufferedInputStream(is));

      while ((line = dis.readLine()) != null) {
        if (line.contains(USERNAME_START_TOKEN) && line.contains(USERNAME_END_TOKEN)) {

          String userName = extractUserName(line);
          if (!userNames.contains(userName)) {
            userNames.add(userName);
            System.out.println(userName);

            fetchedNone = false;
          }
        }
      }
    } catch (MalformedURLException mue) {
      mue.printStackTrace();
    } catch (IOException ioe) {
      ioe.printStackTrace();
    } finally {
      try {
        is.close();
      } catch (IOException ioe) {
        // nothing to see here
      }
    }

    if (fetchedNone) {
      throw new NoMoreUsersException();
    }
  }

}
