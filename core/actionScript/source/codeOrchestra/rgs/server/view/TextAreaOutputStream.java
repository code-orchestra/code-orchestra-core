/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package codeOrchestra.rgs.server.view;

import java.io.*;
import java.util.*;
import javax.swing.*;

public class TextAreaOutputStream
  extends OutputStream {

  private JTextArea textArea;
  private int maxLines;
  private LinkedList lineLengths;
  private int curLength;
  private byte[] oneByte;

  public TextAreaOutputStream(JTextArea ta) {
    this(ta, 1000);
  }

  public TextAreaOutputStream(JTextArea ta, int ml) {
    if (ml < 1) {
      throw new RuntimeException("Maximum lines of " + ml + " in TextAreaOutputStream constructor is not permitted");
    }
    textArea = ta;
    maxLines = ml;
    lineLengths = new LinkedList();
    curLength = 0;
    oneByte = new byte[1];
  }

  public synchronized void clear() {
    lineLengths = new LinkedList();
    curLength = 0;
    textArea.setText("");
  }

  /**
   * Get the number of lines this TextArea will hold.
   */
  public synchronized int getMaximumLines() {
    return maxLines;
  }

  /**
   * Set the number of lines this TextArea will hold.
   */
  public synchronized void setMaximumLines(int val) {
    maxLines = val;
  }

  public void close() {
    if (textArea != null) {
      textArea = null;
      lineLengths = null;
      oneByte = null;
    }
  }

  public void flush() {
  }

  public void write(int val) {
    oneByte[0] = (byte) val;
    write(oneByte, 0, 1);
  }

  public void write(byte[] ba) {
    write(ba, 0, ba.length);
  }

  public synchronized void write(byte[] ba, int str, int len) {
    try {
      curLength += len;
      if (bytesEndWith(ba, str, len, LINE_SEP)) {
        lineLengths.addLast(new Integer(curLength));
        curLength = 0;
        if (lineLengths.size() > maxLines) {
          textArea.replaceRange(null, 0, ((Integer) lineLengths.removeFirst()).intValue());
        }
      }
      for (int xa = 0; xa < 10; xa++) {
        try {
          textArea.append(new String(ba, str, len));
          textArea.setCaretPosition(textArea.getDocument().getLength());
          break;
        } catch (Throwable thr) {
          if (xa == 9) {
            thr.printStackTrace();
          } else {
            Thread.sleep(200);
          }
        }
      }
    } catch (Throwable thr) {
      CharArrayWriter caw = new CharArrayWriter();
      thr.printStackTrace(new PrintWriter(caw, true));
      textArea.append(System.getProperty("line.separator", "\n"));
      textArea.append(caw.toString());
    }
  }

  private boolean bytesEndWith(byte[] ba, int str, int len, byte[] ew) {
    if (len < LINE_SEP.length) {
      return false;
    }
    for (int xa = 0, xb = (str + len - LINE_SEP.length); xa < LINE_SEP.length; xa++, xb++) {
      if (LINE_SEP[xa] != ba[xb]) {
        return false;
      }
    }
    return true;
  }

  static private byte[] LINE_SEP = System.getProperty("line.separator", "\n").getBytes();

}