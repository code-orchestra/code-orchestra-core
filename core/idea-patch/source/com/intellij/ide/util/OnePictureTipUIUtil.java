package com.intellij.ide.util;

import com.intellij.util.ResourceUtil;

import javax.swing.JEditorPane;
import javax.swing.text.Document;
import javax.swing.text.html.HTMLDocument;
import java.io.IOException;
import java.io.StringReader;
import java.net.URL;

/**
 * @author Alexander Eliseyev
 */
public class OnePictureTipUIUtil {

  private static final String TIP_PLACEHOLDER_HTML = "tip-placeholder.html";

  public static void openTipInBrowser(String tipPath, JEditorPane browser) {
    try {
      if (tipPath == null) return;
      URL pictureURL = ResourceUtil.getResource(TipUIUtil.class, "/tips/", tipPath);
      if (pictureURL == null) {
        throw new IOException("Can't locate a picture: " + tipPath);
      }

      URL placeholderURL = ResourceUtil.getResource(TipUIUtil.class, "/tips/", TIP_PLACEHOLDER_HTML);
      if (placeholderURL == null) {
        throw new IOException("Can't locate a placeholder HTML: " + TIP_PLACEHOLDER_HTML);
      }

      browser.read(new StringReader("<html><body><center><img src=\"" + tipPath + "\"/></center></body></html>"), null);

      final Document document = browser.getDocument();
      if (document instanceof HTMLDocument) {
        ((HTMLDocument) document).setBase(placeholderURL);
      }
    } catch (IOException e) {
      try {
        browser.read(new StringReader(e.getMessage()), null);
      } catch (IOException e1) {
        // ignore;
      }
    }
  }

}
