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
package jetbrains.mps.smodel.persistence.def;

import jetbrains.mps.smodel.SModelHeader;

import java.util.HashMap;
import java.util.Map;

public class DescriptorLoadResult {
  private final SModelHeader myHeader = new SModelHeader();
  private Map<String, String> myMetadata = new HashMap<String, String>();

  public void setUID(String UID) {
    myHeader.setUID(UID);
  }

  public void setPersistenceVersion(int persistenceVersion) {
    myHeader.setPersistenceVersion(persistenceVersion);
  }

  public void setMetadata(Map<String, String> metadata) {
    myMetadata = metadata;
  }

  public void setVersion(int version) {
    myHeader.setVersion(version);
  }

  public void setDoNotGenerate(boolean doNotGenerate) {
    myHeader.setDoNotGenerate(doNotGenerate);
  }

  public String getUID() {
    return myHeader.getUID();
  }

  public SModelHeader getHeader() {
    return myHeader;
  }

  public Map<String,String> getMetadata() {
    return myMetadata;
  }
}
