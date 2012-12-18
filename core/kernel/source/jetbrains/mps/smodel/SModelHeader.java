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
package jetbrains.mps.smodel;

/**
 * evgeny, 5/3/11
 */
public class SModelHeader {

  public static final String VERSION = "version";
  public static final String DO_NOT_GENERATE = "doNotGenerate";

  private String myUID = null;
  private int myPersistenceVersion = -1;
  private int myVersion = -1;
  private boolean doNotGenerate = false;

  public int getPersistenceVersion() {
    return myPersistenceVersion;
  }

  public void setPersistenceVersion(int persistenceVersion) {
    myPersistenceVersion = persistenceVersion;
  }

  public int getVersion() {
    return myVersion;
  }

  public void setVersion(int version) {
    myVersion = version;
  }

  public boolean isDoNotGenerate() {
    return doNotGenerate;
  }

  public void setDoNotGenerate(boolean doNotGenerate) {
    this.doNotGenerate = doNotGenerate;
  }

  public void setUID(String UID) {
    myUID = UID;
  }

  public String getUID() {
    return myUID;
  }

  public SModelReference getModelReference() {
    return myUID != null ? SModelReference.fromString(myUID) : null;
  }

  public static SModelHeader create(int persistenceVersion) {
    SModelHeader header = new SModelHeader();
    header.setPersistenceVersion(persistenceVersion);
    return header;
  }

  public void updateDefaults(SModelHeader header) {
    myVersion = header.getVersion();
    doNotGenerate = header.isDoNotGenerate();
  }
}
