package codeOrchestra.utils.macro;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.SystemInfo;
import codeOrchestra.actionscript.util.XMLUtils;
import jetbrains.mps.logging.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.xml.transform.TransformerException;
import java.awt.Point;
import java.io.File;
import java.util.Collections;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class KeyLoggerReport {

  private static final Logger LOG = Logger.getLogger(KeyLoggerReport.class);

  private long startTimeStamp;
  private List<KeyStroke> keyStrokes;
  private Point myInitialCaretPosition;

  public KeyLoggerReport(long startTimeStamp, List<KeyStroke> keyStrokes, Point initialCaretPosition) {
    this.startTimeStamp = startTimeStamp;
    this.keyStrokes = keyStrokes;
    this.myInitialCaretPosition = initialCaretPosition;
  }

  public String write(Project project) {
    Document document = XMLUtils.createDocument();

    Element rootElement = document.createElement("KeyLoggerReport");

    // Timestamp
    rootElement.setAttribute("startTimestamp", String.valueOf(startTimeStamp));

    // System
    String system = null;
    if (SystemInfo.isWindows) {
      system = "windows";
    } else if (SystemInfo.isLinux) {
      system = "linux";
    } else if (SystemInfo.isMac) {
      system = "mac";
    }
    rootElement.setAttribute("system", system);

    // Initial cursor position
    if (myInitialCaretPosition != null) {
      rootElement.setAttribute("initialX", String.valueOf((int) myInitialCaretPosition.getX()));
      rootElement.setAttribute("initialY", String.valueOf((int) myInitialCaretPosition.getY()));
    }

    document.appendChild(rootElement);

    int lastCaretPositionX = (int) (myInitialCaretPosition != null ? myInitialCaretPosition.getX() : -1);
    int lastCaretPositionY = (int) (myInitialCaretPosition != null ? myInitialCaretPosition.getY() : -1);
    for (KeyStroke originalKeystroke : keyStrokes) {
      List<KeyStroke> spittedKeyStoke;
      if (originalKeystroke.canBeSplit()) {
        spittedKeyStoke = originalKeystroke.split();
      } else {
        spittedKeyStoke = Collections.singletonList(originalKeystroke);
      }

      for (KeyStroke splitKeystroke : spittedKeyStoke) {
        long timeOffset = splitKeystroke.getTimestamp() - startTimeStamp;
        if (timeOffset < 0) {
          continue;
        }

        Element keyStrokeElement = document.createElement("keyStroke");
        keyStrokeElement.setAttribute("timeOffset", String.valueOf(timeOffset));
        keyStrokeElement.setAttribute("presentation", splitKeystroke.getPresentation());

        if (splitKeystroke.hasCursorData()) {
          keyStrokeElement.setAttribute("cursorX", String.valueOf(splitKeystroke.getCursorX()));
          keyStrokeElement.setAttribute("cursorY", String.valueOf(splitKeystroke.getCursorY()));
        } else if (lastCaretPositionX != -1 && lastCaretPositionX != -1) {
          keyStrokeElement.setAttribute("cursorX", String.valueOf(lastCaretPositionX));
          keyStrokeElement.setAttribute("cursorY", String.valueOf(lastCaretPositionY));
        }

        for (KeyCodeWrapper keyCodeWrapper : splitKeystroke.getKeyCodes()) {
          Element keyCodeElement = document.createElement("keyCode");
          keyCodeElement.setTextContent(String.valueOf(keyCodeWrapper.getKeyCode()));
          keyStrokeElement.appendChild(keyCodeElement);
        }

        rootElement.appendChild(keyStrokeElement);

        if (splitKeystroke.hasCursorData()) {
          lastCaretPositionX = splitKeystroke.getCursorX();
          lastCaretPositionY = splitKeystroke.getCursorY();
        }

        // Process the socket sent command
        for (String socketSentCommand : splitKeystroke.getSocketSentCommands()) {
          Element socketCommandElement = document.createElement("socketCommand");
          socketCommandElement.setTextContent(socketSentCommand);
          keyStrokeElement.appendChild(socketCommandElement);
        }
      }
    }

    String reportFilePath = new File(project.getProjectFile().getParent().getPath(), "keylogging_" + startTimeStamp + ".xml").getPath();
    try {
      XMLUtils.saveToFile(reportFilePath, document);
    } catch (TransformerException e) {
      LOG.error("Can't write XML to file " + reportFilePath, e);
      return null;
    }
    return reportFilePath;
  }

}
