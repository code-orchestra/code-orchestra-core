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
package jetbrains.mps.smodel.persistence.def.v3;

import jetbrains.mps.generator.ModelDigestHelper;
import jetbrains.mps.generator.ModelDigestUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.persistence.def.IHashProvider;
import jetbrains.mps.smodel.persistence.def.ModelPersistence;
import jetbrains.mps.smodel.persistence.def.XmlFastScanner;

import java.util.HashMap;
import java.util.Map;

public class HashProvider3 extends IHashProvider {
  private static final Logger LOG = Logger.getLogger(HashProvider3.class);

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

    boolean isEmpty = true;
    while ((token = scanner.next()) != XmlFastScanner.EOI) {
      switch (token) {
        case XmlFastScanner.OPEN_TAG:
          depth++;
          if (depth == 2 && ModelPersistence.NODE.equals(scanner.getName())) {
            rootStart = scanner.getTokenOffset();
            rootId = extractId(scanner.token());
            if (rootId != null && isEmpty) {
              rootHashes.put(ModelDigestHelper.HEADER, ModelDigestUtil.hash(scanner.getText(0, rootStart)));
              isEmpty = false;
            }
          }
          break;
        case XmlFastScanner.SIMPLE_TAG:
          if (depth == 1 && ModelPersistence.NODE.equals(scanner.getName())) {
            rootId = extractId(scanner.token());
            if (rootId != null) {
              String s = scanner.getText(scanner.getTokenOffset(), scanner.getOffset());
              rootHashes.put(rootId, ModelDigestUtil.hash(s));
            }
          }
          break;
        case XmlFastScanner.CLOSE_TAG:
          if (depth == 2) {
            if (rootId != null && ModelPersistence.NODE.equals(scanner.getName())) {
              String s = scanner.getText(rootStart, scanner.getOffset());
              rootHashes.put(rootId, ModelDigestUtil.hash(s));
            }
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
    if (isEmpty) {
      rootHashes.put(ModelDigestHelper.HEADER, ModelDigestUtil.hash(content));
    }
  }
}
