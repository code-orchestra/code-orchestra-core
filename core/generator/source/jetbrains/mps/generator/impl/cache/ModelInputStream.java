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
package jetbrains.mps.generator.impl.cache;

import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.SNodeId.Foreign;
import jetbrains.mps.smodel.SNodeId.Regular;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Evgeny Gryaznov, Sep 27, 2010
 */
public class ModelInputStream extends DataInputStream {

  private List<String> myStrings = new ArrayList<String>(2048);
  private List<SModelReference> myModelRefs = new ArrayList<SModelReference>(1024);

  public ModelInputStream(InputStream in) {
    super(new BufferedInputStream(in, 65536));
  }

  public String readString() throws IOException {
    int c = readByte();
    if (c == 0x70) {
      return null;
    } else if (c == 1) {
      int index = readInt();
      return myStrings.get(index);
    }
    String res = readUTF();
    myStrings.add(res);
    return res;
  }

  public SModelReference readModelReference() throws IOException {
    int c = readByte();
    if (c == 0x70) {
      return null;
    } else if (c == 9) {
      int index = readInt();
      return myModelRefs.get(index);
    }

    SModelId id = null;
    if (c == 7) {
      id = readModelID();
    }
    SModelReference ref = new SModelReference(SModelFqName.fromString(readString()), id);
    myModelRefs.add(ref);
    return ref;
  }

  public SModelId readModelID() throws IOException {
    int c = readByte();
    if (c == 0x70) {
      return null;
    } else if (c == 0x28) {
      UUID uuid = new UUID(readLong(), readLong());
      return SModelId.regular(uuid);
    } else if (c == 0x27) {
      return SModelId.foreign(readString());
    } else {
      throw new IOException("unknown id");
    }
  }

  public SNodeId readNodeId() throws IOException {
    int c = readByte();
    if (c == 0x70) {
      return null;
    } else if (c == 0x18) {
      return new Regular(readLong());
    } else if (c == 0x17) {
      return new Foreign(readString());
    }
    throw new IOException("no id");
  }

  public SNodePointer readNodePointer() throws IOException {
    int b = readByte();
    if (b == 0x70) {
      return null;
    } else {
      return new SNodePointer(readModelReference(), readNodeId());
    }
  }
}
