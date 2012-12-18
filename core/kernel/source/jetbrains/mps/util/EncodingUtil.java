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

import com.thoughtworks.xstream.core.util.Base64Encoder;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

/**
 * evgeny, 2/25/11
 */
public class EncodingUtil {

  public static String encodeBase64(byte[] bytes) {
    return new Base64Encoder().encode(bytes);
  }

  public static byte[] decodeBase64(String base64) {
    return new Base64Encoder().decode(base64);
  }

  public static byte[] encode(String text, String encoding) throws IOException {
    ByteArrayOutputStream os = new ByteArrayOutputStream(text.length());
    OutputStreamWriter writer = null;
    try {
      writer = new OutputStreamWriter(os, encoding);
      writer.write(text);
    } finally {
      if (writer != null) {
        writer.close();
      }
    }
    return os.toByteArray();
  }
}
