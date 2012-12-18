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
package jetbrains.mps.generator;

import jetbrains.mps.smodel.persistence.def.ModelPersistence;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.util.ReadUtil;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import java.io.*;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

/**
 * Evgeny Gryaznov, Sep 2, 2010
 */
public class ModelDigestUtil {

  public static Map<String, String> getDigestMap(@NotNull IFile file) {
    InputStream is = null;
    byte[] modelBytes = null;
    try {
      is = file.openInputStream();
      modelBytes = ReadUtil.read(is);
    } catch (IOException e) {
      /* ignore */
    } finally {
      if (is != null) {
        try {
          is.close();
        } catch (IOException e) {
          /* ignore */
        }
      }
    }
    if(modelBytes == null) {
      return null;
    }
    return getDigestMap(modelBytes);
  }

  public static Map<String, String> getDigestMap(byte[] modelBytes) {
    return ModelPersistence.calculateHashes(modelBytes);
  }

  public static String hash(IFile file) {
    if (file == null) return null;

    InputStream is = null;
    try {
      is = file.openInputStream();
      return hash(new InputStreamReader(is, FileUtil.DEFAULT_CHARSET));
    } catch (IOException e) {
      /* ignore */
    } finally {
      if (is != null) {
        try {
          is.close();
        } catch (IOException e) {
          /* ignore */
        }
      }
    }
    return null;
  }

  public static String hash(byte[] content) {
    try {
      return hash(new InputStreamReader(new ByteArrayInputStream(content), FileUtil.DEFAULT_CHARSET));
    } catch (IOException e) {
      // it can't happen
      throw new IllegalStateException(e);
    }
  }

  public static String hash(String content) {
    try {
      return hash(new StringReader(content));
    } catch (IOException e) {
      // it can't happen
      throw new IllegalStateException(e);
    }
  }

  private static String hash(Reader r) throws IOException {
    try {
      BufferedReader reader = new BufferedReader(r);

      MessageDigest digest = MessageDigest.getInstance("SHA");
      String line;
      while ((line = reader.readLine()) != null) {
        digest.update(line.getBytes(FileUtil.DEFAULT_CHARSET));
      }

      byte[] res = digest.digest();
      return new BigInteger(res).toString(Character.MAX_RADIX);
    } catch (NoSuchAlgorithmException e) {
      throw new IllegalStateException(e);
    }
  }
}
