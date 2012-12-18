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
package jetbrains.mps.reloading;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.annotation.UseCarefully;
import jetbrains.mps.vfs.FileSystem;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.io.File;
import java.io.IOException;
import java.util.*;

public class ClassPathFactory {
  private static Logger LOG = Logger.getLogger(ClassPathFactory.class);
  private static final ClassPathFactory ourInstance = new ClassPathFactory();

  public static ClassPathFactory getInstance() {
    return ourInstance;
  }

  //--------------------------

  private Map<String, RealClassPathItem> myCache = new HashMap<String, RealClassPathItem>();
  private List<CompositeClassPathItem> myCompositeClassPathItems = new ArrayList<CompositeClassPathItem>();

  @NotNull
  public RealClassPathItem createFromPath(String path, @Nullable String requestor) throws IOException {
    if (myCache.containsKey(path)) return myCache.get(path);

    boolean jared = path.contains("!/");
    boolean exists = jared ? FileSystem.getInstance().getFileByPath(path).exists() : new File(path).exists();
    if (!exists) {
      String moduleString = requestor == null ? "" : (" in " + requestor.toString());
      String message = "Can't load class path item " + path + moduleString + "." + (new File(path).isDirectory() ? " Execute make in IDEA." : "");
      LOG.debug(message, new Throwable());
      NonExistingClassPathItem item = new NonExistingClassPathItem(path);
      myCache.put(path, item);
      return item;
    }

    if (!jared && new File(path).isDirectory()) {
      myCache.put(path, new FileClassPathItem(path));
    } else {
      myCache.put(path, new JarFileClassPathItem(path));
    }

    return myCache.get(path);
  }

  //--------------------------

  @UseCarefully
  //this is supposed to be used only on class reloading
  public void invalidateAll() {
    for (RealClassPathItem p : myCache.values()) {
      p.invalidate();
    }
    myCache.clear();
    for (CompositeClassPathItem item : myCompositeClassPathItems) {
      item.invalidate();
    }
    myCompositeClassPathItems.clear();
  }

  public void invalidate(Set<String> paths) {
    for (String path : paths) {
      if (!myCache.containsKey(path)) continue;
      myCache.remove(path).invalidate();
    }
  }

  public void invalidate(IClassPathItem classPathItems) {
    for (RealClassPathItem item : classPathItems.flatten()) {
      invalidate(Collections.singleton(item.getPath()));
    }
  }

  public void addCompositeClassPathItem(CompositeClassPathItem item) {
    myCompositeClassPathItems.add(item);
  }
}
