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
package jetbrains.mps.smodel.persistence.def.v7;

import jetbrains.mps.generator.ModelDigestHelper;
import jetbrains.mps.generator.ModelDigestUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.persistence.def.IHashProvider;
import jetbrains.mps.smodel.persistence.def.ModelPersistence;
import jetbrains.mps.smodel.persistence.def.XmlFastScanner;

import java.util.HashMap;
import java.util.Map;

public class HashProvider7 extends IHashProvider {
  private static final Logger LOG = Logger.getLogger(HashProvider7.class);

  public String getHash(byte[] modelBytes){
    return ModelDigestUtil.hash(modelBytes);
  }

  public Map<String, String> getRootHashes(byte[] modelBytes){
    Map<String, String> result = new HashMap<String, String>();
    extractRootHashes(modelBytes, result);
    return result;
  }

  private static void extractRootHashes(byte[] content, Map<String, String> rootHashes) {
    XmlFastScanner scanner = new XmlFastScanner(content);
    int depth = 0, token, rootStart = -1;
    String rootId = null;

    Map<String, String> shortContent = new HashMap<String, String>();
    boolean insideRoots = false;
    while ((token = scanner.next()) != XmlFastScanner.EOI) {
      switch (token) {
        case XmlFastScanner.SIMPLE_TAG:
          boolean rootShortPart = insideRoots && ModelPersistence.NODE.equals(scanner.getName());
          boolean rootLongPart = depth == 1 && ModelPersistence.ROOT_CONTENT.equals(scanner.getName());
          if (rootShortPart || rootLongPart) {
            rootId = extractId(scanner.token());
            if (rootId != null) {
              String s = scanner.getText(scanner.getTokenOffset(), scanner.getOffset());
              if (rootShortPart) {
                shortContent.put(rootId, s);
              } else {
                addMultiHash(rootHashes, rootId, shortContent.get(rootId), s);
              }
            }
            rootId = null;
          }
          break;

        case XmlFastScanner.OPEN_TAG:
          depth++;

          if (depth == 2 && ModelPersistence.ROOTS.equals(scanner.getName())) {
            insideRoots = true;
            rootHashes.put(ModelDigestHelper.HEADER, ModelDigestUtil.hash(scanner.getText(0, scanner.getTokenOffset())));
          }

          if (insideRoots && ModelPersistence.NODE.equals(scanner.getName())) {
            rootStart = scanner.getTokenOffset();
            rootId = extractId(scanner.token());
          }

          if (depth == 2 && ModelPersistence.ROOT_CONTENT.equals(scanner.getName())) {
            rootStart = scanner.getTokenOffset();
            rootId = extractId(scanner.token());
          }
          break;

        case XmlFastScanner.CLOSE_TAG:
          if (depth == 2 && ModelPersistence.ROOTS.equals(scanner.getName())) {
            insideRoots = false;
          }

          if (insideRoots && rootId != null && ModelPersistence.NODE.equals(scanner.getName())) {
            String s = scanner.getText(rootStart, scanner.getOffset());
            shortContent.put(rootId, s);
            rootStart = -1;
            rootId = null;
          }

          if (depth == 2 && rootId != null && ModelPersistence.ROOT_CONTENT.equals(scanner.getName())) {
            String s = scanner.getText(rootStart, scanner.getOffset());
            addMultiHash(rootHashes, rootId, shortContent.get(rootId), s);
            rootStart = -1;
            rootId = null;
          }

          depth--;
          break;
      }
    }

    if (depth != 0) {
      LOG.error("xml: bad data");
    }
  }

  private static void addMultiHash(Map<String, String> rootHashes, String rootId, String... cont) {
    StringBuilder sb = new StringBuilder();
    for (String s : cont) {
      assert s != null;
      sb.append(s);
    }
    String hash = ModelDigestUtil.hash(sb.toString());
    rootHashes.put(rootId, hash);
  }
}
