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

import jetbrains.mps.stubs.javastub.classpath.ClassifierKind;
import jetbrains.mps.util.FlattenIterable;

import java.net.URL;
import java.util.*;

/**
 * @author Kostik
 */
public class CompositeClassPathItem extends AbstractClassPathItem {
  private List<IClassPathItem> myChildren = new ArrayList<IClassPathItem>();

  public CompositeClassPathItem() {
    ClassPathFactory.getInstance().addCompositeClassPathItem(this);
  }

  public void add(IClassPathItem item) {
    assert item != null;
    checkValidity();
    myChildren.add(item);
    item.addInvalidationAction(myInvalidationListener);
  }

  public byte[] getClass(String name) {
    checkValidity();
    for (IClassPathItem item : myChildren) {
      byte[] result = item.getClass(name);
      if (result != null) return result;
    }
    return null;
  }

  public ClassifierKind getClassifierKind(String name) {
    checkValidity();
    for (IClassPathItem item : myChildren) {
      ClassifierKind result = item.getClassifierKind(name);
      if (result != null) return result;
    }
    return null;
  }

  public URL getResource(String name) {
    checkValidity();
    for (IClassPathItem item : myChildren) {
      if (item.getResource(name) != null) return item.getResource(name);
    }
    return null;
  }

  public Iterable<String> getAvailableClasses(String namespace) {
    checkValidity();
    FlattenIterable<String> result = new FlattenIterable<String>();
    for (IClassPathItem item : myChildren) {
      //todo rewrite using mapping iterable
      result.add(item.getAvailableClasses(namespace));
    }
    return result;
  }

  public Iterable<String> getSubpackages(String namespace) {
    checkValidity();
    FlattenIterable<String> result = new FlattenIterable<String>();
    for (IClassPathItem item : myChildren) {
      //todo rewrite using mapping iterable
      result.add(item.getSubpackages(namespace));
    }
    return result;
  }

  public long getClassesTimestamp(String namespace) {
    checkValidity();
    long result = 0;
    for (IClassPathItem item : myChildren) {
      result = Math.max(result, item.getClassesTimestamp(namespace));
    }
    return result;
  }

  public long getTimestamp() {
    checkValidity();
    long result = 0;
    for (IClassPathItem item : myChildren) {
      result = Math.max(result, item.getTimestamp());
    }
    return result;
  }

  public List<IClassPathItem> getChildren() {
    checkValidity();
    return new ArrayList<IClassPathItem>(myChildren);
  }

  public List<RealClassPathItem> flatten() {
    checkValidity();
    List<RealClassPathItem> result = new ArrayList<RealClassPathItem>();

    for (IClassPathItem child : myChildren) {
      result.addAll(child.flatten());
    }

    return result;
  }

  public CompositeClassPathItem optimize() {
    checkValidity();
    List<RealClassPathItem> flattenedItems = flatten();
    Iterator<RealClassPathItem> it = flattenedItems.iterator();

    Set<String> alreadyVisited = new HashSet<String>();

    while (it.hasNext()) {
      IClassPathItem item = it.next();
      if (item instanceof FileClassPathItem) {
        FileClassPathItem fcp = (FileClassPathItem) item;
        if (alreadyVisited.contains(fcp.getPath())) {
          it.remove();
        } else {
          alreadyVisited.add(fcp.getPath());
        }
      }

      if (item instanceof JarFileClassPathItem) {
        JarFileClassPathItem jfcp = (JarFileClassPathItem) item;
        String path = jfcp.getFile().getAbsolutePath();
        if (alreadyVisited.contains(path)) {
          it.remove();
        } else {
          alreadyVisited.add(path);
        }
      }
    }

    CompositeClassPathItem result = new CompositeClassPathItem();
    for (IClassPathItem item : flattenedItems) {
      result.add(item);
    }

    return result;
  }

  @Override
  public void accept(IClassPathItemVisitor visitor) {
    checkValidity();
    visitor.visit(this);
  }

  public String toString() {
    checkValidity();
    StringBuilder result = new StringBuilder("classpath {\n");

    for (IClassPathItem child : myChildren) {
      for (String s : child.toString().split("/[\n]/")) {
        result.append('\t').append(s).append("\n");
      }
    }

    result.append("}");
    return result.toString();
  }

  private final Runnable myInvalidationListener = new Runnable() {
    public void run() {
      callInvalidationListeners();
    }
  };
}
