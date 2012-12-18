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
package jetbrains.mps.samples;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class SamplesManager {
  private static SamplesManager ourInstance = new SamplesManager();
  private List<SamplesInfo> myComponents = new CopyOnWriteArrayList<SamplesInfo>();

  public static SamplesManager getInstance() {
    return ourInstance;
  }

  private SamplesManager() {

  }

  public void registerSamplesInfo(SamplesInfo component) {
    myComponents.add(component);
  }

  public List<String> getSamplesPaths() {
    List<String> result = new ArrayList<String>();
    for (SamplesInfo info : myComponents) {
      result.add(info.getSamplesPath());
    }
    return result;
  }
}
