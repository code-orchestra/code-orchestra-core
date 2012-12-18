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
package jetbrains.mps.util;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.vfs.IFile;
import org.jdom.Document;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.xml.sax.EntityResolver;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.*;

public class JDOMUtil {
  private static final Logger LOG = Logger.getLogger(JDOMUtil.class);
  private static final String ENCODING = "UTF-8";

  private static SAXParserFactory factory = null;

  public static SAXParser createSAXParser() throws SAXException, ParserConfigurationException {
    if (factory == null) {
      factory = SAXParserFactory.newInstance();
    }
    return factory.newSAXParser();
  }

  public static Document loadDocument(IFile file) throws JDOMException, IOException {
    SAXBuilder saxBuilder = createBuilder();
    InputStream in = null;
    try {
      in = file.openInputStream();
      return saxBuilder.build(new InputStreamReader(in, ENCODING));
    } catch (JDOMException e) {
      LOG.error("FAILED TO LOAD FILE : " + file.getPath());
      throw e;
    } catch (IOException e) {
      LOG.error("FAILED TO LOAD FILE : " + file.getPath());
      throw e;
    } finally {
      if (in != null) {
        try {
          in.close();
        } catch (IOException e) {
          LOG.error(e);
        }
      }
    }
  }

  public static Document loadDocument(InputSource source) throws JDOMException, IOException {
    SAXBuilder saxBuilder = createBuilder();
    try {
      return saxBuilder.build(source);
    } catch (JDOMException e) {
      LOG.error("FAILED TO LOAD FILE : " + source.toString());
      throw e;
    } catch (IOException e) {
      LOG.error("FAILED TO LOAD FILE : " + source.toString());
      throw e;
    }
  }

  public static Document loadDocument(File file) throws JDOMException, IOException {
    SAXBuilder saxBuilder = createBuilder();
    FileInputStream in = new FileInputStream(file);
    try {
      return saxBuilder.build(new InputStreamReader(in, ENCODING));
    } catch (JDOMException e) {
      LOG.error("FAILED TO LOAD FILE : " + file.getAbsolutePath());
      throw e;
    } catch (IOException e) {
      LOG.error("FAILED TO LOAD FILE : " + file.getAbsolutePath());
      throw e;
    } finally {
      in.close();
    }
  }

  public static Document loadDocument(InputStream stream) throws JDOMException, IOException {
    SAXBuilder saxBuilder = createBuilder();
    return saxBuilder.build(new InputStreamReader(stream, ENCODING));
  }

  public static Document loadDocument(Reader reader) throws IOException, JDOMException {
    SAXBuilder saxBuilder = createBuilder();
    return saxBuilder.build(reader);
  }

  public static String asString(Document doc) throws IOException {
    StringWriter writer = new StringWriter();

    writeDocument(doc, writer);
    return writer.toString();
  }

  public static void writeDocument(Document document, String filePath) throws IOException {
    OutputStream stream = new BufferedOutputStream(new FileOutputStream(filePath));
    try {
      writeDocument(document, stream);
    } finally {
      stream.close();
    }
  }

  public static SAXBuilder createBuilder() {
    final SAXBuilder saxBuilder = new SAXBuilder();
    saxBuilder.setEntityResolver(new EntityResolver() {
      public InputSource resolveEntity(String publicId,
                                       String systemId)
        throws SAXException, IOException {
        return new InputSource(new CharArrayReader(new char[0]));
      }
    });
    return saxBuilder;
  }

  public static void writeDocument(Document document, IFile file) throws IOException {
    if (!file.exists()) {
      file.createNewFile();
    }

    OutputStream stream = new BufferedOutputStream(file.openOutputStream());
    try {
      writeDocument(document, stream);
    } finally {
      stream.close();
    }
  }

  public static void writeDocument(Document document, File file) throws IOException {
    if (!file.getParentFile().exists()) {
      file.getParentFile().mkdirs();
    }

    if (!file.exists()) {
      file.createNewFile();
    }

    OutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
    try {
      writeDocument(document, stream);
    } finally {
      stream.close();
    }
  }

  public static void writeDocument(Document document, OutputStream stream) throws IOException {
    writeDocument(document, new OutputStreamWriter(stream, ENCODING));
  }


  public static byte[] printDocument(Document document) throws IOException {
    CharArrayWriter writer = new CharArrayWriter();
    writeDocument(document, writer);
    return new String(writer.toCharArray()).getBytes(ENCODING);
  }

  public static void writeDocument(Document document, Writer writer) throws IOException {
    XMLOutputter xmlOutputter = createOutputter();
    if (xmlOutputter == null) {
      LOG.error("Could not create XMLOutputter");
    } else if (document == null) {
      LOG.error("Document is null");
    } else if (writer == null) {
      LOG.error("Writer is null");
      return;
    } else {
      xmlOutputter.output(document, writer);
    }
    writer.close();
  }

  public static XMLOutputter createOutputter() {
    XMLOutputter xmlOutputter = new MyXMLOutputter();
    xmlOutputter.setFormat(Format.getPrettyFormat().setLineSeparator(System.getProperty("line.separator")));
    return xmlOutputter;
  }

  private static class MyXMLOutputter extends XMLOutputter {
    public String escapeAttributeEntities(String str) {
      StringBuffer buffer;
      char ch;
      String entity;

      buffer = null;
      for (int i = 0; i < str.length(); i++) {
        ch = str.charAt(i);
        switch (ch) {
          case '<':
            entity = "&lt;";
            break;
          case '>':
            entity = "&gt;";
            break;
/*
case '\'' :
entity = "&apos;";
break;
*/
          case '\"':
            entity = "&quot;";
            break;
          case '&':
            entity = "&amp;";
            break;

// start Max patch
          case '\n':
            entity = "&#10;";
            break;

          case '\r':
            entity = "&#13;";
            break;

          case '\t':
            entity = "&#9;";
            break;
// end Max patch

          default:
            entity = null;
            break;
        }
        if (buffer == null) {
          if (entity != null) {
            // An entity occurred, so we'll have to use StringBuffer
            // (allocate room for it plus a few more entities).
            buffer = new StringBuffer(str.length() + 20);
            // Copy previous skipped characters and fall through
            // to pickup current character
            buffer.append(str.substring(0, i));
            buffer.append(entity);
          }
        } else {
          if (entity == null) {
            buffer.append(ch);
          } else {
            buffer.append(entity);
          }
        }
      }

      // If there were any entities, return the escaped characters
      // that we put in the StringBuffer. Otherwise, just return
      // the unmodified input string.
      return (buffer == null) ? str : buffer.toString();
    }

    public String escapeElementEntities(String str) {
      StringBuffer buffer;
      char ch;
      String entity;

      buffer = null;
      for (int i = 0; i < str.length(); i++) {
        ch = str.charAt(i);
        switch (ch) {
// Start patch by Max.
          case '\"':
            entity = "&quot;";
            break;
// End patch by Max.

          case '<':
            entity = "&lt;";
            break;
          case '>':
            entity = "&gt;";
            break;
          case '&':
            entity = "&amp;";
            break;
          default:
            entity = null;
            break;
        }
        if (buffer == null) {
          if (entity != null) {
            // An entity occurred, so we'll have to use StringBuffer
            // (allocate room for it plus a few more entities).
            buffer = new StringBuffer(str.length() + 20);
            // Copy previous skipped characters and fall through
            // to pickup current character
            buffer.append(str.substring(0, i));
            buffer.append(entity);
          }
        } else {
          if (entity == null) {
            buffer.append(ch);
          } else {
            buffer.append(entity);
          }
        }
      }

      // If there were any entities, return the escaped characters
      // that we put in the StringBuffer. Otherwise, just return
      // the unmodified input string.
      return (buffer == null) ? str : buffer.toString();
    }
  }

}
