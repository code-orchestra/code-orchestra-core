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
package jetbrains.mps.vfs.impl;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.FileUtil;

import java.io.File;
import java.io.IOException;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

class JarFileDataCache {
  private static final Logger LOG = Logger.getLogger(JarFileDataCache.class);

  private static JarFileDataCache ourInstance = new JarFileDataCache();

  public static JarFileDataCache instance() {
    return ourInstance;
  }

  private ReferenceQueue<JarFileData> myQueue = new ReferenceQueue<JarFileData>();
  private Map<String, WeakReference<JarFileData>> myPathToRef = new HashMap<String, WeakReference<JarFileData>>();
  private Map<WeakReference<JarFileData>, String> myRefToPath = new HashMap<WeakReference<JarFileData>, String>();

  private final Object myLock = new Object();

  private JarFileDataCache() {
  }

  public JarFileData getDataFor(File file) {
    synchronized (myLock) {
      removeGCedReferences();

      String path = file.getAbsolutePath();

      if (myPathToRef.containsKey(path)) {
        WeakReference<JarFileData> ref = myPathToRef.get(path);
        JarFileData data = ref.get();
        if (data != null) {
          return data;
        }
      }

      try {
        JarFileData data = new JarFileData(new File(path));
        WeakReference<JarFileData> ref = new WeakReference<JarFileData>(data, myQueue);
        myPathToRef.put(path, ref);
        myRefToPath.put(ref, path);

        return data;
      } catch (IOException e) {
        LOG.error(e);
        return null;
      }
    }
  }

  private void removeGCedReferences() {
    while (true) {
      WeakReference<JarFileData> ref = (WeakReference<JarFileData>) myQueue.poll();
      if (ref == null) break;

      String path = myRefToPath.get(ref);
      myRefToPath.remove(ref);
      myPathToRef.remove(path);
    }
  }
}
