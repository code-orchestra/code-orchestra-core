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

import java.io.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * @author Kostik
 */
public class UnzipUtil {

  public static void unzip(File zipFile, File outputDir) throws IOException {
    InputStream input = new BufferedInputStream(new FileInputStream(zipFile));
    ZipInputStream zipInput = new ZipInputStream(input);
    ZipEntry entry;
    while ((entry = zipInput.getNextEntry()) != null) {
      File entryFile = new File(outputDir.getPath() + File.separatorChar + entry.getName());
      if (entry.isDirectory()) {
        entryFile.mkdirs();
      } else {
        entryFile.getParentFile().mkdirs();
        FileOutputStream output = new FileOutputStream(entryFile, false);
        byte[] b = new byte[512];
        int len;
        while ((len = zipInput.read(b)) != -1) {
          output.write(b, 0, len);
        }
        output.close();
      }
    }
  }
}
