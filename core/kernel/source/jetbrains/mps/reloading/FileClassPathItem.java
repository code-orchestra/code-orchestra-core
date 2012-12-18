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

import com.intellij.util.containers.EmptyIterable;
import gnu.trove.THashMap;
import gnu.trove.THashSet;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.stubs.javastub.classpath.ClassifierKind;
import jetbrains.mps.util.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;

/**
 * @author Kostik
 */
public class FileClassPathItem extends RealClassPathItem {
  private String myClassPath;
  private Map<String, Set<String>> mySubpackagesCache = new THashMap<String, Set<String>>();
  private Map<String, Set<String>> myAvailableClassesCache = new THashMap<String, Set<String>>();

  protected FileClassPathItem(String classPath) {
    myClassPath = classPath;
  }

  @Deprecated
  public String getClassPath() {
    return getPath();
  }

  public String getPath() {
    checkValidity();
    return myClassPath;
  }

  public synchronized byte[] getClass(String name) {
    checkValidity();
    String namespace = NameUtil.namespaceFromLongName(name);
    String shortname = NameUtil.shortNameFromLongName(name);

    if (!myAvailableClassesCache.containsKey(namespace)) {
      buildCacheFor(namespace);
    }

    Set<String> classes = myAvailableClassesCache.get(namespace);
    if (classes == null
      || !classes.contains(shortname)) {
      return null;
    }

    String path = myClassPath + File.separatorChar + NameUtil.pathFromNamespace(name) + MPSExtentions.DOT_CLASSFILE;
    try {
      byte[] result = null;
      InputStream inp = null;
      try {
        inp = new FileInputStream(path);
        result = ReadUtil.read(inp);
      } finally {
        if (inp != null) {
          inp.close();
        }
      }

      return result;
    } catch (IOException e) {
      return null;
    }
  }

  public ClassifierKind getClassifierKind(String name) {
    String path = myClassPath + File.separatorChar + NameUtil.pathFromNamespace(name) + MPSExtentions.DOT_CLASSFILE;
    try {
      InputStream inp = null;
      try {
        inp = new FileInputStream(path);
        return ClassifierKind.getClassifierKind(inp);
      } finally {
        if (inp != null) {
          inp.close();
        }
      }
    } catch (IOException e) {
      return null;
    }
  }

  public URL getResource(String name) {
    checkValidity();
    try {
      File resourceFile = new File(myClassPath + File.separator + name.replace('/', File.separatorChar));
      if (!resourceFile.exists()) return null;
      return resourceFile.toURI().toURL();
    } catch (MalformedURLException e) {
      return null;
    }
  }

  public synchronized Iterable<String> getAvailableClasses(String namespace) {
    checkValidity();
    if (!myAvailableClassesCache.containsKey(namespace)) {
      buildCacheFor(namespace);
    }

    Set<String> start = myAvailableClassesCache.get(namespace);
    if (start == null) return new EmptyIterable<String>();
    Condition<String> cond = new Condition<String>() {
      public boolean met(String className) {
        return !isAnonymous(className);
      }
    };
    return new ConditionalIterable<String>(start, cond);
  }

  public synchronized Iterable<String> getSubpackages(String namespace) {
    checkValidity();
    if (!mySubpackagesCache.containsKey(namespace)) {
      buildCacheFor(namespace);
    }

    Set<String> result = mySubpackagesCache.get(namespace);
    if (result == null) return new EmptyIterable<String>();
    return Collections.unmodifiableSet(result);
  }

  private synchronized void buildCacheFor(String namespace) {
    namespace = InternUtil.intern(namespace);
    Set<String> subpacks = null;
    Set<String> classes = null;
    File dir = getModelDir(namespace);

    String[] files = dir.list();
    if (files != null) {
      for (String name : files) {
        if (name.endsWith(MPSExtentions.DOT_CLASSFILE)) { //isDirectory is quite expensive operation
          if (classes == null) {
            classes = new THashSet<String>(files.length);
          }
          String classname = name.substring(0, name.length() - MPSExtentions.DOT_CLASSFILE.length());
          classes.add(InternUtil.intern(classname));
        } else {
          File file = new File(dir, name);
          if (file.isDirectory()) {
            if (subpacks == null) {
              subpacks = new THashSet<String>();
            }
            String fqName = namespace.length() > 0 ? namespace + "." + name : name;
            subpacks.add(InternUtil.intern(fqName));
          }
        }
      }
    }

    mySubpackagesCache.put(namespace, subpacks);
    myAvailableClassesCache.put(namespace, classes);
  }

  public long getClassesTimestamp(String namespace) {
    checkValidity();
    File dir = getModelDir(namespace);
    long result = dir.lastModified();
    if (dir.exists()) {
      for (File file : dir.listFiles()) {
        if (file.getName().endsWith(MPSExtentions.DOT_CLASSFILE)) {
          result = Math.max(result, file.lastModified());
        }
      }
    }
    return result;
  }

  public List<RealClassPathItem> flatten() {
    checkValidity();
    List<RealClassPathItem> result = new ArrayList<RealClassPathItem>();
    result.add(this);
    return result;
  }

  public void accept(IClassPathItemVisitor visitor) {
    checkValidity();
    visitor.visit(this);
  }

  private File getModelDir(String namespace) {
    checkValidity();
    if (namespace == null) namespace = "";
    return new File(myClassPath + File.separatorChar + NameUtil.pathFromNamespace(namespace));
  }

  public String toString() {
    return "file-cp: " + myClassPath;
  }
}
